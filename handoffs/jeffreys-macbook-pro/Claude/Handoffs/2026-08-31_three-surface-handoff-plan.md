# Handoff Plan — Chats · Cowork · Claude Code
**Date:** 2026-08-31 · How the three Claude surfaces produce handoffs, how each reaches the consolidation, and how to close the gaps.

## The three surfaces, and where their output actually lives

| Surface | What it is | Where its handoffs live | On disk? | Auto-capturable? |
|---|---|---|---|---|
| **Claude Code** | CLI on the Macs | `~/Claude/Handoffs/`, `~/ClaudeBox/handoffs/` (+ scattered project dirs), config/plans in `~/.claude/` | ✅ yes | ✅ yes |
| **Cowork** | claude.ai desktop app | Written to `~/Claude/Handoffs/` on the Mac *by the session-handoff skill* (via Desktop Commander); the session itself is server-side | ⚠️ only if the skill runs | ⚠️ partial |
| **claude.ai chats** | browser / mobile | Server-side only; on disk only if manually downloaded | ❌ no by default | ❌ manual |

**The core asymmetry:** Claude Code writes to disk natively. Cowork and chats live in the cloud — their handoffs only reach disk when something deliberately writes them there. Cowork sessions **cannot be enumerated via API** (`chat_conversations` doesn't list them, `/sessions` 404s), so a Cowork or chat session that never wrote a handoff is effectively unrecoverable — this is the source of the "19 missing registry rows" and the 9 "Ungrouped" conversations.

## The pipeline we now have (built this session)
```
  [ Claude Code ]     [ Cowork ]        [ chats ]
        │ writes to disk │ skill→disk       │ (manual download)
        ▼                ▼                  ▼
     ~/Claude/Handoffs, ~/ClaudeBox/handoffs, ~/Claude/Roswell, ~/.claude   ← on the Macs
        │
        │  mini-driven git sync every 30 min (mirrors the mini's own files
        │  AND the MacBook's over `ssh mbp`, into handoffs/<host>/…)
        ▼
     vigilant-tribble repo  ← the mirror any cloud session can read
        │
        │  5:00pm PT daily Routine
        ▼
     master status doc + tracker  ← regenerated, pushed, delivered
```

## Plan by phase

### Phase 1 — Capture (get every surface onto disk)
- **Claude Code:** already writes to disk. **Action:** extend the sync to also grab the scattered project-level handoffs (`~/ClaudeBox/**/HANDOFF*.md` outside `handoffs/`, e.g. Malicious Compliance, briefings, mumford-week-plan) so nothing Claude Code produced is missed. *(Owner: Claude — small sync-script change.)*
- **Cowork:** the `session-handoff` skill already writes the canonical copy to `~/Claude/Handoffs/`. **Action:** make "run the handoff skill before closing" the standing rule for every substantive Cowork session — the only reliable capture path, since the session can't be pulled back later. *(Owner: Jeff — habit; the skill does the rest.)*
- **chats:** no automatic capture. **Action:** when a chat produces something worth keeping (a state doc, an artifact), download it into `~/Claude/Handoffs/` before closing the tab. Treat chats as ephemeral by default. *(Owner: Jeff.)*

### Phase 2 — Mirror (get disk → repo)
- **Done:** the mini-driven `sync-handoffs.sh` mirrors all on-disk handoff dirs + `~/.claude` into the repo every 30 min, host-namespaced, and pushes. The mini is the only machine that needs GitHub write (the MacBook's is broken — see the account-key note), so everything routes through it.
- **Action:** confirm the launchd job stays healthy (log at `/tmp/handoff-sync.log`); add the scattered-project-handoffs path from Phase 1.

### Phase 3 — Consolidate (repo → master doc)
- **Done:** the 5:00pm PT Routine reads the mirror, runs the handoff-consolidator, and produces the master doc + tracker.
- **Action:** none ongoing beyond the Nov DST cron shift (`0 0`→`0 1 * * *`).

### Phase 4 — Close the gaps (the unrecoverable middle)
- **The real gap:** Cowork/chat sessions that ended without a handoff are gone — not on disk, not enumerable. No tooling can recover them after the fact.
- **Action A (prevention):** the standing rule from Phase 1 — every substantive Cowork/chat session ends with a handoff written to disk. This is the only durable fix.
- **Action B (detection):** weekly, reconcile the session registry against what's on disk to catch sessions that should have a handoff and don't, while the memory of them is still fresh enough to reconstruct. *(Owner: Claude on a weekly Routine, if wanted.)*
- **Action C (the 9 Ungrouped + 19 missing rows):** one-time — Jeff files the 9 Ungrouped Cowork conversations (tracker T27) and confirms which of the 19 missing registry rows had real handoffs worth reconstructing.

## One-line summary
Claude Code is fully covered (writes to disk → mirrored → consolidated). Cowork is covered **only when the handoff skill runs** — so make that the rule. Chats are ephemeral — download anything worth keeping before closing. The mini-driven mirror + 5pm Routine then carry everything the rest of the way automatically.
