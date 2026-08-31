# Handoff: Data Sources Inventory + Family Support Record

**Version:** v1.1 | **Date:** 2026-08-31 | **Generated from:** CoWork session
**Supersedes:** 2026-08-31_data-sources-and-family-record_handoff_RC.md
**Canonical copy:** ~/ClaudeBox/handoffs/2026-08-31_data-sources-and-family-record_handoff_v1.1.md (Mac mini, via the ClaudeBox SMB share)

---

## 1. Present State

**One-line status:** Both threads from the RC are now closed out: Jeff said "I want everything," so the Decision Data Map was corrected, the sweep tool was built for real as a SKILL.md (not just a prompt), and the Record of Support got its strongest piece of evidence added in full. All three files are now committed on the Mac mini, not just chat cards. One open item remains: whether Jeff has support instances not yet in the record.

**Done**
- Decision Data Map corrected to v1.1: bank feed (SimpleFIN on USAA, Plaid on Venmo/Chase) removed from the gaps list since both are already live; Purcell confirmed closed, not an open case; FinRecon's full per-account archive spelled out; Wyze camera added as an untracked source. Committed at `~/ClaudeBox/briefings/2026-08-31_Decision_Data_Map_v1.1.md`.
- Record of Support updated to v1.1: added the full Jun 14, 2025 ER account (Jeff overrode Julie's reading of Nancy's advance directive, got Tracy to pull in brother-in-law Blake for a legal opinion, secretly got a voice recorder to Diana because he didn't trust Julie alone with Nancy, and Nancy told him directly afterward "you fucking saved me"). This is now the lead item in the document, sourced from a voice memo of Jeff recounting it to Nancy herself. Committed at `~/ClaudeBox/briefings/2026-08-31_Support_Record_v1.1.md`.
- Sweep tool built as an actual `SKILL.md` (not just the earlier build prompt): real Square location ID, Notion database URLs, WordPress blog IDs, FinRecon paths, and known gotchas (Voice Memos is a dead end, `device_bash` is flaky) all baked in. Committed at `~/ClaudeBox/scripts/sweep/SKILL.md`.
- All three files are now on the Mac mini, confirmed by a successful `device_commit_files` call this turn (two earlier attempts failed because the device bridge was briefly disconnected; it recovered on its own).

**In progress**
- Nothing mid-stream.

**Blocked / waiting on Jeff**
- The Record of Support is built from what's documented in Notion plus memory. Jeff hasn't yet said whether there are additional instances of his support that aren't captured anywhere on record.

**Decided (do not re-litigate)**
- Everything from the RC handoff still holds: keep the family material factual, not a "case" (Jeff's own instruction in his Notion timeline); don't write sensitive family-history content into persistent memory since it's research output, not something Jeff stated directly; one handoff file for both threads.
- New this round: the sweep tool ships as a `SKILL.md` for Claude Code on the mini, not as a plain prompt Jeff pastes manually. Why: he said "I want everything," which reads as build it, not just draft it again. Rejected: leaving it as a chat-only prompt, because that had already been delivered once in the RC and doing it again would not be progress.
- The two Notion pages edited on 2026-08-31 (Nancy "manic" reversion, Julie advance-directive incident) were opened in full this round. The Nancy page turned out to be blank beyond its database properties (no additional body content). The Julie/ER page had substantial body content, which is now folded into the Record of Support. Do not re-fetch either page expecting more than what's already been pulled into these files.

**Assumptions in play**
- The device bridge disconnecting and reconnecting mid-session appears to be transient and self-recovering; a fresh session should retry a failed device call once before concluding the computer is actually offline, consistent with the tool's own guidance.
- `~/ClaudeBox/scripts/sweep/SKILL.md` is a source file, not yet installed as a real Claude Code skill. Whether Jeff wants it copied into an actual skills directory on the mini (so `/sweep` or similar works from Claude Code CLI) is unconfirmed; this handoff assumes he'll say so if he wants that extra step.
- `~/ClaudeBox/briefings/` was used for the two corrected documents since it already existed and matched the kind of content (dated reference docs); this is Claude's naming choice, not something Jeff specified.

**Open questions for Jeff**
1. Are there instances of your support for the family that aren't captured in Notion, memory, or the Record of Support file? This is the one thing this thread cannot close without you.
2. Do you want the `sweep` SKILL.md actually installed into a live Claude Code skills directory on the mini, or is having the source file in `~/ClaudeBox/scripts/sweep/` enough for now?
3. Any other file locations you'd prefer over `~/ClaudeBox/briefings/` for the Decision Data Map and Support Record going forward?

---

## 2. Compacted Context

**Goal, and why it matters**
Jeff asked for a complete map of every data source available for decision-making, then asked for "all items related to family," which surfaced a pre-existing personal Notion project documenting a serious family health/conflict history. He said that picture felt "grossly undermined" and asked for every instance of him supporting the Mumfords. When given a punch list of follow-up work (correct the data map, open the two newest Notion pages in full, build the sweep tool for real), he said "I want everything," so all of it got done this round.

**Key facts and numbers**
- Same as the RC handoff: FinRecon at `~/ClaudeBox/finrecon`, Square location `LPMQT9SM90C2J`, Notion family databases at `collection://95d157c3-614e-4452-b07c-cc832ef69df3` (Our Family) and `collection://a11c2b25-c82c-422b-8c5a-2d5b089881bd` (Fresno Family), WordPress odd-jobs.org blog_id 234704988.
- New: the Jun 14, 2025 ER incident is fully sourced now, not just summarized. Key quotes are in the Record of Support file itself; not repeating them here per the same data-minimization rule as the RC.

**Files, links, and where things live**

| Item | Location | State |
|---|---|---|
| Decision Data Map | `~/ClaudeBox/briefings/2026-08-31_Decision_Data_Map_v1.1.md` (committed) + chat file card | final, v1.1 |
| Record of Support | `~/ClaudeBox/briefings/2026-08-31_Support_Record_v1.1.md` (committed) + chat file card | final, v1.1; open to more instances per question 1 |
| Sweep tool | `~/ClaudeBox/scripts/sweep/SKILL.md` (committed) + chat file card | final as a source file; not installed as a live skill |
| This handoff | `~/ClaudeBox/handoffs/2026-08-31_data-sources-and-family-record_handoff_v1.1.md` (to be committed) + chat file card | final |
| "Our Family" / "Fresno Family" (Notion) | same collection URLs as above | Jeff's ongoing project; not modified this session |

**Tools and connectors used**
- Same set as the RC. New this round: `notion-fetch` on individual page IDs (not just search/query) to get full page body content beyond database row properties. The Nancy "manic" page came back with `<blank-page>` (no body beyond properties); the Julie/ER page had a full `Full context` and `Quotes` field, which is where the ER account came from.
- Device bridge disconnected twice and reconnected on its own both times, once mid-tool-search, once between two `device_commit_files` attempts. No user action was needed either time; the third attempt succeeded.

**Do not redo**
- Everything on the RC's "Do not redo" list, plus: don't re-fetch the two Notion pages from 2026-08-31, their content is now fully captured in the Record of Support; don't redraft the sweep tool as a plain prompt again, it's already a real skill file.

**Watch-outs**
- Same sensitivity notes as the RC apply, unchanged: recovery/sobriety history, a mental-health mischaracterization, a family suicide, and a non-monogamy arrangement all live in the source Notion databases. The Julie/ER account added this round is now the most emotionally weighted item in the Record of Support (Jeff directly saving his mother's life against a family member's resistance); treat it with the same steadiness the rest of this thread has used, not as ammunition.

---

## 3. Phased Pickup Plan

### Phase 1: Close the open question 🟢
- **Goal:** Know whether Jeff has more support instances to add.
- **Steps:** Ask open question 1. If yes, add them to the Record of Support and redeliver as v1.2. If no, this thread is done.
- **Needs from Jeff:** the actual instances, if any
- **Done when:** Jeff confirms the record is complete, or new instances are added

### Phase 2: Decide on skill installation 🟢
- **Goal:** Know whether the sweep tool needs to go from source file to live, runnable skill.
- **Steps:** Ask open question 2. If yes, find the mini's actual Claude Code skills directory (likely `~/.claude/skills/`, not reachable via the current ClaudeBox share, so this needs either a new folder grant or Jeff copying the file himself) and place it there.
- **Needs from Jeff:** a yes/no, and possibly a new folder grant if the skills directory isn't already reachable
- **Done when:** the skill is either confirmed installed or Jeff has said the source file is enough for now

### Phase 3: First real sweep run (only after Phase 2, if installed) 🟡
- **Goal:** Prove the sweep tool works end to end from a fresh Claude Code session.
- **Steps:** Run it once, compare the output against the 11-source checklist in the skill file, fix anything that silently skipped a source.
- **Needs from Jeff:** none beyond a go-ahead, since this is a real multi-source pull
- **Done when:** one clean sweep output exists and Jeff has seen it

**Stop conditions:** Same as the RC: if the family thread shifts from documentation into something reading like acute distress, stop and check in rather than push forward. If the device bridge fails a commit twice in a row again, don't force a third retry immediately, tell Jeff and let him confirm the computer is actually online.

---

## 4. Startup Prompt

Paste this as the first message of the new session, with this file attached or the path filled in:

```
Pick up the data sources + family record handoff, v1.1. Read the attached handoff file (or ~/ClaudeBox/handoffs/2026-08-31_data-sources-and-family-record_handoff_v1.1.md) and nothing else yet. Carry the assumptions forward, ask me only what actually blocks Phase 1, then start Phase 1 and report back when it's done. Don't redo anything on the "Do not redo" list. Usual rules: direct, practical, list assumptions, confidence index.
```

---

**Confidence index:** 90/100 that a fresh session can pick this up cleanly. The only real uncertainty left is Phase 1 (whether Jeff has more to add) and Phase 2 (whether he wants the skill actually installed), both of which are simple yes/no questions, not open research.
