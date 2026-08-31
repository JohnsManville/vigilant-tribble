# HANDOFF — Handled learning estimator (claude.ai chat, not Claude Code)

**Written 2026-08-23 · Mini · session `8c67e6c8`, reconstructed from the chat transcript**
**Source:** claude.ai chat *"Learning estimator tool for Handled project"*, project
**Handled**, last active 2026-08-23 12:46 UTC (05:46 PDT). 6 messages.

**This lane overlaps three Claude Code sessions** — `4e92d29e` (Learning Estimator module),
`bf418b62` (Handled Learning estimator dup?), `c0a60e22` (Handled AI Estimator Build) — all
working `handoff-clone`. Read their handoffs alongside this one; the chat is where the spec
was authored, the Code sessions are where it is being built.

---

## THE ORIGINAL IS STRANDED, BUT ALSO INLINE

The chat produced a handoff for `docs/HANDOFF.md` and, on the last turn, re-presented **the
full contents inline** because the file card had not rendered for Jeff. So unlike the
Fairmount one, this document's text is recoverable straight from the conversation without
a download. It still never reached the Mini.

## THE SPEC

- Lives at **`docs/specs/learning-estimator.md`**, currently **v1.2**, already in the
  project files.
- Session opener the chat prescribes: *"Read docs/HANDOFF.md and
  docs/specs/learning-estimator.md. Verify §5 of the handoff, report anything that doesn't
  match, then start at Phase 1. Stop at the phase boundary."*
- Phase 0 is recon only — it reports on the stack and asks questions before touching code.

**Four design commitments, stated as assumptions and worth not re-litigating:**

1. Handled is an existing repo with job/customer models in place. The spec reuses them
   rather than building parallel ones.
2. **Explainable math, not ML.** The learning is a shrunk exponentially-weighted average of
   actual ÷ estimated hours per task, clamped and guarded.
3. **The tool learns hours, never prices.** The rate card stays under Jeff's control. This
   is the load-bearing constraint — an estimator that learns prices would quietly rewrite
   the $128/$99/$149 structure.
4. Actuals are logged through the existing completion flow. No new time-tracking surface.

## TWO WARNINGS FROM THE CHAT, BOTH STILL LIVE

1. **An older RC prompt is stale and must be deleted if it is in the repo.** v1.2 supersedes
   it: v1.2 killed the `RateConfig` idea (pricing reuses `core/pricing.py`), resolved all
   three open questions, and reordered the phases to put actuals capture first. *Two
   competing specs in `docs/specs/` is how Claude Code ends up building the wrong one.*
2. **Weekend 2× is not in pricing.** The rate card says weekends bill at 2×; the chat flagged
   that this is missing from `core/pricing.py`. An estimator built on a pricing module that
   does not know about weekend rates will be confidently wrong on every weekend job.

## FIRST MOVES

1. `grep -r "RateConfig" ~/ClaudeBox/handoff-clone/docs/specs/` — if an RC-era spec is still
   there, delete it before any build session runs.
2. Confirm whether weekend 2× landed in `core/pricing.py`. If not, that precedes Phase 1.
3. Reconcile with `handoff-clone/docs/HANDOFF.md`, which Code session `4e92d29e` re-verified
   and committed today — the chat's version and the repo's version are two documents with
   the same name and may disagree.

**Standing orders:** no sends · append-only ledger, cite by date and title · confidence
index · voice law.
