# Handoff: Cowork files organization

**Version:** RC | **Date:** 2026-08-31 | **Generated from:** CoWork session
**Supersedes:** none (first handoff)
**Canonical copy:** ~/Claude/Handoffs/2026-08-31_cowork-files-organization_handoff_RC.md (written via Desktop Commander)

---

## 1. Present State

**One-line status:** A master status doc for all 9 "Ungrouped" Cowork sidebar conversations was built from memory and delivered as a chat file card; the actual drag-into-folders work in the sidebar still has to be done by Jeff by hand.

**Done**
- Read every relevant memory file (`/areas/`, `/people/`, `/topics/`) to reconstruct real status/next-step for each of the 9 visible sidebar conversation titles
- Delivered `Cowork_Master_Status_RC.md` as a chat file card (see Files table)
- Suggested a 5-folder structure: Roswell, Family Letter, Fresno Family Timeline, Claude Tooling, Personal (plus existing Design folder, untouched)

**In progress**
- Nothing mid-build. This thread is a one-shot deliverable, already shipped.

**Blocked / waiting on Jeff**
- Manual drag-and-drop of the 9 conversations into the 5 suggested folders in the Cowork sidebar (Claude cannot do this; see Watch-outs)
- Confirmation of whether "Email to mom about home purchase" is a stale duplicate of "Letter to Nancy" (70/100 confidence it is, unconfirmed)
- Confirmation of whether "Fresno Family Timeline handoff" and "Fresno family timeline tool" are redundant conversations (55/100 confidence, unconfirmed)
- Whether there are more "Ungrouped" conversations below "Camping team website photos" that never appeared in the screenshot Jeff sent


**Decided (do not re-litigate)**
- Deliver the master status doc as a file, not a published Artifact link. Why: the content touches the Roswell dispute, family conflict, and the confidential Fresno Family Timeline project; a shareable web link is the wrong container for that. Rejected: Artifact publish, because it survives as a URL one share away from anyone.
- Built the doc from persistent memory, not by opening each conversation. Why: no tool in this environment can read another Cowork conversation's transcript; memory is the only durable record reachable from a fresh session. Rejected: waiting for Jeff to paste each transcript, because he asked for progress now.
- 5-folder scheme: Roswell / Family Letter / Fresno Family Timeline / Claude Tooling / Personal, leaving the existing Design folder alone. Why: matches the actual project boundaries found in memory. Rejected: one flat "Family" folder, because Roswell (property/legal) and the Family Letter project (relationship/emotional) have different audiences and different next-actions.

**Assumptions in play**
- The 9 titles in Jeff's screenshot are the complete "Ungrouped" list (unconfirmed; screenshot was visibly cut off after "Camping team website photos")
- "Email to mom about home purchase" and "Letter to Nancy" are the same underlying letter effort at different versions (unconfirmed, 70/100)
- "Fresno Family Timeline handoff" and "Fresno family timeline tool" cover the same project from two angles rather than two distinct work items (unconfirmed, 55/100)

**Open questions for Jeff**
1. Are there more conversations below "Camping team website photos" in Ungrouped? Matters because the folder scheme and this handoff both stop there.
2. Is "Email to mom about home purchase" superseded by the Letter to Nancy thread (now at truth-copy v1.19), or does it hold something separate? Matters because working in it further could duplicate or conflict with v1.19.
3. Same question for "Fresno Family Timeline handoff" vs. "Fresno family timeline tool": one thread or two?

---

## 2. Compacted Context

**Goal, and why it matters**
Jeff's Cowork sidebar has a growing "Ungrouped" list of past conversations and he wants them sorted into folders, and wants assurance he isn't about to redo work (or re-draft something already advanced) by reopening the wrong one.

**Key facts and numbers**
- The 9 known Ungrouped titles: Roswell handoff v1.2, Letter to Nancy, Email to mom about home purchase, Intel sweep skill, Roswell wrist injury analysis, Fresno Family Timeline handoff, Fresno family timeline tool, Claude tools and connectors, Camping team website photos. Plus an existing "Design" folder (already grouped, leave alone).
- Per-conversation status (full detail in the delivered doc, condensed here):
  - **Roswell handoff v1.2**: current, saved `~/ClaudeBox/handoffs/2026-08-31_roswell_handoff_v1.2.md` on the Mac mini. Canonical status doc for the Roswell renovation + transfer negotiation.
  - **Roswell wrist injury analysis**: NOT done. This is Section 5.3 of the counter-proposal (lost-capacity/wrist-injury argument), saved at `~/ClaudeBox/Roswell-Legal/Section-5.3-Lost-Capacity-Insert-RC.md`. Blocked on Jeff confirming exact time fully out of work vs. reduced capacity after the wrist injury, to convert a placeholder into a dollar figure at $128/hr.
  - **Letter to Nancy**: far along, truth-copy at v1.19 (`~/Claude/Family/letter-to-mom-truth-copy-v1.19.md` on the MacBook), RC through v1.17 behind it.
  - **Email to mom about home purchase**: likely an earlier/stale draft of the same letter effort (see Open question 2).
  - **Fresno Family Timeline handoff / tool**: private family-story archive project (WordPress + Notion, raw + sanitized databases). Confidential by Jeff's own prior instruction; do not surface specifics unprompted. Two open sub-items per its last handoff: a "Roswell ledger" location question and a neighbor child-welfare matter ("the Tolle kids").
  - **Intel sweep skill**: built, not finished. Decision Data Map v1.1 and sweep-tool SKILL.md committed on the Mac mini (`~/ClaudeBox/briefings/`, `~/ClaudeBox/scripts/sweep/`). Blocked on Jeff deciding: install into a live Claude Code skills directory, or leave as source file.
  - **Claude tools and connectors**: mostly settled (Tailscale/SMB mount MacBook<->Mac mini, self-healing auto-mount LaunchAgent, live-tested 8/31; session-handoff skill built 8/26). One loose end: confirm the Save skill click worked and `~/Claude/Handoffs` is connected as a folder in the desktop app (it is not, as of this session).
  - **Camping team website photos**: standalone, campingteam.us static site, trip photos in Apple Photos. No open items.

**Files, links, and where things live**

| Item | Location | State |
|---|---|---|
| `Cowork_Master_Status_RC.md` (the deliverable of this thread) | chat file card (file_uuid `0c76bef0-b9e7-498c-b912-21016b5a0daa`); session workspace copy at `/home/claude/Cowork_Master_Status_RC.md` is gone once the session ends | final (RC) |
| This handoff | `~/Claude/Handoffs/2026-08-31_cowork-files-organization_handoff_RC.md` (written via Desktop Commander) | final |
| Roswell handoff v1.2 | `~/ClaudeBox/handoffs/2026-08-31_roswell_handoff_v1.2.md` (Mac mini) | current, belongs to a different project thread |
| Letter to Nancy truth copy v1.19 | `~/Claude/Family/letter-to-mom-truth-copy-v1.19.md` (MacBook) | current, belongs to a different project thread |

**Tools and connectors used**
- `mcp__memory__*`: read-only sweep of 10+ files under `/areas/`, `/people/`, `/topics/`; nothing new written to memory this session (no new durable facts surfaced beyond what was already recorded)
- `computer_resolve_access`: attempted to control the Claude desktop app itself to manipulate the sidebar directly. **Refused by the platform** ("No requested app could be resolved on this device") because an app cannot drive itself. Do not retry this in a future session; it is a hard block, not a permissions issue.
- `ListAgents`: checked for other reachable Cowork sessions to read their transcripts directly. None were running. This is not a reliable path to another conversation's content even when one is running; it only reaches live sessions, not their conversation memory.
- `mcp__remote-devices__get_device_info`: confirmed no folder is connected on jeffreys-macbook-pro-local this session, and that `~/Claude` does not appear in the top-level home directory listing the device-bridge sees (matches the known quirk documented in `/areas/family-property-renovation.md`: the device-bridge sandbox tools cannot see `~/Claude`, but Desktop Commander can)
- `mcp__remote-devices__Desktop_Commander__*`: used to create `~/Claude/Handoffs` and write this file directly on the MacBook, bypassing the device-bridge blind spot

**Do not redo**
- The memory sweep and per-conversation status research (all 9 titles already resolved above; re-derive only if Jeff reports a conversation moved past what's here)
- Building a new master status doc from scratch; if new info comes in, edit/version the existing one instead

**Watch-outs**
- Claude cannot move, rename, or group items in the Cowork sidebar itself, and cannot drive the Claude desktop app via computer-use (blocked at the platform level). Any future "organize my sidebar" ask has to end in a proposed scheme for Jeff to apply by hand, not an automated reorg.
- The Fresno Family Timeline project is confidential by Jeff's own standing instruction: do not surface, summarize, or volunteer specifics unprompted. Engage only when Jeff raises it. This handoff already respects that; keep doing so.
- Don't assume a title like "handoff" or "wrist injury analysis" means the work is finished. Two of the 9 threads read as done from the title alone but are actually blocked on a decision from Jeff (wrist injury dollar figure; sweep skill install decision).

---

## 3. Phased Pickup Plan

### Phase 1: Confirm the open questions 🟢
- **Goal:** Resolve the three open questions above before touching anything else.
- **Steps:** Ask Jeff (a) whether there are more Ungrouped items below "Camping team website photos", (b) whether "Email to mom about home purchase" is superseded by Letter to Nancy v1.19, (c) whether "Fresno Family Timeline handoff" and "tool" are one thread or two.
- **Needs from Jeff:** answers to all three; can be answered from memory (a screenshot or a quick check in each conversation) without opening a new deep-dive.
- **Done when:** Jeff has answered, or explicitly says he doesn't need to check right now.

### Phase 2: Update the master doc and reissue if needed 🟢
- **Goal:** `Cowork_Master_Status_RC.md` becomes accurate and versioned if Phase 1 changed anything.
- **Steps:** If any Phase 1 answer changes a status or resolves a duplicate flag, edit the doc, bump to v1.1, redeliver as a chat file card (same rule as this handoff: no Artifact link, this content is sensitive).
- **Needs from Jeff:** nothing beyond Phase 1 answers.
- **Done when:** an accurate v1.1 exists, or Jeff confirms the RC is still correct and no update is needed.

### Phase 3: Jeff applies the folder structure 🟢
- **Goal:** The 9 conversations are actually grouped in the sidebar.
- **Steps:** Jeff drags each conversation into one of: Roswell, Family Letter, Fresno Family Timeline, Claude Tooling, Personal (Design stays as-is). This is manual; Claude has no tool to do it.
- **Needs from Jeff:** the actual drag-and-drop, at his convenience.
- **Done when:** Jeff confirms it's done, or doesn't care to confirm and this thread is considered closed.

**Stop conditions:** If Jeff says he doesn't want to chase down the duplicate/overlap questions, stop asking and just hand him the RC doc as final. If a new conversation surfaces that looks like it belongs in one of these 5 folders, fold it into the same doc rather than starting a new one.

---

## 4. Startup Prompt

Paste this as the first message of the new session, with this file attached or the path filled in:

```
Pick up the Cowork files organization handoff. Read the attached handoff file (or ~/Claude/Handoffs/2026-08-31_cowork-files-organization_handoff_RC.md) and nothing else yet. Carry the assumptions forward, ask me only what actually blocks Phase 1, then start Phase 1 and report back when it's done. Don't redo anything on the "Do not redo" list. Usual rules: direct, practical, list assumptions, confidence index.
```

---

**Confidence index:** 85/100 that a fresh session can pick this up without asking anything beyond the three open questions above. The uncertainty is entirely in those three questions themselves (the hidden part of the sidebar, and the two possible-duplicate calls), not in the mechanics of what to do next.
