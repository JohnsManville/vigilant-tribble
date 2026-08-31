# Handoff: Data Sources Inventory + Family Support Record

**Version:** v1.2 | **Date:** 2026-08-31 | **Generated from:** CoWork session
**Supersedes:** 2026-08-31_data-sources-and-family-record_handoff_v1.1.md
**Canonical copy:** ~/ClaudeBox/handoffs/2026-08-31_data-sources-and-family-record_handoff_v1.2.md (Mac mini, via the ClaudeBox SMB share)

---

## 1. Present State

**One-line status:** The sweep tool is confirmed installed and live (ran end to end across all 11 sources), the first real sweep caught a real business problem (a stale automation claiming the Fairmount deposit was unpaid when it wasn't), and the Record of Support is now v1.2 with a new instance Jeff volunteered mid-session. Nothing is blocked; several small business decisions from the sweep are waiting on Jeff.

**Done**
- Sweep skill confirmed installed as a real, live account-level skill. Invoking it directly returned its full content, no manual install step needed after all (the earlier plan to place it in the Mac mini's `~/.claude/skills/` by hand is moot).
- First real sweep run completed across all 11 sources. Output at `~/ClaudeBox/briefings/2026-08-31_sweep.md` (committed) + chat card.
- Found and flagged: the Fairmount $3,000 materials deposit was actually paid on Aug 22 (confirmed via Square), but Jeff's own "Daily Recap" automation said on Aug 28 that the bid was unsigned and the deposit uncollected. The automation is stale/wrong on this point.
- Record of Support bumped to v1.2: added the earliest instance on record, at 19 Jeff fed Diana and her then-wife Katie for a year, which let Diana save enough to buy a house (this predates Diana's current partner Stacy). Committed at `~/ClaudeBox/briefings/2026-08-31_Support_Record_v1.2.md`.
- Memory updated: `/people/diana.md` (new line for the Katie/age-19 instance), `/areas/family-support-record.md` (pointer updated to point at v1.2 and describe the new instance).

**In progress**
- Nothing mid-stream.

**Blocked / waiting on Jeff**
- Fairmount: needs Jeff to confirm the job's real status directly, and whether labor/remaining balance is ready to invoice at substantial completion, since the automation can't be trusted on this point.
- Business items surfaced by the sweep, no decision yet: Kari invoice ($5,424.75, Draft since June 11), Herzen bark proposal ($913, 11+ weeks unanswered), Fugate (~$1,000, demand letter vs small claims vs write-off), Elena faucet estimate ($553, needs scope confirmed with Margaret first).
- Dani Maier's office: missed the Aug 27 appointment, needs a reply about rescheduling under the 48-hour cancellation policy.
- Expired API keys (~10 days, per the Aug 28 recap): FinRecon-Analyzer and PT X2 need regenerating.
- The Record of Support: still open whether there are more instances beyond Diana/Katie and the June 2025 ER account.

**Decided (do not re-litigate)**
- Installed the sweep tool as an account-level skill via `propose_skills` rather than placing it manually in the Mac mini's `~/.claude/skills/` directory. Why: direct SSH from the device bridge to the mini's Tailscale IP (100.115.69.54) failed twice with "Network is unreachable," confirming that path doesn't exist from this sandbox; the account-skill route also works across Cowork, claude.ai, and Claude Code CLI, matching Jeff's own stated preference. Rejected: continuing to retry SSH, because the network path is structurally absent, not flaky.
- Everything decided in the v1.1 handoff still holds: family material stays factual, not "a case"; sensitive family-history content stays out of persistent memory as research output, not something Jeff stated directly; one handoff file covers this whole project.
- Briefings and the Record of Support get bumped by version (v1.1, v1.2, ...) as separate files in `~/ClaudeBox/briefings/`, not overwritten in place. This is now the established pattern.

**Assumptions in play**
- When Jeff volunteers a new support instance in conversation (as he did mid-session with the Diana/Katie fact), the right move is to fold it into the Record of Support and memory immediately, not wait for a batch. Consistent with how this session handled it; unconfirmed as a standing rule but working well so far.
- The Kari/Laura iMessage export sitting in Google Drive (`kari_laura_aug.md`, from an Aug 10 stretch) was flagged gently in the sweep output without quoting its content, since it read as an emotionally heavy day. Assuming a light touch, mentioned once, is the right level; not confirmed with Jeff.
- The Mac mini is confirmed unreachable by direct SSH from this environment's device_bash sandbox; assuming this is a structural, not transient, limit.

**Open questions for Jeff**
1. Any more Record of Support instances beyond Diana/Katie and the June 2025 ER account? Still the one open item on that thread.
2. Fairmount: now that the deposit's confirmed paid, what's the job's real status, does the labor/remaining balance need invoicing?
3. Of the sweep's "needs a response today" list (Kari invoice, Herzen, Fugate, Elena, Dani Maier's office, expired API keys), what do you want tackled first, if anything, in the next session?
4. Do you want `sweep` run on a schedule (daily or weekly), or only when you ask for it?

---

## 2. Compacted Context

**Goal, and why it matters**
Same project as v1.1 (a complete data-source inventory plus documentation of Jeff's family support), now closed out on the tooling side (the sweep tool is live and proven) and already paying off: it caught a real error in Jeff's own automation on a live job, and the Record of Support grew by one more instance Jeff gave directly.

**Key facts and numbers**
- Sweep skill name: `sweep`, invocable directly (via the Skill tool / slash) across Cowork, claude.ai, and Claude Code CLI.
- Fairmount: Square invoice for the $3,000 materials deposit shows status PAID, paid 2026-08-22. Jeff's "Daily Recap" automation (a file in Google Drive, `daily-recap-2026-08-28.md`) claimed on 2026-08-28 that the bid was unsigned and the deposit uncollected. The automation is wrong; Square is ground truth here.
- Kari invoice: $5,424.75, Draft in QuickBooks since June 11, 2026 (figure comes from the Daily Recap automation; QuickBooks itself isn't a connected source).
- Herzen bark proposal: $913, Notion pages "Herzen Estate - Driveway Bark Spread (ASAP)" and "EST - Herzen: Driveway Bark Spread," 11+ weeks unanswered as of the recap.
- Fugate: approximately $1,000, decision pending (demand letter, small claims, or write-off).
- Elena faucet estimate: $553, Notion "EST - 5117 Elena: Kitchen Faucet + Filter," needs scope confirmed with Margaret before it goes out.
- Dani Maier's office (Convergence Therapy, Dr. Dani Maier PMHNP-BC): missed the Aug 27 appointment; her email notes a 48-hour cancellation policy.
- Diana/Katie instance: at 19, Jeff fed Diana and her then-wife Katie for a year, which let Diana save enough for a house. Predates Diana's current partner Stacy. Now the lead-off item in Record of Support v1.2.
- API keys expired approximately 10 days ago (as of the Aug 28 recap): FinRecon-Analyzer, PT X2.

**Files, links, and where things live**

| Item | Location | State |
|---|---|---|
| Sweep briefing (first real run) | `~/ClaudeBox/briefings/2026-08-31_sweep.md` (committed) + chat card | final |
| Record of Support | `~/ClaudeBox/briefings/2026-08-31_Support_Record_v1.2.md` (committed) + chat card | final, v1.2, open to more instances per question 1 |
| Decision Data Map | `~/ClaudeBox/briefings/2026-08-31_Decision_Data_Map_v1.1.md` (committed, prior round) | final, v1.1, unchanged this round |
| Sweep SKILL.md source file | `~/ClaudeBox/scripts/sweep/SKILL.md` (committed, prior round) | reference copy; the installed account skill is now the live version |
| This handoff | `~/ClaudeBox/handoffs/2026-08-31_data-sources-and-family-record_handoff_v1.2.md` (to be committed) + chat card | final |
| Prior handoffs (RC, v1.1) | same folder | superseded, historical only |

**Tools and connectors used**
- `Skill` tool: invoking `sweep` directly confirmed it is installed and live, no further install step needed.
- Gmail `search_threads`, Google Calendar (`list_calendars` + `list_events` on both calendars), Google Drive `list_recent_files`, Notion (`notion-list-recent-pages` + `notion-search`), WordPress `wpcom-user-sites`, Square `make_api_request` (invoices.list), Apple Notes `list_notes`, iMessage `get_unread_imessages`, `device_list_dir` (FinRecon), `Control_your_Mac osascript` (Photos album names): all used this round for the first real sweep, all reachable and working.
- iMessage quirk: `get_unread_imessages` returns garbled NSKeyedArchiver/AppleScript metadata for messages containing rich content (dates, calendar-style text). Several messages this round came through unreadable. This is a known tool limitation, not a bug to keep re-investigating.
- Google Calendar quirk: `list_events` without an explicit `calendarId` did not reliably return the personal calendar's events. Pass `calendarId` explicitly (`mumford.jeffrey@gmail.com` and `jeff@odd-jobs.org` / "Odd Jobs - Availability Calendar") to get real results for both calendars.

**Do not redo**
- Everything on the v1.1 "Do not redo" list.
- Don't re-attempt SSH from device_bash to the Mac mini's Tailscale IP (100.115.69.54); confirmed unreachable twice, this is a structural sandbox limit.
- Don't re-run the full 11-source sweep just to "prove" it works again, that's done; just run `sweep` when Jeff wants a fresh one.
- Don't re-open or re-read the Kari/Laura Drive files (`kari_laura_aug.md`, `pull_msgs.py`, `diag.txt`, `chatlist.txt`), already reviewed once and deliberately not quoted in the sweep output.

**Watch-outs**
- Same family-material sensitivity notes as v1.1 still apply.
- The Kari/Laura iMessage export in Drive covers an emotionally heavy stretch (Aug 10 read as a genuinely hard day). Handled with a light touch once in the sweep output; didn't push further since Jeff didn't ask. Keep that same steadiness if it comes up again.
- Jeff's own automations (Daily Recap, OJ Brief) can go stale or wrong, proven this round on Fairmount. Treat their claims as a lead to verify against ground truth (Square, Notion, actual site status), not as fact.

---

## 3. Phased Pickup Plan

### Phase 1: Close the sweep-surfaced business items 🟡
- **Goal:** Get Jeff's actual decisions on the money-on-the-table items the sweep found.
- **Steps:** Ask open questions 2 and 3 together. Based on answers, draft whatever's needed (an invoice-send reminder, a Fugate demand letter, a reply to Dani Maier's office, an API-key regeneration reminder). Flag as moderate work since it may touch several small deliverables across different sources.
- **Needs from Jeff:** decisions on Fairmount's real status, and priority among Kari / Herzen / Fugate / Elena / Dani Maier / API keys.
- **Done when:** each item is either resolved or explicitly deferred with a reason.

### Phase 2: Close the Record of Support open question 🟢
- **Goal:** Know whether more support instances exist beyond what's now in v1.2.
- **Steps:** Ask open question 1. If yes, fold into v1.3. If no, this thread is done.
- **Needs from Jeff:** the instances, if any.
- **Done when:** Jeff confirms it's complete, or v1.3 ships.

### Phase 3: Decide sweep cadence 🟢
- **Goal:** Know if Jeff wants `sweep` run automatically (a scheduled task) or only on demand.
- **Steps:** Ask open question 4. If scheduled, set up a proper scheduled task (not local cron) that fires the sweep at whatever cadence he wants.
- **Needs from Jeff:** a yes/no, and a cadence if yes.
- **Done when:** either a scheduled task exists, or Jeff has said on-demand is fine.

**Stop conditions:** Same as before: if the family thread shifts from documentation into something reading like acute distress, stop and check in rather than push forward. If a sweep-surfaced item touches money or an outside party and Jeff hasn't clearly authorized the specific action (sending, paying, posting), draft it and stop there, don't act on it.

---

## 4. Startup Prompt

Paste this as the first message of the new session, with this file attached or the path filled in:

```
Pick up the data sources + family record handoff, v1.2. Read the attached handoff file (or ~/ClaudeBox/handoffs/2026-08-31_data-sources-and-family-record_handoff_v1.2.md) and nothing else yet. Carry the assumptions forward, ask me only what actually blocks Phase 1, then start Phase 1 and report back when it's done. Don't redo anything on the "Do not redo" list. Usual rules: direct, practical, list assumptions, confidence index.
```

---

**Confidence index:** 93/100 that a fresh session can pick this up cleanly. The sweep tool is proven working end to end and the Record of Support's open item is simple; the only real uncertainty is which sweep-surfaced business items Jeff wants tackled first.
