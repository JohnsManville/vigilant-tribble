# HANDOFF — Learning Estimator Module

**To:** Claude Code build session, `~/ClaudeBox/handoff-clone`
**From:** Cowork planning session (Jeff + Claude), 2026-08-23
**Read this, then read `docs/specs/learning-estimator.md`, then start at Phase 1.**

---

## Current state — what's already done

**Planning/recon is COMPLETE. Do not repeat it.** The spec (`docs/specs/learning-estimator.md`, v1.2) was verified line-by-line against this repo on 2026-08-05: models, `core/pricing.py`, views/urls, CLAUDE.md rules. Its §0.1 repo facts and §0.2 binding decisions are authoritative. Appendix B is the verification log.

**No code for this module exists yet.** Nothing in `core/` has been touched. The four files below were placed in `docs/specs/` from the planning session — they are inputs, not build output:

| File | What it is |
|---|---|
| `learning-estimator.md` | The build spec (v1.2). Phases 1–6, stop at each boundary. |
| `task_templates_seed.csv` | 29 task templates with Jeff's baseline hours, spreads, rate classes. Phase 1 seed. Use these numbers verbatim — do not invent baselines. |
| `estimate_modifiers_seed.csv` | 11 context modifiers. Phase 1 seed. |
| `reconstructed_hours_per_site.csv` | ~474 on-site hours reconstructed from Jeff's Google Timeline (2024–2026), 54 sites. Phase 3 import input for `source=reconstructed` ActualLogs (half-weight in learning, per spec §4). Rows with empty `confirmed_client` are NOT importable yet — Jeff fills those; import only confirmed rows. |

**Dev DB is empty (0 rows).** Whatever you demo needs seeding.

## Key decisions already made (binding — argue in a question, not in code)

1. Reuse `core/pricing.py` + `PriceBookItem` for ALL rate math. No `RateConfig`, no duplicated totals — feed lines through `summarize_line_items()`. Snapshot pricing inputs + calibration factors onto the estimate as JSON.
2. Extend existing `Estimate`/`EstimateLineItem`; new models (`TaskTemplate`, `EstimateModifier`, `ActualLog`, `CalibrationFactor`) all extend `AccountScopedModel`.
3. Actuals capture is Phase 1 and it is the whole ballgame: a pre-filled HTMX "Log actuals" panel on the invoice detail page (shown when PAID or balance sent), completable in under a minute. Invoices flip PAID via the Square webhook — there is no close-out button to hook.
4. Rate classes are `PriceBookItem.Kind` values. Calibration starts at 1.0 everywhere.
5. Weekend 2× is a business rule but is NOT in `pricing.py` today — if needed, add it there test-first as its own change.

## Repo workflow (from CLAUDE.md — non-negotiable)

Commit to `nightly` only. `make check` (ruff + migrations check + pytest) green before every commit. No raw SQL / nothing SQLite-specific. Test-first on anything touching money. Tenant-scope every query via `.for_account(account)`. Notion "Handled" page is context only — zero coupling. Feature-flag the module (`FEATURE_LEARNING_ESTIMATOR`); zero behavior change when off.

## Process

Work one phase at a time. At each phase boundary: passing `make check`, a one-paragraph summary, then STOP and wait for Jeff's go-ahead. If anything in the repo contradicts the spec, flag it before writing code around it. End work summaries with a confidence index 0–100 (house style).

## Open items on Jeff's side (don't block on these)

* Sanity-check of baseline hours in `task_templates_seed.csv` (they're calibrated judgment, not gospel — the module self-corrects anyway).
* Filling `confirmed_client` on unlabeled sites in `reconstructed_hours_per_site.csv` before the Phase 3 import runs.

*Odd Jobs — Handled · Learning Estimator · Handoff RC*
