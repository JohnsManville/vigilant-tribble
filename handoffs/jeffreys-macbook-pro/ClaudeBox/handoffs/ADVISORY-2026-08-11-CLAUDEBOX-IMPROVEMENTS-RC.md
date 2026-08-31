# ClaudeBox — How This Could Be Done Better
**Advisory · RC · 2026-08-11** · Odd Jobs — Jeff Mumford

Digest of the two-machine setup and where the leverage actually is.
Ranked by (value ÷ effort). Verified-vs-inferred marked on every item.

**What I read first** (per E-064): `CLAUDE.md`, `CONNECTIONS.md`, `COVENANT.md`,
`.gitignore`, `scripts/` (full listing + `sync-projects.sh`), `.claude/settings.local.json`,
`handoffs/`, `AI_ERROR_LOG.md` metrics, `odd-jobs-remote-access/*`, `mini-claude-history/*`,
and 703 of your typed turns from 84 CLI sessions.

---

## The one-sentence diagnosis

**Your system stores its memory as documents, and enforces it as etiquette.**
Documents rot, and etiquette doesn't bind. Every failure in the error log
(E-064, E-065, E-068, E-069, E-070, E-071) is a session that *should have* read
something and didn't, or read something that had gone stale. More documents will
not fix that. Making the reading **structural** will.

---

## 1. Add a SessionStart hook. This is the highest-leverage change you can make. ⭐

**Verified:** `~/ClaudeBox/.claude/` contains *only* `settings.local.json`, and it holds
nothing but a permissions allowlist. **You have no hooks at all.** Every "BINDING —
READ EVERY RUN" instruction in `CLAUDE.md` is currently enforced by hoping the model
complies.

A SessionStart hook runs a script and injects its output into the session before the
first turn. Deterministic, costs no reasoning, cannot be skipped. It should print:

1. **Machine identity** — the `whoami` check you already wrote, resolved.
2. **Health line** — `scripts/health-line.sh` output (green/yellow/red).
3. **Pointer to the current handoff** — filename + first 15 lines.
4. **The distilled lessons** (item 2 below) — not the 256 KB ledger.
5. **Dirty/diverged repos** — one line per repo that isn't clean.

That single change structurally kills the E-064 and E-071 failure classes: a session
physically cannot start believing it's on the wrong machine, or building on a stale
handoff, or rebuilding infrastructure it was just told exists.

> **Verify before building:** confirm the hook event name and settings schema against
> your installed Claude Code version (`claude --version`, then the hooks docs) rather
> than trusting this doc. I have not run it on your box. **Confidence the capability
> exists: 90/100. Confidence in the exact key names: 70/100 — check them.**

---

## 2. Distill `AI_ERROR_LOG.md`. It has outgrown its own purpose.

**Verified:** 256,502 bytes · 2,560 lines · **64 entries.**

The ledger is right and should stay append-only forever — it's the evidence. But no
session can afford to read 256 KB, so in practice it gets grepped or skipped, which
means the lessons in it aren't reaching the sessions that need them. The log is
working as a record and failing as a control.

**Fix:** generate `LESSONS.md` — one page, one line per distinct lesson, deduplicated,
regenerated whenever entries are appended. That's what the hook injects. The ledger
stays the permanent record you cite *back to*.

You already have this exact pattern running: `scripts/nightly-distill.sh` does it for
intel. Point the same shape at the error log. **Don't build a new mechanism.**

---

## 3. Generate handoffs. Stop writing them.

**Verified:** `handoffs/` holds 10+ files including three from today. The rule
"supersedes every earlier handoff" lives in prose inside the handoffs themselves.
E-071 is the exact failure this produces — a handoff claimed Phase 1 while the repo
was two phases in.

A handoff has two halves and only one of them should be authored:

| Half | Who writes it | Content |
|---|---|---|
| **Machine-verifiable** | `scripts/handoff.sh` | per-repo `git log -1` + ahead/behind + `status --porcelain`, last sync **success line**, health-line output, timestamp, machine identity |
| **Narrative** | the model | what was tried, what's blocked, what's next, what was *verified* vs *done* |

Then a handoff cannot lie about state, because state is generated, not remembered.

**Also:** make `handoffs/CURRENT.md` a symlink to the newest one. "Read the newest
handoff" is currently a sorting problem the reader has to solve correctly, every time.

---

## 4. Put the Claude desktop app on the Mini.

**Verified:** this session — and every Cowork session you run — bridges to
`jeffreys-macbook-pro`. That is the *client*: the machine that travels, sleeps at
94% full, and is explicitly not the source of truth.

So the current shape is backwards. The cloud sessions can only touch the non-
authoritative machine, which is why every plan I write has to end with "now go run
this in Terminal on the Mini." That round trip is pure loss, and it's the reason the
retracted sync plan had to be handed to you as homework instead of executed.

Install the desktop app on the Mini and connect `~/ClaudeBox` there. Then a cloud
session reaches the box directly — reads the real state, and hands work to the
always-on machine that can actually finish it.

**Effort: low. Value: high.** This is the cheapest item on the list.

---

## 5. Solve the 51-file Covenant dispute by fixing the *reason* it exists.

**Verified from `CONNECTIONS.md`:** 51 intel files (135 MB, frozen at 2026-07-30)
sit on the MacBook from before the `--exclude /backups` fix. Removing them is
burn-shaped; keeping them breaks gates 3, 4 and 5. Open since 8/9, Kari holds the
tiebreak, nothing decided.

The dispute exists because those files are simultaneously (a) a gate violation and
(b) the only second copy of an irreplaceable archive. **Both are true, which is why
it's stuck.** Dissolve it rather than adjudicate it:

- **Delete the 51 from the MacBook** — they violate three gates and sit on the machine
  most likely to leave the house.
- **Add a second SSD mirrored from `ClaudeData` with the same `--delete` semantics**
  `intel-mirror.sh` already uses. A burn-respecting mirror satisfies the Covenant
  *and* gives you disaster recovery. Store it off-site, rotate it when you're home.

That gets you both things the current standoff makes you choose between. Kari still
holds the call; this just gives her a third option that isn't a compromise.

**Related, and more urgent than it looks:** `ClaudeData` is 2 TB of single-copy data,
deliberately excluded from Time Machine (correctly — TM retains deleted files and
breaks gates 3 and 5). Right now a drive failure loses the archive outright.

---

## 6. Collapse the standing-order corpus. One fact, one home.

`CLAUDE.md`, `COVENANT.md`, `CONNECTIONS.md`, your Cowork preferences archive, the
new two-machine brief, and every `MASTER.md` all carry overlapping copies of your
rates, voice law, send rules, and machine roles. **They have already disagreed once
in a way that mattered** — the MacBook's `CLAUDE.md` told every session "this machine
is the always-on Claude box," which is false, and it took until 8/11 to catch.

Rule: each fact lives in exactly one file; everything else links to it. `CLAUDE.md`
becomes the index. Duplicated truth is just deferred contradiction.

---

## 7. The cost problem is structural, and items 1–3 are the fix

You are anxious about usage (*"how are we on useage? make sense to open new task?"*)
while simultaneously requiring every session to read a large corpus before it may act.
Those two requirements are in direct conflict, and right now the corpus is winning by
being skipped.

Hook-injected context is deterministic and nearly free. A 1-page `LESSONS.md` replaces
256 KB. A generated handoff replaces a session re-deriving state from scratch. **Items
1–3 make you safer and cheaper at the same time** — that's why they're ranked first.

Separately: use a cheap model for mechanical passes (file moves, log greps, batch
classification). Your `USE LOWER MODEL` turn on 7/20 says you already know this; make
it a default rather than an intervention.

---

## 8. Close the two dangling unknowns with a date and an owner

Both have been sitting unverified while being treated as known:

- **Daily-brief OAuth session** — reported expired ~8/8, still unverified 8/11.
- **Tailscale `AutoUpdate.Apply`** — E-068 recommended keeping it on now that the
  aftermath is watched; no record of the decision being made.

Neither is hard. Both are exactly the shape of thing that becomes an incident.

---

## 9. Rotate the exposed API key (carried over — still open)

Pasted as a plain terminal command 2026-07-20; now in shell history, in the archived
CLI transcript, and inside `claude-history-handoff-2026-08-01.tar.gz`. Your own
`README.md` states the rule. **Revoke, reissue, set via editor.** 95/100 this is real.

---

## Do this in this order

| # | Item | Effort | Why first |
|---|---|---|---|
| 1 | Rotate the key | 10 min | Only item with an active adversary |
| 2 | Desktop app on the Mini | 15 min | Unblocks everything else being done *by* Claude instead of by you |
| 3 | `LESSONS.md` distillate | 1 hr | Prerequisite for the hook |
| 4 | SessionStart hook | 1–2 hr | The structural fix |
| 5 | `handoff.sh` + `CURRENT.md` | 1–2 hr | Kills E-071 permanently |
| 6 | Covenant: 51 files + second SSD | Kari's call | Unsticks a 3-day-old standoff |
| 7 | Collapse duplicated docs | ongoing | Prevents the next contradiction |

Items 2–5 are one Claude Code session on the Mini. This doc is written so you can hand
it to `claude` in Terminal and say "do 2 through 5, verify each before advancing."

---

## Assumptions

1. Mini stays authoritative; MacBook stays client.
2. `~/ClaudeBox` never gets a cloud git remote.
3. You want fewer moving parts, not more — every item above either replaces an existing
   mechanism or uses one you already run. **No fourth sync lane is proposed.**

**Confidence: 84/100.** High on the diagnosis and on items 2, 3, 5, 6, 7, 9 — those come
from files I read directly on your MacBook. Lower on item 1: I verified you have no hooks,
but I have not run a hook on your box and the exact settings schema needs checking against
your installed version. And the standing caveat — **the Mini was never inspected**; if its
`scripts/` or `.claude/` differ from the MacBook's, items 1–3 need a look there first.

---

*Odd Jobs — Handyman Services · Jeff Mumford · jeff@odd-jobs.org · 503-880-7433*
