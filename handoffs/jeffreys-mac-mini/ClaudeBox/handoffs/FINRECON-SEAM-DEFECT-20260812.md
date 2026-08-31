# FinRecon defect — SimpleFIN sync double-imports the overlap window

**Found:** 2026-08-12, first real `finrecon sync` run
**Severity:** high — silently corrupts the ledger, reports success
**Status:** 🔴 OPEN. Ledger restored. **Scheduled sync DISABLED** pending a fix.

---

## What happened

The first real sync imported 319 transactions across 11 accounts and reported
**`0 duplicate`** for every single one. That is wrong. **148 of those 319 rows (46%) were
re-imports of transactions already in the ledger**, across 8 of the 11 accounts.

| Account | Duplicate groups | Dup rows | First | Last |
|---|---:|---:|---|---|
| usaa-checking-1923 | 73 | 73 | 2026-06-30 | 2026-07-16 |
| chase-prime-2586 | 25 | 29 | 2026-07-05 | 2026-07-14 |
| usaa-visa-2188 | 17 | 17 | 2026-06-30 | 2026-07-15 |
| citi-costco-3425 | 17 | 17 | 2026-06-30 | 2026-07-22 |
| usaa-visa-9952 | 5 | 5 | 2026-07-01 | 2026-07-12 |
| amex-41009 | 3 | 3 | 2026-07-01 | 2026-07-15 |
| amex-81000 | 2 | 2 | 2026-07-12 | 2026-07-14 |
| chase-checking-0922 | 2 | 2 | 2026-06-30 | 2026-07-01 |
| **TOTAL** | **144** | **148** | 2026-06-30 | 2026-07-22 |

Net distortion **$39,598.54** (signed — it includes a double-counted $38,428.84 credit on
`amex-81000`, so the gross error is larger than the net).

Concrete example — the same $1,000 Citi payment, twice:

```
id 6807  2026-07-22  1000.00  citi-costco-3425  batch 55  (blank)
id 7724  2026-07-22  1000.00  citi-costco-3425  batch 77  ONLINE PAYMENT, THANK YOU
```

## Root cause

Dedupe rests on `UNIQUE (account_id, source_txn_id)`. Identity comes from one of two spaces:

- **Native ids** — the source mints them (SimpleFIN, OFX/QFX FITID, Venmo, Cash App).
  `dedupe_key IS NULL`.
- **Synthetic ids** — the loader derives `sha256(posted_date|amount_cents)#occurrence` for
  sources with no ids (USAA/Chase CSVs, statement PDFs). `dedupe_key IS NOT NULL`.

**The two id spaces never collide.** A transaction already present under a statement-derived
synthetic key is invisible to a SimpleFIN row carrying the Bridge's native id, so
`INSERT OR IGNORE` inserts rather than ignores, and `duplicate_count` reports 0. The system
is behaving exactly as designed and producing a wrong ledger.

`DECISIONS.md` §5.23/§5.24 already identified this seam and `loader._native_era_clip()`
guards it — **but only in one direction.** It clips *synthetic* rows that fall inside an
account's *native-id era*. Here the reverse happened: *native* SimpleFIN rows landed on top
of an era already covered by *synthetic* rows. There is no guard for that direction, and
`SimpleFinImporter` does not set `native_seam_guard` (it would not help if it did — the
guard tests the wrong condition for this case).

This is not USAA-specific and not a mapping error. The account map was verified correct
before the run, including the two ambiguous USAA Visas.

## What was done

1. **Rolled back all 11 batches** (72–82) via `finrecon rollback-batch`. Clean: 319 rows
   deleted, 0 reviewed, 0 in transfer links, 11 `audit_log` entries written.
   Ledger restored to **7,539 transactions, max posted 2026-07-22** — byte-consistent with
   the pre-sync state. **0 duplicate groups remain.**
2. **Disabled the scheduled sync** —
   `launchctl unload ~/Library/LaunchAgents/com.oddjobs.finrecon-simplefin-sync.plist`.
   It fires daily at 05:30 and **would have reproduced this corruption every morning**,
   compounding, unattended. `com.claudebox.finrecon-serve` left running.
3. **Nothing was lost.** All 11 SimpleFIN JSONs are retained at
   `data/archive/<slug>/simplefin-2026-08-13T034614Z.json` and can be re-imported once the
   seam is fixed. Backups: `finrecon-20260812-201020.db` (pre-migration),
   `finrecon-20260812-204612.db` (pre-sync).

## What a fix has to do

Extend the seam logic to be **symmetric**. Before inserting a native-id row, check whether
an existing row in the same account matches on `(date, amount_cents)` with the multiplicity
the file implies — the same exact-field, non-fuzzy test `_native_era_clip()` already uses,
description playing no part (§5.10) — and drop the incoming row if it is already covered.

Design questions for Jeff, not to be guessed:

1. **Which row wins?** The existing synthetic row carries the older provenance; the incoming
   native row carries a better id. Keeping the native one means deleting verified history;
   keeping the synthetic one means the account never migrates to native ids. A third option
   is to *upgrade in place* — attach the native `source_txn_id` to the existing row and null
   its `dedupe_key`, preserving one row with the best identity available.
2. **Fail loud or clip quietly?** `_native_era_clip()` raises `SeamGapError` on any hole
   rather than clipping. The same standard here would mean a partial-overlap sync refuses
   outright. That is consistent with the project's ethos and probably right.
3. **Per-account seam dates.** Each account's history ends on a different date
   (`chase-united-5925` at 2026-06-01, `citi-costco-3425` at 2026-07-22), so a single global
   `--days` window cannot avoid overlap for all of them. The guard has to be per-account.

## Do not, in the meantime

- Do not re-enable the launchd job until this is fixed.
- Do not run `finrecon sync` without `--dry-run`, and note that **dry-run does not surface
  this problem** — it reports what it *would write*, not what would duplicate. The
  `0 duplicate` in the real run is the tell, and it is a false negative.

## Re-enable, once fixed

```bash
launchctl load ~/Library/LaunchAgents/com.oddjobs.finrecon-simplefin-sync.plist
```

---

## Worth keeping from the run that exposed this

The sync did surface two real, wanted facts before being rolled back. **Both are recorded in
`ROSWELL-POLICY-SUMMARY-RC.md`; neither survives in the ledger right now.**

| | |
|---|---|
| **CMG escrow check landing** | **2026-07-21, +$8,837.38, `chase-checking-0922`**, "DEPOSIT ID NUMBER 22387" — the first carrier-origin money ever to reach the ledger. Matches check #00001432 dated 5/28/2026 from Proctor Financial for CMG |
| **Subcontractor cash** | **2026-07-21, −$1,000.00, `chase-checking-0922`**, "WITHDRAWAL 07/21" — Jeff, same day, same account: escrow proceeds drawn straight to sub labor |

Both re-enter the ledger when the archived JSONs are re-imported after the fix. The
`chase-checking-0922` file had only 2 duplicate groups, so that one account is the cheapest
candidate for a careful manual re-import if the Roswell reconciliation is needed before the
seam work is done.
