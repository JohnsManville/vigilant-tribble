# HANDOFF — SSD integration, intel mirror, API key rotation
**Written:** 2026-08-23 05:17 PDT · **Lane:** infrastructure (2TB SSD / backups / credentials)
**State verified live at write time** — nothing below is recalled from memory alone.

## TL;DR
2TB SSD integration and the nightly intel mirror are DONE and have run clean for 3+ weeks.
The OpenAI key rotation is STUCK at the last step since 7/30: the Keychain holds garbage,
the API returns 401, and every OpenAI-dependent script (finrecon GPT lane, Purcell GPT
scripts, bridge) has been dead since then. One copy-paste fixes it — see Open item 1.

## DONE — verified 2026-08-23 05:17
- **2TB SSK SSD is /Volumes/ClaudeData** (APFS, GUID, since 7/30). 33Gi used / 1.8Ti free.
  Marker file present. Survives reboot; device node varies across boots (disk5→disk9 seen) —
  never hardcode diskN, bind by volume name only.
- **Old 500GB ClaudeData**: contents migrated 7/30 (51 files, MD5-verified identical),
  then volume deleted on Jeff's explicit order. Its space returned to the APFS container
  shared with ClaudeBoxSSD (Time Machine — untouched throughout).
- **Nightly intel mirror is healthy**: `com.claudebox.intel-mirror` runs 03:30 daily,
  unbroken 7/30→8/23, mirrored 81 files / 136M this morning.
  - Script: `~/ClaudeBox/scripts/intel-mirror.sh` → `~/ClaudeBox/backups/intel-mirror/`
  - Design (Covenant-driven): `rsync --delete` so burns/purges propagate; dest is
    Time Machine-EXCLUDED so burned material never persists in snapshots; aborts loudly
    if the SSD isn't mounted (marker-file gate); skips during EMBER_HOLD;
    excludes `.ember-*` so sealed staged burns never gain a second copy.
  - `burn-intel.sh` now also purges mirror raw/+media/ AT BURN TIME (no 24h lag).
    That block is syntax-checked but never live-tested — a real run stages an actual
    burn and texts Jeff. Test only deliberately, with a HALT ready.
- **Caches on SSD**: npm → `/Volumes/ClaudeData/caches/npm`; `HOMEBREW_CACHE` in
  `~/.zshrc`. Old `~/.npm` (693M) deleted 7/30.
- **`~/.zshrc` scrubbed of plaintext keys** (verified: zero `sk-` strings). It now loads
  `OPENAI_API_KEY` from the login Keychain (service name `openai-api-key`).

## OPEN ITEMS

### 1. Finish the OpenAI key rotation ← THE ONE THAT MATTERS
Since 7/30 the Keychain entry holds 505 chars of stray clipboard, API answers **401**,
and finrecon's GPT lane + Purcell GPT scripts + openai_finrecon_bridge silently have no
working key (they fail with "OPENAI_API_KEY not set/invalid" style errors when invoked).

**Why it broke:** the first store used `security add-generic-password -w` interactive
prompt, which **truncates at 128 bytes** — the pasted ~164-char key was silently clipped.
The recovery attempt read a stale clipboard. OpenAI shows a key exactly once, so the
key created 7/30 (name `claudebox-miniclaudebox-mini`, doubled by a form re-render) is
live server-side but unrecoverable.

**Fix (2 minutes):**
1. platform.openai.com/api-keys → Create new secret key, name `claudebox-mini` → Copy.
2. Immediately (clipboard-fed store — no truncation, nothing echoed or in history):
   `security add-generic-password -a "$USER" -s openai-api-key -U -w "$(pbpaste)"`
3. Verify: `zsh -ic 'curl -s -o /dev/null -w "%{http_code}\n" -H "Authorization: Bearer $OPENAI_API_KEY" https://api.openai.com/v1/models'` → want **200**.
4. Revoke/delete the orphan `claudebox-miniclaudebox-mini` key in the console.

Console facts established 7/30: account mumford.jeffrey@gmail.com has ONE org (Personal),
ONE project (Default). Both historically exposed OpenAI keys (`sk-proj-Vm9e…` from .zshrc,
`sk-proj-we6aei…` from a Notes title) do NOT exist there — nothing left to revoke on the
OpenAI side. All 4 pre-existing keys were already Inactive.

### 2. Anthropic console cleanup (nothing on the box uses these)
Revoke at console.anthropic.com/settings/keys if still listed: `sk-ant-api03-6ipK…`
(was commented out in .zshrc; now in transcripts) and `sk-ant-api03-OJ356…` (per 7/24
briefing, in Apple Notes). No replacement needed — the box deliberately runs on the Max
plan with ANTHROPIC_API_KEY unset.

### 3. Apple Notes hygiene (Jeff's hand — assistant is blocked from these, correctly)
- Delete the note whose TITLE is the raw key `sk-proj-we6aei…` (created 7/20).
- Delete/scrub whatever note holds the `sk-ant-api03-OJ356…` key.
- The note titled `tEKC41yT)qv6` (May 18) looks like a bare password as a title — same treatment.

### 4. Rotate the Mini account password (open since 7/24 briefing)
It was pasted into chat 7/22 and lives in a transcript. Still outstanding.

## GOTCHAS LEARNED (don't relearn these)
- `security add-generic-password -w` (interactive prompt) truncates at 128 bytes with
  no warning. Store long secrets with `-w "$(pbpaste)"` instead.
- openrsync (macOS Tahoe's rsync) throws bogus AppleDouble `._*` errors and unreliable
  `-c` itemize output; verify migrations with real per-file MD5, not `rsync -c`.
- OpenAI sk-proj keys are project-scoped; the API-keys page defaults to an "Active"
  filter that hides revoked keys. Check `?status=all` and the project/org switchers
  before concluding a key doesn't exist.
- External volume device nodes renumber across reboots AND erases. Identify drives by
  size + volume name + marker file (`.claudebox-data-volume`), never by diskN.
