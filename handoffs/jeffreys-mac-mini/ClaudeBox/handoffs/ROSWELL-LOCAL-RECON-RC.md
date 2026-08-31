# 2870 SE Roswell — Local Reconnaissance Report (RC)

**Written:** 2026-08-12 · Claude Code, **jeffreys-macbook-pro** (Mac14,7)
**Answers:** `Roswell_Archive_Handoff_ClaudeCode_RC.md` §7 Immediate items 1–4
**Nothing sent, moved, renamed, or deleted. No originals touched.**

---

## Headline

The handoff says photos, texts, and FinRecon are dark. **They are not.** All three already
exist locally, and the bank ledger already answers questions the handoff lists as open.

The genuinely dark thing is different and worse: **$0 of insurance money has ever landed**,
against **$17,663.38 already paid out of pocket to the remediation contractor** — and the
carrier set a documentation deadline in June 2025 that nobody appears to have tracked.

Revised archive completeness: **34/100 → 61/100.**

---

## 1. Corrections to the handoff's "verified anchors"

Do not carry these forward unchanged.

| # | Handoff says | Actually |
|---|---|---|
| 1 | FinRecon is a CLI project in `~/.claude/projects`, 7 sessions / 37.3 MB | It is a Python package at `~/ClaudeBox/finrecon` with a live SQLite DB — 7,539 txns, 242 docs, 16 accounts. The Notion figure counts *session transcripts about* FinRecon. See `FINRECON-RUNBOOK-RC.md` |
| 2 | Photo record 100% dark | `~/ClaudeBox/finrecon/data/roswell_photos/` — 13 assets, GPS-stamped at 45.4585, −122.6333 (the property), album "Roswell Reno", with `metadata.csv` and `_originals/`. Manifest at `~/ClaudeBox/scripts/photo-lane/manifests/roswell.txt` |
| 3 | iMessage record 100% dark | Full export exists: 2,896 conversations + `messages.csv` at `~/Claude/Projects/imessage export/imessage_mine/`. Duplicated under `Fresno Family/01_Incoming/`. Laura's export (347 files) at `~/Documents/Personal/Family/laura_export/` |
| 4 | Peter Gowans phone discrepancy, unresolved | Both numbers are live. There is a text thread at **+1 503 380 1962** — `imessage_mine/conversations/+15033801962.html`, and it mentions Mold Masters. Not a discrepancy; two channels |
| 5 | Adjuster: Jessica LaClair | Confirmed by two PDFs — **direct (509) 608-4046**, Claims Resolution Specialist III, FL license W405340. **But** `roswell_casualty_case.md` names adjuster **"Jordan Stoddard."** Two names on one claim — reconcile |
| 6 | CMG contact Bri Arriola, pnwloans@cmgfi.com | Casualty file says **Brian Stone, bstone@cmgfi.com**. Reconcile |
| 7 | CMG check "returned to sender, unexplained" | Casualty file gives a mechanism: **CMG holds proceeds in loss-draft escrow, releasing only against inspections.** That is a process, not a mystery — and a different problem than the handoff assumes |
| 8 | Contractor is PNW Mold Masters **Inc** | Bank descriptions read **"PNW MOLD MASTERS LLC."** Inc vs LLC — confirm which entity was actually paid before any demand letter names one |

---

## 2. Two documents the handoff has never seen

Both in `~/Library/Mobile Documents/com~apple~CloudDocs/Personal/Financial/2870 SE Roswell St Milwaukie, OR 97222/Mold Remediation/`.

### 2.1 `Delay and Close Letter.pdf` — **misnamed**

Safeco form **CWL1020 "Explanation of Delay,"** dated **June 27, 2025**, 2 pages. It is
*only* the delay notice. **There is no close letter in this file** despite the filename.
It requests exactly two things:

- Photos of the damages in the home
- Estimates or invoices

Insured of record on the letter: **Nancy T. Mumford** alone.

> If a close letter exists, it is not on this Mac, and it would reset every deadline in
> Deliverable B. Finding out is a top-3 question.

### 2.2 `Mumford Roswell - Policy Info - Claim05956068201.pdf` — **also misnamed, and it matters**

This is **not the policy.** It is the **6/24/2025 email from Jessica LaClair** transmitting
the ROR. **The actual policy is not on this Mac** — Step 2 stays blocked on the Gmail
attachments. Do not let the filename fool the next session.

What it does contain is decisive:

> *"If we do not receive documentation by **6/27/2025** the claim will be closed."*

> *"While your claim may be listed as 'closed' on your online account, I can simply reopen
> it when I receive the documents."*

> *"Any licensed contractor **or homeowner** is authorized to carry out the necessary repairs."*

> *"If a contractor is utilized for the repairs, please ensure that our initial estimate is
> shared with us **prior to the completion of work**, so we can agree upon a fair cost of repair."*

**Three consequences:**

1. The 6/27 deadline and the 6/27 delay letter are the same day. The claim may have gone
   "closed" in the portal and been reopened — or not. **Check the portal's claim status.**
2. That last quote is the whole ballgame for **Defect #3**. Estimate 1072 was accepted
   7/11/2025 and the work was done. If 1072 was never shared with Safeco *before completion*,
   the carrier has a stated, pre-agreed basis to refuse the $375/hr rebuild rate. If it *was*
   shared, that is the defense and it needs to be evidenced. **This is answerable from Gmail
   and it decides how hard Workstream B is worth pushing** — arguably more than the fungi
   sublimit does.
3. *"or homeowner is authorized"* is written carrier permission for Jeff's own labor. It
   supports billing owner labor into the claim, not just the build book.

---

## 3. What the money actually shows

From `~/ClaudeBox/finrecon/data/finrecon.db`, all 16 accounts.

### Deliverable G, first reconciliation — done

| | |
|---|---|
| Estimate 1072, accepted 07/11/2025 | **$27,400.00** |
| Paid to PNW Mold Masters (2 payments) | **−$17,663.38** |
| — 2025-08-06, Amex 81000 | $8,823.38 |
| — 2025-10-31, Amex 81000 | $8,840.00 |
| Unpaid against the accepted estimate | **$9,736.62** |
| **Received from Safeco / Liberty Mutual / CMG** | **$0.00** |

**Zero carrier dollars, ever.** The only insurance credits in 12 years of ledger are
PacificSource health reimbursements and a $429 USAA P&C payment in 2024. Jeff has
self-funded the entire remediation.

### Other confirmed Roswell spend

| Item | Amount |
|---|---|
| Home Depot, Roswell-tagged (4 txns, 11/24/25 – 4/14/26) | $13,989.39 |
| — incl. **2025-12-05, $8,269.00**, Home Depot Oregon City | ← **cabinet-order candidate** |
| — incl. 2025-12-02, $4,599.76, Home Depot Oregon City | |
| Rose City Labs, 2025-06-16 (2 charges, Amex 41009) | $412.00 |
| Labor, memo-tagged Roswell | $300.00 |
| Dry Box Inc, 2025-10-01, marked SURCHARGE | $145.00 |

**Home Depot cabinets (§9 of the handoff, "cost never located"):** the $8,269.00 on
2025-12-05 is the strongest candidate — the casualty file already annotates it
*"cabinets/materials."* Not proof; pull the receipt to confirm cabinets vs appliances.

**Dry Box:** exactly **one** payment in the entire ledger. The cloud session found invoices
Jan–Jul 2026 at $145/mo. So either Dry Box is billing an account FinRecon does not cover,
Nancy is paying it directly, or **the invoices are unpaid.** All three are worth knowing;
the third is urgent.

### Nancy's money — a live inconsistency

**51 inbound transactions totalling $62,126.38.** The casualty file counts *"$59,771 across
14 lumps (Aug 2025 → May 2026)"* — my independent tally of the 14 Zelle lumps plus the
$1,500 "Roswell" credit reproduces **$59,771.38 to the penny.** The ledger agrees with itself.

But the classification does not hold up:

- `roswell_casualty_case.md` treats **all** of Nancy's transfers as **bridge loans** — a liability.
- **2025-10-02, "Zelle: Nancy Mumford, $8,837.38"** sits days after the **8/6 Mold Masters
  payment of $8,823.38** and reads like a **reimbursement**, not a loan.

It cannot be both. If it is a reimbursement, the $59,771 loan figure is overstated and Jeff
did not bear that cost. If it is a loan, the cost is Jeff's — **and then the casualty file's
repair basis is wrong**, because its table stops at $14,289 and omits the entire $17,663.38
paid to Mold Masters. That is a **~$17.7k understatement of casualty basis** in a document
already sent to the tax preparer.

> Flagging, not resolving — the answer changes both the 4684 and who owns the claim proceeds.

---

## 4. Ownership conflict — read this before anything goes to the carrier

`roswell_casualty_case.md` (2026-07-19, prepared for Melissa Jeffery) states:

> *"Beneficial owner = Jeff. His mother Nancy Mumford is on title ONLY to qualify for a
> lower primary-residence mortgage rate; she contributed $0 to purchase and pays nothing
> toward maintenance/upkeep."*

The file flags this itself as an inconsistency for tax purposes. It is also an **insurance**
exposure: the policy names **Nancy T. Mumford** as insured at what is documented as her
primary residence, and the claim advancement strategy runs through that.

The two positions — *"Nancy's primary residence"* to the lender and carrier, *"beneficially
Jeff's, Nancy pays nothing"* to the tax preparer — are in tension in writing, in Jeff's own
files. They may well be reconcilable (Nancy does live there). But **a claim summary and a
casualty workpaper that say different things about who owns the house should not both go out
unreviewed**, and if counsel is engaged this is the first thing they should see.

This is above my pay grade to resolve and it is exactly the kind of "legally significant
item" the handoff says goes at the top of the gap list. It goes at the top.

**No attorney is engaged** (see §5), so there is no counsel to hand this to. It sits with
Jeff, and it should be settled before any further position is stated to Safeco or to Melissa.

---

## 5. `COUNSEL_PACKET.pdf` — **not Roswell. Closed.**

**Jeff, 2026-08-12: the counsel packet belongs to a completely different project.**

Located at `~/Library/CloudStorage/GoogleDrive-jeff@odd-jobs.org/My Drive/COUNSEL_PACKET.pdf`
(+ a duplicate). Never opened, and there is no reason to open it for this matter.

This closes **handoff Open Question #3** and retires **preflight finding #2**. The cloud
session inferred a Roswell connection from co-location in Drive and a July 2026 timestamp;
the inference was wrong. **No attorney is engaged on the Roswell claim**, so Deliverables E
and H are written for Jeff, in Jeff's voice, and do not route through counsel.

> Lesson for the next session: proximity in a Drive folder is not evidence of subject matter.
> Nothing else in this report rests on that file.

---

## 6. Prior AI work product on this exact claim

Handoff §7 item 4 asked for prior AI outputs. Found:

- **`Insurance Claim Deep Dive — Liberty Mutual Water Loss - RC.docx` / `.pdf`** (2026-06-08),
  with `build_claim_doc.js`, at
  `~/Library/Application Support/Claude/local-agent-mode-sessions/2508e93c…/3919f734…/local_a148a98f…/outputs/`
- `~/ClaudeBox/finrecon/data/roswell_casualty_case.md` — the Form 4684 case file
- `~/ClaudeBox/finrecon/LIFE_CONTEXT.md` and `DECISIONS.md` — both carry Roswell context
- `~/Claude/Projects/ChatGPT Data Migration/Roswell - Claude Project Instructions (RC).md`
- `~/ClaudeBox/handoffs/HANDOFF-2026-08-11-COWORK-SYNC-SESSION.md`

Buried in an app-support session folder is not an archive. These should be copied into
Category 07/01 when the structure is built.

---

## 7. Source material inventory (copy targets for Step 4)

**iCloud — `…/Personal/Financial/2870 SE Roswell St Milwaukie, OR 97222/`** (33 files)
- `Mold Remediation/`: E215 Mold Report · ROR · Explanation of Delay · LaClair 6/24 email ·
  Claim05956068201 · Roswell Blueprint · 2870 Roswell Sketch · Jeff house ·
  `Mold Masters/Estimate_1072_from_PNW_Mold_Masters_Inc.pdf`
- `Signed Docs/`, `2021 REfi/`, `Banking/`, `Water Main/` (2 photos), `Asher Miller tenant/`
- **`Water Main/`** — prior water event at this property. Not in the handoff. Relevant to any
  repeated-seepage argument the carrier might make.

**iCloud — `…/Personal/ME/Odd Jobs/Bids/2870 SE Roswell/`** — Kitchen Plans, Kitchen Layout

**`~/Claude/Projects/Handoff Clone/Odd Jobs Bids - Backup 2026-06-10/2870 SE Roswell/`** —
the richest build set: Blueprint Spec (.pages + .pdf), Bathroom Line Drawing RC4/RC5,
Bathroom Permit Line Set RC6, Bathroom Permit Set RC2, Bathroom Schematic RC1,
Kitchen Cabinet + two Commented copies, Rendering, **Drywall Critical Path .docx**

**`~/Claude/Projects/2870 SE Roswell/`** — design files per the handoff (unchanged)

**Also:** `~/Desktop/Roswell Kitchen Layout .pdf` ·
`~/Library/Mobile Documents/com~apple~CloudDocs/Voice Memos/SE Roswell St.m4a` (unheard) ·
`~/Downloads/Personal/Legal & Finance/Claim_Report_Mumford_Updated.pdf` ·
`~/Downloads/Photos/Screenshot 2025-07-01 at 2.56.13 PM.jpeg` (contains "Chaetomium")

---

## 8. Still genuinely blocked

| What | Why | Fix |
|---|---|---|
| **The policy itself** | Not on this Mac. The file named "Policy Info" is an email | Gmail attachments, 6/30/2025 — cloud session. **Step 2 stays blocked** |
| **Apple Photos library** | Permission classifier blocked reading `Photos.sqlite` | Jeff approves the read, or re-runs the existing `photo-lane` script |
| **`chat.db` direct query** | Same block on `~/Library/Messages/chat.db` (840 MB) | Not urgent — the 2,896-conversation export already covers it |
| **June 2025 discovery photos** | The 13-photo export starts **2025-10-07**. Demo was already underway | The June photos are the most claim-valuable assets that exist, and the carrier asked for them on 6/27/2025. They are in the Photos library, behind the block above |

---

## 9. Gap list seed — ranked

1. **Was Estimate 1072 shared with Safeco before the work finished?** The carrier put that
   condition in writing on 6/24/2025. Answers whether the $27,400 is defensible at all.
2. **Ownership conflict** — "Nancy's primary residence" vs "beneficially Jeff's" (§4).
   Legally significant, in Jeff's own files, unresolved.
3. **Did the claim close on 6/27/2025?** Portal status. Everything downstream depends on it.
4. **$0 received / $17,663.38 paid.** Whatever else is true, no carrier money has ever moved.
5. **Casualty basis understated ~$17.7k** — Mold Masters payments missing from the 4684
   workpaper already given to the tax preparer.
6. **Nancy's $8,837.38 — loan or reimbursement?** Changes the basis and the loan total.
7. **Clearance test** — still nothing found locally. Occupancy risk for Nancy *and* a claim hole.
8. **Dry Box** — one payment on file, ~7 invoices known. Unpaid, or paid off-ledger.
9. **E215 wrong-address correction letter** — still to be drafted. Not sent. **Draft only.**
10. **June 2025 photos** — behind a permission block, and the carrier asked for them 14 months ago.
11. **Adjuster identity** — LaClair vs Stoddard. **CMG contact** — Arriola vs Stone.
12. **Inc vs LLC** — confirm the entity actually paid before naming one anywhere.

---

## 10. Checkpoint

Per the handoff, work **stops here**. §7 items 1–4 (FinRecon, photos, texts, filesystem)
are done to the limit of local access. Step 2's POLICY SUMMARY cannot be produced on this
machine — the policy is not here.

**Resolved since this report was first written:**

- **`claim_eligibility_flag`** — ✅ done. Jeff approved; **FinRecon migration 12** adds
  `documents.claim_flag` (`claim` / `owner` / `both` / `undetermined`) plus the
  `job_ref = 'roswell:<room>'` convention. 345 tests green, DB backed up first.
  **Deliverable G is unblocked.** Details in `FINRECON-RUNBOOK-RC.md` §6.
- **Runbook** — ✅ written to the Notion page *"FinRecon remote access runbook"*
  (was blank, tagged `RUNBOOK — do not archive`).
- **`COUNSEL_PACKET.pdf`** — ✅ not Roswell (§5). Open Question #3 closed.

**Still open for Jeff:**

- **Archive location** — Drive vs local. Source material is split roughly evenly between
  iCloud Drive and Google Drive today, so "it's already where the documents are" does not
  favour either. Weak preference for Google Drive, matching the cloud session, so both
  sessions can write.
- **The ownership conflict** (§4) — nothing else should be stated to Safeco or Melissa
  until it is settled.
