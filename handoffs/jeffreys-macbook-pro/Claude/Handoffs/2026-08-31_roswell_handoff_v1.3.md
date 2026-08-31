# Handoff: Roswell (2870 SE Roswell)

**Version:** v1.3 | **Date:** 2026-08-31 | **Generated from:** CoWork session
**Supersedes:** ~/Claude/Handoffs/2026-08-31_roswell_handoff_v1.2.md
**Canonical copy:** ~/Claude/Handoffs/2026-08-31_roswell_handoff_v1.3.md

---

## 1. Present State

**One-line status:** Everything in v1.2 stands unchanged, still start at Phase 1 of that plan. New this session: a life-story timeline record of the wrist injury and Nancy's loan pattern went into two Notion databases, corrected twice to match the real characterization (loan, not kindness, not investment). Also: a parallel CoWork session working from `~/ClaudeBox` instead of `~/Claude` duplicated part of this work incorrectly before the mistake was caught and corrected in place.

**Done (this session, on top of v1.2)**
- Added the wrist-injury / Nancy's-loan-pattern timeline to Notion "Fresno Family - Timeline" (raw, sourced database), page `3cd3f802-1765-81b4-a823-cc2e2968f614`, and a softer version without dollar figures to the sanitized "Our Family - A Shared Timeline", page `3cd3f802-1765-81dd-bf6e-dcd237717771`. Both now correctly describe the payments as documented bridge loans ("Loan from Nancy, Roswell bridge, short-term, repay from insurance"), not support or kindness and not an investment, after two rounds of correction.
- Confirmed again, independently, via Gmail MCP: no Elliott Dale correspondence at `mumford.jeffrey@gmail.com`. Matches v1.2's own watch-out that the Gmail MCP only reaches the personal mailbox. The real correspondence lives in the `jeff@odd-jobs.org` Workspace mailbox via Mimestream, already extracted in v1.2.
- **Caught and corrected a real problem.** A parallel CoWork session this same day, using the device-bridge folder tools (`device_bash` / `device_list_dir`) instead of Desktop Commander, could not see `~/Claude` at all (it reported the folder does not exist) and built a duplicate, wrong body of work in `~/ClaudeBox` believing it was starting from scratch: a standalone "Section 5.3" insert built around a wrist-injury/payment-correlation theory that does not match the real Section 5.3 (GC labor hours, per `legal/2026-08-31_section5-rebuild_RC.md`), plus a competing, thinner handoff chain in `~/ClaudeBox/handoffs/`. Both have been marked SUPERSEDED in place, banners added to the top of each file, rather than deleted, so nothing is silently lost. See Watch-outs below.

**In progress / Blocked / Decided / Assumptions / Open questions:** unchanged from v1.2, read that file for all of it. Nothing this session touched Phases 1 through 6 of the v1.2 plan.

---

## 2. Compacted Context

Unchanged from v1.2 except the additions below.

**New files this session**

| Item | Location | State |
|---|---|---|
| Family timeline entry (raw) | Notion, Fresno Family - Timeline, page 3cd3f802-1765-81b4-a823-cc2e2968f614 | current, corrected twice |
| Family timeline entry (sanitized) | Notion, Our Family - A Shared Timeline, page 3cd3f802-1765-81dd-bf6e-dcd237717771 | current, corrected twice |
| Superseded Section 5.3 draft | ~/ClaudeBox/Roswell-Legal/Section-5.3-Lost-Capacity-Insert-RC.md | SUPERSEDED, banner added, do not use |
| Superseded competing handoff | ~/ClaudeBox/handoffs/2026-08-31_roswell_handoff_v1.3.md | SUPERSEDED, banner added, do not use |
**Watch-outs (new)**
- **CoWork sessions using the device-bridge folder tools (`device_bash`, `device_list_dir`, `device_request_folder_access`) cannot see `~/Claude` on this Mac and will falsely report it does not exist.** This already cost one full session's work today. Any CoWork session working on Roswell must use Desktop Commander (a local MCP tool with unrestricted filesystem access) for anything under `~/Claude`, never the device-bridge tools. If Desktop Commander is not available in a given session, stop and tell Jeff rather than concluding the folder is missing.
- The two superseded files were left in place with banners rather than deleted, in `~/ClaudeBox`. They are not part of the canonical Roswell record. Do not read them for facts, only for the retraction note at the top of each.

---

## 3. Phased Pickup Plan

Unchanged from v1.2. Start at Phase 1 there (refresh and route the holding reply to Dale). Phase 2, life lane intake, still needs: how long Jeff was fully unable to work, how long at reduced capacity, and the date cleared or whether still ongoing, for the wrist, plus Laura's leave dates, the Odd Jobs monthly falloff, and the Amber and family-gap items listed in `TIMELINE-OVERLAY-RC.md` section 7.

**Stop conditions:** unchanged from v1.2, restated for emphasis: never transmit anything to Dale, Nancy, or her side without Jeff's attorney reviewing first; never characterize Nancy's payments as a kindness or as an investment, they are documented loans; use Desktop Commander, not the device bridge, for anything under `~/Claude`.

---

## 4. Startup Prompt

```
Pick up the Roswell handoff. Read ~/Claude/Handoffs/2026-08-31_roswell_handoff_v1.3.md and nothing else yet. If you're a CoWork session, confirm Desktop Commander is available before touching anything under ~/Claude. Carry the assumptions forward, ask me only what actually blocks Phase 1, then start Phase 1 and report back. Don't redo anything on the "Do not redo" list. Usual rules: direct, practical, list assumptions, confidence index.
```

---

**Confidence index:** 90/100 that a fresh session can pick this up cleanly. The residual uncertainty is whether any other CoWork session, in the time since v1.2 was written, made further changes under ~/ClaudeBox believing it was working from scratch, since that failure mode is now confirmed real and may not be limited to today.
