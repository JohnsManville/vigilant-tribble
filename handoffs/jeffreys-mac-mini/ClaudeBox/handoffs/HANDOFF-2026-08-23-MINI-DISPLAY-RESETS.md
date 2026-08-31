# HANDOFF — Mini "sleep"/hard-reset mystery: diagnosed, fixed, verified

**Written by:** the Mac mini session (`jeffmumfordmacmini`, verified by `whoami`),
2026-08-23 ~04:50 PDT. Diagnostic work ran 2026-08-13; verification numbers below
were re-read fresh on 2026-08-23. All timestamps PDT.

**Status: RESOLVED.** Jeff confirmed "problem appears solved" 2026-08-13. Ten days
of runtime since agree.

---

## 1. What the problem actually was

Jeff asked "find out why the Mini is going to sleep." It was never sleeping —
`pmset` was correct (sleep/displaysleep/disksleep all 0, caffeinate asserting
forever) and Sleep Count was 0. The box was taking **hard power cuts**: six
unexpected resets 8/6–8/12, every one logging the identical fault
`rst uv,vdd_boost_uvlo` (under-voltage lockout) in
`/Library/Logs/DiagnosticReports/ResetCounter-*.diag`, with the unified log
stopping mid-stream — no shutdown sequence. `autorestart=1` booted it back up,
which read as "it slept and came back."

The power cuts were **Jeff himself**, pulling the plug because after remoting in
(Screen Sharing from the MBP) the physical monitor would not come back — black,
green, or stuck on the Screen Sharing placeholder glyph (square-with-triangle).

## 2. Root cause

macOS Screen Sharing **High Performance** mode. Logs show `ScreensharingAgent`
creating a "Screen Sharing Virtual Display" (1920×1080) on every HP session —
six creations on 8/12 alone, all from the MBP over Tailscale (100.122.41.121).
HP mode detaches the GPU from the physical LG QHD and renders to the virtual
display; on session end the re-handshake with the LG frequently failed.

Ruled OUT along the way:

- **HDMI path.** The cabling moved from a USB-C dongle to direct HDMI, but Jeff
  confirmed the black/green failure happened on the dongle too — same failure on
  two physical paths, so the port was never the variable. (An earlier over-claim
  that "dongle = worked" is logged as **AI_ERROR_LOG E-084**; don't repeat it.)
- **Monitor settings.** LG OSD audited via photos 8/13: General menu was already
  clean (SMART ENERGY SAVING Off, Automatic Standby Off), and this model has
  **no Deep Sleep and no HDMI Deep Color options**. Nothing to change; don't
  re-suggest these.
- **Sleep/energy config, screen saver, screen lock** — all checked, all benign.

## 3. The fix (applied 2026-08-13)

One setting, MBP side: the Screen Sharing client switched from High Performance
to **Standard** mode. Standard mirrors the LG's real framebuffer — no virtual
display is created, so there is nothing to hand back and the failure cannot
occur. The client remembers the choice per host.

## 4. Verification (fresh, 2026-08-23)

- **Zero** `ResetCounter-*.diag` files in `/Library/Logs/DiagnosticReports/`
  (the 8/6–8/12 set has aged out; nothing new replaced them).
- Exactly one reboot since the fix: **8/18 12:00, preceded by a clean `shutdown`
  entry at 11:58** — a deliberate restart, not a power cut.
- Current boot 8/18 12:00, up 4d16h at time of writing. Sleep Count 0.

Ongoing proof is passive: **any new `ResetCounter` file = it happened again.**

## 5. If the display ever fails to come back anyway

Recovery ladder, gentlest first — **never the power cord** (the 2 TB ClaudeData
archive is attached; every yank is a corruption dice-roll):

1. Power-cycle the **monitor** (or re-seat HDMI) — forces a fresh handshake.
2. `ssh -t jeffmumfordmacmini@<mini> sudo killall WindowServer` — fresh session,
   no reboot.
3. `ssh -t jeffmumfordmacmini@<mini> sudo reboot` — clean restart.

If it recurs more than once despite Standard mode, the remaining knob is
dropping the LG from 75 Hz to 60 Hz (System Settings → Displays); after that,
suspect the LG's own re-handshake behavior.

## 6. Where the rest of the record lives

- Memory: `~/.claude/projects/-Users-jeffmumfordmacmini-ClaudeBox/memory/mini-display-not-released-after-screen-sharing.md`
  (full diagnosis + "how to apply" for future sessions; indexed in MEMORY.md).
- Error log: `~/ClaudeBox/AI_ERROR_LOG.md` **E-084** (committed in `18bd174`).

## 7. Open items surfaced but NOT part of this fix

- **AnyDesk (7070) and ARD (3283) are both still listening wide open** — same
  items as the 8/11 security audit (plus auto-login ON). Untouched here; still
  the highest-value hardening work on this box.
- Note: a remote-access **logger** was deployed 8/13–8/22 per later commits
  (`eed2547`, `b56d4dd`) — that work belongs to other sessions; see those
  commits, not this doc.
