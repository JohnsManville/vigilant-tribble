# Handoff — DGUTS '26 (for import into another session)

Project: **"DGUTS 26'"** (Cowork). Written 2026-08-01 by the cloud session. Self-contained: a fresh
session should be able to resume from this doc alone. Trip reference lives in project doc
`claude/raft-trip-reference-2025.md` — read that too.

> **STATUS (2026-08-01, latest):** Site is LIVE with Press page + all fixes. RSVP form fixed & verified.
> Job-claim Worker (api.campingteam.us) DEPLOYED & tested. **The ONE remaining action:** redeploy the
> site folder once so the live crew page picks up the new job board (see §6.3). Everything else is done.

## 1. What this work is
Jeff's annual raft trip, "Don't Give Up The Ship II" (DGUTS '26) — hosted by Jeff Mumford & Nigel
Vanderford. (Account/device owner: Jeff Mumford.) Two threads of work happened:
- **Original ask:** find last year's Google sign-up Form and update it for 2026. **STILL OPEN** —
  the Form itself was never edited (see §6).
- **What actually got built this session:** a full rebuild of the trip website **campingteam.us**,
  a newspaper-style announcement **email**, and a satirical **Press** page. All done; only the
  final publish step remains (manual — see §4).

## 2. The build (campingteam.us) — DONE, lives in these places
Static site, plain HTML + one stylesheet + images, no framework/runtime.
- **Cloud workspace (ephemeral):** `/home/claude/campingteam-site/` and `campingteam-site.zip`.
- **User's Mac (durable):** `~/Downloads/campingteam-site/` (unzipped, current) and `campingteam-site.zip`.
- **Delivered in chat + Cowork artifacts:** landing preview, press preview, newspaper email.

Pages (all share `styles.css`; nav on every page: Home · Who's Coming · Costs · FAQ · Press · RSVP):
- `index.html` — landing. Featured as **DGUTS '26** (hero placard + eyebrow + title). Sections:
  origin story, river briefing, the Slate (5-day itinerary), Scouting Report (rapids), Season I
  Highlights (9 real photos + flag photo), Equipment Check.
- `crew.html` — roster of 10 (2 hosts + 8 guests), locked-in jobs, unclaimed jobs.
- `costs.html` — ~$250–350/family breakdown, Venmo-pool flow, permit/vendor/flow-data links.
- `faq.html` — 8 FAQs (verbatim from the live site).
- `press.html` — **"The Deschutes Dispatch"** newspaper: the real announcement + satirical articles
  praising hosts Jeff & Nigel and good-naturedly roasting **Jake Stevens** (clearly labeled fiction).
- `images/` — 10 real trip photos (flag, raft, deckhand, crawdaddy, campkitchen, steak, vanroof,
  campnight, uboat, ramp), EXIF-rotated.

### Proofing pass already applied (don't re-flag these):
- Rapids reconciled to **Wapinitia → Oak Springs camp**; dropped "Elevator" (it sat below camp);
  fixed the Sandy Beach/Sherars line.
- Flow-gauge link relabeled "USGS flow — Madras gauge" (it's the upstream reference, not the Maupin
  stretch — a better gauge could still be swapped in).
- Stale "Due Aug 1" job → "After RSVP". Mileage stat 10.5 → 8.3 (put-in to camp).
- "Additional rafting day" → "Second guided run" (removes contradiction with the two-run itinerary).
- Deschutes River Adventures link → raftdra.com (no redirect). River Trails link verified correct.
- **RSVP deadline = August 7** on every page + the email. (Calendar verified: Aug 12–16 2026 = Wed–Sun.)

## 3. Newspaper email — DONE (not sent)
`/home/claude/DGUTS26-newspaper-email.html` — "The Deschutes Dispatch," email-client-safe (table
layout, inline styles, Georgia serif): headline "'Don't Give Up The Ship' Returns For Second Voyage,"
Ship's Orders box, RSVP-by-Aug-7 CTA, Slate/Classifieds/Weather/Obituaries. **Not sent** — Gmail is
not connected. To send: connect Gmail and draft to the crew, or user pastes it into Gmail.

## 4. DEPLOY — the only remaining step (MANUAL; sandbox cannot push)
Site is hosted on **Cloudflare Pages**, project **`dont-give-up-the-ship`** (Direct Upload, no Git).
- Account ID: `2edd47bf2763908b1a88267ecdea8b93` · Zone ID: `38d82fab1bd798f704d850128dcf9ac8`
- Domains: campingteam.us + dont-give-up-the-ship.pages.dev · Production branch: main
- **Upload page URL:** https://dash.cloudflare.com/2edd47bf2763908b1a88267ecdea8b93/pages/view/dont-give-up-the-ship/deployments/new
- **To publish:** open that URL (user is logged in) → drag `~/Downloads/campingteam-site` folder into
  the box → Save and Deploy → ~1 min → verify at campingteam.us/press.
- Deployment history seen 2026-08-01: latest `5de3487f` (~15:40), earlier `a1ccc0f3` (15:43 was a
  manual test), etc. Confirm the LATEST build (with press.html) is the one live.

### Why no session can push from the cloud sandbox (all verified):
npm registry blocked (403); pip blocked (blake3 unavailable); api.cloudflare.com unreachable from
container (curl→000); Claude Chrome extension NOT connected; the device-bridge Chrome control
(`mcp__remote-devices__Control_Chrome__*`) can run authenticated same-origin JS on dash.cloudflare.com
but CANNOT set file inputs and CANNOT compute the blake3 asset hashes Pages Direct Upload requires.
**Unblock for a future session to deploy directly:** (a) connect the Claude Chrome extension, or
(b) re-run the task "on your computer" (Wrangler runs locally there), or (c) get a network path to
Cloudflare's API + a token. Otherwise it's the manual drag.

## 5. Key trip facts (source of truth for any edits)
- Don't Give Up The Ship II · **Aug 12–16, 2026** (Wed–Sun) · Oak Springs camp, Maupin, Oregon.
- Deschutes River; put-in Wapinitia → camp at Oak Springs. Hosts **Jeff & Nigel**. Est. 2025.
- **RSVP deadline: August 7.** Cost ~$250–350/family via Venmo pool.
- **Sign-up form (respondent link):** https://forms.gle/26uXuPKinVcea2m68
- Roster (10): hosts Jeff Mumford, Nigel Vanderford; guests Alyssa, Audrey, Damir, Jimmy, Kathrine,
  Laura B, Milan, Molly.

## 6. STILL OPEN / next actions
1. **Deploy — DONE & VERIFIED (2026-08-01).** User deployed the final build; verified live via
   cache-busted campingteam.us and dont-give-up-the-ship.pages.dev: Press page + nav live, rapids
   reconciled (no Elevator, Wapinitia → Oak Springs Camp), 8.3-mi stat, Aug 7 deadline site-wide.
   Note: plain campingteam.us may serve stale cached HTML briefly; Cloudflare "Purge Everything" clears it.
2. **RSVP form — FIXED & VERIFIED LIVE (2026-08-01). Nothing left to do.**
   - Canonical form = **"Don't Give Up The Ship II — RSVP"**, linked by site + email via
     **forms.gle/26uXuPKinVcea2m68** (published id `1FAIpQLSdOFChk8TjlPcjdkjNz4ppxnLDCM8XavjsS_gG_5KZhw8F4kQ`).
   - **Real edit doc id: `1LpTrH0jQjhzNkyH5X-iWAIeZsyacm73MpYrhR7H1sIw`** — its Drive doc name is
     literally **"Untitled form"** (Jul 29), which is why searches by title missed it. Optional cleanup:
     rename the Drive doc to match the form title.
   - **Description updated via browser automation** (execCommand insertText on the contenteditable —
     this DID work, contrary to earlier caution): now reads "…RSVP by **August 7**. Details:
     **https://campingteam.us**" (was July 31 / odd-jobs.org). "All changes saved in Drive" observed;
     **verified on the live respondent view after reload.** Questions untouched (already 2026-correct).
   - **Duplicate RSVP forms in the account (none linked by the site; clean up if desired):**
     "Deschutes Raft/Camping Trip RSVP" (2026-08-01) and "2026 Deschutes Raft/Camping Trip RSVP" (May) —
     both are a separate jokey screening quiz ("Do you like fun?", says "August 13–17th" — wrong dates,
     ignore or fix if ever used); "RSVP" (2026-08-01) — untouched Google template; "Laura and Jeff's
     RSVP" (2015).
3. **Job board (added 2026-08-01): Worker DEPLOYED & TESTED. Only the site redeploy remains.**
   crew.html §03 is a live "Claim A Job" board (8 claimable slots incl. per-night dinner captains)
   fetching **https://api.campingteam.us/jobs** with Claim/Release buttons; graceful static fallback if
   API offline ("text Jeff to claim"). The newspaper email's Classifieds links to it too.
   - **Backend LIVE:** Cloudflare Worker **`dguts-jobs`** deployed by user via
     `~/Downloads/dguts-jobs-worker/deploy.sh` (wrangler 4.118). KV namespace id
     `6cb7c7a0b1414e018daf1d926021204c` (binding JOBS). Custom domain **api.campingteam.us** provisioned.
     Version d4198f50. **End-to-end tested:** GET /jobs → 8 jobs; POST /claim → 200; duplicate claim →
     409 with holder name; POST /release → 200; state left clean. CORS `*`.
   - **STILL TO DO — redeploy the site once** so the live crew page uses the API: drag
     `~/Downloads/campingteam-site` into the Pages upload page. (Current live crew.html is the old static
     version.) Source of truth for the worker = `~/Downloads/dguts-jobs-worker/` (also cloud
     `/home/claude/dguts-jobs-worker/`). Edit JOBS array in worker.js + re-run deploy.sh to change slots.
4. Optional: connect **Gmail** and send "The Deschutes Dispatch" to the crew.
5. Optional: better USGS gauge for the Maupin stretch on costs.html.

## 7. Cowork artifacts created (desktop, pinned)
- `dguts-26-landing` (home page preview) · `dguts-26-press` (Press page) ·
  `dguts-26-newspaper-email` (announcement email). Update in place via update_artifact.

## 8. Sources used this session
- iMessage group "Don't Give Up The Ship" (chat.db, 202 msgs Aug 2025) — mined for logistics.
- User-uploaded design bundle ("Camping Team.dc.html") — became the new landing page.
- Live campingteam.us pages (crew/costs/faq content).
- Prior handoffs in `~/Documents/HANDOFF-2026-07-30-DGUTS-RAFT.md` and `HANDOFF-2026-08-01-DGUTS-SITE.md`.
