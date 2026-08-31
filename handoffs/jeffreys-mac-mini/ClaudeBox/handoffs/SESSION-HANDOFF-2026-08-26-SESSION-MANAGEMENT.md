# HANDOFF: Session Management Lane

**Date:** 2026-08-26 14:40 PDT (clock verified)
**Machine:** Mac mini, `jeffmumfordmacmini`, Macmini9,1, macOS 26.6.2
**Version:** v1.1
**Supersedes:** `~/ClaudeBox/handoffs/HANDOFF-2026-08-23-SESSION-MANAGEMENT-RESTART.md` (RC)
**Source session:** Claude Code `8c67e6c8`, opened 2026-08-23, resumed 2026-08-26

---

## The goal, in Jeff's words

> "Every night the agent needs to write the handoff for every session on the Mini, the MBP,
> and the cloud of everything that was worked on that day, compact it, sort/organize the
> session to appropriate buckets, and then produce a master catalog or inventory of what's
> finished, what's work in progress, what's blocked etc."
> "Then every morning I'll triage based on what I can pick up where I left off or what needs
> to push."

Driving complaint: **"I should never open Claude with all these works in progress."**

---

## Present State (verified at write time)

| Check | Value |
|---|---|
| Health line | 🟡 no triage brief for today; sync log shows this morning's DIVERGED/FAILED; disk 90% (22G free) |
| Registry | 26 OK, 19 MISSING, 2 STALE, 3 IDLE |
| Catalog | 50 sessions: 16 blocked, 18 in progress, 8 finished, 8 archived |
| launchd | 4 claudebox agents loaded (capture, distill, handoff, dailybrief) |
| Error ledger | max **E-105**. Get the next id with `scripts/next-error-id.sh`, never by grep |
| Git | `b7a1ff5`, 1 unpushed, three remotes (ClaudeData, mini-local, mbp) |
| Disk | 22 GB free, 90%. Was 95% red at 14:11; 14 GB reclaimed by snapshot thinning |
| Externals | 2 (ClaudeBoxSSD 500G, ClaudeData 2T). **The new 2 TB has never been detected** |

### Done
- Registry + catalog system: `session-registry.tsv` (7 cols: SURFACE KEY TITLE HANDOFF STATUS BUCKET NEXT), `scripts/session-registry.sh`, `scripts/master-catalog.sh`, `scripts/evening-sweep.sh`.
- `/evening-handoff` skill at `~/.claude/skills/evening-handoff/`, wired to `com.oddjobs.claudebox.handoff` at 22:00 via `scripts/nightly-handoff.sh`.
- **Distiller TCC outage closed (8/23).** Root cause was never a permission. The shell now reads the volume and pipes to `claude -p` on stdin; claude runs `--allowedTools ""` and never touches `/Volumes`.
- **Retry added to all three nightly jobs (8/26)** after a single API timeout killed two of them on 8/25.
- **DNS gate in `sync-projects.sh`**: waits up to 150s, retries each fetch 3x, skips rather than reporting false failures.
- 9 Claude Code sessions archived, each with a verified handoff.
- Drive-safety rewrite: `scripts/verify-volume.sh` (exit 0 safe / 1 refuse / 2 unknown); `CLAUDE.md` no longer identifies drives by size.
- 8/25 distill gap backfilled via the new `DISTILL_DATE` override (51 lines, ~206 messages).

### In progress
- **The morning destination is still not built.** Jeff chose "a scheduled cloud agent — a routine that fires each morning, reads the registry and yesterday's handoffs, and exists as a session you open, not a file you locate." Blocker found and not solved: cloud agents cannot read local files, no MCP connectors are attached, and the repo has no GitHub remote. Options are (a) a connector that can reach a published brief, (b) push a sanitized brief somewhere cloud-readable, (c) keep it local and accept a file. **Not decided.**
- 19 registry rows still MISSING: 8 claude.ai chats (low value) and 11 Cowork sessions.

### Blocked
- **Cowork sessions cannot be enumerated at all.** Absent from claude.ai's `chat_conversations` API; `/api/organizations/<org>/sessions` 404s on web; nothing on disk. Their rows carry `@1970-01-01` as a deliberate sentinel so they always read STALE. **Do not invent dates for them.**
- **New 2 TB drive not detected.** Not unmounted, not unformatted, absent from `diskutil list`. Both Thunderbolt/USB4 ports read "No device connected"; both existing SSDs are on USB, one behind a USB3.1 hub. Physical: cable, port, or hub power. Everything downstream (a ~46 GB offload of Voice Memos, Pictures, iCloud archive) is built and waiting.

---

## Decided (do not re-litigate)

1. **FDA grants stay.** Jeff: *"I want tool to work, then I will evaluate privacy alerts."* `/bin/bash` and the claude binary hold Full Disk Access. Both turned out unnecessary. Do not raise revoking them unprompted; he will. Recorded in `CLAUDE.md`.
2. **Buckets are advisory.** No API moves a session into a sidebar group. The catalog names the right bucket; the drag stays Jeff's. Never claim you moved one.
3. **Drives are identified by marker file, never by size.** A second 2 TB drive killed the old rule. Run `scripts/verify-volume.sh` before any destructive disk op.
4. **Messages data is not disk bloat.** Messages in iCloud is ON (`Library/Messages/CloudKitMetaData` exists). A retention trim propagates deletions to every device. `capture-intel.sh` depends on `Messages/Attachments`. The 33.7 GB that arrived since 8/11 is iCloud backfilling history to the always-on box. See E-105.
5. **Nightly jobs commit their own outputs** by explicit path and push with `scripts/git-push-all.sh`. An earlier prompt said "commit nothing", which would have stranded every night's work on this disk.
6. **Staleness grace is 0.5h, not 4h.** Four hours was wide enough to hide 2h28m of real work (E-102).

## Do not redo
- Searching the filesystem for claude.ai chat data. Verified absent: IndexedDB, Local/Session Storage, blob_storage, and the 707 MB cache hold zero conversation payloads.
- Granting more permissions to fix the distiller. Three grants failed; the fix was architectural.
- The Fairmount pay link. **Invoice #000004, $3,000, PAID 2026-08-21, Visa 7989.** Four documents claimed it was stuck. See E-104.
- Re-deriving the chat inventory. 122 conversations enumerated via the `chat_conversations` API through browser control; 11 were active in the 8/20-8/23 window.

---

## Files

| File | Location | State |
|---|---|---|
| Registry data | `~/ClaudeBox/session-registry.tsv` | live, hand-maintained |
| Registry report | `~/ClaudeBox/SESSION_REGISTRY.md` | generated, do not hand-edit |
| Master catalog | `~/ClaudeBox/MASTER_CATALOG.md` | generated |
| Triage briefs | `~/ClaudeBox/briefings/TRIAGE-*.md` | 8/24 and 8/25 exist; **8/26 missing** (last night's sweep died) |
| Evening skill | `~/.claude/skills/evening-handoff/SKILL.md` | live |
| Phase plan | `~/ClaudeBox/PHASED-PLAN-2026-08-23.md` | current |
| Phase plan (web) | https://claude.ai/code/artifact/d5e05738-4fa0-4365-9be7-037200845e65 | published |
| Prior handoff | `~/ClaudeBox/handoffs/HANDOFF-2026-08-23-SESSION-MANAGEMENT-RESTART.md` | superseded by this |

---

## Phased Pickup Plan

**Phase 1 (🟢 light).** Confirm state: run `scripts/health-line.sh`, `scripts/session-registry.sh`, and check whether last night's 22:00 sweep produced `briefings/TRIAGE-<today>.md`. That is the first real test of the retry fix. **Done when:** you can state whether the sweep landed and why.

**Phase 2 (🟢 light).** Resolve the morning-destination question with Jeff. Cloud routines cannot read this box. Present the three options above and let him pick. **Done when:** a destination is chosen and written into the phase plan. This is the goal of the whole lane and it is the only thing still unbuilt.

**Phase 3 (🟡 heads-up).** Build the chosen destination. If it is a scheduled cloud routine, it needs a connector or a reachable brief first. **Done when:** Jeff opens something on a morning without being told where to look.

**Phase 4 (🟢 light).** Drive: if `diskutil list` shows a fourth disk, run `scripts/verify-volume.sh` (expect exit 2, unclaimed), give it a marker and a role, update the `CLAUDE.md` table, then offload Voice Memos (11 G), Pictures (12 G), iCloud archive (23 G) with byte-verify before deleting sources. **Do not touch `Library/Messages`.** **Done when:** disk is under 80%.

**Stop conditions:** stop and ask before deleting anything under `~/Library/Messages`, before any destructive disk operation where `verify-volume.sh` does not return 0, before sending anything to anyone, and before syncing `AI_ERROR_LOG.md` between machines (the Mini and MBP copies have forked with colliding IDs).

---

## Assumptions carried forward
- Jeff still wants the morning surface to be something he opens, not a file he locates. Stated 8/23, not revisited.
- The 8 remaining chat rows (alternator, washing machine, boat diesel) do not need handoffs. My call, stated.
- Another session (`d5ef8d36`) is writing this repo concurrently. Stage explicit paths only; never `git add -A`.

**Confidence: 92.** Verified against the machine at write time. The 8 is the Cowork lane, which nothing local can enumerate, and the morning-destination feasibility, which depends on connectors I could not test.
