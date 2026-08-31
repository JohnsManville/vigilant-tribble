# HANDOFF & CURRENT STATE — session management, and the thing that is still not built

**Written 2026-08-23 11:11 PDT (clock verified) · Mini `Macmini9,1` · session `8c67e6c8`**
**Supersedes** `HANDOFF-2026-08-23-SESSION-COVERAGE-AUDIT.md` and its Phase 0 addendum as
the entry point for this lane. Read this one first.

---

## 1. READ THIS BEFORE YOU BUILD ANYTHING

Jeff's goal, in his own words across four messages:

> *"I want each chat, cowork, claudecode and CLI session managed."*
> *"I want them swept originally and then I want to setup an evening skill to generate the
> handoff and present state md."*
> *"**And every day, I want to arrive to a fresh claude desktop/claude cloud review session
> where I can triage and organize where I want to pickup from the previous days chats.**"*

**That third sentence is the goal. It is not built.** Everything else in this document is
scaffolding for it.

What exists today is `briefings/TRIAGE-<date>.md` — a markdown file, in a repo, on a
machine. Jeff has to go find it. That is the opposite of *arriving to* something. The
session that built all this produced the machinery that **generates** a triage brief and
never built the thing that **puts it in front of him**.

**The drift is the lesson.** After the phased plan was approved, that session spent its bulk
on a monitor fix, a disk cleanup, git remote topology, notes and commit hooks. Every one was
a real problem, and Jeff approved each. Every one was also *the session's own finding, not
his goal.* He eventually said: *"I feel like we're losing sight of what I set out to do."*
He was right. **If you find yourself fixing the box, stop and ask whether it serves the
morning session.**

**Do not re-guess the destination.** Jeff was asked where he wants to land each morning —
a scheduled cloud session, a pinned desktop conversation, a push notification, or the file
as-is — and what that session is for — triage-and-route, orient-only, or run-the-day.
**He dismissed the question and asked for a fresh start instead.** Ask him. Do not assume.

## 2. CURRENT STATE — verified at write time

| Check | Value |
|---|---|
| Clock / machine | 2026-08-23 11:11 PDT · `jeffmumfordmacmini` · `Macmini9,1` |
| Health line | 🟢 `capture live 11:06 · build retired · distill ok · handoff new · disk 92%` |
| Registry | **26 OK · 19 MISSING · 2 STALE · 3 IDLE** |
| Git | `23baf03`, clean tree, **0 unpushed**, three remotes in sync |
| Error ledger | max **E-101** — and **14 duplicated IDs**. Cite by date and title, never number |
| Evening job | scheduled 22:00, **0 successful runs ever** — tonight is the first |

**The 19 missing:** 8 claude.ai chats (low value — an alternator question, a washing-machine
guide, a boat-diesel calculation; writing handoffs for those is noise) and **11 Cowork
sessions that cannot be reached at all** — absent from claude.ai's API, `/sessions` 404s on
web, nothing on disk. They carry a `@1970-01-01` sentinel so they always read STALE rather
than silently passing on an invented date. Only Jeff can date them.

## 3. WHAT WAS BUILT, AND WHETHER IT IS PROVEN

| Thing | State |
|---|---|
| `session-registry.tsv` + `scripts/session-registry.sh` | working, exercised repeatedly |
| `scripts/evening-sweep.sh` | working |
| `~/.claude/skills/evening-handoff/` | written; **the Claude half has never executed** |
| `scripts/nightly-handoff.sh` + launchd 22:00 | installed; **never run end-to-end** |
| `briefings/TRIAGE-2026-08-24.md` | exists — **hand-written, not generated** |
| `scripts/git-push-all.sh`, git hooks, three remotes | working, verified |

**Two calibrations the registry needs, do not remove them:** a **4-hour grace** (a handoff is
written *during* the session it documents, so without grace every session reads STALE), and
**lane folding** (87 imsg polls + 6 cron runs otherwise bury the interactive sessions).

## 4. THE ONE FINDING THAT OUTLIVES THIS LANE

Handoffs keep being written to places the Mini cannot read. Three forms, all found today:

1. **Cowork → the MacBook.** Two docs written to `/Users/jeffmumford/`; pulled back by SSH.
2. **Claude Code → nowhere.** One composed, both write attempts blocked by a safety checker;
   recovered verbatim from `tool_use.input.content` in the transcript.
3. **claude.ai chats → the conversation.** Three chats were *asked* for a handoff, all three
   produced one, **none reached the Mini.** They sit behind Download buttons.

The chat lane is not under-documented. It is documented into a place the box cannot read.
**A session claiming it wrote a handoff is not evidence the file exists. `ls` it.**

## 5. LIVE ITEMS THAT ARE NOT ABOUT SESSIONS

Do not let these get buried under tooling work:

- **Square invoice #000004 — $3,000 deposit, Josh Loerzel — pay link unverified.** The URL
  carries an `invtmp:` prefix and did not work. Nothing sent to Josh; keep it that way until
  someone opens it. → `HANDOFF-2026-08-23-CHAT-FAIRMOUNT-DEPOSIT.md`
- **The intel distiller is still broken.** Nine nights lost (8/14–8/22), data backfilled by
  hand, **cause not fixed** — TCC/Full Disk Access at confidence 97, needs Jeff at the
  machine. The monitor now catches it (E-098 fixed); it cannot self-heal.
- **Exposed API key**, 34 days old. The only open item with an adversary.
- **Purcell**: the 10 Aug deadline passed 13 days ago, no August brief mentions it, nothing
  newer than 25 July. Closed or silently stalled — nobody knows which.
- **The error ledger is forked** between Mini (E-101) and MacBook (E-095), with two different
  `E-095` entries. **Do not `scp` it in either direction.**
- **Automatic login is ON**; ARD/VNC open; AnyDesk unattended. Audited 8/11, never changed.

## 6. FIRST MOVES FOR THE FRESH SESSION

1. `date` and `whoami`. Then read this file's §1 again before writing code.
2. **Ask Jeff where he wants to land each morning, and what that session is for.** That is
   the unblocked question and everything depends on it.
3. Check whether the 22:00 job ran: `logs/handoff-2026-08-23.log`, and whether
   `briefings/TRIAGE-2026-08-24.md` was regenerated (it is currently hand-written).
4. Take the true max error id with
   `grep -oE "E-[0-9]+" AI_ERROR_LOG.md | sort -V | tail -1`. Never eyeball the tail.
5. Stage explicit paths — **never `git add -A`.** Several sessions write this repo at once;
   it swallowed another session's work three times on 8/23. Push with
   `scripts/git-push-all.sh` (plain `git push` reaches one of three remotes and omits notes).

**Standing orders in force:** no sends without Jeff's hand (imsg `APPROVE <id>` excepted) ·
AI_ERROR_LOG append-only, corrections get a new entry, cite by date and title · the Covenant
governs the intel archive and family data · confidence index 0–100 on answers and estimates ·
voice law — no remarks about Jeff being tired, working late, or needing rest.

**Confidence 95.** Every figure above was read off the machine at write time. The 5 is the
Cowork lane, which nothing here can enumerate.
