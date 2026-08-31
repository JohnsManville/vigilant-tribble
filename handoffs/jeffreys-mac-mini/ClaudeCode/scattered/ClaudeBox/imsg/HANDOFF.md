# imsg — Present State & Handoff

**As of 2026-08-23 04:46.** Standalone iMessage read/respond tool for ClaudeBox.
Lives at `~/ClaudeBox/imsg` (own git repo, code-only — state/ is gitignored).
Design doc: `BUILD_SPEC.md`. This file is the operational truth; the spec is the
original plan and is now partly historical.

---

## TL;DR

Built in four phases, all shipped. **Running unattended for ~26 days.** The safety
architecture has held perfectly: **zero messages have ever been sent to a third
party** — 211 outbound, every one to Jeff's own self-thread, plus 29 refusals
logged at the gate. Exactly one draft has ever been approved (the Phase 3 test on
7/29).

The send side is solid. **The drafting side has three defects**, one of which is an
armed hazard. **Phase 4 (auto-respond) is in shadow mode and the shadow evidence
says do not take it live.**

| | |
|---|---|
| Daemon | `com.claudebox.imsg` — running, pid 1709, watermark lag 0, breaker ok |
| Prune job | `org.mumford.imsg-prune.plist` — daily 03:15, 7-day retention |
| Auto-respond | **SHADOW** (`live_authorized: False`), 18 shadow fires to date |
| Pending drafts | **43** — 12 of them carry the SKIP-leak defect (see below) |
| Third-party sends | **0, all-time** |
| Decoder health | 99.89% over 30-day replay |
| Draft brain | **36% failure rate** over the last 14 days (107 of 295) |

---

## How it works

A LaunchAgent polls `chat.db` every 20s, routes each new inbound message, and
either answers Jeff directly or queues a draft for his approval.

**Routing.** Inbound from Jeff's own number → the dispatch brain answers and texts
back. Inbound from a watched contact (see `watch_list.json`) → an auto-respond rule
may fire, otherwise the draft brain writes a reply and queues it. Everything else
is ignored.

### The TCC constraint — read this before touching the daemon

Verified by probe 2026-07-28. **bash holds Full Disk Access; python3.13 carries an
explicit FDA *deny*, and that deny poisons every descendant process.** So
`bash → python → sqlite3` cannot read chat.db, while `bash → sqlite3` can. Apple
Events are unaffected (python → osascript sends fine).

Hence the split in `imsg-watch.sh`: **bash dumps new rows** via `sqlite3 -json`
(blobs hex-encoded) into `state/pass_dump.json`, then hands the file to
`imsg watch --pass-dump <file> --max-rowid <N>`, and **python does everything
else** — decode, route, draft, send. Terminal `imsg` commands read chat.db
directly, because an interactive shell has FDA.

Do not "simplify" this into a single python process. It will silently stop reading
messages.

### Other hard-won details

- **~62% of messages have NULL `text`** — the body lives only in the
  `attributedBody` typedstream blob. `lib/decode.py` handles it. The original
  shell dispatch didn't, and silently dropped a third of Jeff's texts.
- **Rowids and dates are not jointly monotonic** (iCloud backfills history).
  Always window by ROWID, never by date.
- `sqlite3 -json` emits an empty string, not `[]`, for zero rows.
- The draft brain runs `claude -p` with `cwd=IMSG_DIR` so it can read context
  files. That generates a session transcript per draft — hence the prune job.
  **Do not "fix" this by repointing cwd**; it would blind the brain and silently
  degrade draft quality. Jeff chose pruning over relocation (8/11).

---

## The safety model

Governed by Jeff's standing order of 2026-07-20: **"No sends without my hand."**

`lib/send.py` refuses every recipient not in `allowed_send.json`, which contains
exactly one entry: Jeff's own number. The only way to reach anyone else is a
**message-scoped send token** — a pending draft file. `APPROVE <id>` (by text or
`imsg approve <id>`) authorizes that one message to that one recipient, then the
draft is archived and the token is consumed. It cannot be replayed, and it cannot
authorize a different recipient. Both properties are asserted in `stress.sh`.

Every draft, approval, edit, refusal and send is appended to `state/audit.jsonl`,
append-only.

**Phase 4 live mode is doubly locked, deliberately.** `autorespond.live_authorized()`
requires a dated line containing the exact string `AUTO-RESPOND AUTHORIZED` in
`~/ClaudeBox/CLAUDE.md` — Jeff's writing, nobody else's. **And** `send.py` was
never given an auto-send bypass: the permission classifier blocked that edit during
the Phase 4 build and the strict gate was kept on purpose. So even if the CLAUDE.md
line appeared tomorrow, a live auto-send would raise, get caught, and fall back to
a draft. **Going live requires both: Jeff writes the line, and the gate edit is
made with Jeff present. Never widen the gate alone.**

---

## What each phase does

**Phase 1 — CLI foundation.** `imsg read / unread / search / threads / draft /
drafts / approve / reject / send / status`, all with `--json`. Contact resolution
from AddressBook (1,590 handles cached).

**Phase 2 — Hardened dispatch.** `imsg watch` + LaunchAgent, replacing the old
shell daemon (archived at `~/ClaudeBox/dispatch.old/` — never restart it).
Watermark advances *before* processing so a crash can't cause a replay. Cold-start
fast-forward: >6h downtime or a >50-row gap with >3 real texts skips the backlog
and notifies once, instead of answering stale messages at 2am. Rate limiter at 8
replies/5min trips a circuit breaker (auto-clears in 30 min).

**Phase 3 — Draft queue.** Watched contacts get a claude-drafted reply queued and
notified to Jeff's self-thread with `APPROVE n | EDIT n <text> | SKIP n`. Drafts
supersede rather than stack (one pending per contact). Group chats never trigger
drafts. Unknown numbers are flood-capped at 5/hour.

**Phase 4 — Auto-respond, SHADOW ONLY.** `auto_policy.json` holds deterministic
templates — no model in the loop at send time, so nothing can be invented or
promised. One rule: `afterhours-unknown-intake`. Caps: 1/contact/hour, 5/day.
Kill switch: text `STOP`/`RESUME` to the self-thread, or `imsg auto --stop`.
In shadow, a matched rule produces a draft plus a notify instead of sending.

---

## Known defects — ranked

### 1. SKIP-leak (armed hazard, 12 drafts affected)

When the draft brain decides no reply is warranted it should output exactly `SKIP`,
and `lib/watch.py:223` tests `text.strip().upper() == "SKIP"`. **In practice the
brain writes SKIP with its reasoning attached**, the exact-match test misses, and
the refusal gets queued as though it were a message.

Currently affected: drafts **39, 86, 145, 150, 151, 159, 160, 161, 171, 172, 174,
177**. Draft #99 (since cleared) read `"SKIP\n\nOnly Jeff can answer AM
availability for the kids…"` addressed to Laura. One earlier case even carried
leaked MCP error text into the draft body.

Nothing has leaked, because Jeff hasn't approved anything. But each of these is one
tap from sending internal machinery to a human.

**Fix:** treat any reply whose first line is or starts with SKIP as a refusal, and
reject drafts containing obvious machine exhaust before queueing. Containment now:

```
cd ~/ClaudeBox/imsg && for i in 39 86 145 150 151 159 160 161 171 172 174 177; do ./imsg reject $i; done
```

### 2. Draft brain fails ~36% of the time

107 of 295 triggers in the last 14 days ended in `draft_brain_error`, exit code 1
with empty stderr, on perfectly ordinary messages ("Soon", "Wrapping up a call").
This is down from 64% earlier in August but still means a third of drafts never
appear. Root cause not yet established — the empty stderr and the MCP noise seen
in draft bodies both point at the `claude -p` subprocess invocation rather than at
the messages. Needs a reproduction before a fix. *(Confidence 85 that it's
subprocess/invocation-related, not content-related.)*

### 3. Draft queue never drains

43 pending, the oldest from 7/30. Jeff has approved exactly one draft ever. A reply
saying "sorry I missed you — rain check" is meaningless three weeks later. The
queue needs an expiry (auto-retire anything older than ~48h) regardless of what
else changes. It may also indicate the approve-by-text workflow isn't landing in
practice — worth asking Jeff directly.

---

## Phase 4 verdict — recommendation: do not go live

This is exactly what shadow mode was built to determine, and it earned its keep.
Of the shadow fires reviewed on 8/13, **not one was a new-client after-hours
inquiry**. They were: a dental appointment reminder for John (twice), a school
notice ("Summer CARE Closed 8/5"), a personal message ("You're not fucking
blocked"), a contractor mid-conversation about sending a bid, and someone replying
"Okay got you locked in". Later fires include marketing spam from a burger chain.

Had live mode been on, all of them would have been wrong sends — including telling
a personal contact and an active contractor "you've reached Odd Jobs Handyman
Services, Jeff is off right now."

The `unknown_numbers` matcher cannot distinguish a stranger with a job from someone
Jeff already deals with who simply isn't in Contacts, nor from an automated
notification. **Recommendation: do not add the `AUTO-RESPOND AUTHORIZED` line.**
Either rework the rule — require inquiry-like content, exclude any handle with
prior conversation history, exclude shortcodes and `(smsfp)`-style senders — or
retire Phase 4 and keep the draft queue.

**This decision is Jeff's alone.** Nothing in the code will change it.

---

## Operations runbook

```
./imsg status                     # daemon pid, watermark lag, breaker, queue depth
./imsg auto                       # auto-respond mode + rules + caps
./imsg auto --shadow              # review would-have-sent log
./imsg drafts                     # pending queue
./imsg approve <id> / reject <id>
./imsg watch --reset-breaker      # clear a tripped circuit breaker
./imsg watch --install            # (re)install the LaunchAgent
./imsg watch --uninstall          # stop and remove it
./stress.sh                       # full test gate — run before shipping anything
```

From the phone (self-thread): `APPROVE n`, `EDIT n <text>`, `SKIP n`, `STOP`,
`RESUME`. Bare verbs only — "send 5 invoices tomorrow" is treated as a dispatch
question, not an approval of draft 5.

Restart the daemon: `launchctl kickstart -k gui/$(id -u)/com.claudebox.imsg`

**`stress.sh` is the pre-ship gate** and must be green before anything reaches a
human: decoder replay ≥99%, send-gate refusal with the transport stubbed, dump-path
parity, Phase 4 invariants (live off, STOP disables matching, every template
carries the 🤖 auto-reply disclosure), and the Phase 3 draft-queue invariants
(tokens, supersede, edit, groups, unknowns, flood cap, audit completeness).

---

## File map

```
imsg                    the CLI (408 lines)
imsg-watch.sh           LaunchAgent entrypoint — bash half of the TCC split
imsg-session-prune.sh   daily transcript prune (added 8/11, 7-day retention)
stress.sh               the test gate — keep it green
lib/db.py               read-only chat.db + CliConn subprocess fallback
lib/decode.py           attributedBody typedstream decoder
lib/contacts.py         AddressBook resolution, load_cached() for daemon context
lib/send.py             THE GATE — allowlist + message-scoped draft tokens
lib/state.py            drafts, watermarks, audit log
lib/watch.py            the daemon: routing, dispatch, drafting, commands
lib/watchlist.py        which contacts get drafted replies
lib/autorespond.py      Phase 4 policy engine (shadow-locked)
allowed_send.json       ["+15035935754"] — widening this is Jeff's decision only
watch_list.json         watched contacts + per-contact drafting instructions
auto_policy.json        deterministic auto-reply templates + caps
state/                  runtime (gitignored): drafts/, threads/, audit.jsonl,
                        dispatch.jsonl, shadow.jsonl, watermark_watch
```

---

## Next work, in priority order

1. **Fix the SKIP-leak** — highest value, smallest change, removes an armed hazard.
2. **Diagnose the 36% brain failure rate** — a third of drafts silently never appear.
3. **Add draft expiry** (~48h) so the queue self-drains.
4. **Decide Phase 4**: rework the matcher or retire it. Jeff's call, not the box's.
5. Ask Jeff whether the approve-by-text flow is actually usable — 1 approval in
   26 days is the loudest signal in this whole document.

*Overall confidence: 95 — every figure above was read from the live daemon, audit
trail, and queue on 8/23. The 36% brain-failure diagnosis is the one item resting
on inference rather than a reproduction.*
