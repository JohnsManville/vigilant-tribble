# 2870 SE Roswell — Project Archive
## HANDOFF TO CLAUDE CODE — Release Candidate (RC)

**Written:** 2026-08-12
**Written by:** Cowork cloud session (Gmail / Drive / Notion reach)
**Written for:** Claude Code running locally on jeffreys-macbook-pro
**Owner:** Jeff Mumford — owner, acting GC, Odd Jobs – Handyman Services

---

## 0. WHY YOU ARE READING THIS

A cloud Cowork session ran preflight on the 2870 SE Roswell archive project and hit a hard wall: **the highest-value work left is local to Jeff's Mac and the cloud session cannot reach it.** You can. This document hands you that half of the job.

Read Section 4 (Division of Labor) first if you only read one thing.

---

## 1. THE PROJECT IN ONE PARAGRAPH

2870 SE Roswell St, Milwaukie, OR 97222 is a family-owned property. Jeff's mother Nancy lives there — or did, until a June 2025 water loss and secondary mold growth displaced her. Jeff is the owner/GC and is doing much of the work himself. There are **two workstreams running in tandem, not sequentially**:

- **Workstream A — FINISH AND OCCUPY.** Pull every spec, plan, takeoff, model number, and finish selection into one build book so the renovation completes and Nancy moves home.
- **Workstream B — CLAIM ADVANCEMENT.** Assemble the documentary and financial record to push the Safeco claim toward further payout.

The same receipt is a build-book line item AND a claim line item. Index once, tag for both.

---

## 2. VERIFIED FACTS — TREAT AS ANCHORS

These were confirmed against source documents. Do not re-derive; do not contradict without evidence.

### Claim & policy
- Policy **OP6225045**, Safeco Insurance Company of Illinois
- Claim **# 059560682-01**. Date of loss: **June 13, 2025**
- Insureds of record: **Nancy T. Mumford & Jeffrey Mumford** (Laura Mumford co-owner)
- Adjuster: **Jessica LaClair**, Jessica.Laclair@libertymutual.com
- **2025-06-24** — carrier issued reservation of rights citing duty-to-mitigate (`Mumford, Jeffrey ROR.pdf`)
- **2025-11-10** — Safeco information request forwarded by Julie Mumford, already ~2 weeks stale on arrival; forwarded to Mold Masters same night; **no traceable response found**
- **Claim framing on file: WATER DAMAGE under Coverage A** with the Water Seepage or Leakage Endorsement, mold as *secondary* microbial growth. **Defend this framing.** If the loss is recharacterized as a mold claim, recovery collapses to the fungi sublimit.

### Contractor
- **PNW Mold Masters Inc**, 11800 NE 124th Ave Unit K152, Vancouver, WA 98682
- pnwmoldmasters@gmail.com — *also* pnwmoldmaster@gmail.com (singular; one email went there — search both)
- (971) 424-8086 on file. **Rose City Labs lists Peter Gowans at (503) 380-1962** — discrepancy, unresolved.

### Mortgagee / loss payee
- **CMG Financial**, pnwloans@cmgfi.com, contact Bri Arriola
- Oct 2025: claim check **returned to sender**, unexplained by servicer; endorsement/re-mail still being chased as of 2025-12-29

### Family on threads
julie.mumford@gmail.com, mumford.nancy@gmail.com, mumford.diana@gmail.com, terrychasteen14@gmail.com, callen3336@aol.com (Catherine)

### Known financial documents
All in Google Drive folder `1rPQ7amtphBXMojk7lcpnov-F0PWpCLun`, owned/shared by pnwmoldmasters@gmail.com. **Verified reachable from the cloud session.**

| Doc | Date | Amount | Note |
|---|---|---|---|
| Estimate 1072 | 07/08/2025, **ACCEPTED 07/11/2025** | **$27,400** | pack-out, demo, mold remediation (bedroom, sewing room, master, bath), rebuild |
| Estimate 1091 | 09/15/2025, no acceptance shown | **$9,175** | kitchen containment/demo/drying/subfloor/flooring |
| Claim_Report_Mumford_Updated.pdf | 09/17/2025 | $28,255–$32,805 | cause = toilet & bathtub leaks, kitchen secondary |
| Claim Support Report (Google Doc) | 09/16/2025 | $14,005 | kitchen only; cause = **kitchen sink plumbing** |
| E215 Mold Report (Rose City Labs) | sampled 6/20–21/2025 | — | sewing room 11,943 CTS/M³ (chronic amplification), bathroom 7,600, crawlspace 6,229, outdoor control 2,686. **Chaetomium** (water-indicator organism) in sewing room + crawlspace |

Folder also contains an **undisclosed `Photos` subfolder** (`1IHxPsWgN_fWsAkKqV3XQqWvC3oj34S3x`) that was not in the original brief.

---

## 3. KNOWN DEFECTS IN THE CLAIM FILE

Do not paper over these. They are the work.

1. **E215 lab report names the WRONG PROPERTY.** Origin Address reads **2908 SE Malcolm St** (Jeff's own house) instead of 2870 SE Roswell. Must be reissued by Rose City Labs (503-307-0096) before further use as claim evidence.
   **Worse than originally understood:** the Rose City Labs *email itself* is titled "Environmental Report: 2908 SE Malcolm St," and Jeff forwarded that wrong-address report to **five family members (6/25/25) and to PNW Mold Masters (7/1/25)**. The defective document is in circulation.
   → A correction-request email to Rose City Labs is to be **drafted for Jeff's approval. Do not send.**

2. **Cause-of-loss conflict.** Two claim reports submitted a day apart state different causes: toilet/tub leaks (9/17) vs. kitchen sink plumbing (9/16). Determine which is the **position of record with the carrier** and document the reconciliation.

3. **Estimate 1072 labor rates will not survive Xactimate comparison** — $375/hr rebuild, $150/hr packing. Flag which line items are exposed.
   *New context:* **PDX Restoration Services** (Reuben Federer / Daniel Petrovskiy, 971-645-5471) sent a competing estimate **7/2/2025**. A second bid on the same scope is directly relevant to defending — or abandoning — the 1072 rates.

4. **Estimate 1091 shows no acceptance.** Determine whether the $9,175 kitchen scope was ever submitted to or approved by anyone. If never submitted, it is a live supplement candidate.

---

## 4. DIVISION OF LABOR — THE CORE OF THIS HANDOFF

The cloud session and Claude Code have **non-overlapping reach**. Neither can do this alone.

### Cloud Cowork session CAN reach (you probably cannot)
- **Gmail** — one mailbox carrying *both* `mumford.jeffrey@gmail.com` and `jeff@odd-jobs.org`. Confirmed: the Roswell drywall bill thread, Home Depot Pro receipts, Rose City Labs threads, and Safeco/Mold Masters threads are all present.
- **Google Drive** — authenticated as jeff@odd-jobs.org. Both target folders reachable.
- **Notion** — substantial Roswell content (project page, Peter Gowans, "Adrian (Liberty)", "Roswell cabinet purchase cost").
- **Google Calendar**, **Square**, **WordPress**.

### Claude Code CAN reach (the cloud session cannot) — **THIS IS YOUR JOB**
- **`~/.claude/projects` — the FinRecon CLI project.** 7 sessions, 37.3 MB. Anchor prompt on record: *"review where we have gaps in the FinRecon Tool."*
- **The full local filesystem** — not just the one connected project folder.
- **Apple Photos library / local photo folders** — site and damage photography. Currently entirely unmapped.
- **iMessage database** (`~/Library/Messages/chat.db`) — texts with Peter Gowans and family. Currently entirely unmapped.
- **Local OCR and scripting** at no per-token document cost.

### Currently connected local folder (design files only)
`/Users/jeffmumford/Claude/Projects/2870 SE Roswell`

```
Hammered Copper Sink Comparison - RC.md
Roswell_Copper_Sink_Comparison_RC.md
Roswell_Finishes_Checklist_v1.1.md
Roswell_Kitchen_Backsplash_DesignBoard_RC.html
Roswell_Kitchen_Orthographic_Renders_RC.html
Roswell_Kitchen_SpecSheet_RC.pdf
Roswell_Paint_ButterMatch_RC.pdf          (26 MB)
Roswell_Paint_Palettes_RC.pdf
Roswell_RangeWall_Render_RC.png
Roswell_SinkWall_Render_RC.png
Kitchen Backsplash Renderings RC/         (5 option renders + PDF/PNG boards)
Patchwork B&W Renders RC/                 (VariantA FullSplash, VariantB FeatureWall, + prompts)
```

**Zero claim documents. Zero receipts. Zero photos of the loss.** This folder is Workstream A design material only.

### Out of scope / dropped
- **Todoist — DROPPED.** Jeff scrapped it 2026-08-12. Do not search it, do not ask about it, do not reinstate it.

---

## 5. BLOCKER #1 — FINRECON

**This is the single highest-value thing you can do that the cloud session cannot.**

Deliverable G of the project spec is a financial dataset exported into FinRecon and run. The cloud session found:

- FinRecon is **not** a connector and **not** an available tool — it is a local CLI project living in `~/.claude/projects`
- Notion page **"CLI · FinRecon — 7 sessions, 37.3 MB"** confirms location and size
- Notion page **"FinRecon remote access runbook"** exists, is tagged `RUNBOOK — do not archive`… **and is completely blank.**

Jeff's standing rule, quoted: *"Export in FinRecon's expected input format and run it. If you cannot determine that format with certainty, STOP and ask — never guess a schema and produce a file that silently fails to import."*

The cloud session stopped and asked. **You should not have to.** Read the local project and determine:

1. The exact expected input format (file type, delimiter, encoding)
2. The exact field names and column order
3. Required vs. optional fields, and date format
4. How the tool is invoked (entry point, args, config file)
5. Where output lands

Then **write the runbook back into the blank Notion page** so this never blocks anyone again.

Target fields per the project spec (map these to FinRecon's actual schema, don't assume):
`date, vendor, amount, payment_method, category, room_or_phase, source_document_link, claim_eligibility_flag`

---

## 6. WHAT PREFLIGHT TURNED UP THAT CHANGES THE PICTURE

Six findings from the cloud session that were **not** in the original brief:

1. **The record runs 8 months longer than assumed.** The brief treats the timeline as ending 2025-12-29. It runs to at least **July 2026** — drywall bill 6/5/26, Home Depot appliance delivery 1/10/26, Dry Box invoices through 7/28/26. The archive spans ~14 months, not 6.

2. **`COUNSEL_PACKET.pdf` exists in Drive** — created 2026-07-21, 485 KB, two identical copies. Jeff has not explained it. **If counsel is engaged, that changes how the claim summary and gap list should be written, and possibly whether output should route through the attorney.** Open question for Jeff.

3. **A second contractor bid the job** — PDX Restoration Services, estimate 7/2/2025. See Defect #3.

4. **The wrong-address lab report is in circulation** — see Defect #1.

5. **Dry Box, Inc — $145/month recurring**, invoices found from at least Jan 2026 through Jul 2026. Almost certainly pack-out storage. **If never submitted to the carrier, this is a live supplement candidate** under loss-of-use or contents. Unverified whether it relates to Roswell — confirm before claiming it.

6. **Peter Gowans phone discrepancy** — (503) 380-1962 per Rose City Labs vs. (971) 424-8086 on file.

---

## 7. NEXT STEPS — ORDERED

### Immediate (Claude Code, local)
1. **Crack FinRecon.** Read `~/.claude/projects`, determine the input schema with certainty, document it. Write the runbook back to the blank Notion page. → unblocks Deliverable G.
2. **Map the photo record.** Locate site/damage/progress photography — Photos library, phone backups, local folders. Organize by **date and by room**. This is Category 06 of the archive and it is currently 100% dark. Photos taken at discovery (June 2025) and immediately post-demo are the most claim-valuable assets that exist.
3. **Extract the iMessage record.** Query `chat.db` for Peter Gowans, Julie Mumford, Nancy Mumford, and any Rose City Labs / CMG contacts. Texts with the contractor will contain scheduling, scope changes, and payment discussion that never hit email. Export to a readable format for indexing.
4. **Sweep the wider local filesystem** for Roswell material outside the one connected project folder — receipts, scans, takeoffs, downloaded PDFs, prior AI session outputs.

### Then (either session, coordinated)
5. **Step 2 — Policy read.** Retrieve the four attachments from the 2025-06-30 email *"2870 Roswell - Insurance Info (share ok)"* (jeff@ → pnwmoldmasters@; a 7/1 duplicate went to the singular address). Produce the **POLICY SUMMARY** in this order:
   1. **Fungi/mold limit or sublimit — quote verbatim.** This is the ceiling if the water framing fails. Everything else is secondary to this number.
   2. Water Seepage or Leakage Endorsement — grant *and* limitations, verbatim
   3. Suit-limitation period + every notice/proof-of-loss deadline, **with days remaining as of run date** (working estimate: Oregon-typical 2 years from DOL ≈ **June 13, 2027** — verify against the actual policy)
   4. Dwelling / other structures / personal property / loss-of-use limits; deductible
   5. Water exclusions — especially repeated-seepage / long-term-leak language (the recharacterization hook), verbatim
   6. Duty-to-mitigate and duty-to-cooperate (the ROR cites these)
   7. Appraisal clause; ordinance-or-law / code-upgrade coverage
   Close with plain math: **paid to date, what the policy could still owe, what stands between the two.**
   *Also check for a newer policy period — if renewed, the newer dec page governs.*

6. **Step 3 — Broad search**, then **Step 4 — archive structure**, then **Step 5A — Master Index**.

### Checkpoints Jeff set (respect these)
- ~~Stop after Step 1~~ — **done**, access report delivered 2026-08-12
- **Stop after Step 2 with the POLICY SUMMARY.** The fungi sublimit and seepage endorsement language determine how hard Workstream B is worth pushing. Do not proceed past this without Jeff.
- **Stop after the Master Index**, before building deliverables C–H.

---

## 8. DELIVERABLES SPEC (unchanged, for reference)

| ID | Deliverable | Format | Status |
|---|---|---|---|
| A | **Master Index** — Date, Type, Title, Source, From/To, Category 01–10, Link/path, Amount, Workstream (Build/Claim/Both), Version, Notes, Confidence. Sorted by date. Every item gets a row. | spreadsheet | not started |
| B | **Policy Summary** — fungi sublimit first | markdown | not started |
| C | **Build Book** — room-by-room spec of record; **Spec Conflicts** section (known: plan says RANGE.GAS.30, takeoff specifies Café **CES700P4MW2** electric); **Remaining to Occupancy** punch list sequenced by dependency with permit flags; map claim-funded vs. owner-funded | markdown | not started |
| D | **Timeline** — every entry cites its index row. No entry without a source. | markdown | not started |
| E | **Claim Summary** — incl. Cause-of-Loss Reconciliation, Correspondence Ledger (every message, direction, what was asked, answered or not, days elapsed), Supplement Candidates | markdown | not started |
| F | **Mortgagee / Loss Payee Memo** — CMG check: amount, physical location, endorsement status, what releases funds, who owes the next move. *Money stuck at the servicer is a different problem than money not yet approved — keep separate.* | markdown | not started |
| G | **Financial Dataset → FinRecon** — first reconciliation to run: accepted **$27,400** vs. any payout actually received | FinRecon native | **BLOCKED — see §5** |
| H | **Gap List** — Build gaps / Claim gaps, ranked by urgency. Seed with the four known defects + clearance test existence + the unanswered 11/10 request + the CMG check + any deadline inside 60 days at the very top. **Be blunt. This is the most valuable output.** | markdown | not started |

### Archive structure (Step 4)
```
2870 SE Roswell — Project Archive/
  01 Insurance Claim
  02 Mold Testing, Protocols & Clearance
  03 Remediation & Contractors
  04 Design & Specs
  05 Renovation / Rebuild
  06 Photos & Video (by date and by room)
  07 Communications (email + text threads)
  08 Financials (invoices, receipts, payments, payouts)
  09 Permits & Inspections
  10 Property & Ownership Docs
```
**Copy in. Never move, rename, or delete originals.**

---

## 9. ARTIFACTS TO CONFIRM OR FLAG MISSING

- Drive folder "Kitchen Plans" — `1c4mArmBJk4LP-02de2JvH10-LI4S9nMF` ✅ confirmed reachable
- `Roswell_Kitchen_Plans_.pdf` and `Avondale FP 12225.jpg`
- `Roswell_Kitchen_Render_Spec_RC.md`
- Café **CES700P4MW2** slide-in electric range spec
- Cement Tile Shop, Pacific Collection, **Patchwork Black & White** (backsplash takeoff ≈ 49 net sq ft / 12 boxes)
- Roswell drywall bill thread ✅ found (Dmitriy Savenkov, 2026-06-05)
- **Home Depot cabinet order/receipt — cost never located. Find it.** (Note: order H4017-567029 found, but that is an *appliance* delivery, Dec 2025–Jan 2026. Cabinets are separate.)
- **CLEARANCE TEST after remediation — none found to date. If it does not exist, that is a top-3 gap for both workstreams.** A remediation with no clearance test is both an occupancy risk for Nancy and a hole in the claim.

Search shorthand too: "mom's house", "Nancy's house", "the Roswell house", and misspellings (Rosewell, Roswell St vs Ave).

---

## 10. OPERATING RULES — NON-NEGOTIABLE

- **Read-only on originals.** No sending, no replying to email, no deleting. Drafts only, for Jeff's approval. The Rose City Labs correction request is the first draft due.
- **Never move, rename, or delete originals.** Copy into the archive.
- **OCR scans and photos of paperwork. Index actual content, not filenames.**
- **Where specs conflict across versions, surface the conflict. Never silently pick the newer one.** Cite both sources, leave the decision to Jeff.
- **Legally/financially significant items** (ROR, denial letters, releases, lien notices, `COUNSEL_PACKET.pdf`) go at the **top** of the gap list.
- **Labor tracked at $99/hr friends-family basis** unless Jeff says otherwise.
- **Never fabricate contents of sources you cannot read.** State plainly what you cannot reach and what Jeff must do about it.
- **Confidence index 0–100** on archive completeness when done.
- Versioning: **RC** first, then v1.1, v1.2. No "final final" unless Jeff says it first.

---

## 11. OPEN QUESTIONS FOR JEFF

1. **FinRecon input format** — Claude Code should be able to answer this from the local project without asking. If it cannot, Jeff needs to paste the header row or a sample file.
2. **Where does the archive live?** Google Drive under the existing "2870 SE Roswell" folder (`1beMtxbKUXEycGgyEs9hKolJq7wxukiJy`), or a local Mac folder? Cloud session's recommendation: **Drive** — it is where the source documents already are and the Mold Masters folder is shared there. Claude Code may reasonably argue for local. Jeff decides.
3. **What is `COUNSEL_PACKET.pdf`?** If an attorney is engaged, that changes the tone and routing of Deliverables E and H.
4. **Is the Dry Box, Inc. storage rental ($145/mo) related to Roswell?** If yes and never submitted, it is a supplement candidate.

---

## 12. STATE AS OF HANDOFF

| Item | Status |
|---|---|
| Step 1 — Preflight access report | ✅ **Complete** (2026-08-12) |
| Step 2 — Policy retrieval & summary | ⬜ Not started — **next checkpoint** |
| Step 3 — Broad search | ⬜ Not started |
| Step 4 — Archive structure | ⬜ Not started |
| Step 5A — Master Index | ⬜ Not started |
| Step 5 C–H | ⬜ Not started |
| FinRecon schema | 🔴 **Blocked — Claude Code to resolve** |
| Photo record | 🔴 **Dark — Claude Code to map** |
| Text/iMessage record | 🔴 **Dark — Claude Code to extract** |
| Todoist | ⬛ **Dropped from scope** |

**Nothing has been sent, modified, or deleted. No originals touched.**

**Archive completeness confidence at handoff: 34/100.** Access is good; photos, texts, post-Dec-2025 carrier correspondence, and FinRecon are all unmapped.

---

*Roswell_Archive_Handoff_ClaudeCode_RC.md — Odd Jobs – Handyman Services*
