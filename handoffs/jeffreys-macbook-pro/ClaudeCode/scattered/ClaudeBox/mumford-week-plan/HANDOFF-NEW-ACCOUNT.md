# Mumford Week Plan — handoff to a new Claude account

**Date:** 2026-08-06
**Live site:** https://mumford-week-plan.pages.dev
**GitHub (source of truth):** private repo `JohnsManville/mumford-week-plan` — push/pull, don't rsync
**Cloudflare account:** Jeff Mumford (`2edd47bf2763908b1a88267ecdea8b93`), Pages project `mumford-week-plan`
**Local copies:** `~/ClaudeBox/mumford-week-plan` on both the Mac mini (ClaudeBox) and the MacBook Pro, both tracking `origin/main`

This document briefs a fresh Claude session, on a new account with no memory of this project, on everything needed to pick it up. It accompanies `mumford-week-plan-handoff-20260806.zip`, a complete copy of the working tree including full git history.

---

## What this is

A private, login-protected co-parenting tool for Jeff and Laura Mumford: one page showing where the kids (John and Lucy) are now, the week's custody schedule, a running time balance, open decisions with deadlines, standing agreements, and agreed kid-facing scripts. It exists to reduce texting friction. Read `README.md` in the project for the full feature tour, and `guide.html` (served at `/guide.html`) for the user-facing read-me.

## Current state (as of this export)

- Working tree **clean**, latest commit `7c2e714` "Standing schedule v2 (new default week) + drag-to-paint grid editor", everything pushed to origin/main and deployed.
- **v2 is live and quiet.** Weekly auto-fill is wired in end to end: the signed Standing Schedule generates each week's plan (Schedule tab → "Generate this week from the default"), published weeks live server-side in KV, and all views (Now, Agenda, Calendar, Time Balance, calendar feed, widget) render from them.
- Standing Schedule is **ACTIVE in prod, signed by both parents**. Overlays: Date Night = Wednesdays (movable), M4 = Sundays all day (all four together, neutral time).
- Supervised care (school/daycare/camp/Nancy, ~40h/wk M–F daytime) is held neutral, outside either parent's balance.
- `CLOSEOUT-2026-07-23.md` was the last pickup note; `HANDOFF.md` and `MBP-SETUP.md` are historical records of the Mini→MBP handoff. This file supersedes all three.

## Architecture in one breath

Cloudflare Pages + Functions. `public/index.html` is the entire app (one file, renders from a `PLAN` object, with server-published weeks fetched at load). `functions/` holds the auth gate (`_middleware.js`, HMAC-signed 30-day cookie), login/logout, the decisions API (`api/proposals.js` + `api/respond.js`), the standing schedule API (`api/schedule.js`), published weeks (`api/plan.js`), and an unguessable no-login path `cal-34al27ofqqxfk05c/` serving the subscribable `.ics` feed, a JSON status endpoint, and the Scriptable widget script. Storage is one KV namespace, binding `PROPOSALS` (id `6a5526349b67455db3ecccacb1172311`), keys `proposals`, `standing`, `plan`.

## Secrets — read this

- Production secrets are **Cloudflare Pages secrets**, not in the repo: `PASS_JEFF`, `PASS_LAURA` (per-person login passwords) and `AUTH_SECRET` (cookie HMAC key).
- The zip includes `.dev.vars` (gitignored) carrying local-dev copies of those three values so `stress.sh`/local wrangler work. **Treat the zip as secret material.** If it ever travels anywhere untrusted, rotate:
  `printf '%s' 'new-value' | npx wrangler pages secret put PASS_LAURA --project-name=mumford-week-plan` (same for the others).

## Getting the new account operational

1. Unzip, or `git clone https://github.com/JohnsManville/mumford-week-plan.git` if the new environment has repo access (the zip's `.git` has full history either way — `git remote -v` already points at origin).
2. Auth wrangler to the Jeff Mumford Cloudflare account: `npx wrangler login`, confirm with `npx wrangler whoami`.
3. Deploy is one command: `./deploy.sh` — it blocks em-dashes, deploys `public/` with the KV binding from `wrangler.toml`, then self-verifies the status endpoint and login gate. Every Pages deployment is immutable with its own URL, so history can't be rewritten.
4. Version-bump discipline (from README): edit `PLAN` in `public/index.html` → keep `functions/cal-34al27ofqqxfk05c/status.js` in sync → deploy. Times are Pacific; `status.js` hardcodes the UTC offset (`-07:00` summer / `-08:00` winter).
5. `stress.sh` is the pre-release battery (81/81 checks on the decisions API); it self-provisions a fresh local KV.

## Open threads to check on pickup

1. **Weekly publish is still manual.** Each Monday-start week must be generated from the Schedule tab (or verified via `curl -s https://mumford-week-plan.pages.dev/cal-34al27ofqqxfk05c/status` — check `weekStartMs`). Automating this with a scheduled Function/cron is the obvious next build.
2. **Widget wording:** any phone still running the pre-7/23 Scriptable script needs `public/cal-34al27ofqqxfk05c/widget-week-plan.js` re-pasted once for the supervised-care wording.
3. **Decisions tab:** check nothing has expired unanswered (deadline alarms are in the calendar feed).
4. Summer standing grid is seeded **through 9/7** — a school-year default week will need to be drafted, proposed, and co-signed before then. The drag-to-paint grid editor (latest commit) exists for exactly this.

## Working agreements that shape changes

Signatures are on-the-record (name + timestamp), not legal e-signatures. Changes are logged verbatim, attributed, pending until the other parent accepts — nothing changes silently. M4 is neutral shared time; Date Night is its own bucket; supervised care never counts toward either parent. Keep the tone of the product neutral: visibility, not scorekeeping.
