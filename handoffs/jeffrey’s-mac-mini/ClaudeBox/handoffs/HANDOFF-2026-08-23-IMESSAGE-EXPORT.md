# HANDOFF — iMessage thread export tool (HELD for future dev)

**Date:** 2026-08-23
**Status:** ON HOLD per Jeff ("stop", "hold for future dev")
**Deliverable:** `~/ClaudeBox/scripts/imessage-export` (executable Python, ~280 lines)
**Workspace:** Malicious Compliance (Purcell). Test range surfaced settlement-letter
PDFs in Kari's thread — likely Purcell evidence use.

---

## What Jeff asked for

1. A CLI tool that outputs a specific iMessage thread **by date range, with images,
   in printable form** (Messages.app's own printing doesn't work). ✅ DONE.
2. The ability to **download attachments offloaded to iCloud** (most are). ❌ NOT DONE
   — this is the held work.

## What WORKS today (verified by real exports)

```sh
~/ClaudeBox/scripts/imessage-export --list "kari"                 # find a chat
~/ClaudeBox/scripts/imessage-export --chat "+15419617167" \
    --from 2026-06-01 --to 2026-06-30 -o out.html                 # export
```

- Reads `~/Library/Messages/chat.db` read-only (`file:...?mode=ro`). No TCC block
  for CLI on this box. 422,481 messages at time of writing.
- Date range is inclusive; Apple epoch = ns since 2001-01-01 in `message.date`.
- Decodes `attributedBody` typedstream when `message.text` is NULL (parse after
  `NSString` marker + `+` byte; 1-byte or `0x81`+2-byte-LE length prefix).
- Resolves chats by identifier or `--chat-id`; merges multiple ROWIDs for the same
  `chat_identifier` (SMS + iMessage); errors on ambiguity.
- HTML output: day dividers, left/right bubbles, embedded images (HEIC→JPEG via
  `sips -Z 1200`), markers for videos and **missing (cloud-only) attachments**, and
  an end-of-run stats line. Default output `~/ClaudeBox/exports/`.
- Test artifacts (session scratchpad, may be gone): test_export.html — 451 msgs,
  2 images embedded, 42 missing flagged; test_export2.html — 74 msgs, 1 image, 13 missing.

## What does NOT work — the held problem

**Forcing iCloud-offloaded attachments to download.** 35,787 of 36,618 attachments
have `attachment.transfer_state = 0` (cloud-only) and are **entirely absent from
disk** — not APFS dataless placeholders (0 files with the dataless flag), so file
reads cannot force materialization.

### Proven dead ends — do not retry
- **Reading the files** — they don't exist locally; nothing to read.
- **Passive scroll-back automation** — `open "imessage://<phone>"` + Page Up loop
  (System Events key code 116) renders history but downloads NOTHING. Verified
  empirically: 13 target files stayed `transfer_state=0` through a full scroll run;
  new files on disk that day were unrelated live traffic.
- **⌘I** — does nothing in this Messages version (Catalyst app).
- **`imessage://open?addresses=...`** — does not switch conversations. The plain
  form `imessage://+1503...` DOES (verified via window-title change).
- **`defaults write`** for anything AirPlay-style — n/a here, but same lesson:
  verify state, don't trust plists.

### The confirmed lead (where to resume)
Per ReagentX/imessage-exporter FAQ + discussions #400/#520 and MacRumors: the
conversation **details/info panel has a "download all attachments" control**.
Progress so far:
- The details panel opens by clicking the **conversation header button** — matched
  by searching name+description concatenated for a substring (e.g. "Portland" in
  "My Beloved, Portland, OR"). AXPress on it succeeded.
- BUT a recursive search of window 1 for an AXButton containing "ownload"
  afterward found **nothing**. Unknown whether: the pane actually opened, the
  button needs scrolling into view, has a different label, or lives in a
  popover/sheet not enumerated under window 1.
- Messages is Catalyst: top-level `AXGroup/iOSContentGroup`, unnamed toolbar
  buttons. `every button of entire contents` errors (-1700) — use a recursive
  handler instead.

### Resume plan
1. Re-open the target chat (`open "imessage://<ident>"`, verify with window title).
2. AXPress the header button; then enumerate **all UI elements** (not just
   buttons) of **all windows + sheets + popovers**, dumping role/name/description,
   to find what the press actually opened and where the download control lives.
3. Wire the found control into `trigger_downloads()` in the script, replacing the
   ineffective Page Up loop. Poll `transfer_state` in the DB to confirm downloads.
4. Alternative if AX fails: Settings → Messages "Download Attachments"-style
   options, or `brctl`/`fileproviderctl` angles (unexplored).

## Constraints in force — binding

- **Jeff DENIED computer-use screen access to Messages** (`user_denied`). Do NOT
  retry screen capture/screenshot of Messages. Diagnose via AppleScript
  (System Events accessibility) and the DB only.
- **No sends without Jeff's hand** (7/20/26 standing order). Automation must never
  press Return or any send control in Messages. Current code only uses Page Up
  and clicks on non-send buttons — keep it that way.
- No screen-recording permission for CLI (`screencapture` fails); no python
  Quartz module installed; `timeout` command doesn't exist on macOS zsh.

## Environment facts worth keeping

- Kari's 1:1 chat identifier: `+15419617167` ("My Beloved Kari").
- Group chats use `chat...` identifiers; URL scheme can't open them — script
  falls back to clicking the sidebar row.
- Console lock check: `ioreg -n Root -d1` → IOConsoleLocked = false at time of work.
