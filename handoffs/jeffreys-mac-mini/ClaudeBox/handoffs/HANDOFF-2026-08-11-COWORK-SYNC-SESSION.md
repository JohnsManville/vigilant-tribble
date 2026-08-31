# HANDOFF — Cowork session, 2026-08-11 evening

**Written by:** the remote Cowork session (cloud sandbox + device bridge to the MacBook).
**Trigger:** Jeff, "sync MBP and Mini Claude sessions."
**Companion doc:** `handoffs/PROJECT-RESTATEMENT-2026-08-11.md` (written ~19:03 the same
day by another session). That doc owns custody/architecture. **This doc does not restate
it** — it adds three sync-adjacent facts that doc does not cover, and records one error.

---

## 0. Read this first if you are the next session

This session got the diagnosis **wrong on its first pass** and was corrected only because
Jeff said "look again." The failure and its lesson are logged as **E-069** in
`AI_ERROR_LOG.md`. The short version:

> `CONNECTIONS.md` and `AI_ERROR_LOG.md` are not optional context on this box.
> Read them **before** forming any diagnosis, not after Jeff pushes back.
> E-064 (8/9) and E-069 (8/11) are the same error, two days apart, by two sessions.

I listed `CONNECTIONS.md` in a directory listing and did not open it. It contains the
explicit standing order I then violated: *"Three lanes, three different mechanisms — do
not add a fourth without reading this file first."* I proposed a fourth.

**Retracted artifact:** `~/odd-jobs-remote-access/_to_delete/SYNC-PLAN-RC-RETRACTED-20260811.md`.
Do not act on it. Nothing was built; no `git init` was run in `~/ClaudeBox`.

---

## 1. Current state — verified on disk 2026-08-11 ~18:30–19:20 PT

### Lane 2 (rsync, ~/ClaudeBox) — HEALTHY
`scripts/sync-projects.sh` via `com.oddjobs.sync-projects`. Ran **three times today**
(10:31, 12:14, 12:15). Last run logs `pulled Mini -> MBP`, `pushed MBP -> Mini`,
`finrecon data synced both ways`, `stamped OK`. The MacBook copy of ClaudeBox is current
to within hours. It is **not** an orphaned or hand-maintained copy.

### Lane 1 (GitHub) — FAILING TODAY, cause unconfirmed
Clean `in sync` ×4 through **8/09 05:12**. Then:

| Run | Error | Note |
|---|---|---|
| 8/11 10:31 | `Could not resolve host: github.com` | DNS; during the Tailscale repair window (E-068). rsync fell back to `mini-lan` and worked. |
| 8/11 12:14 | `could not read Username for 'https://github.com': Device not configured` | credential helper cannot prompt — no TTY |
| 8/11 12:15 | same | same |

All four repos affected: `handoff-clone`, `mumford-week-plan`, `finrecon`,
`bitsies-scene-builder`. Lane 2 succeeded through all three runs.

**Unresolved:** the 12:14/12:15 runs were manual. A launchd 05:00 run has the same
no-TTY condition, yet **succeeded under launchd on 8/09** — so something changed today.
Candidate (NOT verified): the expired OAuth/gh credential CONNECTIONS.md notes since ~8/8.
**Next scheduled test is tomorrow 05:00.** Check `logs/sync-projects.log` after it.
Do not assert a cause without checking `gh auth status` and the Mini's own log first.

### Lane 3 (SSD / services) — see PROJECT-RESTATEMENT-2026-08-11.md
Not re-audited here. The intel-mirror TCC grant was still open as of that doc.

---

## 2. Three things nobody is tracking

### 2.1 The Mac mini's Claude Code CLI history is stranded — this is what Jeff asked about
- History **frozen at Jul 25, 2026.** 84 sessions, 316 transcripts, 4 projects.
- Exported 8/01 to `~/mini-claude-history/_export/claude-history-handoff-2026-08-01.tar.gz`
  (146 MB, verified: gzip OK, 700 members, sha256 starts `3bc7d01c6dd0bfacba51`).
- **The tarball has never been imported anywhere.** It has sat on the MacBook for 10 days.
- To make sessions resumable: unpack and place the encoded project folders (e.g.
  `-Users-jeffmumfordmacmini-ClaudeBox`) under the target machine's `~/.claude/projects/`,
  keeping the encoded names. `gunzip -k` any `.jsonl.gz` to read. Full steps in
  `~/mini-claude-history/HANDOFF-IMPORT.md`.
- **Open decision for Jeff:** import to which machine, and under which account (see 2.2).

### 2.2 The account transition was prepared and never executed
`MASTER-REINSTATEMENT-AND-IMPORT.md` (8/06) staged four containers to move off
*mumford.jeffrey@gmail.com's Organization*. **This Cowork session is still running under
that same org** — so the move did not happen. Five days elapsed.

The four containers are all still on the MacBook and verified:
1. `~/ClaudeBox/_account-transition-export-20260806/` (~8 MB — digests, chat export, memory export)
2. `~/ClaudeBox/backups/full-archive-since-jul21-20260806/` (~1.3 GB)
3. `~/mini-claude-history/_export/…tar.gz` (146 MB — same file as 2.1)
4. `~/ClaudeBox/mumford-week-plan/mumford-week-plan-handoff-20260806.zip` (~1.1 MB)

Known gap carried forward: **Jeff Mumford's Individual Org** (`519217cd-…`) chats and
memory were never exported — 403 on the browser login used at the time.

### 2.3 Reclaimable disk, still not reclaimed
Both machines were near full on 8/09 (Mini 94%, MBP 96%). Flagged since 8/01, untouched:
- `~/mini-claude-history/_to_delete/` (~272 MB) — every file has a verified `.gz` twin
- `~/ClaudeBox/_to_delete/PARTIAL-DISCARD-Malicious_Compliance.tar.gz` (~93 MB)
- On the Mini: `_account-transition-export-20260806` (~1.6 G), `_tmp_msg` (~808 M)

Note for any Cowork/bridge session: **the device bridge cannot delete.** It can only move.
Deletions are Jeff's hand, in Finder or a terminal.

---

## 3. What this session changed on disk

1. Appended **E-069** to `AI_ERROR_LOG.md` (append-only, per CLAUDE.md's binding rule).
2. Moved the retracted plan to `~/odd-jobs-remote-access/_to_delete/`.
3. Wrote this file.

Nothing else. No scripts, no agents, no repos, no config.

---

## 4. Open, in the order I'd take them

1. **Lane 1** — check `logs/sync-projects.log` after tomorrow's 05:00 run; `gh auth status`
   on both machines. Smallest, and it is actively broken today.
2. **CLI history import** — needs Jeff's decision on target machine + account. Blocked on #3.
3. **Account transition** — go or no-go. Everything is staged and verified; it just needs
   a decision. If no-go, say so in writing so the four containers stop being treated as
   pending and their ~1.5 GB can be reclaimed.
4. **Disk** — Jeff's hand, five minutes, ~2.7 GB across both boxes.

Items 1–2 do not conflict with G1–G5 in the restatement doc. Item 3 is upstream of a lot.

---

*Confidence in section 1: 88/100 — read from the sync log, export manifests, and error
ledger directly. The 12 points off are Lane 1's root cause and anything Mini-side, which
this session could not reach: the device bridge has no network access (verified — DNS
fails, `100.115.69.54:22` unreachable from it). Everything above is MacBook-side evidence.*
