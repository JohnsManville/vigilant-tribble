# Handoff: Unbilled Revenue Rebuild, 12-month Daily Activity Log
**Version:** RC | **Date:** 2026-09-03 | **From:** Cowork session | **Priority:** EMERGENCY (Jeff: "defcon 0")

## Goal
Rebuild a day-by-day activity log for Sep 1 2025 to Sep 3 2026 and produce a list of unbilled revenue candidates with evidence. Jeff's read: the bulk lives in (1) text threads where work happened and no invoice was ever sent, (2) material purchases with no adjacent invoice/payment. Output: one xlsx (RC) at ~/ClaudeBox/activity-log-rebuild/Odd_Jobs_Activity_Log_RC.xlsx.

## Jeff's rules for this job
- NO STONE UNTURNED. All threads in scope, including Laura, Kari, family, self-thread. Personal threads contribute whereabouts and work mentions only; do not summarize relationship content into the workbook.
- Rates for valuation: $128/hr standard, $149/hr drain/toilet, $99/hr friends/family, 2-hr minimum, materials at cost +30%. Unknown hours on a confirmed work day: placeholder 4 hrs, flagged for Jeff.
- Square is ground truth for payment where it exists (only from June 2026). Before that, FinRecon is the ledger.
- Every unbilled candidate row must carry its evidence (message quotes with dates, purchase rows, drive rows) so Jeff can decide bill / write off / favor without re-reading a year of texts.
- No em dashes in anything written for Jeff. RC then v1.1 etc.
- Read only. Never send a message, never modify chat.db or finrecon.db.

## What is already done (do not redo)
All in ~/ClaudeBox/activity-log-rebuild/extract/:
- imsg_2025-09_to_now.csv: 82,372 messages, 758 threads, Sep 1 2025 to now. Columns ts,date,chat,contact,handle,dir,group,attach,text. Built by scripts/dump_imsg.py using ~/ClaudeBox/imsg/lib (decodes attributedBody).
- imsg_threads.csv: message count per chat.
- thread_scores.csv: per-thread job-signal scores (money, addr, sched, work, done, where counts). Sorted by score. Built by scripts/score_threads.py. Top ~40 are the job threads.
- thread_hits.csv: every message that hit a signal, with which signal (7,713 rows). Read this instead of raw threads where possible.
- whereabouts.csv: 1,951 outbound messages from Jeff with location/activity signals ("on my way", "at Home Depot", addresses, job words). This is the backbone of the Daily Log.
- FinRecon extracts (from ~/ClaudeBox/finrecon/data/finrecon.db, read-only): income.csv (18 tagged business receipts), unreviewed_income.csv (76 deposits not yet classified, checking + payment platforms), expenses.csv (282 business expenses), documents.csv (61 receipts w/ job_ref), labor.csv (44 labor payouts), mileage.csv (77).
- Copied: drives_2024_2026_from_timeline.csv (Google Timeline drives, ends 2026-07-23; home is geo 45.4559,-122.6325), venmo_sms_receipts_20260731.csv, cash_worksheet_v2_20260731.csv, client_billing.md (FinRecon's provisional per-client rollup; Purcell, General/shop, Roswell, Payne, Gregg, Bonner, Dillan show positive Outstanding).
- Square pulled (Cowork): location LPMQT9SM90C2J created 2026-06-12. Only one real invoice: #000004 Josh Loerzel, Materials Deposit 3360 SW Fairmount, $3,000, PAID 2026-08-21. Invoices 1-3 are $1 tests, ignore.

## Cowork is adding (check the extract folder; may land while you work)
- calendar_events.csv (Odd Jobs Availability + primary, 12 months)
- gmail_invoices_sent.csv (sent mail matching invoice/proposal/estimate, by customer)
- notion_invoices_estimates.csv (Notion Invoices + Estimates databases)
If a file is missing, proceed without it and note the gap.

## Phase plan
Phase 2: Open the top ~40 threads from thread_scores.csv. Skip SMS short codes (86753, 90347, 58794, 899000, 97710) and vendors (Bridgetown Automotive). Fan out: one subagent per contact, input = that contact's rows from imsg_2025-09_to_now.csv. Each returns a job timeline: first contact, address, scope described, site visit date, work days (from texts), materials mentioned, wrap-up date, any payment talk (amount, method, promised vs sent), and whether an invoice was ever mentioned. Personal threads (Laura +15037099395, Kari +15419617167, Nancy, Fam Bam, Tracy): extract ONLY lines about where Jeff was / what job he was on / who he was working for, by date.
Phase 2b: Orphan purchases. For each row in expenses.csv (materials vendors), look for an adjacent payment: income or unreviewed_income within 30 days after, a documents.csv job_ref, or a job thread active that week. No match = orphan candidate. Purchases on days with no job thread and no drive away from home get flagged likely shop/personal.
Phase 3: Money match. Per job thread: paid in full / partial / nothing. Check income.csv, unreviewed_income.csv, venmo, cash worksheet, Square. "No invoice sent" confirmed via gmail_invoices_sent.csv and notion_invoices_estimates.csv when present.
Phase 4: Value. Per unbilled job: work days x hours (from texts, else 4-hr placeholder flagged), rate, materials on those days at +30%, labor paid out, minus collected. Confidence 0-100 per row.
Phase 5: Build xlsx. Sheets: Unbilled Candidates (sorted by $), Job Timelines, Daily Log (one row per day: drives, purchases, texts by contact, money in, whereabouts quotes), Orphan Purchases, Money Match, Sources & Assumptions. Then a short summary back to Jeff: total candidate $, top 10, and what needs his call.

## Known people (from FinRecon / prior sessions)
Customers with money in: Gosney, Lindsay/Lindsey, Bonner, Phillips (John, Kirk), Tanner Jackson, Purcell (Lisa, Darin), Pilotti/Jenn, Brady, Silverman, Greene, Loerzel, Steen, Upton, Cohen, Power, Dobrenz, Wardenaar, Tetz, Afagg, Joel Brown, Jose Hernandez, Michele Godwin, City Slicker Family Farm, Payne, Gregg, Dillan. Roswell = renovation + insurance claim, treat separately. Steve Miller = colleague/vendor, not a customer. Brandon Brown = friend/colleague, check for work anyway. Dima Drywall = sub.

## Stop conditions
Anything from a restricted source (therapy, Kari conditions doc, family timeline databases) surfacing: leave it out. If chat.db or finrecon.db needs re-reading, read only.

Confidence that this handoff is sufficient to run unattended: 85/100. Gap: hours per job will be rough; flag them.

## Result addendum (Claude Code session, 2026-09-03 16:15)
- Delivered: `~/ClaudeBox/activity-log-rebuild/Odd_Jobs_Activity_Log_RC.xlsx` (Unbilled Top List, Unbilled Candidates (all), Job Timelines, Daily Log 368 days, Orphan Purchases, Money Match, Contact Summaries, Crew Payables, Open Questions, Thread Coverage, Sources & Assumptions).
- Method: 63 contact threads opened in full by one subagent each (top 40 by score plus every calendar-named client and every FinRecon customer found in iMessage); one JSON per contact in `activity-log-rebuild/agent-out/`. Builder: `activity-log-rebuild/scripts/build_xlsx.py <ver>`; curated top list `scripts/consolidated.json`; crew payables `scripts/payables.json`. Next version: edit the JSONs, run with `v1.1`.
- Headline: customer-side unbilled $13.7k low to $46.8k high excluding Purcell; Purcell $0 to $13.6k (disputed, defer to the 23 July Project Record); Roswell $20k to $42k as a reimbursement claim, not a receivable; crew owed out $1.8k to $7.3k.
- Corrections to the inputs found on the way: mileage.csv "Berzac job site (N Portland)" (10 dates) and "Loerzel job site (Vancouver)" (11/11/25) are mislabels; the $250 Higgins Zelle 1/22/26 is scout dues; +15038807433 is Jeff's own Odd Jobs line; the Aug 2026 Wardenaar hashed chats are a parents' group. Logged in AI_ERROR_LOG.
- Gaps: Google Timeline has no rows for Feb 2026 and Aug 2026; bank data thin after April 2026; no FieldVibe or est-send export yet (would resolve most unnamed-client rows).
