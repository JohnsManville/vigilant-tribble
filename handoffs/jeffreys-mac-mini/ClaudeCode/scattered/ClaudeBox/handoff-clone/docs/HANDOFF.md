# Handled — Claude Code Handoff & Present State

**Verified against the repo 2026-08-23 · branch `nightly` @ `e9ecc4a` — last code commit 2026-08-12**

Read this first in any new session, then `docs/specs/learning-estimator.md` for design
detail. **Where this file and the spec disagree about the current state of the repo, this
file wins — and the repo beats them both.** The spec is authoritative on *design* (model
shapes, the update rule, phase scope), not on what is built. Re-verify §8 before you
touch anything; every "verified" claim has a shelf life and this one is no exception.

---

## 1. Present state in one screen

**Handled** is the job-to-cash command center for **Odd Jobs — Handyman Services**
(Jeff Mumford, Portland Metro, CCB #252070). One operator, real jobs, real money. A
Django app covering six steps and nothing else:

```
Lead → Customer → Estimate → Proposal → e-Sign → Invoice
```

The six-step app is **built and working**. The active work is the **Learning Estimator**,
a module that estimates labor hours from a task library and corrects itself from logged
actuals. It adjusts **hours only, never prices.** Jeff sets prices.

| | |
|---|---|
| Gate | `make check` — ruff clean, no pending migrations, **296 tests passing** |
| Learning Estimator | Phases 0–4 done, 5 skipped, 6 half done |
| Feature flag | `FEATURE_LEARNING_ESTIMATOR` — **off by default**, `'1'` to enable |
| Dev DB | seeded library, **zero jobs** — no customers, projects, estimates or invoices |
| Blocked on Jeff | three decisions, §6 |

**The single most important thing to understand about the current state:** the learning
half of the loop is wired into the app and the estimating half is not.

* `invoice_log_actuals` → `recalibrate(account)` is **live** (`core/views.py:726`). Close
  out a job with the flag on and calibration factors move.
* `estimate_job` — the function that *uses* those factors — **has no caller outside
  tests.** The estimate builder screen still runs the original manual line-item flow.

So today the app can learn but cannot yet spend what it learned. Closing that is Phase 6b.

---

## 2. Stack and repo facts

| | |
|---|---|
| Framework | Django **6.0.7** |
| DB | SQLite `db.sqlite3`, stock config — **`journal_mode=delete`, not WAL** |
| | Postgres must stay a settings change — no SQLite-specific SQL |
| Frontend | Server-rendered templates + HTMX. **No SPA.** |
| Layout | Project `config/`, single app `core/` |
| Tests | pytest + pytest-django (`pytest.ini`), 21 test modules |
| Gate | `make check` = ruff + `makemigrations --check` + pytest |
| PDFs | reportlab 5.0.0 |
| Payments | **Square only** (`core/square.py`, `.env.square.example`). No Stripe code, no Stripe dependency. `CLAUDE.md` and `TASKS.md` mention Stripe Billing for a future subscription — aspiration, not code. |
| Migrations | `0001`–`0008` |
| Branch | Commit to `nightly` only. **`main` merges are Jeff's.** |
| Deps | 13 packages, no ML libraries, no queue, no cloud services |

### Hard rules from `CLAUDE.md`

1. **Tenant scoping is rule 1.** Every tenant-owned model extends `AccountScopedModel`.
   All queries go through `.objects.for_account(account)`; unscoped queries raise
   `UnscopedQueryError`. It genuinely fires — it caught a bug in `calibration.py` during
   the Phase 4 build.
2. **Six steps only.** Features outside the six-step flow get rejected.
3. **No scheduling. No time tracking.** The close-out form is the ceiling.
4. **No raw SQL**, nothing SQLite-specific. Django `JSONField` is fine.
5. **Test-first for anything touching money.**
6. Small commits, conventional messages, one logical change each.
7. **Stop at every phase boundary.** Do not chain phases.

---

## 3. What exists

**Models** (`core/models.py`): `Account`, `AccountScopedModel` + scoped manager,
`Customer` (`is_friends_family`), `Property`, `Project`, `PriceBookItem`, `Estimate`
(+ estimator fields: `version`, `hours_p50`, `hours_p80`, `pricing_snapshot`,
`calibration_snapshot`, `unknowns`, `estimate_type`), `EstimateLineItem` (+ provenance:
`task_template`, `baseline_hours`, `modifier_product`, `calibration_factor`,
`estimated_hours`, `rate_class`), `Proposal`, `Invoice`, `UserProfile`, and the four
estimator models — `TaskTemplate`, `EstimateModifier`, `ActualLog`, `CalibrationFactor`.

**Money layer** (`core/pricing.py`) — **the single source of truth for rate math. Never
duplicate it.**

- `STANDARD_LABOR_RATE` 128 · `DRAIN_LABOR_RATE` 149 · `FRIENDS_FAMILY_LABOR_RATE` 99
- `MATERIALS_MARKUP` 1.30 · `WEEKEND_MULTIPLIER` 2 (via `labor_rate()`)
- `MINIMUM_LABOR_HOURS` 2 — shortfall billed at the highest labor rate present
- `DEPOSIT_THRESHOLD` — **strictly over** $1,000 → 50% (`DEPOSIT_RATE` 0.50)
- `summarize_line_items()` → `EstimateSummary`

Rate classes are `PriceBookItem.Kind`: `labor_standard`, `labor_drain`,
`labor_friends_family`, `material`. Do not invent a parallel enum.

**Estimator modules**, in the order data flows through them:

| Module | Does | Called by |
|---|---|---|
| `core/task_catalog.py` | Parses Jeff's two seed CSVs. Holds **no numbers of its own**. | `seed_estimator` |
| `core/estimator.py` | `estimate_job` — baseline × modifiers × calibration → P50/P80 → priced lines → `pricing.py` | **tests only** |
| `core/variance.py` | Estimated vs actual per `ActualLog`; ratio, delta, learnable | `calibration.py` |
| `core/calibration.py` | The update rule, its guards, rollup, `recalibrate` | `views.py` close-out |

**Commands:** `seed_pricebook`, `seed_estimator`, `import_reconstructed_hours`.

**Flows:** PDF proposals, e-sign accept, Square invoices. Estimate builder at
`projects/<id>/estimate`, invoice detail at `invoices/<id>`, actuals panel at
`invoices/<id>/actuals`. The Square webhook flips invoices to `PAID` when
`amount_paid >= total` — there is no user-facing "close job" screen.

---

## 4. Learning Estimator — phase state

| Phase | Scope | State |
|---|---|---|
| 0 | Recon | ✅ Done |
| 1 | Actuals capture + 4 models + seed | ✅ `f0c2001`, `63b40fa`, `8af5d37`; library reconciled to Jeff's CSVs in `75aabe8` |
| 2 | Deterministic estimator + goldens | ✅ `381d256`, `912311a`, `4a3a37e`; goldens re-pinned in `75aabe8` |
| 3a | Variance + outcome-flag exclusions | ✅ `92f7db9` |
| 3b | `import_reconstructed_hours` | ✅ `5ba2e1e` — built, **imports 0 rows today**, see §6.1 |
| 4a | Update rule + guards + `recalibrate` | ✅ `c7aeb57` |
| 4b | Rollup fallback at `k/(n+k)` | ✅ `a152278` |
| 5 | Explainability + calibration reporting | ⏭️ **Skipped over — not done.** See §6.3 |
| 6a | Close-out triggers `recalibrate` | ✅ `e9ecc4a` |
| 6b | Estimator UI in the builder + proposal output | ⏸️ **Not built.** See §6.2 |

### Binding decisions

- **No `RateConfig`, no new rate math.** Reuse `core/pricing.py` + `PriceBookItem`.
  Snapshot the inputs actually used onto the estimate.
- **No parallel estimate models.** Extend `Estimate` / `EstimateLineItem`.
- **The task library is Jeff's CSVs, full stop.** `core/task_catalog.py` parses
  `docs/specs/task_templates_seed.csv` (29 tasks) and `estimate_modifiers_seed.csv`
  (10 modifiers) at import and raises `CatalogError` if either is missing. **Never
  hand-author a baseline — edit the CSV.** Phase 1 originally shipped an invented catalog
  that diverged from Jeff's files in 23 of 29 tasks (AI_ERROR_LOG **E-075**); four tests
  now make that impossible to repeat.
- **Actuals capture** is one HTMX panel on `invoices/<id>`, pre-filled, under a minute.
  Not a time-tracking system.
- **Calibration starts at 1.0 everywhere.** Money history exists (~26 jobs via finrecon);
  per-task hours history does not.
- **Ships dark behind `FEATURE_LEARNING_ESTIMATOR`**, zero behavior change when off.
- **No seventh step.** Estimator lives in the Estimate step, actuals in the Invoice step.

### The algorithm, as built

Ratio per observation, dividing by the **pre-calibration** estimate so factors never
compound on themselves:

```
ratio      = actual_hours / (baseline_hours × modifier_product)
weight     = alpha × (n / (n + k)) × observation_weight     # alpha 0.25, k 5
new_factor = (1 - weight) × old_factor + weight × clamped_ratio
```

Guards, all on: ratio clamp `[0.4, 2.5]`; factor clamp `[0.6, 1.8]` with an `at_clamp`
review flag; 2-sample minimum before any deviation from 1.0; `scope_changed` /
`hidden_damage` / `client_delay` excluded (still queryable); untemplated rows excluded.

Two half weights that **stack**: observations older than 18 months, and
`source=reconstructed`. A stale reconstructed row pulls at a quarter.

**Rollup**, under 3 samples on a task key — `w_trade = k/(n+k)`, Jeff's call 2026-08-12
over spec §4's literal "at the shrinkage weight", which vanishes exactly when it is most
needed. Consequences, both tested rather than left implicit:

* At `n = 0` the weight is **1.0** — an unmeasured task key inherits its trade's factor
  outright.
* `recalibrate` therefore walks **every active template**, not only logged ones. Two
  logged deck-board jobs move all four deck tasks to 1.033.
* A trade with fewer than 2 observations is never borrowed from; the trade factor always
  excludes the task's own logs.

**The factor is always a full replay from 1.0**, never a nudge to the stored value, so
incremental and rebuild-from-empty are one code path. The spec's
incremental-equals-rebuild requirement is therefore true by construction; the test that
checks it is confirmation, not proof.

---

## 5. Dev database

Reset and reseeded 2026-08-11, verified again 2026-08-12:

| | |
|---|---|
| Account | 1 — "Odd Jobs Handyman Services" |
| Login | `demo` (original password hash preserved through the reset) |
| Price book | 6 items |
| Task templates / modifiers | **29 / 10** — match the CSVs key-for-key, zero stale keys |
| Calibration factors | 29, **all at 1.000** |
| Customers, projects, estimates, proposals, invoices, actuals | **0** |

There is no job data. Anything demo-able has to be seeded first.

---

## 6. Blocked on Jeff — three decisions

### 6.1 The reconstructed hours cannot land — `confirmed_client` is empty

`docs/specs/reconstructed_hours_per_site.csv` (untracked): **54 rows, 473.9 on-site
hours**, columns `site, known_label, first_visit, last_visit, visit_days, onsite_hours,
hrs_per_day, client_match_candidates, confirmed_client`. **`confirmed_client` is empty on
all 54 rows**, so `import_reconstructed_hours` imports nothing:

```
reconstructed_hours_per_site.csv: 54 rows, 0 imported.
  skipped, unconfirmed: 54
```

That is correct behavior, not a stub. The command never resolves a customer from
`client_match_candidates` — those are weighted fuzzy guesses, and turning a guess into a
stored fact is exactly E-075. **Filling that one column is all that stands between the
file and 473.9 hours of history.** `client_match_candidates` plus finrecon's ~26 jobs
should auto-propose a good share, turning recall into review — unverified, and per the
Purcell workspace `CLAUDE.md` finrecon's older totals are superseded, so check the current
source of truth first.

**And a deeper gap sits behind it.** Spec §0.4 calls this data "coarse, **job-level**
calibration evidence," but §4's algorithm is per-task end to end and `CalibrationFactor`
is FK'd to `task_template`. There is no job-level factor and no consumer for untemplated
rows. Imported rows land with `task_template=NULL`, `variance.py` reports them
`Exclusion.UNTEMPLATED`, and calibration skips every one. The half-weight path for
`source=reconstructed` is built and tested — and **no data currently reaches it.**

Three options, cheapest first: **(a)** accept it — reconstructed rows are §5 reporting
evidence only, and §4's half-weight sentence is struck as dead text; **(b)** add a
trade-level or account-level factor those rows can feed, which the rollup already
half-implies; **(c)** attribute all 54 sites down to tasks by hand — far more work than
the customer mapping and probably not worth it.

### 6.2 Phase 6b — how much UI?

`estimate_job` has no caller outside tests. For the estimator to reach a customer it needs
a way in from the estimate builder, and its P50/P80 + unknowns need somewhere to render on
the proposal. Spec §11 says not to build UI beyond the close-out form and estimate flow
unless asked, so this needs a scope decision. Phase 6 must also reconcile versioned
estimator drafts with the builder's single-draft assumption (`_draft_estimate_for`, noted
in `core/estimator.py`).

### 6.3 Phase 5 was skipped — nothing reads the review signals

`explain_estimate`, `get_calibration_report`, drift and low-sample flags were never built.
Consequence today: `at_clamp` and the `rule: "rollup"` history entries are written and
have **no reader**. A factor pinned at a clamp is meant to be a review signal that the
baseline is wrong, and nothing surfaces it.

---

## 7. Other open items

1. **`seed_estimator` has no prune.** It upserts by key and never deletes, so a renamed or
   dropped CSV key leaves the old row behind in any DB that already has it. Harmless today.
   If you add `--prune`: `CalibrationFactor` cascades and `ActualLog.task_template` is
   `SET_NULL`, so pruning a template with logged actuals silently demotes that history to
   untemplated. Refuse to prune templates that have `ActualLog` rows.
2. **`recalibrate(account)` runs on every close-out** and walks all 29 templates,
   re-deriving variance per log. Trivial at Jeff's volume and it keeps one code path, but
   it is O(templates × logs) per submission — narrow it long before it sees thousands of
   rows.
3. **`ActualLog` has no estimate FK.** Variance infers the estimate: the project's
   invoiced estimate first, else its newest. Two invoiced estimates on one project makes
   that a guess. An `ActualLog.estimate` FK would settle it.
4. **Uncommitted working-tree changes**, not this session's and not reviewed: `.gitignore`,
   `config/settings.py` (`ALLOWED_HOSTS` from env), a one-line edit to
   `docs/specs/learning-estimator.md`, plus untracked `.claude/`, `.env.square.example`,
   and `docs/specs/reconstructed_hours_per_site.csv`. **The reconstructed CSV should
   probably be tracked** — it is referenced by a shipped command.
5. **The spec still carries three factual errors this file corrects — it is where they
   came from.** `docs/specs/learning-estimator.md` §0.1 says SQLite **(WAL)** (it is
   `delete`), says **"Square (Stripe also present)"** (there is no Stripe), and its Phase 1
   paragraph says `estimate_modifiers_seed.csv` holds **11 modifiers** (it holds **10**).
   Correcting the spec would close the loop; until then, see the rule at the top of this
   file.

---

## 8. Verify before starting

- [ ] `make check` green on a clean `nightly` checkout — expect **296 passed**.
- [ ] `git log --oneline -12` — confirm §4's phase table against real commits rather than
      trusting the table. This document has been wrong before; the log has not.
- [ ] `docs/specs/task_templates_seed.csv` (29 rows) and `estimate_modifiers_seed.csv`
      (10 rows) present and tracked. If missing, **stop and ask** — never generate
      substitutes.
- [ ] Only one estimator spec in `docs/specs/`. An earlier RC draft (with a `RateConfig`
      object and a different phase order) is superseded by v1.2 — delete it if present.
- [ ] `handled-claude-code-handoff-RC.md` (2026-08-11) is **superseded by this file** and
      wrong in six places. **Two copies confirmed in `~/Downloads` on 2026-08-23** —
      `handled-claude-code-handoff-RC.md` and `handled-claude-code-handoff-RC_1.md`. Left
      in place: deleting files outside the repo is Jeff's call, not a session's. If either
      is opened as context, it will restate the six wrong facts.

---

## 9. Brand and customer-facing output

Relevant when anything renders to a proposal, invoice, or PDF.

**Handled brand direction:** *Field Ledger / Local Pro Hybrid.* App = dark command-board.
Customer docs = clean Ledger Blue on Paper. Never hide the margin/pricing story.

- Colors: blacktop `#080B0E`, graphite `#111820`, steel `#26313C`, ledger-blue `#2563EB`,
  hi-vis `#D7FF2F` (sparingly — CTAs/done/paid/margin), workwear-clay `#B56A3C`
  (sparingly), paper `#F6F2E8`, success `#17A56B`, warning `#FFB000`, error `#D3483D`
- Type: Sora ExtraBold (display/wordmark), Inter (UI/body), Space Grotesk (labels/metrics)
- Wordmark: **Handled.** — the period is final. No tool or house clip-art.

**Business identity block on customer documents:**
> Odd Jobs — Handyman Services · Portland Metro · jeff@odd-jobs.org · 503-880-7433 · CCB #252070

⚠️ Supersedes the older Odd Jobs brand kit (Hanley Pro / Montserrat / `#F7BF42`) for
anything Handled generates. Odd Jobs remains the *business identity* on documents; Handled
is the *product brand*.

**Existing document templates** (Cowork artifact gallery, over the Notion backend —
reference for layout, not code to import): `handled-proposal-template` v1.1,
`handled-invoice-template` v1.1.

⚠️ **This section is carried forward unverified.** It is Jeff's design content, not
something in the repo, and nobody has checked it against the current artifacts. Confirm
before it drives a customer-facing render.

---

## 10. How to start a session

```
Read docs/HANDOFF.md and docs/specs/learning-estimator.md.
Verify §8 against the repo, report anything that doesn't match, then pick up at
the phase §4 says is next. Stop at the phase boundary.
```

---

## 11. Standing expectations

- Every phase ends with: passing `make check`, a one-paragraph summary, and a **stop**.
- **Verify phase status before building.** This document is a snapshot; `git log` is the
  truth. The RC this replaces sent a session to rebuild two finished phases.
- **Prefer a stated assumption over a silent guess, and a question over both** when the
  guess would change Jeff's hours or money. Two spec ambiguities in this module were
  resolved by asking (the rollup weight, the reconstructed import); both would have been
  wrong if guessed.
- No new runtime dependencies without asking. No ML libraries, cloud services, or queues.
- The math must be explainable to a customer standing in a driveway. Every number traces
  to a rule or a data point.
- Don't refactor unrelated parts of Handled.
- If you're writing a fourth abstraction layer, stop and ask.
- **`~/ClaudeBox/AI_ERROR_LOG.md` is binding.** Any run that catches an AI giving Jeff
  false data appends an entry. Append-only; log your own errors too.

---

## 12. Change log

| Date | Change |
|---|---|
| 2026-08-23 | Re-verified against the repo after 11 idle days. No code moved (last commit still `e9ecc4a`, 2026-08-12); `make check` still **296 passed**; dev DB, seed CSVs and calibration constants all unchanged. Corrected a stale commit count and test-module count, and recorded that the superseded RC now has **two** copies in `~/Downloads`. |
| 2026-08-12 | Rewritten as present-state. Phases 4a, 4b, 6a landed; verified every §2 and §5 fact against the repo. Recorded that `estimate_job` has no caller outside tests. |
| 2026-08-12 | Phase 3b built (`5ba2e1e`) — import hook ships working and imports 0 rows. |
| 2026-08-11 | Dev DB reset and reseeded to Jeff's CSVs. Phase 3a landed. |
| 2026-08-11 | Created, replacing `handled-claude-code-handoff-RC.md`, which reported Phase 1 as pending with Phases 1–2 committed, called shipped weekend 2× a gap, miscounted the modifier seed, and claimed WAL, Stripe and an empty dev DB. See AI_ERROR_LOG **E-075 / E-076 / E-077**. |

*Odd Jobs — Handled · Claude Code Handoff · present state verified 2026-08-23*
