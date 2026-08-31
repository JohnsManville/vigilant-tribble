# Notion Sub-System Work Queue (execute in order, auth first)

Status 2026-08-06 (4th update — FINAL, FILE CLOSED): Queue itself completed 8/1; on 8/6 the kari session (live in-session Notion MCP) cleared the ENTIRE subs open-items board — Handled checklist 7/7 ticked: Girgich rate $25/hr CONFIRMED · Hinckley rate $30/hr SET · Nebbie rate VARIES per job (Rate blank, Basis Per Job) · Girgich screen door COMPLETED & PAID $60 via Cash App, fully logged (first assignment through the whole Draft→Paid lifecycle) · "Amber Purple" VERIFIED = Amber Purkapile · TJ 12/12/25 timesheet 5h SETTLED ($100 sent 8/6) · TJ 1/9–1/10 payday DOCUMENTED per Jeff: paid $1,050 cash at the time · Gibb Elliott PAID IN CASH directly per Jeff (no payout pending; his hours contest survives on paper only, in the frozen 7/22 Purcell record, untouched). Roster = 12; Fischer + Cohen still deliberately excluded (ask Jeff before ever adding). Nothing left in this queue — future sub work tracks on the Handled page itself.
[8/1 record: Step 0 kari OAuth done & verified. Step 1 both TEST records verified in Notion trash (mumford cowork session). Step 2 created Gowans (Active), Hainsworth (Active), Hernandez (Inactive, Jeff's call); zero enrichments needed, nothing overwritten. Step 3 Pay $60/Per Job set on the screen-door assignment. Historical idempotency rule for executors: check DB state first; name variants count as existing ("Nebbie" IS Paxton, "Drew" = "Andrew" Hainsworth); never duplicate.]

## 0. Verify auth
Notion MCP server is configured user-scope in `~/.claude.json` (`notion` → https://mcp.notion.com/mcp). Complete/verify OAuth (Jeff approves in browser with his own Notion login — the workspace holding the "Handled" page). Confirm tools load and the Handled page (`37d3f802-1765-81b4-b041-e3633ddc0137`) is accessible before doing anything below.

## 1. Delete the two TEST records
- Subcontractors DB: `83eeabd4-d2fe-4856-b60b-b27b117c199c` — one test subcontractor
- Assignments DB: `4ea165fa-7e0b-4633-abfd-9c7ded9daba2` — one test assignment
- Verify each is unmistakably a TEST record before trashing. Do NOT touch: Jeff Girgich, Tanner Jackson (TJ), or the live assignment "Screen door install — Larysa & Mikel" (Confirmed, 2026-08-01).
- Move to Notion trash (recoverable), nothing else.

## 2. Load remaining real subs (Subcontractors DB) — DELTA ONLY
Nine already exist (see Status line). Remaining to CREATE: only #4 Peter Gowans, #6 Drew Hainsworth, #7 Jose Hernandez below. For the others listed here that already exist (possibly under short names like "Nebbie"): compare and fill EMPTY fields from this data (phones/emails/notes), never overwrite non-empty fields, never create duplicates. Data mined 2026-08-01 from finrecon `labor_payments` (Mini) + AddressBook contacts cache. Status = Active, Preferred Contact = Text where a phone exists, leave Rate BLANK (unknown — do not invent), payment history goes in Notes.

1. **Margaret "Nebbie" Paxton** — 503-444-1461, paxtonnebbie@gmail.com. Pays via Zelle. Notes: 19 payments totaling $3,565, Oct 2025–Jul 2026, jobs Purcell + Roswell casualty rebuild. Most active current sub after Girgich.
2. **Matt Hinckley** — 503-307-2052, matt_h85@hotmail.com (alt matt@mattandfredsolutions.com, "Matt and Fred Solutions"). Notes: $1,000 on Purcell, 3/6/2026.
3. **Audrey Parker** — 719-210-1253, astra.sub.one@gmail.com. Notes: $771.65 across 2 payments, Jan–Feb 2026, Purcell.
4. **Peter Gowans** — 503-380-1962 (alt 971-424-8086), pnwmoldmasters@gmail.com. Trade: mold remediation (runs PNW Mold Masters). Notes: $610.50, Feb + Jun 2026, jobs Mold Masters, Malcolm/Roswell.
5. **Gibb Elliott** — 503-989-9926, gibbelliott@gmail.com. Notes: Purcell sub, Venmo-paid (in Purcell records, not labor_payments).
6. **Drew (Andrew) Hainsworth** — 503-724-6496. Notes: $400, Oct–Nov 2025, Mold Masters job.
7. **Jose Hernandez** — 503-290-8572. Notes: $900 across 3 payments, Sep 2024–Jun 2025. Pre-2026 era.
8. **Amber Purkapile** — 503-969-9647, need.a.hand.asap@gmail.com (saved in contacts as "Amber Purple"). Notes: $360 across 3 payments, Jan–May 2026, jobs Cohen, Payne.

Deliberately excluded (ask Jeff before adding): Joel Fischer (2015–17 only), Brian Cohen (2016–17, likely the Cohen-job customer).

## 3. Still open after this
- DONE 8/1: Pay $60 / Per Job set on the Girgich screen-door assignment — then completed & paid $60, logged 8/6.
- DONE 8/6: this file updated and closed (final status above).
