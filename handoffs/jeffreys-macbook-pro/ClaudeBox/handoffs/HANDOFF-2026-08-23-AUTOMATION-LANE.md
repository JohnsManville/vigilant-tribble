# HANDOFF — automation lane (ledger feed + alarms), 2026-08-23

**Stamped 2026-08-23 ~04:55 PDT.** Companion to
[`HANDOFF-2026-08-23-FINRECON-CASH-LANE.md`](HANDOFF-2026-08-23-FINRECON-CASH-LANE.md),
committed 04:48 the same morning — **that one owns the tax file and the cash lane; this
one owns the feed that supplies them.** Read that one for Schedule C, the $45,741 cash
lane, and what Jeff owes the accountant. Read this one for whether the numbers underneath
are current, and what runs unattended.

## 0. Read this first

**Every figure below was measured at the stamp, not recalled.** Each one carries the
command that re-derives it. If you are reading this more than a few days out, run them
before quoting anything — three separate errors this month came from repeating a dated
document's numbers as current state (E-079, E-080, and E-083, which was me doing it to
myself hours after logging the other two).

**Cite error-log entries by date and title, not number.** Two agents write ClaudeBox
concurrently and have produced nine duplicate E-numbers.

> ### ⚠️ Dating correction, and why it matters
>
> The conversation that produced this work **began 2026-08-11 and ran to 2026-08-23**.
> Its early turns are stamped 8/11–8/12 and are correct for that date. But for most of
> the session I anchored to 8/11 because the originating handoff was written then — so
> **anything in it dated "today" before the SimpleFIN build should be read as 8/11, not
> 8/23.** `CASH_POSITION_2026-08-11.md` is the one that matters: its cash figures are
> **12 days old** and were computed from a ledger that was itself 26 days stale. It is a
> method, not a current answer. Do not quote its August/September numbers.

---

## 1. The headline: the feed works now

The problem that started this: the ledger stopped being fed on 2026-07-22 and **nobody
noticed for 20 days**. It surfaced only when Jeff asked whether he could make another
month, and the answer had to be computed off three-week-old data.

That is fixed. USAA / Chase / Amex now refresh nightly with no input from Jeff.

| Account | Last txn | Days stale |
|---|---|---:|
| chase-checking-0922 · chase-prime-2586 · chase-united-5925 · usaa-visa-2188 | 2026-08-20 | **3** |
| usaa-checking-1923 *(the operating account)* | 2026-08-19 | **4** |
| amex-81000 | 2026-08-18 | 5 |
| amex-41009 · citi-costco-3425 | 2026-08-14 | 9 |
| usaa-visa-9952 | 2026-08-07 | 16 |
| lowes-commercial | 2026-07-17 | 37 |
| venmo-personal · cashapp | 2026-07-08/10 | 44/46 |
| hd-proxtra-8761 | 2026-05-15 | 100 |
| **qb-checking-6210** *(where customer income lands)* | 2026-05-01 | **114** |
| usaa-savings-1696 · usaa-savings-1915 | 2026-04-13 / 02-27 | 132 / 177 |

```sh
cd ~/ClaudeBox/finrecon && sqlite3 -header -column data/finrecon.db "
select a.slug, substr(max(t.posted_at),1,10) last_txn,
       cast(julianday('now') - julianday(substr(max(t.posted_at),1,10)) as int) days_stale
from transactions t join accounts a on a.id=t.account_id
group by a.slug order by days_stale;"
```

The bottom six are **expected** — SimpleFIN does not cover them (§1.3 coverage table).
They are the quarterly manual lane, BUILD_PLAN P4. The two savings accounts *are* mapped
and connected; they return 0 transactions because they genuinely have no activity, which
matches §5.10's finding that USAA only issues a savings statement for cycles with activity.

Ledger: **7,781 txns** (was 7,539 on 8/11).

---

## 2. What runs unattended, and its real state

| Agent | Schedule | State at stamp |
|---|---|---|
| `com.oddjobs.finrecon-simplefin-sync` | 05:30 daily | **Fixed this morning** — see §3 |
| `org.mumford.imsg-prune` | 03:15 daily | ✅ Healthy. Ran 8/23, 143 transcripts held |
| `com.oddjobs.claudebox.dailybrief` | 06:00 daily | ✅ Carries the health line |
| `com.claudebox.finrecon-serve` · `intel-mirror` · `capture` · `distill` · `heartbeat` · `sync-projects` · `keep-awake` · `tailscale-watchdog` · `icloudcachecleanup` | various | Not touched this session |

```sh
launchctl list | grep -E 'finrecon|imsg-prune|oddjobs'
tail -5 ~/ClaudeBox/finrecon/logs/simplefin-sync.log
tail -3 ~/ClaudeBox/imsg/prune.log
```

**Health line right now:**

```
🟢 System OK · capture live 04:46 · build retired · distill ok · disk 94%
```

⚠️ **Disk is 94%.** `health-line.sh` escalates to red at 95%, with the note "box will
wedge". It was 83% on 8/11. Nothing in this session caused it, but it is the closest
thing to an imminent operational problem on the box.

**A ledger-staleness alarm now rides the 06:00 text.** It judges `max(posted_at)` on the
operating account — the data, not whether a job ran — and escalates 14d → yellow,
30d → red. It reads green today, which is the first time that has been true and earned.

---

## 3. The two defects in this session's own work

Both are mine. Both are fixed. Recording them plainly because the fix commits are the
only other place they exist.

**(a) SimpleFIN sync double-imported the overlap window — HIGH, fixed 8/12.**
Full writeup: [`FINRECON-SEAM-DEFECT-20260812.md`](FINRECON-SEAM-DEFECT-20260812.md).
The first real sync imported 319 rows and reported `0 duplicate` for all of them; **148
(46%) were re-imports**, net distortion $39,598.54. Cause: dedupe rests on
`UNIQUE (account_id, source_txn_id)`, and native ids (SimpleFIN) and synthetic ids
(CSV/statement-derived) are **separate spaces that never collide**. `_native_era_clip()`
guarded only one direction. My end-to-end test proved re-importing the *same source* was
idempotent and I reported that as dedupe being proven — it never exercised native rows
landing on an era already covered by synthetic ones, which is the case that mattered.

Fixed by `2d50c19` (symmetric seam guard). Verified at the stamp:

```sh
cd ~/ClaudeBox/finrecon && sqlite3 data/finrecon.db "
select count(*) from (select account_id, substr(posted_at,1,10) d, amount_cents,
  sum(case when dedupe_key is null then 1 else 0 end) native,
  sum(case when dedupe_key is not null then 1 else 0 end) synth
 from transactions group by account_id, substr(posted_at,1,10), amount_cents
 having native>0 and synth>0);"
```

**Returns 1**, in `hd-proxtra-8761` — not a SimpleFIN account, so unrelated to this seam.
The defect doc still reads `🔴 OPEN … Scheduled sync DISABLED`; **that status is stale**,
the sync is loaded and running. Left the doc alone rather than editing another session's
file — worth a status line from whoever owns it.

**(b) The nightly sync reported FAILED every night while succeeding — fixed at the stamp.**
`0 sync ok / 5 sync FAILED` in the log. Adding `.json` to the folder-walk set so sync's
own output could be imported also swept in the Costco receipt dump (~220 per-receipt
files, which belong to `docs ingest-costco`, not the transaction loader) and a stray
`trailer-justin-2026-05.json`. The accounts imported correctly the whole time; two
unrecognised files failed the run afterwards. Fixed in `ba366f5` — JSON is importable
only when sync wrote it (`simplefin-*`). 243 non-transaction JSONs now correctly skipped,
**352 tests pass**.

> A scheduled job that reports FAILED while actually succeeding is worse than one that
> plainly fails: it trains you to stop reading the log, which is exactly where a real
> failure would appear. **Tomorrow's 05:30 run should be the first `sync ok` ever
> written.** Check it — that is the single highest-value verification on this page.

```sh
grep -c 'sync ok' ~/ClaudeBox/finrecon/logs/simplefin-sync.log   # expect >= 1 after 8/24
```

---

## 4. Waiting on Jeff

1. **Three unmapped SimpleFIN accounts**, skipped nightly and reported every run:
   `USAA YOUTH SAVINGS (3067)` · `FIXED RATE LOAN (1690)` · `FIXED RATE LOAN (1004)`.
   The two loans carry 4 transactions each. Decide whether they belong in the ledger; if
   yes, register them and add their ids to `data/simplefin_map.json`.
2. **Was the $1.50 coverage test ever run?** §1.4 has wanted an empirical answer on
   **Home Depot Commercial** and **Green Dot** since 7/14. Green Dot is the one that
   matters — if it reaches QuickBooks Checking, the 114-day income blind spot closes
   automatically instead of becoming a build.
3. **Disk at 94%.**

Everything else Jeff-facing — the mortgage servicer question, Home Depot's past-due
hardship offer, the tax packet — is in the cash-lane handoff, which is more current on
all of it.

---

## 5. Plan of record

[`finrecon/BUILD_PLAN.md`](../finrecon/BUILD_PLAN.md) **v2.0**, phased against Jeff's two
stated acceptance tests: *"it cannot rely on me"* and *"who owes what to make it one more
month."* P0 (his ten minutes) is **done** — that happened 8/12. P1 is effectively done as
of the §3(b) fix. **P2 is the next real work: generate the cash sheet and push it,**
instead of a session hand-building it when asked.

P3 remains the honest gap and the plan flags it at confidence 55: **receivables exist in
no system on this box** — Handled holds 0 customers, 0 invoices, 0 estimates. "Who owes
Jeff" is still only in his head, his email, and QBO.

---

## 6. Documents to distrust

| Doc | Why |
|---|---|
| `CASH_POSITION_2026-08-11.md` | 12 days old, off a 26-day-stale ledger. Method, not answer. |
| `FINRECON-SEAM-DEFECT-20260812.md` | Says OPEN / sync DISABLED. Fixed and re-enabled. |
| `DECISIONS.md` §5.23 | Its two "open" items closed weeks ago — §5.25.1 records the real figures. |
| `DOWNLOAD_GUIDE.md` | Retired 8/11. Four wrong portal rows, struck through in place. `PORTAL_PLAYBOOK.md` supersedes it. |

The pattern across all four, and across E-079/E-080/E-083: **a dated document's open
items are a record of what was open on that date, never a to-do list.** The cheap guard
is to put the re-measure query next to the claim, which is why this page is full of them.

---

*Odd Jobs — Handyman Services · Jeff Mumford · stamped 2026-08-23 04:55 PDT*
