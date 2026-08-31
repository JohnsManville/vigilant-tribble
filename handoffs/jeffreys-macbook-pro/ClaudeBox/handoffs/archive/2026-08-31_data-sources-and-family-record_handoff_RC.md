# Handoff: Data Sources Inventory + Family Support Record

**Version:** RC | **Date:** 2026-08-31 | **Generated from:** CoWork session
**Supersedes:** none (first handoff for this pairing; distinct from the older ClaudeBox handoffs in this same folder, which cover other projects)
**Canonical copy:** ~/ClaudeBox/handoffs/2026-08-31_data-sources-and-family-record_handoff_RC.md (Mac mini, via the ClaudeBox SMB share)

---

## 1. Present State

**One-line status:** Two threads finished this session: a complete inventory of Jeff's connected data sources (business and personal) with a Claude Code build prompt for a `sweep` tool, and a documented record of Jeff's support for the Mumford family pulled from his own existing Notion timeline project plus memory and financial records.

**Done**
- Full live sweep across Gmail (personal, work email confirmed as an alias into the same inbox), Google Calendar, Google Drive, Notion Command Center, WordPress.com (4 sites), Square, Apple Notes, iMessage, Apple Photos, and FinRecon (delivered in chat across several turns, not saved as a standalone file)
- Claude Code build prompt for a `sweep` CLI/skill tool, drafted and delivered (file card only, see table below)
- "Decision Data Map" document: sources organized by which life/business/family decision they inform (file card only, see table below)
- Source comparison table (freshness, authority, overlaps/conflicts) delivered in chat text, not saved to a file
- FinRecon deep dive: confirmed a full per-account bank/card archive exists at `~/ClaudeBox/finrecon/data/archive` (Amex x2, Chase x3, Citi Costco, HD Pro Xtra, Lowe's Commercial, a QuickBooks checking account, USAA x5 including a youth savings account, CashApp, Venmo)
- Corrected an earlier assumption: SimpleFIN (USAA, confirmed live Aug 13 via email) and Plaid (Venmo-to-Chase, Aug 1) bank feeds are already live, not a "gap" as stated in the Decision Data Map file, which was not updated to reflect this correction
- Clarified the "Purcell" matter found in FinRecon: it is an archived, superseded client debt-recovery attempt (demand letter, recovery plan, job closeout), not an active outside legal case
- Confirmed Google Location Timeline data is already extracted into `drives_2024_2026_from_timeline.csv` inside FinRecon; no live location connector exists or was requested
- Found a Wyze security camera album in Apple Photos; this is an untracked data source, not connected to any tool
- "Record of Support" document: compiled every instance of Jeff helping/supporting the Mumford family, sourced from two pre-existing Notion databases ("Our Family — A Shared Timeline" and "Fresno Family — Timeline") plus memory and financial records (Roswell purchase, mini-splits). Delivered as a file card.

**In progress**
- Nothing mid-stream. The last delivered item was the Record of Support file.

**Blocked / waiting on Jeff**
- Nothing strictly blocked, but several open offers below need a yes/no before the next session should spend more effort on them.

**Decided (do not re-litigate)**
- The Record of Support stays factual documentation, not an argument or "case." Why: an entry in Jeff's own Fresno Family Timeline (added 2026-08-31, the Rowan/murder-suicide entry) carries his own instruction not to build this into "a family-abandonment case." Rejected: a more persuasive/advocacy framing, because it would override Jeff's own stated boundary on this material.
- Sensitive family-history content discovered in Notion (health diagnoses, recovery details, relationship structure, the Chris Berzac death, the "manic" mischaracterization) was NOT written into Claude's persistent memory this session. Why: it came from reading Jeff's own files, not from Jeff stating it to Claude directly in conversation, and memory privacy rules only file user-stated facts. Rejected: summarizing it into memory files for convenience, because that would misapply the [stated] tag to research output.
- This handoff keeps Thread 2 (family) at a summary level and points to the source Notion databases and the delivered Record of Support file, rather than re-quoting sensitive detail inline. Why: the handoff may land in a shared folder; minimize duplication of sensitive material per the handoff skill's own data-minimization rule.

**Assumptions in play**
- The folder access granted this session (`/Users/jeffmumford/ClaudeBox`) is per-session and will need to be re-granted (one `device_request_folder_access` call) in a fresh session before FinRecon or the handoffs folder can be reached again (unconfirmed, but consistent with how the bridge has behaved so far)
- `~/ClaudeBox/handoffs` (lowercase, on the Mac mini via the SMB share) is being treated as the canonical handoffs folder, not `~/Claude/Handoffs` as the handoff skill's own instructions assume as a default. This folder already holds many other handoffs from other projects using a different naming convention (`HANDOFF-YYYY-MM-DD-...`); this file uses the skill's own naming convention instead for consistency going forward. (Unconfirmed with Jeff which convention he actually wants long-term.)
- `device_bash` was unreliable this session (failed twice, generic error, no retry succeeded); `device_list_dir` and `device_bash`-free approaches worked fine. A fresh session should prefer `device_list_dir` / `device_stage_files` over `device_bash` for FinRecon work until this is understood.

**Open questions for Jeff**
1. Do you want the Claude Code `sweep` tool actually built now, or was the drafted prompt enough for later? Matters because building it is real work, not just a prompt.
2. Do you want the Decision Data Map file corrected for the SimpleFIN/Plaid live-bank-feed finding, or is the chat correction enough? Matters because the file itself (already delivered) still states it as a gap.
3. Do you want the two Notion pages edited on 2026-08-31 (the Nancy "manic" reversion, and the Julie advance-directive incident) opened in full, beyond the database-row summary already pulled? Matters because only the row-level Description was read, not the full page body.
4. Are there instances of your support for the family that aren't captured in the Record of Support file? You asked for "every instance"; the file is built from what's documented in Notion plus what's in memory, not from a from-scratch interview.

---

## 2. Compacted Context

**Goal, and why it matters**
Jeff asked for a complete map of every data source available for decision-making (business, financial, family, personal), then asked specifically for "all items related to family," which surfaced a pre-existing personal Notion project documenting a serious family health/conflict history. He then said that picture "seems grossly undermined" and asked for every instance of him helping and supporting the Mumfords, which this session compiled from that same Notion project plus memory and financial records.

**Key facts and numbers**
- FinRecon lives at `~/ClaudeBox/finrecon` (Mac mini, reached from this MacBook Pro session via the ClaudeBox SMB share). Data folder: `~/ClaudeBox/finrecon/data`. Superseded/archived material: `~/ClaudeBox/finrecon/data/_SUPERSEDED_2026-07-20` and `~/ClaudeBox/finrecon/data/archive`.
- Two Notion databases carry the family history: "Our Family — A Shared Timeline" (`collection://95d157c3-614e-4452-b07c-cc832ef69df3`, 17 rows, simpler schema) and "Fresno Family — Timeline" (`collection://a11c2b25-c82c-422b-8c5a-2d5b089881bd`, ~50 rows, richer schema with Quotes, People, Full context, Laura's notes columns). Both are queryable directly with `notion-query-data-sources` (SQL mode) once the collection URL is known; no need to re-search for the URLs.
- Square location ID for Odd Jobs: `LPMQT9SM90C2J`. WordPress site IDs: odd-jobs.org is blog_id 234704988 (full access); boatelpdx.wordpress.com, rosewilddesigns.wordpress.com, and jeff...-gofld.wordpress.com (oldsmarine.com) are the other three, two of which need a paid plan for MCP tools.

**Files, links, and where things live**

| Item | Location | State |
|---|---|---|
| Claude Code `sweep` build prompt | chat file card only (session workspace, lost) | final draft, not yet acted on |
| Decision Data Map | chat file card only (session workspace, lost) | final, but stale on the bank-feed point (see Decided above) |
| Record of Support | chat file card only (session workspace, lost) | final as delivered; open to additions per question 4 |
| This handoff | `~/ClaudeBox/handoffs/2026-08-31_data-sources-and-family-record_handoff_RC.md` (committed) + chat file card | final |
| "Our Family — A Shared Timeline" (Notion) | `collection://95d157c3-614e-4452-b07c-cc832ef69df3` | Jeff's existing, ongoing project; not modified this session |
| "Fresno Family — Timeline" (Notion) | `collection://a11c2b25-c82c-422b-8c5a-2d5b089881bd` | Jeff's existing, ongoing project; not modified this session |

The three file-card-only deliverables are gone once this session ends unless Jeff saved them himself; regenerate from this handoff's context if needed rather than re-running the full sweep.

**Tools and connectors used**
- Gmail, Google Calendar, Google Drive, Notion (search, fetch, query-data-sources), Square (`make_api_request`), WordPress.com (`wpcom-user-sites`): all live and working, no auth issues.
- `mcp__remote-devices__*`: device bridge to `jeffreys-macbook-pro-local`. `device_request_folder_access` for `~/ClaudeBox` succeeded and granted `/Users/jeffmumford/ClaudeBox`. `device_list_dir` worked well. `device_bash` failed twice with a generic "failed in the device workspace" error; did not retry a third time per the tool's own guidance. `Control_your_Mac__osascript` worked for Photos (album count/names) but Voice Memos has no AppleScript dictionary in current macOS (confirmed dead end, do not retry).
- The remote-devices MCP server disconnected and reconnected once mid-session (transient); if tools are missing, a `ToolSearch` retry is usually enough, no user action needed.

**Do not redo**
- The full source-by-source sweep (Gmail/Calendar/Drive/Notion/WordPress/Square/Apple Notes/iMessage/Photos/FinRecon) — it's summarized in Present State and the file cards above.
- Re-searching Notion for the two family timeline databases — their collection URLs are recorded above, fetch or query directly.
- Re-establishing that work email routes into the personal Gmail inbox, that Voice Memos is unreachable, or that the Purcell matter is closed/archived, not active.

**Watch-outs**
- Thread 2 (family) is sensitive: recovery/sobriety history (both Jeff and Laura), a mental-health mischaracterization ("manic," medically refuted as anxiety/ADHD), a family suicide (Chris Berzac, June 2026), and a consensual non-monogamy arrangement (Kari, Brandon) all appear in the source Notion databases. Handle with the same care as this session did: factual, non-inflammatory, no "case-building," and do not write any of it into persistent memory as a [stated] fact unless Jeff says it directly in conversation.
- Jeff's own Notion entry (added today) explicitly instructs against turning this into "a family-abandonment case." Respect that boundary in any follow-up work on this thread.
- If Jeff seems to be in a heightened emotional state when picking this thread back up, prioritize being steady and factual over feeding a grievance narrative, consistent with how this session handled it.

---

## 3. Phased Pickup Plan

### Phase 1: Confirm direction 🟢
- **Goal:** Know which of the four open questions above Jeff wants acted on, if any.
- **Steps:** Ask the four open questions (or however many are still unanswered). If Jeff says "nothing, just wanted the record," stop here.
- **Needs from Jeff:** answers to the open questions
- **Done when:** Jeff has responded to at least the questions that matter to him

### Phase 2: Correct the Decision Data Map 🟢
- **Goal:** The Decision Data Map file no longer states live bank feeds (SimpleFIN/Plaid) as a gap.
- **Steps:** Regenerate the file with the "Gaps worth closing" section updated (drop or reframe item 1), redeliver as a new file card.
- **Needs from Jeff:** none, this is a factual correction
- **Done when:** corrected file delivered

### Phase 3: Build the `sweep` tool (only if Jeff says go) 🟡
- **Goal:** A working Claude Code tool/skill that runs the source sweep on demand instead of manually.
- **Steps:** Use the drafted build prompt (recreate from this handoff's context if the original file is gone) as the spec; build on the Mac mini via Claude Code CLI, following the guardrails already specified (read-only, no auto-send, snippet-not-full-body output, respect the "no abandonment case" and similar handling rules).
- **Needs from Jeff:** a go-ahead, since this is real build work, not a chat answer
- **Done when:** the tool runs once successfully and produces a briefing file

### Phase 4: Add missing support instances (only if Jeff has more) 🟢
- **Goal:** Record of Support file reflects anything Jeff adds that isn't already in Notion or memory.
- **Steps:** Interview Jeff for additional instances, add them to the file, redeliver.
- **Needs from Jeff:** the actual instances
- **Done when:** Jeff confirms the record is complete

**Stop conditions:** If Jeff wants to go deeper into the sensitive family material (opening the two Notion pages in full, adding more detail to the timeline itself), proceed factually but stop and check in if the conversation shifts from documentation into something that reads like acute distress rather than record-keeping. If `device_bash` fails a third time in the same way, stop retrying it and tell Jeff rather than continuing to burn attempts.

---

## 4. Startup Prompt

Paste this as the first message of the new session, with this file attached or the path filled in:

```
Pick up the data sources + family record handoff. Read the attached handoff file (or ~/ClaudeBox/handoffs/2026-08-31_data-sources-and-family-record_handoff_RC.md) and nothing else yet. Carry the assumptions forward, ask me only what actually blocks Phase 1, then start Phase 1 and report back when it's done. Don't redo anything on the "Do not redo" list. Usual rules: direct, practical, list assumptions, confidence index.
```

---

**Confidence index:** 82/100 that a fresh session can pick this up cleanly. The uncertainty is mostly about Thread 2: whether Jeff wants more work on the family record at all, and whether the sensitivity handling here matches what he actually wants going forward. The data-sources thread (Thread 1) is more straightforward at 92/100.
