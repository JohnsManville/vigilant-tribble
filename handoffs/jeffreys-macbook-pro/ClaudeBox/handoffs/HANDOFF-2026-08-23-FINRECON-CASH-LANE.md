# HANDOFF — finrecon session (cash lane), 2026-08-23

**Written by:** the Mac mini session (`jeffmumfordmacmini`, verified by `whoami`).
**Measured at:** 2026-08-23 04:45–04:52 PDT. Every figure below was read from the
ledger, the repos or the live service inside that window. All times PDT.
**Covers:** one conversation that began 2026-07-31 and resumed on 08-11, 08-13 and
08-23. Its subject was Jeff's 2024/2025 tax reconstruction.

---

## 0. Read this first

This conversation is the exact hazard **E-085** describes. It spanned 23 days of
wall-clock while feeling continuous, and the world moved under it every time:
ClaudeBox gained 40+ commits, finrecon's ledger grew from 7,539 to 7,781 rows, and
a parallel session committed into a directory this session was mid-way through
splitting out. **Every number below has a measurement timestamp. Re-measure before
you act on any of it.** Nothing here is load-bearing enough to trust at second hand.

Two habits this session learned the hard way, both worth keeping:

- **Query the address the service actually binds.** finrecon answers on
  `http://100.115.69.54:8787` (tailnet) and `127.0.0.1:8787` is dead *by design*
  since v1.32. Reading loopback-000 as "it's down" cost an error entry (**E-071**).
- **Settle ambiguities with a test, not a guess.** Every cash-lane rule below was
  decided by a measurement against the data, and two of them overturned standing
  assumptions that had been sitting in the file for weeks.

---

## 1. Where the tax file stands

| | 2024 | 2025 |
|---|---|---|
| Gross receipts (Line 1) | $15,148.50 | $42,140.75 |
| Tentative net, pre-8829 | −$75.11 | −$39,220.57 |
| Uncategorised, non-personal | 1,086 txns / −$37,180 | 1,284 txns / −$70,323 |

Ledger: **7,781 transactions**, 16 accounts, **2,370** rows still unreviewed across
2024–25, **10** open evidence cases, **81 labor payments / $16,627.15** recorded for
1099 tracking, **3** classification drafts staged and unsaved in the review UI.
Test suite: **348 passing**.

Neither year is filing-grade. The uncategorised tails are why.

---

## 2. The cash lane — this session's deliverable

**162 withdrawals, $45,741.39 (2024–25).** Whole period across all dates: $66,007.72.
Worksheet: `finrecon/data/cash_worksheet_20251231.csv` — one row per withdrawal with
the jobs Jeff logged that week, crew he paid digitally, business income within 7 days,
and quoted iMessage evidence. **129 of 162** rows have a job that week, **29** have a
crew name, **141** carry message evidence.

It replaces a 7/31 sweep that reported **133 pulls / $39,366.64**. The old sweep
hand-enumerated bank names in a regex and that list had rotted — it missed $6,374.75.
The fix is not a longer list: `finrecon/scripts/cash_lane.py` matches on how USAA
*labels* rows, gates operator names on a withdrawal's amount shape, and **prints a
warning for anything cash-shaped its rules did not claim**, so the next missing
operator surfaces on the next run instead of hiding for a month.

Settled by test:

- **Bank of America is cash** — 12 of 14 rows carry a USAA ATM-REBATE credit within
  5 days, and USAA rebates ATM surcharges only.
- **Chase is cash**, refuting the standing skip-note guess that its 8 branch debits
  were "most likely teller payments toward the imported Chase accounts." Zero match a
  credit on any imported Chase account; all 8 carry the surcharge shape. $5,328 was
  on the wrong side of that guess.
- The self-audit then found **Embold CU**, a `KEYBANK` and an `SW001410` row that
  repeat the whole descriptor as the description, and terminals `LK376401`,
  `VC001185`, `P237842`.
- It also caught the mirror error: **`7-Eleven` is both a store and an FCTI ATM under
  one description.** A machine dispenses $20 bills, so the pool now requires a
  multiple of $20 plus a sub-$5 surcharge — which drops $3.78 snacks and keeps the
  $100 withdrawals beside them.

The ledger was **not** touched. This is a worksheet for Jeff to name payees on.

---

## 3. Waiting on Jeff, ranked by dollars

1. **Cash worksheet** — $45,741 across 162 rows. Start with the 29 that already carry
   a crew name that week. Each named row becomes contract labor with 1099 tracking;
   unnamed cash stays non-deductible.
2. **The wires** — ~$21k of unidentified 2024 deposits. USAA carries no sender, so
   only Jeff's memory resolves these.
3. **Amazon residual** — 315 items / $7,810 in `data/amazon/amazon_REVIEW_residual_20260731.csv`.
   Deciding them unlocks 65 more ledger charges.
4. **ADU cash split** — how Oct-2025's $2,107 divides between Tyler and Sid, plus
   Sid's surname (half clears the $600 1099 threshold).
5. **Hinckley → Roswell** — confirm his ~$2,090 is rebuild labor so it follows Paxton
   into the Form 4684 pile rather than Schedule C Line 11.
6. **Deferred by Jeff:** Laura's Venmo export. $10.5k of masked weekly debits is
   booked Personal on a *probable* house-cleaner reading — every row says "probable,"
   not confirmed. Her statement export would make it fact.

---

## 4. Traps

- **`seam-dedupe.sql` is committed but NOT RUN.** `audit_log` has zero seam-dedupe
  rows, so **53 known duplicates are still in the ledger** (batches 75–79, all card
  rows). They do not move either Schedule C draft and they do not touch the cash lane
  (USAA-only), but they inflate any ledger-wide total. Run it before quoting one.
- **The cash script's message evidence comes from an ephemeral scratchpad.** Re-running
  without `--imsg` silently ships a worksheet with a blank evidence column — it
  happened once today and was caught within the same turn. The script now prints a
  loud warning and the rebuild command; heed it.
- **Two agents write ClaudeBox concurrently.** That produced nine duplicate E-numbers,
  a directory collision on Sea Ray Trainer, and a 61 MB archive appearing mid-session.
  Prefer one holder at a time. **Cite error entries by date and title, not number.**
- **`_claude-session-archive/` is gitignored on purpose.** Its own RESTORE.md offers a
  "delete permanently after ~2026-09-10" path, and COVENANT gate 5 requires verbatim
  family transcripts to purge at 90 days. A repo with a remote cannot honour a purge.

---

## 5. Repo state at the stamp

| Repo | HEAD | Working tree |
|---|---|---|
| ClaudeBox | `b56d4dd` | clean |
| finrecon | `fa13f48` | 2 untracked (below) |
| Sea Ray Trainer | `d23d206` | clean — split out this session, its own repo |

`finrecon/ingest_roswell_docs.py` and `finrecon/seam-upgrade.sql` are untracked and
belong to another session; left alone deliberately. Nothing has been pushed anywhere.

---

## 6. Resuming

```sh
cd ~/ClaudeBox/finrecon
curl -s -o /dev/null -w "%{http_code}\n" http://100.115.69.54:8787/   # expect 200
.venv/bin/finrecon report schedulec 2025
.venv/bin/python scripts/cash_lane.py --imsg <scratchpad-with-imsg-json>
```

To rebuild the message cache the worksheet depends on:

```sh
for q in cash "pay you" "paid you" "an hour" "help me" "job site"; do
  ~/ClaudeBox/imsg/imsg --json search "$q" --days 980 > "$DIR/${q// /_}.json"
done
```

---

*Confidence: 95. Every figure was measured inside the stamp window and the cash-lane
rules were each decided against the data. The 5 points off are the parts that are
true-when-written by nature: the ledger is live, other sessions commit to these repos,
and this document starts ageing the moment it is saved.*
