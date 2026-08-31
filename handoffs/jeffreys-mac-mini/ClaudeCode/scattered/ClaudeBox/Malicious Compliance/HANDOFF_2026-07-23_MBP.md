# HANDOFF — 23 JUL 2026 (for MBP session) — supersedes HANDOFF_2026-07-22_PICKUP.md

**Written 22 Jul ~23:55 PDT by the Mini evening session. Read this first; the 22-Jul pickup
handoff remains for history but every status line in it is superseded by this file.**

## Canonical locations (nothing canonical lives on the MBP)

- **Ledger:** `Mini:~/ClaudeBox/finrecon/data/finrecon.db` — v1.26, git `1fddd99`
  (branch `phase4-review-ui-docs-engine`). Latest backup `data/backups/finrecon-20260722-231947.db`.
- **Purcell package:** `Mini:~/Downloads/PURCELL - FINAL 2026-07-20/` (START HERE — 21 July.md).
- **Attorney letter:** `Mini:~/ClaudeBox/Malicious Compliance/PURCELL_ATTORNEY_LETTER_2026-07-22_rebuilt-verified-r2.md` (r2 = current; r1 kept).
- **Error log:** `Mini:~/ClaudeBox/AI_ERROR_LOG.md` — **next free number E-049.**
- Mini ssh: `jeffmumfordmacmini@Jeffreys-Mac-mini.local` (named IPs are stale).
- The MacBook mirror used by the 22-Jul full-accounting run lived in that session's scratchpad
  and is likely gone — re-mirror if needed; prefer ssh reads against the Mini.

## What the 22-Jul evening session completed (do not redo)

1. **"PROJECT RECORD AND ACCOUNTING — 22 July.pdf"** rendered (ReportLab, 20 pp, 69,283 B,
   sha256 `950a9c95…`), installed beside the md in the FINAL package, row appended to
   MANIFEST-ADDENDUM-2026-07-22.csv. Md re-verified `b5d0c5ed…` pre-render.
2. **Ex. J RECONFIRMED live in work Gmail** (Jeff at keyboard, Chrome): Karissa 6/6/26 6:54 AM,
   thread "Supplemental Order – Purcell Deck Project (Ref: H4017-566634)", verbatim no-restock-fee
   language. Thread facts: Jeff's 6/8 replies promise to confirm with Steve whether the round kits
   are sealed (never resolved in-thread); Karissa 6/9: "just tried calling Steve and there was no
   answer." Pre-transmission checklist item is DONE.
3. **Tender 0919 SOLVED (E-047, commit `1fddd99`):** it is another physical-card token of
   citi-costco-3425 — NOT a BofA/Apple card. 6/6 post-Aug-2024 receipts match same-day
   exact-amount Costco lines (incl. paired $24.99 return/credit). `TENDER_ALIASES` += 0919;
   re-link **+9 (156 → 165 of 241)**. Remaining 0919 receipts (Feb–Jul 2024) link when the
   on-order Citi statements import. Corroboration: BofA's only card = Alaska Airlines, applied
   ~Aug 2025 (application-feedback emails) — cannot be a Feb-2024 tender.
4. **Jeff CLOSED the BofA/Apple-Card export lane — do not re-queue it.**
5. **Errors logged:** E-046 (session wrongly denied its own TCC volume prompt — it was Claude
   Code binary 2.1.216, benign, approved), E-047 (above), **E-048 (serious footgun):** the
   session's `finrecon serve` launched with cwd = Malicious Compliance and **silently created
   + served a fresh EMPTY ledger** at `Malicious Compliance/data/finrecon.db` — Jeff saw
   "queue clear / $0" fake state. Fixed: stray DB deleted, `.claude/launch.json` now pins
   `serve --db /Users/jeffmumfordmacmini/ClaudeBox/finrecon/data/finrecon.db`. A guard task
   (serve refuses a zero-account ledger without --init) was chipped but not started.
   **Any MBP session running `finrecon serve` must pass --db explicitly or run from the
   finrecon directory, and must sanity-check the top-bar stats (2024 ≈ $6,101 / 47%,
   2025 ≈ −$34,379 / 55% as of tonight) before telling Jeff anything.**

## TRUE review state (corrects the earlier "queue clear" claim — that was E-048's fake DB)

- **Uncategorized queue: 40 groups**, biggest first: DEPOSIT@MOBILE 8× +$63,056 (usaa-checking);
  1050926 AUTOPAY RTN R01-INS 2× −$20,687 (citi); WIRE IN 4× +$18,702; Wells Fargo 18× −$11,057;
  COSTCO WHSE 42× −$7,338 (new from the Citi import); 4TE*NCSD CARE 30× −$9,128; etc.
- **Suggestions: 40 groups** (auto-categorized, unconfirmed).
- **Active skips: 76** across 11 cases — the lane index: Needs your input (19) · Nancy—Roswell
  bridge loans (14, liability NOT income) · Paper checks—need images (11) · Deposits—need source
  data (9) · Roswell—casualty Form 4684 (6) · Bank/loan transfer-vs-expense (6) · Suspense (5) ·
  2026—next year (5) · person-payments (2) · cash (2) · Venmo business-profile (1).
- **Phase 3 (in progress): the 19 "Needs your input" decisions.** Aggregates computed 22 Jul:
  7-ELEVEN 60× −$3,459.50 ('24–'26, 3 cards) and BRIDGETOWN AUTOMOTIVE 2× −$3,485.93 → default
  Personal under Jeff's standard-mileage election (confirmed 7/18) unless he overrides;
  Turo 12/26/24 −$1,005.80 (+$51.70 refund); Airbnbs −$701.74 (11/24), −$1,052.81 (9/25),
  −$477.43 (10/25); Meredith lodging 2× −$812.72 (10–11/24); Chase branch-counter debits 8×
  −$5,027.50 ('25–'26, day-labor relevant); ConsolidatedCCU 2× −$1,106 (which loan? truck
  interest deductible atop mileage); SE MCLOUGHLIN 2× −$807 (7/11+7/14/26); "J Milwaukie Hrm"
  8× −$1,283.92 recurring; Sawyer+N* 3× −$973.97; Milwaukie Floral 2× −$225.99; Caleb Holcomb
  Venmo +$340 memo "Bike". **AMAZON MKTPL 425× −$25,579.82 stays parked until Jeff's real
  Amazon order-history export arrives (the earlier "Amazon" file was the wrong export).**

## Work queue for the next session

1. **Phase 3** — walk Jeff through the 19 (list above; UI Cases panel → "Needs your input",
   `remove` releases an item back to the queue). Also the 40-group queue proper — biggest
   items are deposit/wire attribution (OPPE second-business question lives in the $63k
   DEPOSIT@MOBILE group — match to invoices/check images BEFORE calling it Schedule C income).
2. **Phase 4** — Citi statements email had NOT arrived as of 22 Jul ~22:40 PDT (checked twice).
   When it lands: Jeff authenticates, backup first, import PER FILE
   (`finrecon import <pdf> --importer citi-statement --account citi-costco-3425`), Jan-2025
   "seam-clipped" report = CORRECT. Then `docs ingest-costco …costco-receipts-full-history.json`
   and report newly linked (expect the remaining 0919s + 22 waiting + 3 in the Dec 13–31 seam).
   FYI noted in passing: a Citi returned-payment notice 22 Jul 07:06 PDT was followed by a
   $1,000 payment confirmation 11:54 PDT — appears handled, not our workstream.
3. **Phase 5** — labor framing decision still open: letter r2's **$4,982.46 + foreman band
   $1,200–$3,000** vs record's **$6,097.46 booked / $4,191.80 floor**. When Jeff picks,
   reconcile BOTH documents to it (new files + manifest rows; never alter installed evidence).
4. **Stale-file hygiene (Jeff approved? NO — proposed only):** `finrecon/data/`
   PURCELL_FINAL_ACCOUNTING_VERIFIED.md, PURCELL_COMPLETE_EXPORT.md,
   purcell_attorney_case_brief.md (Jul 19–20, dead numbers) → propose moving to
   `_SUPERSEDED_2026-07-20/`. schedule_c_draft_2024/2025.md are 5 ledger-versions stale —
   regenerate only after queue burn-down + Amazon + Citi imports.
5. ~~**Mileage log is still EMPTY** — currently a $0 truck deduction for both years; the single
   biggest missing tax number. Needs Jeff's reconstruction (calendar/photos/job records help).~~
   **CLOSED 2026-07-24 (MBP sessions):** `mileage_log` = 456 day-rows with job_refs —
   **2024 = 2,255 mi / $1,510.38 @67¢ · 2025 = 2,421 mi / $1,694.70 @70¢**; Schedule C Line 9
   live both years (incl. Brady reclaim; backups `*_pre_brady_20260724.*`). The Mini-side
   Takeout/passkey reconstruction lane is superseded — **do not resume it.** See DECISIONS v1.28.

## Ambient facts

- A second session ("iMessage thread export by date") was RUNNING on the Mini at 23:37 PDT,
  same workspace — coordinate before touching iMessage exports.
- finrecon UI: Cases panel = lane index; Purcell deliberately has NO ledger case (package PDFs
  are the Purcell source of truth, ledger undercounts — standing rule).
- Standing law unchanged: draft anything, transmit nothing — Jeff's hand only. Truth over
  advocacy; absence in a partial mirror is not absence in fact. Never enter passwords.
  Preserve, don't alter. Nothing from "1 FOR ATTORNEY (privileged)" goes outbound.
