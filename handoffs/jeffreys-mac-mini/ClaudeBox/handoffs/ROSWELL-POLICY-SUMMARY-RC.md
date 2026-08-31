# 2870 SE Roswell — POLICY SUMMARY (Deliverable B, RC)

**Written:** 2026-08-12 · Claude Code, jeffreys-macbook-pro
**Claim:** 059560682-01 · **Policy:** OP6225045 · **DOL:** 2025-06-13
**Carrier:** Safeco Insurance Company of Illinois (Liberty Mutual)
**Policy period:** **05/18/2025 – 05/18/2026** (loss falls inside)

> ### ⚠️ Coverage is ACCEPTED. Read this before §5.
>
> **Jeff, 2026-08-12: Safeco has already paid out a portion of the remediation.**
>
> That is the single most important fact on this claim and it reframes everything below.
> **A carrier that pays has accepted the loss as covered.** The Reservation of Rights (June
> 2025) is therefore *historical* — superseded by the carrier's own conduct — not a live
> coverage position.
>
> **Why FinRecon showed $0.** Those funds went to **CMG as mortgagee / loss payee**, into
> loss-draft escrow. They never touched an account FinRecon tracks, so the ledger correctly
> reports zero carrier deposits *to Jeff* while the carrier has in fact paid. Both statements
> are true; only the second one describes the claim. Every mobile deposit in the ledger from
> Jun 2025 on has been individually verified against a check image — Hoff family, Purcell,
> John Hancock — and **none is Safeco.**
>
> **What this changes:**
> - §5 (Exclusion 5) is **not** a live threat to the claim's validity. It is a *supplement-stage*
>   risk — a lever the carrier could use to cap **further** payment, not to undo coverage.
> - The fungi sublimit (§1) still matters, but as **headroom remaining**, not as a cliff.
> - The real problem is **Deliverable F**: approved money stuck at the servicer. That is a
>   loss-draft release problem, not a coverage problem, and it is worked completely differently.
>
> **The payment chain (Jeff, 2026-08-12):**
>
> ```
> Safeco  ──pays──▶  CMG (mortgagee / loss payee)  ──issues checks──▶  Jeff
>                    loss-draft escrow,
>                    released against inspections
> ```
>
> **CMG issues the checks, not Safeco.** So the October 2025 check that came back "returned to
> sender" was a **CMG** check drawn on escrow — not a carrier payment that failed. Searching the
> ledger for Safeco or Liberty Mutual was never going to find it; the payer name is CMG.
>
> That also explains the shape of the problem: the money is **already approved and already
> sitting in escrow.** Nothing about it depends on a coverage decision. It depends on
> inspections, endorsements, and a servicer's mailroom.
>
> ### Money HAS now reached Jeff — first documented release
>
> Check voucher supplied by Jeff 2026-08-12. **Cashed within the last ~2 weeks** (so early
> Aug 2026).
>
> | Field | Value |
> |---|---|
> | Check number | **00001432** |
> | Check date | **2026-05-28** |
> | Amount | **$8,837.38** |
> | Payee | **Nancy Mumford AND Jeffrey Mumford** — both endorsements required |
> | Purpose | **"FOR PAYMENT OF RESTRICTED ESCROW"** |
> | Description / tran code | **"Stamp and Go"** · 304 · Batch 13069 |
> | Loan number | **0174928853** |
> | Drawn by | **Proctor Financial Inc.**, 700 Tower Dr Ste 400, Troy MI 48098-2837 |
> | On behalf of | CMG Mortgage, Inc. |
> | Bank | The Huntington Bank |
> | Fuse | **"VOID IF NOT CASHED WITHIN 90 DAYS"** |
>
> **Five things this tells us that nothing else in the file did:**
>
> 1. 🔴 **Every CMG check carries a 90-day fuse.** #1432 was dated 5/28/2026 and void after
>    **2026-08-26**. It was cashed with roughly two weeks to spare. **The October 2025 check that
>    came back "returned to sender" is long void** and cannot simply be re-mailed — it has to be
>    reissued. That is a different and easier ask than "where is our money," and it should be
>    made to Proctor, in writing, now.
> 2. **The real counterparty is Proctor Financial Inc., not CMG.** Proctor is the loss-draft
>    administrator that actually cuts and mails these checks. Chasing CMG's general line or a
>    servicer contact is chasing the wrong desk. Reference **loan 0174928853** and **batch 13069**.
> 3. **"Stamp and Go" is the release mechanism**, and it is the *good* one — a loss-draft
>    disbursement endorsed and released **without full inspection monitoring**. This refines the
>    casualty file's "releasing only against inspections": at least this tranche did not require
>    one. Ask Proctor whether the remaining balance stays Stamp-and-Go or converts to
>    inspection-based draws, because that determines the entire release schedule.
> 4. **Dual payee.** Both Nancy and Jeff must endorse every check. That is the likely cause of
>    the Oct 2025 return and the Dec 2025 endorsement chase — and it will recur on every future
>    check unless addressed.
> 5. **The amount is exactly $8,837.38 — the same figure as the "Zelle: Nancy Mumford" credit of
>    2025-10-02.** Same amount, eight months apart. That is now a documented coincidence worth
>    resolving, not speculation: it suggests Nancy **advanced** Jeff the escrow release in Oct
>    2025 against a disbursement that did not actually arrive until May 2026. If so, the Oct
>    Zelle is a bridge loan (as the casualty file treats it) and **not** a reimbursement — which
>    settles the §3 question in the recon report, and means the $17,663.38 paid to Mold Masters
>    is properly Jeff's cost and belongs in the casualty basis.
>
> 🔴 **Still unknown, in priority order:**
> 1. **Total paid by Safeco into escrow**, and the current **escrow balance**. Proctor/CMG
>    loss-draft statement — request by loan number.
> 2. **Every check issued to date**: number, date, amount, status (cashed / void / reissued).
>    Check #1432 implies at least 1,431 prior checks in Proctor's sequence, so the number is not
>    a claim-specific counter — the statement is the only reliable source.
> 3. **What releases the remainder** — Stamp-and-Go throughout, or inspection-based draws.
>
> ⚠️ **FinRecon does not have this yet.** The ledger's most recent transaction is **2026-07-22**;
> the check cleared after that. **Run `finrecon sync`** — the deposit should appear, and it will
> be the first carrier-origin money ever to land in the ledger.

### Source caveat — read first
> Every quotation below is from the carrier's own **Reservation of Rights, 2025-06-23**,
> which quotes the policy form verbatim. That is strong evidence of the *language*.
>
> **It is not the policy, and it contains no dollar figures.** Every limit, sublimit, and
> deductible lives on the **Declarations page, which is on neither Mac** (§8). The ROR says
> so itself: *"the provisions set forth above in no way replace the provisions of the actual
> Policy issued… To the extent there is any discrepancy between this letter and the Policy,
> the Policy controls."*
>
> This summary is therefore **complete on language, empty on numbers.** Do not price the
> claim off it.
>
> **UPDATE 2026-08-12 evening — the renewal letter is in hand** (`2025 Safeco Renewal.pdf`,
> Jeff, from personal Gmail; archived to 01 Insurance Claim). Dated April 8, 2025, term
> **05/18/2025 – 05/18/2026**, premium $1,487.00 (billed to the mortgage servicer — CMG pays
> it from escrow). Agent: **Davidson & Associates Ins Inc, Vancouver WA, (360) 514-9550.**
>
> | Coverage | Limit (this term) | Prior term |
> |---|---|---|
> | **A — Dwelling** | **$377,700** | $371,000 |
> | **B — Other Structures** | **$37,770** | $37,100 |
> | **C — Personal Property** | **$283,280** | $278,250 |
> | **D — Additional Living Expense / Loss of Rent** | **$75,540** | $74,200 |
>
> ⚠️ **Still missing: the declarations page itself.** This six-page reprint is the opening
> letter plus marketing and privacy notices — the letter itself says the "coverage statement
> page (also known as the policy declarations page) … comes after the opening letter in this
> package," and the archive reprint cut off before it. The dec page carries the three numbers
> that decide Workstream B: **the fungi sublimit, the Water Seepage endorsement limit, and the
> deductible.** Fastest source: **call Davidson & Associates, (360) 514-9550**, and ask for the
> full declarations page for OP6225045, 2025–2026 term. One phone call.
>
> What the four limits already settle: **headroom is not the problem.** $377,700 of Coverage A
> against a ~$41k–$51k total loss scope means the only binding ceilings are the sublimits — and
> **Coverage D at $75,540** is large enough that Nancy's 14 months of displacement (ALE) is a
> seriously under-claimed category if the fungi cap doesn't swallow it.

---

## 1. Fungi / mold sublimit — the ceiling

**Exclusion 19 — Fungi, Wet or Dry Rot, or Bacteria:**

> "Fungi, Wet or Dry Rot, or Bacteria meaning the presence, growth, proliferation, or spread
> of fungi, wet or dry rot, or bacteria. This exclusion does not apply to the extent coverage
> is provided for under Additional Property Coverages — Fungi, Wet or Dry Rot, or Bacteria in
> Section I — Property Coverages."

**Additional Property Coverage 10 — the buy-back.** "We will pay up to the amount shown in
your Policy Declarations for:"

> a. the direct physical loss to covered property caused by fungi, wet or dry rot, or bacteria;
> b. the cost to remove fungi, wet or dry rot, or bacteria from covered property;
> c. the cost to tear out and replace any part of the building or other covered property as
>    needed to gain access to the fungi, wet or dry rot, or bacteria;
> d. the cost of any testing of air or property to confirm the absence, presence, or level of
>    fungi… whether performed prior to, during or after removal, repair, restoration, or
>    replacement…; and
> e. Coverage D — Additional Living Expense and Loss Of Rent.

**The cap, verbatim:**

> "The limit of liability shown in your Policy Declarations for Fungi, Wet or Dry Rot, or
> Bacteria is the most we will pay for the **total of all loss or costs for Coverages A, B, C,
> and D**, and does not increase the limit of liability for these coverages, regardless of the
> number of locations or number of claims made."

**Read that twice.** It is a **single aggregate cap covering A + B + C + D together** —
dwelling, other structures, contents, *and* loss of use. If the loss is recharacterized as a
mold claim, remediation, rebuild, contents, and every month of Nancy's displacement all
compete for one number.

Three conditions gate it:

> f. are a result of a loss we cover that occurs during the policy period;
> g. are not excluded under Building Property Losses We Do Not Cover; and
> h. **only if all reasonable means are used to save and preserve the property from further damage.**

Condition **(h) is the duty-to-mitigate hook the ROR was issued on.** Condition **(g) points
straight at Exclusion 5 below** — and that is the whole fight.

🔴 **The number is unknown.** Typical Safeco fungi sublimits run $5,000–$50,000. At the low
end that is less than Jeff has *already* paid PNW Mold Masters ($17,663.38). **Retrieving this
figure is the single highest-value outstanding task on the claim.**

---

## 2. Water Seepage or Leakage Coverage — the endorsement

> "For an additional premium, it is agreed that the policy is amended as follows…
>
> We cover up to the amount stated in your Policy Declarations for the deterioration, wet or
> dry rot of property described in Coverages A, B and C caused by **accidental, repeated or
> continuous seepage or leakage of water or steam from within a plumbing, heating, air
> conditioning system or from within a household appliance.**
>
> We will cover the cost of tearing out and replacing any part of the building necessary to
> repair the system or appliance. However, such tear out and replacement coverage only applies
> if the water or steam causes actual damage, including unknown or hidden damage, to a dwelling
> structure on the residence premises."

**Limitations, verbatim:**

> "We do not cover:
> 1. loss to the system or appliance from which water or steam escaped;
> 2. **any damage you first discover prior to the effective date of this endorsement.**
>
> For purposes of this coverage, a plumbing system or household appliance does not include a
> sump, sump pump or related equipment, or a roof drain, gutter, downspout, exterior drain,
> or similar fixtures or equipment."

**Why this endorsement is the whole case.** It buys back Exclusion 5 — and it does so
specifically for *repeated or continuous* seepage, which is exactly what a 14-month-old
chronic-amplification mold finding looks like.

**Good news on the cause-of-loss conflict (Defect #2).** Both competing causes on file —
toilet/tub leaks (9/17 report) and kitchen sink plumbing (9/16 report) — are water *from within
a plumbing system*. Neither is a sump, gutter, downspout, or exterior drain. **Both qualify
under the endorsement.** The conflict is a credibility and record-keeping problem, not a
coverage cliff. Still pick one position of record — but the panic level drops.

⚠️ **Limitation 2 needs checking.** If the seepage endorsement was added at a renewal *after*
the damage was first discovered, it does not apply. Policy period 05/18/2025 – 05/18/2026 began
**26 days before the DOL**. Confirm the endorsement's effective date, and confirm nothing in
the file shows discovery before 05/18/2025.

🔴 The endorsement has **its own separate limit** ("the amount stated in your Policy
Declarations") — also unknown.

---

## 3. Deadlines, with days remaining as of 2026-08-12

### Suit limitation — ~305 days left

The ROR closes with two alternative provisions and tells Jeff to check which one his policy has:

> **8. Suit Against Us.** "No action shall be brought against us unless there has been
> compliance with the policy provisions and the action is started within **two years after the
> inception of the loss or damage**."
>
> **10. Suit Against Us.** "No action can be brought unless the policy provisions have been
> complied with and the action is started within **two years after the date of the loss**."

| Reading | Clock starts | Expires | Days left |
|---|---|---|---|
| Provision 10 — *date of loss* | 2025-06-13 | **2027-06-13** | **~305** |
| Provision 8 — *inception of the loss or damage* | earlier, if seepage predates DOL | **earlier than 2027-06-13** | fewer |

**Provision 8 is the dangerous one.** "Inception of the loss or damage" on a chronic seepage
claim can be argued back to when the leak *began*, not when it was found. The same Chaetomium
finding that proves the damage is real also dates it early. **Determine which provision the
policy contains.** The handoff's working estimate of June 13 2027 is right only under
provision 10.

### Proof of loss — 90 days, trigger unconfirmed

> "g. Submit to us, **within 90 days after you received forms from us** in which to file a
> proof of loss, your signed sworn proof of loss…"

The clock runs from **receipt of POL forms**, not from the loss. Nothing in the local file
shows Safeco ever sent them. 🔴 **Confirm whether POL forms were ever issued.** If they were
and 90 days lapsed, that is a live forfeiture argument the carrier has not yet played.

### Notice — satisfied

> "b. give immediate notice to us or our agent. With respect to loss caused by the peril of
> Windstorm or Hail, the notice must be within 365 days after the date of the loss."

DOL 2025-06-13, claim filed 2025-06-16, FNOL logged 2025-06-16. Three days. Not an issue.

---

## 4. Coverages and loss settlement

**Coverage A — Dwelling:**

> "1. the dwelling on the residence premises shown in your Policy Declarations used
> principally as a private residence, including structures attached to the dwelling other than
> fences, driveways, or walkways; 2. attached carpeting, built-in appliances, fixtures; and
> 3. materials and supplies located on or next to the residence premises used to construct,
> alter, or repair the dwelling…"

Item 3 matters: **materials on site are Coverage A property.** The $13,989.39 of Home Depot
materials is dwelling property, not just an expense.

**Loss settlement — Replacement Cost, not ACV:**

> "a. Replacement Cost. Property under Coverage A or B, including fences, at replacement cost…
> (1) We will pay the full cost of repair or replacement, but not exceeding the smallest of the
> following amounts: (a) the limit of liability… (b) the replacement cost of that part of the
> damaged building… (c) the full amount actually and necessarily incurred to repair or replace
> the damaged building… (d) the direct financial loss you incur; or (e) our pro rata share…"

RCV is favourable. Note **(c) — "the full amount actually and necessarily incurred."** Every
receipt Jeff can produce raises the (c) ceiling; every one he cannot lowers it. That is why the
missing cabinet receipt and the Dry Box invoices matter in dollars, not just tidiness.

**Reasonable Repairs:**

> "2. Reasonable Repairs. We will pay up to the amount shown in your Policy Declarations for
> the reasonable cost you incur for necessary repairs made solely to protect covered property
> from further damage, following a covered loss."

Emergency mitigation is its own bucket. 🔴 Amount unknown.

🔴 **Not quoted anywhere in the ROR and therefore still unknown:** Coverage A/B/C/D limits,
deductible, ordinance-or-law / code-upgrade coverage, and the **appraisal clause**. Appraisal
is a real lever in a valuation dispute and the ROR is silent on it. Get the policy.

---

## 5. Exclusion 5 — the recharacterization hook, verbatim

> "We do not cover loss caused directly or indirectly by any of the following excluded perils.
> Such loss is excluded **regardless of any other cause or event contributing concurrently or
> in any sequence to the loss**…
>
> 5. **Continuous or repeated seepage or leakage of water or steam, or the presence or
> condensation of humidity, moisture, or vapor which occurs over a period of more than 14 days.**"

**Fourteen days.** That is the entire threshold, and it is a low bar for a slow leak.

That opening sentence is an **anti-concurrent-causation clause**: if Exclusion 5 applies, it
excludes the loss *even if* a covered cause contributed. Only the Water Seepage endorsement
(§2) overrides it.

### The uncomfortable part

The **E215 Rose City Labs report** — the evidence Jeff commissioned — records the sewing room
at **11,943 CTS/M³, described as chronic amplification**, and identifies **Chaetomium**, a
recognised marker of **long-term** water intrusion.

Read plainly, Jeff's own lab report is evidence that the water condition persisted **well
beyond 14 days** — which is Exclusion 5's trigger.

This is not fatal. It is the exact scenario the Water Seepage endorsement is sold to cover, and
"repeated or continuous" appears in the endorsement's own granting language. But it means:

- **The endorsement is not a nice-to-have. It is the only thing standing between this claim and
  Exclusion 5.** Its limit and its effective date are the two numbers that decide the case.
- Any argument that leans on "chronic," "long-standing," or "months of exposure" to prove
  severity **also feeds Exclusion 5**. Frame damage severity in terms of *extent*, not *duration*.
- The **E215 report must be corrected and reissued anyway** (wrong property address, Defect #1).
  Whoever drafts that request should not editorialise about duration.

**Also relevant — Exclusion 18, Planning/Construction/Maintenance:** excludes faulty
"maintenance." A carrier arguing an untreated long-term leak was a maintenance failure would
cite 18 alongside 5. **However**, the ROR immediately adds: *"we do insure for any resulting
loss from items 1. through 6. unless the resulting loss is itself excluded."*

---

## 6. Duties after loss — what Jeff is on the hook for

> "3. An Insured's Duties After Loss… a. cooperate with us in the investigation, settlement, or
> defense of any claim or suit… d. protect the property from further damage, make reasonable and
> necessary repairs required to protect the property and **keep an accurate record of repair
> expenses**; e. prepare an inventory of the loss to the building and damaged personal property
> showing in detail the quantity, description, replacement cost, and age. **Attach all bills,
> receipts, and related documents that justify the figures in the inventory**; f. as often as we
> reasonably require: (1) exhibit the damaged and undamaged property; (2) provide us with records
> and documents we request and permit us to make copies; and (3) **submit to examinations under
> oath**…"

Duty (e) is precisely the FinRecon documents dataset — and duty (d)'s "accurate record of repair
expenses" is why `claim_flag` now exists. **Doing the archive is performing a policy duty**, not
just getting organised.

Duty (f)(3), **examination under oath**, is worth noting given the ownership question flagged in
the recon report §4. An EUO is sworn testimony about the property and the loss.

---

## 7. Correspondence ledger — the carrier asked for the same thing four times

| Date | Document | What Safeco asked for | Deadline stated |
|---|---|---|---|
| 2025-06-23 | ROR | Confirmed source of damage/water source · **photos of the exploratory cuts** · **photos of any demo efforts** | 6/27/2025, else "temporarily inactivate your claim" |
| 2025-06-24 | LaClair email | Pre-demolition and post-demolition photos; contractor estimate **before work completes** | "If we do not receive documentation by 6/27/2025 the claim will be closed" |
| 2025-06-27 | Email + CWL1020 Explanation of Delay | **Estimates · Photos · Receipts** | none stated |
| 2025-11-10 | Info request (per cloud session) | unknown — **no traceable response found** | unknown |

**One ask, four times, for fourteen months: photographs.** The oldest photo in the local export
is **2025-10-07** — after demolition. The pre-demo and exploratory-cut photos the carrier
specifically named have never been produced and are not in any export I can reach.

Note also LaClair's own escape hatch, twice in writing: *"While your claim may be listed as
'closed' on your online account, I can simply reopen it on my end when I receive the documents."*
Portal status ≠ claim death. But **confirm the current portal status** regardless.

---

## 8. 🔴 What is still missing, and exactly where it is

**The document needed is `2025 Safeco Renewal.pdf` (225 KB).** It is the renewal/declarations
packet and it carries every number absent from this summary.

It is on **neither Mac** (searched both by name and content). It exists as a **Gmail
attachment**, in this specific message:

> **From:** Julie Mumford <julie.mumford@gmail.com>
> **To:** Jeff Mumford <mumford.jeffrey@gmail.com>
> **Cc:** Tracy Mumford <tracymumf@gmail.com>, Diana Gregg <mumford.diana@gmail.com>
> **Date:** **Jun 17, 2025, 4:38 PM**
> **Subject:** **"Fwd: SAFECO Renewal"**
> Forwarding Nancy Mumford's Jun 10 2025 3:39 PM email, subject "SAFECO Renewal" — *"Good through May 2026"*
>
> **Attachments:** `2025 Safeco Renewal.pdf` (225 KB) · `voicemail-58753719392.m4a` (609 KB) ·
> `voicemail-58745553696.m4a` (732 KB)
>
> Julie's text: *"Attached to this email are the policy documents, voicemails from two
> contractors, and record of the claim filed yesterday on mom's Safeco account."*

This is a **different and earlier email** than the 2025-06-30 *"2870 Roswell - Insurance Info
(share ok)"* message the handoff points at. Fetch both.

**Two contractor voicemails from 6/17/2025** are also attached there — the earliest contractor
contact in the record, predating both PNW Mold Masters and PDX Restoration. Nobody has
transcribed them.

### Pull list for the cloud session, in priority order

1. **`2025 Safeco Renewal.pdf`** → the fungi sublimit, the seepage endorsement limit and
   **effective date**, Coverage A/B/C/D limits, deductible, **which Suit Against Us provision
   applies**, appraisal clause, ordinance-or-law.
2. **The 2026 renewal** — the 05/18/2025–05/18/2026 term has now expired. A newer dec page
   exists. It does not govern this loss, but confirm no lapse and no coverage change.
3. The two 6/17/2025 contractor voicemails.
4. The 2025-11-10 Safeco information request and any response.
5. Any **proof-of-loss forms** Safeco issued (§3).

---

## 9. Plain math

| | |
|---|---|
| Accepted estimate (1072, accepted 07/11/2025) | $27,400.00 |
| Paid to PNW Mold Masters, out of pocket | **−$17,663.38** |
| Unbilled/unpaid against that estimate | $9,736.62 |
| Estimate 1091 (kitchen), acceptance unknown | $9,175.00 |
| Home Depot materials, Roswell-tagged | $13,989.39 |
| Rose City Labs testing — **expressly covered under APC 10(d)** | $412.00 |
| Dry Box storage — 1 payment on file, ~7 invoices known | $145.00 + unknown |
| **Paid by Safeco — a portion of remediation** | **amount unknown — went to CMG, not Jeff** |
| **Received by Jeff, in his own accounts** | **$0.00** |

**Paid to date vs. received to date are different numbers on this claim, and the gap is the
whole of Deliverable F.** Safeco has paid; CMG holds it in loss-draft escrow, releasing against
inspections. Jeff meanwhile funded $17,663.38 of remediation out of pocket. **He is a
reimbursement claimant against escrow money that already exists** — a far stronger position
than waiting on a coverage decision, and one worked through the servicer, not the carrier.

**What the policy could still owe:** unknown until the Declarations page is in hand *and* the
amount already paid is known — remaining headroom is the limit minus what has been paid.
Coverage A, the fungi sublimit, and the seepage endorsement limit are three different ceilings
and the claim can hit any of them first.

**What stands between the two:**

1. The **Declarations page** — no number can be stated without it.
2. **Photographs** the carrier has demanded four times and never received, especially pre-demo
   and exploratory-cut images from June 2025.
3. Whether **Estimate 1072 was shared with Safeco before the work completed**, as required in
   writing on 2025-06-24.
4. Whether the claim is **open or inactivated** right now.
5. **Exclusion 5 vs the seepage endorsement** — the merits of the whole claim, decided by the
   endorsement's limit and effective date.
6. The **CMG loss-draft escrow**, which is a separate problem from coverage: money not yet
   approved and money stuck at the servicer must not be conflated.

---

## 10. Checkpoint

**Per the handoff, work stops here.** This is the Step 2 gate.

The language half of Deliverable B is done and is well-sourced. The numbers half cannot be
written on this machine. Nothing further should be sent to Safeco, and no supplement should be
priced, until `2025 Safeco Renewal.pdf` is in hand.

Two items are time-sensitive independent of that:

- **~305 days** on the suit limitation under the favourable reading — fewer under the other.
- The **proof-of-loss 90-day clock** may already have run. Nobody has checked.

Also unresolved and unchanged: the **ownership conflict** (recon report §4). It should be
settled before any further position is stated to Safeco, because duty (f)(3) is an examination
under oath.
