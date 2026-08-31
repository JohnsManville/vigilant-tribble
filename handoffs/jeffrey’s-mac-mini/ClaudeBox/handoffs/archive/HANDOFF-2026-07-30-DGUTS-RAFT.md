# Handoff — 2026-07-30 · DGUTS '26 raft-trip form update

Written by the Cloud Claude session (Cowork, project **"DGUTS 26'"**). This is a task handoff, not a machine/infra handoff.

## TL;DR
Task = **find last year's DGUTS raft-trip Google Form and update it for 2026.** The iMessage
side is fully mined and saved to the project. **Blocked on Google:** Google Drive is connected
to the account but **toggled OFF for this chat** (tools not loaded), and **Gmail isn't connected.**
Until Drive is enabled in-chat, the actual Form can't be located or edited.

## THE ONE THING TO UNBLOCK
1. In this conversation's connector settings, **flip Google Drive ON for this chat** (it shows
   `enabledInChat: false`; being connected at the account level isn't enough).
2. Optional but recommended: **connect Gmail** (not connected) so the session can search email
   for the form/registration link.
3. Then: search Drive for the raft/DGUTS Google **Form**, and open the Overview Doc (link below) —
   the signup Form is most likely linked from inside it.
   Alternative if connectors stay flaky: **browser route** — drive the user's logged-in Chrome to
   drive.google.com / Gmail (user pre-approved this as a fallback).

## What's DONE (verified this session)
- **Folder access granted on the Mac:** `~/imessage_export` (empty — export was a dud),
  `~/Pictures`, `~/Documents`, `~/Downloads`, and `~/Library/Messages`.
- **iMessage thread read in full:** group "Don't Give Up The Ship", chat ROWID 3388,
  202 msgs, **Aug 12–23 2025**. Pulled via `sqlite3`/python direct against `chat.db`
  (CLI sqlite3 absent in the device VM; used python3 stdlib + attributedBody decode).
- **Reference notes saved to the project:** `claude/raft-trip-reference-2025.md` — trip basics,
  links, participants, meals/gear. That doc is the source of truth; read it first.
- **Local Documents/Downloads searched:** no raft/trip/form files locally (dead end).

## Key facts for the 2026 update
- **2025 trip:** arrivals ~Wed Aug 13; on-river through ~Mon Aug 18, 2025.
- **Location:** Lower Deschutes R., OR — BLM land; camped **"Blue Hole"** (one campground up-river
  from Oak Springs, Maupin area). Runs: kids run, Oak Springs, Boxcar.
- **Host:** Jeff (organizer). **Nigel** = guide/mascot. Meals communal (B + D); bring ICE, shade.
- **Overview Doc (Google):** https://docs.google.com/document/d/1NU6ZTyUXfA_x1Zf7ESvGdd1eWbSR7BrbnRfplbmTdNg/edit
  (FAQ + Meal Planning + packing-list link; likely holds the Form link)
- **Expenses Sheet (Google):** https://docs.google.com/spreadsheets/d/1KOtXkAMMWBcZzOydh4DffTQWzKMVvC3G5Np1x0zMs-0/edit
- **Cost split:** KittySplit; pay via Venmo @Jeff-Mumford-1 / Cash App $JeffMumford.
- Participant phone list is in the project reference doc.

## Still to do (in order)
1. Enable Drive in-chat (+ Gmail) → locate the previous Google Form.
2. Read the Form's current questions + the Overview Doc.
3. Confirm 2026 dates/venue changes with the user, then edit the Form (Forms API via connector,
   or browser). **Get user sign-off before writing any real edits.**
4. Optional: pull `~/Pictures` 8/13–8/18 2025 photos for context (lower priority; user deferred).

## Session state at handoff
- Cloud Claude session: idle, nothing running. All findings persisted to the project doc, so a
  fresh session can resume cleanly without re-reading iMessage.
- Nothing was written to Google yet; no edits made anywhere. Read-only so far.
