# Handled / Learning Estimator — present state & handoff

**Written 2026-08-23 04:47 PDT · Mini (`jeffmumfordmacmini`) · every figure below measured
at that timestamp, not inherited from a prior document.**

> **This is a status + thread handoff, not a build handoff.** The build handoff is
> `~/ClaudeBox/handoff-clone/docs/HANDOFF.md`, it is accurate, and it is the file a new
> Claude Code session should read first. Do not duplicate it here — per `CLAUDE.md`, one
> living doc per topic. This file records what that doc cannot: that the work is dormant,
> which thread owns it, and what is still blocked.

---

## 1. One-line state

**The learning estimator is built and live behind its flag, green at 296 tests, and has
not been touched in 11 days.** It is not broken and not half-finished — it is parked, with
two known gaps (Phase 5 skipped, Phase 6b unbuilt) and one real-world blocker that only
Jeff can clear.

---

## 2. Repo — `~/ClaudeBox/handoff-clone`

| | |
|---|---|
| HEAD | `e9ecc4a` — *feat(estimator): close the learning loop at close-out (Phase 6a)* |
| Committed | **2026-08-12 00:53** — **11 days ago** |
| Branch | `nightly`, **0 unpushed**, **56 commits ahead of `main`** |
| Gate | `make check` **green — 296 passed** (ruff clean, no pending migrations) |
| Dev DB | 1 account, 1 userprofile, 29 task templates, 29 calibration factors, 10 modifiers, 6 price-book items. **No customers, projects, estimates, invoices, or actuals** — seed a flow before demoing one. |
| Commands | `seed_pricebook`, `seed_estimator`, `import_reconstructed_hours` |

**Uncommitted in the working tree, unchanged for 11 days** (someone's in-flight work, never
reviewed): `.gitignore`, `config/settings.py` (`ALLOWED_HOSTS` from env), a one-line edit to
`docs/specs/learning-estimator.md`. Untracked: `.claude/`, `.env.square.example`,
`docs/specs/reconstructed_hours_per_site.csv`.

**`main` is 56 commits behind `nightly`.** Every phase of this module lives on `nightly`
only. Merging is Jeff's call and has never been made.

---

## 3. Phase state

Verified against both the commit log and `docs/HANDOFF.md` — they agree.

| Phase | State |
|---|---|
| 0 Recon · 1 Models+actuals · 2 Deterministic estimator | ✅ Done |
| 3a Variance + outcome-flag exclusions | ✅ Done — `core/variance.py`, 24 tests |
| 3b `import_reconstructed_hours` | ✅ Built — **imports 0 rows today.** See §4. |
| 4a Update rule + guards + `recalibrate` | ✅ Done — `core/calibration.py`, 25 synthetic tests |
| 4b Rollup fallback `k/(n+k)` | ✅ Done — per Jeff 2026-08-12, 11 tests |
| **5 Explainability + calibration reporting** | ⚠️ **Skipped over — not done** |
| 6a Close the loop at close-out | ✅ Done — 9 end-to-end tests. **The module is no longer dark.** |
| **6b Estimator UI in builder + proposal** | ⏸️ **Not built** — needs Jeff's go-ahead on UI scope |

---

## 4. The three things that need Jeff

**1. The site→customer mapping — this is the real blocker.**
`docs/specs/reconstructed_hours_per_site.csv` holds **54 rows / 473.9 on-site hours** of
Timeline-derived history. `import_reconstructed_hours` is built and tested against it and
**imports zero rows**, because `confirmed_client` is empty on all 54 and the file is keyed
per *site*, not per *task*. `ActualLog` needs a project and a task template; neither is
derivable. The column `client_match_candidates` already carries fuzzy guesses
(`john phillips (15.0); jimmy lindsay (6.12); …`) — Jeff has to confirm them. Until he does,
the estimator has **no historical calibration evidence at all** and every factor sits at 1.0.
A pre-filled worksheet ranked by hours would make this ~20 minutes rather than an afternoon.
**Do not invent a mapping** — that is the E-075 failure mode exactly.

**2. Phase 5 was skipped while the loop went live.** Phase 6a wired calibration into
close-out, so logged actuals now move factors and the next estimate uses them. Phase 5 —
`explain_estimate`, `get_calibration_report`, drift and low-sample flags — was jumped over.
So the numbers move and **there is currently no built-in way to see why.** The spec's
standing rule is that the math must be explainable to a customer standing in a driveway.
Right now it isn't. Decide whether to backfill 5 before touching 6b.

**3. Phase 6b scope.** Estimator UI in the estimate builder and proposal output. Unbuilt,
deliberately, pending Jeff's call on how much UI he wants.

---

## 5. The spec is still wrong — three lines, still unfixed

`docs/specs/learning-estimator.md` is the file `docs/HANDOFF.md` §5 sends every new session
to, and it **still carries the errors that started this whole cascade**. Measured 2026-08-23:

| Line | Says | Truth |
|---|---|---|
| 17 | `SQLite (WAL)` | `journal_mode=delete` |
| 19 | `Payments: Square (Stripe also present)` | No Stripe code, no Stripe dependency |
| 186 | `estimate_modifiers_seed.csv` (**11 modifiers**) | the CSV holds **10** |

These are the source of the bad RC handoff that sent a session to rebuild two finished
phases (AI_ERROR_LOG **E-077**). `docs/HANDOFF.md` §6.5 already documents the workaround —
*handoff beats spec on repo facts, repo beats both* — but the spec itself has never been
corrected. **Three line edits. No tests involved. Highest value-per-minute item on this
list.** This closes the item E-085 left explicitly unmeasured.

---

## 6. Which thread owns this

Three Claude Code sessions worked this one build, none aware of the others.

| Thread | Last active | Verdict |
|---|---|---|
| **Handled AI Estimator Build** `local_fec01e5e` | 2026-08-12 07:53Z | **Resume this one.** Opus 5, effort high. Built 3a→6a; its transcript holds the reasoning behind the `k/(n+k)` choice and the Phase 5 skip. Stopped, not lost. |
| **Learning Estimator module** `local_1467b311` | 2026-08-12 07:15Z | Superseded duplicate. Wrote the original `docs/HANDOFF.md`. **Archive it.** |
| The session that wrote *this* file | 2026-08-11 → 2026-08-23 | **Stray — close it.** See §7. |

---

## 7. Read this before trusting anything a session tells you about this repo

The session that wrote this file spent 2026-08-11 auditing a handoff doc that claimed
Phase 1 was next when Phases 1–2 were already committed (**E-077**). It then went dormant
and was resumed twice. Inside one unbroken conversation, `date` returned **Aug 11 15:31**,
then **Aug 13 22:27**, then **Aug 23 04:45** — the box clock NTP-accurate to 0.027s the
whole time. On the Aug-13 resume it answered "what are my next steps" from Aug-11 state and
told Jeff to *commit right now, the window is open* when the work had already been committed
and the build had advanced five phases (**E-085**).

**So: the recurring failure on this box is not bad analysis, it is stale analysis.** Four
separate ledger entries — E-072, E-077, E-080, E-083 — are all a document confidently
reporting a state that had already moved. E-085 is the same disease with the document
removed: the *session* was the stale handoff.

**The guard, and it is cheap:** any session resuming after a gap re-reads `date` and
`git log` **before** it answers, not after. If a session's first act in a turn is advice
rather than measurement, that is the smell. That guard is what caught the Aug-13→Aug-23
jump while writing this file.

**Corollary for the error log:** `AI_ERROR_LOG.md` is concurrently written. Read the max ID
in the same breath as the append — two sessions collided on E-077/E-078 on 8/11 (**E-082**).
It stands at **E-093** as of 2026-08-22 23:02.

---

## 8. If you are picking this up cold

```
cd ~/ClaudeBox/handoff-clone && claude
```

Then, in this order:

1. `date` and `git log --oneline -6`. If HEAD is not `e9ecc4a`, **this file is stale** —
   trust the repo and say so.
2. Read `docs/HANDOFF.md` — the build handoff, and it is good.
3. `make check` — expect **296 passed**. Anything else, stop and report.
4. Fix the three spec lines in §5. Small, safe, and it stops the bleeding.
5. Then ask Jeff which of §4's three decisions he wants to make. **Do not start 6b, and do
   not invent a site→customer mapping.**

Every phase still ends the same way: passing `make check`, a one-paragraph summary, and a
**stop**. Do not chain phases — chaining is how Phase 5 got skipped.

---

*Odd Jobs — Handled · status handoff · measured against the repo 2026-08-23 04:47 PDT*
