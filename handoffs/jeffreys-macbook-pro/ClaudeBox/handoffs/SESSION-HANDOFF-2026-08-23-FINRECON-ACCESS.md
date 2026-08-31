# FinRecon Remote Access, Mini Sleep, Victory-Lap Deck — PRESENT STATE & HANDOFF

**Written:** 2026-08-23 04:47 · Claude Code on **jeffreys-mac-mini** (Macmini9,1)
**Covers:** a session that ran in bursts from **2026-07-31 → 2026-08-23**.
**Every claim below was re-verified on the Mini at 04:45–04:50 on 2026-08-23**, not
carried over from when the work was done. Where something could not be verified
today, it says so.

---

## 1. Bottom line

FinRecon's web UI is reachable, survives reboots, and the Mini can no longer sleep.

| Thing | State today | Evidence |
|---|---|---|
| **URL** | `http://100.115.69.54:8787` | HTTP **200** from the Mini |
| Bind | `100.115.69.54:8787` — **tailnet-only** | `lsof` shows Python on that address |
| `127.0.0.1:8787` | **deliberately dead** (`000`) | by design since v1.32 |
| Server process | LaunchAgent **running**, pid 1721 | `launchctl print` |
| Auto-start / auto-restart | `com.claudebox.finrecon-serve` (RunAtLoad + KeepAlive) | loaded |
| Sleep | **`SleepDisabled 1`, `powernap 0`** | `pmset -g` |
| Keep-awake belt | `com.claudebox.keep-awake` running, 2 caffeinate assertions | `pmset -g assertions` |
| Mini uptime | **4 days** — agents came back on their own after that reboot | `uptime` |
| Tests | **348 passed** | `pytest -q` |
| Ledger | **7,781 txns · 2,706 reviewed · 250 docs · schema 12** | sqlite |

**One-paste health check:**

```sh
curl -s -o /dev/null -w 'finrecon: %{http_code}\n' -m 8 http://100.115.69.54:8787/
lsof -nP -iTCP:8787 -sTCP:LISTEN | tail -1
pmset -g | grep -iE 'SleepDisabled|powernap'
launchctl print gui/501/com.claudebox.finrecon-serve | grep -m1 'state = '
```

---

## 2. What changed this session

### 2.1 Remote access: tunnel → direct tailnet bind
The old path (`ssh -N -L 8787:localhost:8787 mini`) kept dying with MacBook sleep.
Replaced with a direct bind:

- `finrecon serve` gained a **`--host`** option (`src/finrecon/cli.py`); default is
  still `127.0.0.1`. The hard loopback guard in `web/server.py` became a **loud
  warning** instead of a `ValueError`.
- Logged as **DECISIONS v1.31** (allow non-loopback) then **v1.32** (narrow to
  tailnet-only, `--host 100.115.69.54`, closing LAN exposure).
- Runs via `~/ClaudeBox/scripts/finrecon-serve` → LaunchAgent. Log:
  `~/ClaudeBox/finrecon/serve.log`.
- Restart: `launchctl kickstart -k gui/501/com.claudebox.finrecon-serve`

**Known, accepted trade-off (Jeff's call):** the UI has **no authentication**. Any
tailnet device (MacBook, iPhone, iPad) can read *and edit* the ledger.

### 2.2 The sleep bug — root cause found, and I had it wrong twice
Jeff's "connections die every ~2 min" was **correct** and I dismissed it twice by
reading `pmset -g` (current settings) instead of `pmset -g log` (history).

`sleep 0` was already set and did nothing, because:
1. Someone clicked **Apple menu → Sleep** during a screen-share (`Software Sleep
   pid=…loginwindow`) — `sleep 0` does not block an explicit sleep command; and
2. `powernap 1` then kept it dozing: **13 sleep entries between 17:54 and 18:09 on
   7/31**, each with a DarkWake ~1–2 min later.

Fixed for good when **Jeff ran** `sudo pmset -a disablesleep 1 powernap 0` (needs a
password; I cannot). `com.claudebox.keep-awake` (`caffeinate -s`) is the backstop.

**Rule for next time: `pmset -g log`, not `pmset -g`.**

### 2.3 Victory-lap deck for Laura
`~/ClaudeBox/finrecon/FinRecon-Victory-Lap.pptx` + `.pdf` — 9 slides, non-technical,
explains what FinRecon does and why it can be trusted. Validation passed; rendered
and inspected slide by slide.

- **Present from the PDF.** Neither Mac has PowerPoint or Keynote.
- **⚠️ Numbers are now stale.** Built against 7,539 txns / 242 docs; the ledger is
  now **7,781 / 250**. Regenerate before showing it if precision matters — the
  generator is in the session scratchpad (gone), so it needs rebuilding.
- **Not in git** (both files untracked).

### 2.4 Apple Notes
- **Created** note **"FinRecon — Runbook (URL + fixes, Aug 1 2026)"** (synced to the
  MacBook): leads with the URL, lists the three dead commands not to use.
- **Edited** "Personal To Do:" — removed the one stale
  `cd ~/ClaudeBox/finrecon && npm run dev` line Jeff had pasted there.
  - Text verified intact (729 lines; only that line gone). All 7 photos still inline
    (confirmed via `U+FFFC` placeholder count in the Notes sqlite blob).
  - **Irreversible side effect I caused:** Notes re-imported the inline images, so
    their **filenames became UUIDs** (`stair-hand-rails-017b.jpeg` → `623CF420-…`).
    Pixel data is fine. `set name of attachment` is read-only — cannot be undone.
  - Also normalized by Notes: `<h1>` → bold 24px span, `<font>` tags stripped,
    double spaces collapsed. All visually neutral.
  - **Backups:** `~/ClaudeBox/backups/notes/` — full pre-edit body (3 MB, images as
    base64) + all 6 attachments **with their original filenames**.

### 2.5 AI_ERROR_LOG
Appended **E-059 / E-060 / E-061**:
- **E-059 (↓ against Jeff, MEDIUM)** — I asserted twice that the Mini wasn't
  sleeping; `pmset -g log` contradicted it. Dismissed his correct diagnosis.
- **E-060 (↔, LOW)** — the old runbook's claim that FinRecon is an npm project on
  the external volume is false; it is Python at `~/ClaudeBox/finrecon`.
- **E-061 (↔, LOW)** — I recorded the ssh tunnel as a working fallback in the same
  turn the tailnet-only bind killed it.

---

## 3. Open items

1. **⚠️ Two runbooks now cover overlapping ground.** Mine —
   `~/ClaudeBox/finrecon/RUNBOOK-remote-access.md` (URL, sleep, restart) — and the
   larger `~/ClaudeBox/handoffs/FINRECON-RUNBOOK-RC.md` (2026-08-12, MacBook-written,
   17 KB, feeds a Notion page). The Aug 12 doc knows about
   `com.claudebox.finrecon-serve` but **does not state the URL**. CLAUDE.md says one
   living doc per topic — **these should be merged**, with the Aug 12 doc as the
   survivor and the URL/sleep facts folded in.
2. **Deck numbers stale** (§2.3) — regenerate if it will be shown again.
3. **MacBook not verified today.** It has been **offline ~17h** per `tailscale
   status`. The direct URL last returned 200 from it on 2026-07-31. Nothing suggests
   it broke; it simply could not be re-tested.
4. **Notes attachment filenames** — permanently UUIDs; originals only in the backup
   folder. See memory `apple-notes-editing.md` before editing that note again.
5. **Security, unrelated and unactioned:** a note is **titled** with what looks like a
   live OpenAI key (`sk-proj-we6aei…`), in plaintext in iCloud. Recommend revoke +
   rotate. Not touched.
6. **Tooling gaps on the Mini:** **Homebrew is gone** (only its cache survives on
   ClaudeData); LibreOffice is not installed — the deck was rendered by mounting the
   official DMG and running it from the image, then unmounting. Nothing installed.

## 4. Resolved since the Aug 12 handoff

That doc flagged a **live hazard**: the Mini was on schema **11** while the MacBook
replica had migration 12, with the web UI ingesting documents into the older schema.
**Closed.** The Mini is now **schema 12 with `documents.claim_flag` present**, and
the ledger has moved well past the 7,539/242 snapshot in that doc. The Mini is the
authoritative copy, as decided.

`com.oddjobs.finrecon-simplefin-sync` (daily 05:30) is loaded and idle between runs —
normal for a scheduled agent, not a fault.
