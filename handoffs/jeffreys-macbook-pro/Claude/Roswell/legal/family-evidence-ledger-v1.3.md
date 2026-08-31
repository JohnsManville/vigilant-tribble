# Family Evidence Ledger v1.3
**Date:** 2026-08-31 | **Status:** v1.2_REBUILT plus completed mini harvest (Section 12). Supersedes v1.2_REBUILT.

**Provenance:** The original family-evidence-ledger-v1.1.md was never saved as a file. It existed only as a Cowork chat card, and that conversation's cloud copy is gone. This version is built fresh from primary documents and data still on disk (Section 9), verified this session. Treat every figure below as sourced from the file/query cited next to it, not from memory of the lost v1.1.

---

## 1. Nancy's bridge loans to Jeff/Laura

Per `2026-08-31_finish-delta-findings_RC.md` (quoting `_prior-analysis/roswell_casualty_case.md`, prepared 2026-07-19 for Melissa Jeffery):

- **$59,771.38** advanced across 14 Zelle transfers, Aug 2025 to May 2026, to float repairs and the household during Laura's 2025 medical leave. Carried as a liability, to be repaid from insurance proceeds when CMG releases them.
- Less one **$850.00** Zelle repayment, 2026-05-22.
- **Outstanding, documented: $58,921.38.**
- The $20,000 repayment is settled (Section 3), and the $8,837.38 CMG insurance was passed to Nancy — repaying her 2025-10-02 advance (Jeff confirmed 2026-08-31): **current outstanding $30,084.00** ($58,921.38 − $20,000 − $8,837.38). Total repaid to Nancy: $29,687.38.

**The itemized 14 rows** (found in `2026-08-31_section5-rebuild_RC.md`, each tagged "Loan from Nancy — Roswell bridge (short-term; repay from insurance)"; sum verified to $59,771.38):

| Date | Amount | Date | Amount |
|---|---:|---|---:|
| 2025-08-01 | $3,000.00 | 2026-02-09 | $1,800.00 |
| 2025-10-02 | $8,837.38 | 2026-02-11 | $5,000.00 |
| 2026-01-07 | $750.00 | 2026-02-13 | $1,000.00 |
| 2026-01-20 | $2,484.00 | 2026-02-18 | $5,000.00 |
| 2026-01-26 | $10,000.00 | 2026-03-25 | $10,000.00 |
| 2026-02-06 | $1,500.00 | 2026-03-26 | $400.00 |
| | | 2026-04-09 | $5,000.00 |
| | | 2026-05-01 | $5,000.00 |

Raw detail lives in FinRecon (`~/ClaudeBox/finrecon/data/finrecon.db`, `transactions` table, counterparty LIKE '%NANCY%'). That query also returns Nancy-linked transfers back to 2015 (small personal amounts unrelated to Roswell) not part of this list.

## 2. Account ...2585 — retracted finding

Per `2026-08-31_2585-account-finding_RC.md` (v1.1, supersedes a withdrawn v1.0):

- ...2585 is **Jeff's own second Chase checking account**, not Nancy's. The four transactions on it ($9,269 on 12/23/25, $10,000 on 1/26/26, $5,000 on 4/13/26, -$5,000 out 6/1/26) are Jeff moving money between his own accounts, not gifts or loans from Nancy.
- This retraction breaks two earlier conclusions: that Nancy advanced an uncounted $24,269, and that the 6/1/26 -$5,000 was Part 2 of a $20,000 repayment to Nancy (Section 3).
- Method note carried forward: match transfers on the payment rail and counterparty name, never on amount and date alone. Two same-size transactions on the same day are usually one movement of money seen twice.
- **Added 2026-08-31, per Jeff:** ...2585 is his account, and Nancy is a signer on it. He confirms he sent the 6/1/26 $5,000 to her through this account, and it counts as repayment — so while the transfer rides on the internal Chase rail (not a Zelle/ACH naming Nancy), it functioned as a payment to her in practice. The other three ...2585 movements ($9,269 on 12/23/25, $10,000 on 1/26/26, $5,000 on 4/13/26, all flowing the other direction, into Jeff's main checking) remain "Jeff moving his own money" per the original retraction — Jeff's confirmation was specific to the 6/1/26 outbound transfer, not those three.

## 3. The $20,000 repayment to Nancy — status

Per `2026-08-31_20k-repayment-resolution_RC.md`:

- **Part 1, $15,000 via the CMG/Shellpoint Flex HELOC** (Laura + Jeffrey Mumford, loan #111677504415027 / NFT0000005594, later serviced by Shellpoint as loan 0697312494). Mechanism and timing verified by email. Amount and payee (Nancy) confirmed directly by Jeff, 2026-08-31 — **settled, and independently corroborated:** Nancy's own iMessage, 2026-06-04 21:46 PT, "The $15,000 cleared and everything's OK." A Shellpoint draw-history statement or check image is optional backup documentation, not a blocker.
- **Part 2, $5,000 via Chase 6/1/26 — confirmed as repayment.** Nancy is a signer on ...2585; Jeff confirms he sent this $5,000 to her through that account. Reinstated as repayment despite the internal-rail appearance. The bank's own memo on this transaction is not a custom note, it's Chase's system-generated reference ("Transaction#: 29447000314") — no "balance" language, contrary to what Jeff thought he'd written there. No direct iMessage confirmation of this specific $5,000 was found (message history checked back only to 6/1 evening); closest same-day lead is Nancy's 2026-06-01 23:25 PT text "Need to run to the bank to deposit check" — plausible but not confirmed to be this transaction.
- **Net status: $29,687.38 repaid to Nancy — $850 (5/22/26) + $20,000 ($15,000 HELOC + $5,000 via ...2585) + $8,837.38 (CMG insurance passed to her, per Jeff 2026-08-31). Outstanding $30,084.00.**

## 4. HELOC facility (carrying-cost evidence)

Per the same file, statement obtained 2026-08-30:

- Servicer: Shellpoint (Newrez), loan 0697312494, secured on 2908 SE Malcolm St, borrowers Laura + Jeffrey Mumford.
- Statement date 08/07/2026, cycle 07/07-08/06/2026: credit limit $75,000.00, principal balance $73,790.37, available $1,209.63.
- APR 8.09%, interest-only payment $507.16/mo, finance charges paid YTD $732.00. No draws in this cycle; the ~$73,790 balance was drawn before 07/07/2026.
- Proves the facility, timing, and capacity. Does not name the payee, so does not by itself prove the $15,000 went to Nancy.
- Relevant to carrying-cost claims: the household services a nearly-maxed $75k HELOC at 8.09% ($507/mo interest) opened during the Roswell crunch; the Roswell/Nancy-repayment-attributable portion is a claimable carrying cost.

## 5. Finish costs and the insurance claim delta

Per `2026-08-31_finish-delta-findings_RC.md`:

- **No insurance baseline exists in the archive.** The `01 Insurance Claim/` folder has no scope of loss, estimate, or line-item allowance. Claim: Safeco 059560682-01, policy OP6225045, date of loss 2025-06-13, adjuster Jordan Stoddard. To make a finish-delta claim assertable, the carrier's scope of loss has to be requested from Safeco directly.
- **Confirmed finish spend: $12,868.76** — cabinets (Avondale shaker white, order H4017-565922, 11/26/25, $4,599.76) + appliances (Café matte white package, order H4017-567029, 12/02/25, $8,269.00).
- Named but never purchased: Silestone Halcyon countertop, Cement Tile Shop Patchwork B&W backsplash (~$576 estimated), allen + roth Gunstock Oak flooring.
- **Adverse evidence, flagged by its own source file as "read before asserting Section 5.2":** a job-site voice memo (Jeff + Matt, recorded openly) has Jeff encouraging Nancy's appliance spend rather than her electing above-scope finishes unilaterally, and the purchases were charged to Jeff's own Amex and shipped to him. Full detail is in `2026-08-31_recording-evidence-note_RC.md`, which also flags sensitive material about Nancy's health that it explicitly says to keep out of anything that circulates — read that file directly rather than relying on this summary.

## 6. Jeff's claimed advances into the property

Per `2026-08-31_counter-proposal_v1.1.md` Section 4.2 and its strategy note:

- Current gross claim: **$32,998.09** advanced (corrected for the $546.93 duplicate + $885.90 recovery). The **$8,837.38** CMG escrow disbursement (check #00001432) is **not netted** against Jeff's advances — it is Nancy's fronted insurance, passed to her (§3), and lives on her ledger. Does not yet include HVAC (~$20,000 mini-splits), carrying costs, or GC labor.
- The strategy note (2026-08-31) says only 28% is documented and flags the appliance and cabinet receipts as missing. **That's stale.** `~/ClaudeBox/roswell-archive/08 Financials/HOME-DEPOT-ORDERS-RC.md`, pulled 2026-08-14, already has both, transcribed line-by-line from the order pages:
  - **Cabinets, order H4017-565922, $4,599.76** — full box/trim itemization, Amex card ending 1000, delivered in three shipments Dec 8/9/29, ledger txn 1140.
  - **Appliances, order H4017-567029, $8,269.00** — Café refrigerator/range/dishwasher/microwave itemized with paid vs. list price, delivered Jan 11 2026, ledger txn 1135. Flags two spec corrections worth checking against the plan set: the fridge is standard depth (not counter depth as the finishes checklist says), and the 4th appliance is an OTR microwave, not a range hood — there is no separate hood.
  - That raises documented spend by $12,868.76 beyond the 28% figure. Actual PDF receipts are downloadable from each order's page (View Receipt / Export) but that file itself notes downloading needs Jeff's go-ahead — not done here either, per the same rule.
  - Same file also independently confirms: the Silestone countertop was quoted, never bought (matches Section 5); the "rocwll" typo orders and their $885.90; the $546.93 duplicate; and the $14,171.28 Purcell deck reversal (matches Section 7).
- **Mold Masters — payment 1 documented, payment 2 is not.** FinRecon shows two Amex (ending 1000) payments to PNW Mold Masters LLC: **$8,823.38 on 2025-08-06**, covered by `03 Remediation & Contractors/Estimate_1072_from_PNW_Mold_Masters_Inc.pdf` ($27,400.00 total estimate, per `SUBSTANTIATION-GAP-RC.md` doc #243, linked to ledger txn 1195); and **$8,840.00 on 2025-10-31, which genuinely has no invoice or document anywhere** — confirmed by both this session's search (Gmail, by name and by amount; the archive) and the archive's own `SUBSTANTIATION-GAP-RC.md`, which flags it "🔴 NONE" the same way.
- GC labor (Section 5.3) claimed at $128/hr, hours not yet reconstructed from project records. Flagged as the strongest and largest category, and the only one that does not conflict with the tax position (Section 8) — but currently undocumented.

### 🔴 Adverse findings, per `2026-08-31_section5-rebuild_RC.md` — read before asserting Section 5.1

1. **Nancy's loan timing lines up with Jeff's remediation payments.** Her $3,000 on 2025-08-01 landed 5 days before Jeff's $8,823.38 Mold Masters payment (8/6/25). Her $8,837.38 on 2025-10-02 is within $2.62 of Jeff's $8,840.00 Mold Masters payment 29 days later (10/31/25). Her bridge loans begin 5 days before Jeff's first large remediation payment and continue through the whole rebuild. The file's own conclusion: **"You cannot bill Nancy for spending money Nancy lent you."** A $23,821.74 reimbursement claim against her does not survive first contact with her attorney if it's substantially her own money.
2. **The $8,837.38 may be double-counted, in Jeff's favor, which is the dangerous direction.** Nancy's $8,837.38 Zelle on 2025-10-02 (tagged bridge loan) and the CMG/Proctor insurance check for exactly $8,837.38 (issued 5/28/26, landed in Chase 7/21/26 — the same figure netted in the counter-proposal's $8,837.38 "CMG escrow disbursement received") are very likely the same money: Nancy fronted the insurance proceeds eight months before the carrier released them, and the check repaid her when it landed. **If so, netting that $8,837.38 against Jeff's own advances (as counter-proposal v1.1 Section 4.2 does, to reach $23,821.74 net) is wrong** — it should instead reduce what Nancy is owed, not reduce what Jeff claims. **RESOLVED 2026-08-31 (Jeff confirmed the $8,837.38 was passed to Nancy) — see `2026-08-31_double-count-resolution_RC.md`.** The $8,837.38 is off Jeff's advance side; his advances are $32,998.09 gross, the $23,821.74 net figure is retired, and Nancy's outstanding is $30,084.00.
3. **Corrected gross advance figure: $32,998.09**, not $32,659.12 — the substantiation file's $32,659.12, less the confirmed $546.93 duplicate, plus the recovered $885.90 "rocwll" orders (Section 7). **Do not net the CMG $8,837.38 against this until finding 2 above is resolved.**

## 7. Ledger corrections found during this reconstruction pass

Per `2026-08-31_finish-delta-findings_RC.md` Section 6:

- **$546.93 duplicate confirmed** — Home Depot shows one order on 2025-11-24 (H4017-565507); the ledger held two rows. Roswell basis overstated by $546.93 until one row is removed.
- **$885.90 of Roswell spend recovered** — three orders were missed because the PO field was typed "rocwll" on two of them.
- **Revised Home Depot Roswell total: $14,875.29**, against $13,989.39 previously in the casualty file.
- **$14,171.28 charge (order H4017-566634) reversed** and not reflected in the ledger. This one is the Purcell deck, not Roswell, but affects the Odd Jobs books separately.

## 8. Tax-position conflict — read before sending anything

Per the same file: the casualty file prepared for Form 4684 takes the position that Jeff is sole beneficial owner, and Nancy contributed $0 and pays nothing toward the property, for tax purposes. That directly conflicts with billing Nancy for costs advanced (Section 5.1) and the HVAC (Section 5.4) in the counter-proposal. Section 5.2 (finish delta) and Section 5.3 (GC services) do not have this conflict.

## 9. Sources

- `~/Claude/Roswell/legal/2026-08-31_2585-account-finding_RC.md`
- `~/Claude/Roswell/legal/2026-08-31_20k-repayment-resolution_RC.md`
- `~/Claude/Roswell/legal/2026-08-31_finish-delta-findings_RC.md`
- `~/Claude/Roswell/legal/2026-08-31_recording-evidence-note_RC.md`
- `~/Claude/Roswell/legal/2026-08-31_counter-proposal_v1.1.md` (and RC, superseded)
- `~/Claude/Roswell/legal/2026-08-31_counsel-packet_RC.md` — briefing for Jeff's real estate attorney on the transfer terms (separate from this ledger's financial scope; open item there is which CMG payment figure is correct, $1,911/mo vs $2,246.17/mo, a ~$2,000 swing in what the escrow cut costs)
- `~/Claude/Roswell/legal/2026-08-31_reply-to-dale_RC.md` — drafted, concedes nothing, asks for the escrow start date and payment reconciliation. Status as of 2026-08-31: **unsent, awaiting Jeff's go**
- `~/Claude/Roswell/legal/2026-08-31_section5-rebuild_RC.md` — source of the 14-row bridge loan table (Section 1) and the adverse findings on Section 5.1 (Section 6)
- `~/ClaudeBox/finrecon/data/finrecon.db` — `transactions` table, live query source for all bank/card detail
- `~/ClaudeBox/roswell-archive/08 Financials/roswell-ledger-extract-20260812.csv` — older 95-row extract, superseded by FinRecon
- `~/ClaudeBox/roswell-archive/08 Financials/HOME-DEPOT-ORDERS-RC.md` — itemized Home Depot order pulls (2026-08-14), source for Section 6's receipt detail
- Mac mini `/tmp/harvest1.txt` (2026-08-31 pull, see Section 10)

## 10. Mini harvest additions (2026-08-31), not yet reconciled into the above

- HELOC and 2585 JSONL searches: zero hits.
- 11 Amazon Ring/camera orders, 2018-2026, shipped to the Malcolm address — order IDs and tracking numbers in the raw harvest output, not yet tied to any claim above.
- `monthly-statement.pdf` confirmed at `/Users/jeffmumfordmacmini/Downloads/`, 26KB, dated Jul 17 — not yet opened.
- `laura_export/` on the mini: roughly two dozen exported message-thread files by phone number, two identifiable by email — filenames only, contents not pulled.

## 11. Open items, ranked

1. Safeco scope of loss / estimate for claim 059560682-01 — without it, Section 5 has no insurance baseline.
2. (Optional, not blocking) HELOC draw statement or check image as paper backup for the now-settled $20,000 Nancy repayment ($15k HELOC + $5k via ...2585).
3. GC hours reconstruction from project records/iMessage/calendar for the Section 5.3 labor claim.
4. ~~Home Depot receipts for the two missing orders~~ — done, both fully itemized in HOME-DEPOT-ORDERS-RC.md (Section 6). Mold Masters payment 1 ($8,823.38) is documented (Estimate 1072); **payment 2 ($8,840.00, 10/31/25) genuinely has no invoice anywhere** — real gap, not just an unsearched one. Home Depot PDF downloads still blocked: Chrome bounced to a Home Depot re-sign-in screen (jeff@odd-jobs.org) that needs Jeff to complete himself, not something to click through with his credentials.
9. CMG check #00001432 — `SUBSTANTIATION-GAP-RC.md` says a photo of the check already exists and just needs filing; that photo may also help settle the Section 6 double-count question (item 7 below), since it could show what the check was issued against.
10. Dry Box Inc storage charges — `SUBSTANTIATION-GAP-RC.md` flags ~7 known invoices Jan-Jul 2026 against only 2 paid via tracked accounts; if this is Roswell pack-out storage never submitted to the carrier, it's a live supplement candidate under Coverage D. Not pulled into this ledger, noted for follow-up.
5. Resolve the $546.93 duplicate in the ledger.
6. ~~Itemized 14-row bridge-loan schedule~~ — done, in Section 1.
7. **New, high-priority:** resolve whether the $8,837.38 CMG check duplicates Nancy's $8,837.38 loan (Section 6, finding 2) before Section 5.1 is asserted to anyone. This is a real error in the counter-proposal's own math, in Jeff's favor, which is the worst direction for opposing counsel to find first.
8. Send or hold the drafted reply to Dale (unsent) — separate from this ledger, but the escrow-start-date question in it gates the whole transfer timeline per the counsel-packet.

---

**Confidence index: 93/100** that this rebuild accurately reflects what is in the source RC files as of 2026-08-31, all ten now read. The remaining 7: the $8,837.38 double-count question (Section 6) is flagged, not resolved; the Mold Masters invoice document itself is still unlocated even though the payments are bank-confirmed; and GC hours are still fully unreconstructed.


---

## 12. Mini harvest COMPLETED (2026-08-31, this session) — supersedes Section 10

All from `/Volumes/ClaudeData/archives/mini-offload-20260826/iCloud Drive (Archive)/Desktop/laura_export/` (exports of Jeff's Messages), mini CallHistory.storedata, Amazon Order History.csv, and ~/Downloads on the mini.

### 12.1 Ownership-story receipts (the strongest finds of the whole project)

**Apr 18, 2020 — The Greggfords (Jeff to Diana + Stacy):**
> Jeff: "Due to some complications I'll be the co borrower"
> Stacy: "Can we chat about that"
> Jeff: "Mom doesn't have a job offer"
> Stacy: "Makes sense"

Documentary proof, dated three weeks before funding, that Jeff went on the loan because Nancy could not qualify, and that Diana and Stacy knew it in real time. Nobody in the family can claim they believed Nancy bought the house herself. Same exchange references Diana's "draft letter — didn't send outside the 4 of us."

**May 12, 2020 — family group (Nancy, Julie, Diana, Tracy, Laura):** JEFF announces "Underwriting is COMPLETE!", "Signing 14/15", "Funding on 18th". Jeff ran the purchase, announced to the family by Jeff.

**May 13, 2020 — same group, Nancy:** "Hey loving children! Since I am not paying upfront for the PMI, I will try and swing the Roswell mortgage while it is empty." **Jeff's reply: "Keep your money until you need it, you never know when you might..."** — Jeff declining her money at the very start.

**May 18-20, 2020 — same group:** Julie: "Can we call it the Buttercup Cottage?" Nancy, May 20: **"Love you all to the MOON and back"** — Nancy's own sign-off in the week the house funded. This is the documented source for the letter's closing phrase.

**Sep 14, 2021 — Grandma & Portland Mumfords group, Nancy:** "I have a company coming out for a second estimate tomorrow... anyone available to be here at my house... my water bill was too high... on my side not the city's" — Nancy narrating Roswell to the family as "my house," her bill, her side of the line.

### 12.2 Kindness receipts

- **Jun 26, 2021 (heat dome), Laura↔Nancy:** Nancy: "86° in and my house 101 outside... I will probably come back to my house about midnight and open it up and blow the air through." Laura: "Would you like to stay at our house?" Nancy: "I would love to sleepover at your house!" — the documented misery that led to the AC and then the mini splits.
- **Aug 10, 2021, Official No Mom Group, Jeff:** "Going to buy mom an air conditioner for her bedroom, let me know if you want to chip in." Tracy/Diana chip in; Julie lends a portable unit; Jeff offers same-day pickup.
- **May 5, 2022, Jeff:** "Anyone have plans ideas for Mother's Day, Nancy edition?" — Jeff initiating her celebration.
- **Greggfords thread (2018-2024):** two-way childcare economy plus one-way handyman economy: Jeff helping move their washer/dryer, helping Stacy's mother(?) move in, "Purchase this and I'll help you install" (water filter), dimmer install, trailer and truck lending, "I guarantee I can fix whatever is wrong with the heater."
- Dec 7, 2024, Jeff to Greggs: "Thank you guys so much for looking after our kids" — the babysitting ran both ways and Jeff said thank you in writing.

### 12.3 Call history (mini CallHistory.storedata, retained window Jun 9 - Jul 20, 2026 only)

38 calls between Jeff and Nancy in six weeks; **30 of 38 originated by Jeff**. Long calls late in the window: Jul 15 (21.2 min), Jul 17 (13.0), Jul 18 (9.9), Jul 19 at 9:38pm (18.1). Jun 24: three calls from Jeff between 10:55pm and 11:49pm. **Last contact Jul 20: two incoming calls from Nancy, 0.0 min, unanswered. Then nothing. Six days later Patrick announced the POA transfer.** Jeff was the one doing the calling, right up to the end. Julie: zero calls in window. Diana: zero. Tracy: one 0-min call Jun 24.

### 12.4 Negative results (checked, closed)

- **Ring cameras:** no Ring purchase anywhere in Amazon Order History (2018-2026). The two candidate ASINs were a pill organizer and a WYZE Cam Pan v3. All cameras in the history are WYZE (2025), shipped to Malcolm. The Julie camera install predates the export window or was bought elsewhere; the claim rests on the iMessage record.
- **USAA statement PDFs (mini ~/Downloads):** no extractable hits for 2585/HELOC/$15k (no pdftotext on mini; PDFs compressed; USAA is the wrong rail anyway — the $5k moved through Chase, the $15k through the HELOC).
- **HWA/Hog Wild folder inventoried:** Sale_Announcement_to_Hog_Wild_Employees_2-13-18.doc, "Ownership percentages and detail.xlsx", MUMFORD K1 2018, Hog Wild LLC Financial Statements 2017-2018, Investor Proposal, HW Management Bios, 2018 Reorg + Executive folders under "Jeff Hog Wild". Documents Jeff's ownership/executive role era; not yet mined for the Tracy/Diana hires — file-level inventory only.

**Confidence index: 95/100** on the quotes above (read directly from export files with dates and speakers attached; export files are Apple Messages text exports, speaker labels as rendered by the exporter).

### 12.5 Greggfords deep mine (added same day, on Jeff's request)

Threads: "The Greggfords - 107.txt" (Jeff+Laura+Diana+Stacy, 2018 to Sep 20, 2025, ~40,550 lines), successor "The Greggfords - 519.txt" (Sep 20, 2025 to Mar 29, 2026, 263 lines), Diana 3-way (+15038309494 +15037099395, ends Aug 3, 2025).

**New kindness receipts, June 2025 (the week the mold hit):**
- Jun 9, 2025: Jeff clears a severe toilet clog and sets a new reinforced wax seal at the Greggs' house, and babysits Hollis the same afternoon ("It was a slow build but I got him laughing and smiling"). Diana: "What do we owe you." Jeff: "Nothing." **Four days before the Roswell mold loss (Jun 13).**
- Jun 12, 2025: Hollis brings Jeff an "Uncles Day" gift; "The best part was the whole body hug."
- Jun 15, 2025: Father's Day, Jeff doordashing donuts to their house.
- Jun 8, 2025: Laura to the Greggs: "you are TOO kind after everything you've done for us this weekend" — the help ran both directions and both sides said so in writing.

**Timeline texture:** the GROUP thread stays warm all summer 2025 (the Jeff-Diana rupture lived in the direct thread, not here). Message volume tells the arc anyway: 2,515 msgs in 2020, 1,921 in 2021, then 1,010 / 674 / 604 / 518, and the 7-year thread dies Sep 20, 2025. The successor thread is mostly Minecraft logistics between the kids, then Nov 13, 2025 Diana sharing the DMV story ("mom ALREADY HAD a real ID"), last message Mar 29, 2026. Diana was still running Nancy's errands (DMV, car, handicap pass) in Aug-Nov 2025.

**Ledger cross-hit:** Jul 26, 2025, Jeff: "I need to move Mom's car so we can drop a storage container in her driveway" — pins the pack-out container delivery date at Roswell to Jul 26, 2025. Relevant to open item 10 (Dry Box storage supplement).

### 12.6 Greggs free-work pricing (letter support, conservative, Odd Jobs rate sheet)

| Item | Date | Billed-equivalent |
|---|---|---:|
| MN trip at Hollis's birth: flight, multi-day help, bathroom repair | 2018 | ~$2,304 (3 days x 6 hr x $128) + airfare |
| Toilet clog + new wax seal | Jun 9, 2025 | $447 (3 hr @ $149 drain rate) |
| Washer/dryer move | 2020 | $256 (2-hr min) |
| Move-in help | 2021 | ~$512 (half day) |
| Water filter install | 2021 | $256 (2-hr min) |
| Dimmer install | 2020 | $256 (2-hr min) |
| 29th derelict-property advocacy (letters, city follow-up) | multi-year | ~$512 (4 hr) |
| Minneapolis Christmas drive (Tracy home, ~3,400 mi RT) | Dec | ~$4,096 (4 days x 8 hr x $128) + fuel |
| **Documented total, conservative** | | **~$8,600+** |

Unpriced on purpose: truck/trailer/tool lending over a decade (rental equivalent $75-100/day per loan), and childcare, which ran both directions and is owned as mutual in the letter. Letter v1.22 uses "north of eight grand," which this table supports.

### 12.7 Tracy mine (chat.db direct thread, 4,171 msgs 2014-2026, + Gmail)

Dump on disk: `~/Claude/Family/_tracy_thread.txt`.

- **Hog Wild ownership confirmed in Tracy's words**, Feb 14, 2018: "it's kind of weird that it's about you being 'named' president and CEO, when you actually bought it." Jeff: "as opposed to Private Equity owners, it's back to owner/operator." Jeff BOUGHT Hog Wild; the letter's "when I had position there" undersells it.
- **Jeff gave Tracy paid work**: Hog Wild catalog copy, presentations, Toy Fair NYC trips with airfare Jeff approved ("600 isn't outrageous. Book it!"), 2015-2020.
- **Message volume spike: 1,086 msgs in 2025** (vs 43-81 in 2021-2023). Tracy leaned IN during the crisis year.
- **June 2025, Nancy's hospitalization**: Tracy came to Portland, visited the hospital daily; Jeff housed her and Blake at a client's house (Anne's), lent TVs, gear, arranged everything while his own life burned.
- **⚠️ Nuance the letter must survive**: Jun 17, 2025, Jeff to Tracy: "I know I can trust you with the deepest, darkest parts of my soul but it would help to have you confirm you understand and will respect my wishes to navigate some of these issues alone." Tracy: "we may just keep offering unless you say the offers aren't helpful." Tracy DID offer support, repeatedly, in writing, and Jeff asked for room. "Nobody wrapped around me" is contestable if Tracy is included in "nobody." Recommend the letter carve Tracy out or address it.
- Jun 12, 2025 Jeff on Julie: "she doesn't have the right to make herself feel better by making others feel worse." Tracy: "I love you a lot — and I know it's been hard."
- **Current**: Tracy in Portland Aug 29-31, 2026; texted Aug 30 asking Jeff to breakfast (his phone showed satellite-only).

### 12.8 Julie mine (chat.db direct thread, 7,394 msgs 2014-2026; Gmail already swept)

Dump on disk: `~/Claude/Family/_julie_thread.txt`.

- **Jul 16, 2015, Julie in writing**: "As I'm helping Mom sort through her finances, should I plan for her to repay the money that you and Laura supported her this winter and spring?" — documents Jeff+Laura financially carrying Nancy in 2015, five years before the house, acknowledged by Julie.
- **Jeff's work for Julie, documented across a decade**: 2015 punch list in-thread (kitchen trap, pedestal sink, full-size toilet, light fixtures); 2016 appliance install + haul-off, fence/yard cleanup, Adeline's room setup; 2017 hosted the girls during lead-paint scraping; 2018 leaky dishwasher, water-heater guidance; 2019 arranged flooring installer, radiant-heat consult, "I'd be delighted!" (May 18, 2019); Dec 2019 picked Mom up, grab-bar coordination; 2020 sauna build supervision, climbing-wall offer, drain calls.
- **Feb 11, 2026**: Julie and Jeff coordinating Mom's hospital release together, warm and functional. Last direct thread activity May 31, 2026 (cordial). Thread silent since, POA moved to Patrick Jul 26.
- **Gmail (surfaced via Tracy sweep)**: Julie held Nancy's POA (finalized Jun 19, 2025, transferred away Jul 26, 2026); Julie ran the will/estate signing (Feb 2026), beneficiary forms (Oct 2025), Moda cards (Nov 2025), assisted-living search (Jul 2025). The Julie-2020-crisis emails EXIST on paper: Jeff's Mar 9, 2020 "Fun In Florida!" thread with Terry Chasteen (nanny concerns, "should we let her be with the kids as scheduled?") and Tracy's Mar 31, 2020 "Getting increasingly desperate sense of things at Julie's house." The letter's "the WHOLE family agreed, out loud, on email" claim is now paper-backed.
- **⚠️ Context the letter must survive**: summer 2025 the family WAS mobilized, on Nancy's cancer and care logistics (MorningStar, POA, chemo scheduling, assisted-living tours, 529s Nancy opened Jun 4, 2025). Her attorney's version of that summer is "everyone was drowning in Mom's illness." The letter's complaint is about support for JEFF (the unsafe story, Laura's treatment, the mold), which is distinct, but v2.0 should not phrase it in a way that erases the Mom-care mobilization. Health details themselves stay OUT of anything that circulates, per the recording-evidence note's standing flag.

### 12.9 DampRid finding (per Jeff, 2026-08-31)

When the mold was discovered and Jeff asked, Nancy said she had no idea about it. During pack-out, Jeff found DampRid throughout the house. Jeff's conclusion: she knew about the moisture and never disclosed it. Now in letter v2.2.

**🔴 Two-edged:** against Nancy this shows concealment. But claim 059560682-01 is still live and the scope of loss is still being pursued. If Safeco ever hears "occupant knew about long-standing moisture and said nothing," that invites neglect/late-notice defenses against the claim itself. Keep the DampRid passage inside the truth copy only; it must not reach anything that could circulate to the carrier while the claim is open.
