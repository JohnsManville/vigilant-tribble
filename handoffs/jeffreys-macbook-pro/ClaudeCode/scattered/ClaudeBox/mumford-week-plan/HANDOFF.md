# Mumford Week Plan, handoff to MacBook Pro

**Date:** 7/23/2026
**Live site:** https://mumford-week-plan.pages.dev
**Project on disk:** `~/ClaudeBox/mumford-week-plan` (Cloudflare Pages, deploy with `./deploy.sh`)
**Cloudflare account:** Jeff Mumford (`2edd47bf2763908b1a88267ecdea8b93`)

This package hands the in-flight work from the Mac mini to the MBP. It contains the changed source (matching what's live), the auto-fill generator that isn't wired in yet, the balance preview, and this doc.

---

## How to pick up on the MBP

1. Put this project on the MBP if it isn't already: `git clone` your repo, or copy `~/ClaudeBox/mumford-week-plan` over. Make sure `npx wrangler` is logged in to the Jeff Mumford Cloudflare account (`npx wrangler whoami`).
2. Copy the files from `updated-files/` in this package over the matching paths in the project. They already match the live site, so this only matters if the MBP copy is behind.
3. Deploy is one command: `cd ~/ClaudeBox/mumford-week-plan && ./deploy.sh` (checks for em-dashes, pushes, verifies).

---

## What is LIVE right now (deployed, working)

**Standing Schedule** (Schedule tab)
- Recurring default week that repeats once **both** parents sign it. Signature = name + timestamp, logged, immutable. Takes both to activate.
- Seeded with the summer grid (through 9/7): the 7x5 grid (Morning/Dropoff, Midday, Pickup, Evening, Overnight), footnotes filled from Laura's packet, plus **Date Night** (movable; childcare decided week to week; tracked as its own separate time) and **M4** (every Sunday, all four; shared time).
- Backend: `functions/api/schedule.js`, KV key `standing`. GET returns `{who, schedule}`; POST `{action:"sign"|"reset", schedule?}`.
- **To activate:** each parent signs in and taps "Sign as ..." on the Schedule tab.

**Decisions** (was the Changes tab)
- Open decisions + change proposals merged into one list. Four actions per item: **Yes** (accept), **No** (decline), **Counter-propose**, **Need more info**.
- "Need more info" holds the item open and pings the other person for a clarification, then returns it to where it was.
- Optional **deadline** per item: due-soon / due-today / OVERDUE badges, sorted by urgency, with an escalating banner on the Now tab.
- Backend: `functions/api/proposals.js` (create, GET list) + `functions/api/respond.js` (accept/decline/counter/need_info/clarify/withdraw/apply), KV key `proposals`. IDs are UUIDs (collision-safe).
- **Tested:** 81/81 unit checks green across every action + guards + a 60-item churn.

Both were deployed from the Mac mini. The source in `updated-files/` matches what's live.

---

## Decisions locked in (so far)

- **Signatures:** on-the-record approval (name + timestamp), not a legal e-signature. PDF export was considered and declined for now.
- **M4:** shared time, neutral in the balance. Every Sunday (the default Sunday).
- **Date Night:** movable, set each week; childcare decided week to week; tracked as its own separate bucket (not childcare-for-a-parent, not either parent's time).
- **Supervised care:** M-F daytime (school / daycare / camp / Nancy) is supervised care, ~40h/week, held separate from the parent split.
- **Reminders:** in-app (badges + banner) shipped. Calendar-feed alerts and text/email push are still TODO.

---

## Weekly auto-fill: WIRED IN 7/23/2026 (was: built but not wired in)

The generator that turns the signed grid into a week's custody math is in `pending/genweek.mjs`. It is tested and produces the balance shown in `pending/Default-Week-Computed-Preview.html`. It is now wired in: the generator lives in `index.html`, published weeks go through `functions/api/plan.js` (KV key `plan`), and the render path re-renders from the generated week when the hardcoded week is over. The mapping rules below were signed off by Jeff on 7/23/2026.

**Computed default week:** Jeff **31h**, Laura **97h**, Supervised care **40h** (total 168h). Of parent-only hours: Jeff 24% / Laura 76%.

**Mapping rules the generator uses (need Jeff's OK before integration):**
- Slot lengths: Morning 1h, Midday 7h, Pickup 2h, Evening 3h, Overnight 11h (= 24h/day).
- Supervised care (Camp / Nancy / school / daycare) = neutral, set aside from the parent split.
- Overnight by location: Malcolm counts to Laura, Aldercrest to Jeff. (Footnote 4: Mon/Thu Malcolm is Jeff's option; if he takes those two nights, ~22h shifts to Jeff: Jeff 53h / Laura 75h.)
- Saturday "Handoff by 8pm" evening counted to Jeff.
- Weekend pickups (dash) carry to that day's evening parent.
- M4 (shared) and Date Night (separate) are overlays not yet in the hours; they layer on once their times are set.

**Integration work remaining (the real lift):**
The whole app renders from a single hardcoded `PLAN` object in `index.html` (currently the 7/16-7/22 week). To make weeks auto-generate:
1. Add a `plan` KV key + a `functions/api/plan.js` (GET/POST) to store a generated week.
2. On load, fetch the current week's plan; fall back to the hardcoded `PLAN` if none.
3. Wrap the existing render calls (Now, Calendar, Agenda, Time Balance) so they run after the fetch instead of at parse time.
4. A "Generate this week from the default" action (Schedule tab) that runs the generator, previews, and saves.
This is a real refactor of the render path; do it behind a fallback and test against the live login before shipping.

---

## Other TODO (open threads) — status as of 2026-07-23

1. ~~Wire auto-fill live~~ DONE (3bf7d97, deployed). **Mapping rules SIGNED OFF by Jeff 2026-07-23.**
2. ~~Calendar-feed deadline alerts~~ DONE (b20c7fe: dynamic .ics with auto-fill weeks + deadline alerts, deployed).
3. ~~Update the Scriptable widget~~ DONE (5f6acb8: supervised-care state, KV-served current week, deployed).
4. ~~Update the read-me (guide.html)~~ DONE (5f6acb8, deployed).
5. ~~Fill Date Night + M4 times~~ DONE (062334b: Wednesdays + all-day Sunday, with overlays).

All handoff threads closed 2026-07-23.

---

## File map

```
updated-files/                         # matches the live site
  public/index.html                    # the app (Schedule tab, Decisions merge, deadlines)
  functions/api/schedule.js            # standing schedule (KV: standing)
  functions/api/proposals.js           # decisions create + list (KV: proposals)
  functions/api/respond.js             # decisions responses (all 6 actions)
  README.md                            # updated feature + architecture notes
pending/
  genweek.mjs                          # auto-fill generator (node-testable, not wired in)
  Default-Week-Computed-Preview.html   # the computed default-week balance
HANDOFF.md                             # this file
```

Deploy secrets (`PASS_JEFF`, `PASS_LAURA`, `AUTH_SECRET`) live as Cloudflare Pages secrets, not in these files.
