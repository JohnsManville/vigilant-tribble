# WhipDesk Setup — Handoff / Import Context (updated)

> Paste-in context for a Claude Code session running **on this Mac Mini ("Claudebox")**.
> Original setup was driven from a Claude session on Jeff's MacBook Pro over SSH; sessions
> don't sync between machines, so this file carries the state across.

## What WhipDesk is
[WhipDesk](https://github.com/BinaryBananaLLC/WhipDesk) is a mobile-first remote-access tool.
An **agent** runs on the machines you want to view/control (the Macs); the **client** is any
browser (Jeff's iPhone). WhipDesk itself is NOT a coding session — it's the window you look
through to see this Mac's desktop and whatever coding agent runs on it.

## Device topology
- **This machine = Mac Mini "Claudebox"** — `Jeffreys-Mac-mini`, Apple M1 (Macmini9,1),
  macOS 26.x, LAN `192.168.68.55` / `192.168.68.59`, user `jeffmumfordmacmini`. Always-on box.
- **MacBook Pro** — `Jeffreys-MacBook-Pro`, M2, user `jeffmumford`. WhipDesk installed via
  Homebrew Node + `npm install -g whipdesk`. Its SSH key (`~/.ssh/id_ed25519`, comment
  `macbookpro-whipdesk-setup`) is authorized on this Mini.
- **iPhone** — browser controller, nothing to install.

## Current state on THIS Mini  ✅ RUNNING
- WhipDesk **1.0.2** running now — 2 node processes, listening on **TCP :8787**, HTTP 200 on
  both LAN IPs. **PIN is set** (`~/.whipdesk/pin.json`) and a **cloud token exists**
  (`~/.whipdesk/token`), so Jeff signed in with `mumford.jeffrey@gmail.com` — it should also
  appear at https://whipdesk.com/dashboard.
- Install layout (no Homebrew here; `/usr/local/lib/node_modules` is root-owned, so a
  **user npm prefix** was used):
  - Node `v24.18.0` at `/usr/local/bin/node` (root-owned, universal binary).
  - `npm config set prefix ~/.npm-global`
  - Binary: `~/.npm-global/bin/whipdesk` → `../lib/node_modules/whipdesk/dist/agent.cjs`
    (shebang `#!/usr/bin/env node`).
  - Bundled **ffmpeg 6.0** present (installed with `--allow-scripts=ffmpeg-static`).
  - `~/.zprofile` adds `export PATH="$HOME/.npm-global/bin:$PATH"`.

## Connect the iPhone
- Same Wi-Fi: Safari → `http://192.168.68.55:8787` (or `.59`), enter PIN. Or scan the QR in the
  Mini's Terminal.
- Anywhere: https://whipdesk.com/dashboard signed in with `mumford.jeffrey@gmail.com`.
- **Black screen?** Grant **Screen Recording** + **Accessibility** to the app that launched
  whipdesk (Terminal) in *System Settings → Privacy & Security*, then quit/reopen it and rerun.

## PENDING TASK — auto-start on boot (launchd LaunchAgent)
Goal: WhipDesk survives reboots on this always-on box. This must be finished **at the Mini**
(GUI session), not purely over SSH, because of the TCC permission caveat below.

### The plist — `~/Library/LaunchAgents/com.whipdesk.agent.plist`
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key><string>com.whipdesk.agent</string>
  <key>ProgramArguments</key>
  <array>
    <string>/Users/jeffmumfordmacmini/.npm-global/bin/whipdesk</string>
  </array>
  <key>EnvironmentVariables</key>
  <dict>
    <key>PATH</key>
    <string>/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/jeffmumfordmacmini/.npm-global/bin</string>
  </dict>
  <key>RunAtLoad</key><true/>
  <key>KeepAlive</key><true/>
  <key>ProcessType</key><string>Interactive</string>
  <key>StandardOutPath</key><string>/Users/jeffmumfordmacmini/Library/Logs/whipdesk.log</string>
  <key>StandardErrorPath</key><string>/Users/jeffmumfordmacmini/Library/Logs/whipdesk.err.log</string>
</dict>
</plist>
```

### Install / load steps
1. **Stop the current manually-launched instance first** (avoids a port-8787 clash):
   `pkill -f '.npm-global/bin/whipdesk'`
2. Write the plist above, then load it:
   `launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.whipdesk.agent.plist`
   (or the legacy `launchctl load -w ~/Library/LaunchAgents/com.whipdesk.agent.plist`)
3. Verify: `launchctl print gui/$(id -u)/com.whipdesk.agent | head` and
   `curl -s -o /dev/null -w '%{http_code}\n' http://127.0.0.1:8787/` → expect `200`.
- To unload later: `launchctl bootout gui/$(id -u)/com.whipdesk.agent`

### ⚠️ TCC permission caveat (the reason this must finish at the Mini)
Screen Recording / Accessibility are tied to the **responsible process**. Right now the working
instance was launched from **Terminal**, so the permission is attached to Terminal. A
launchd-launched instance is a *different* responsible process (node/whipdesk), so it may **not**
inherit that grant → you may get a black screen until you grant Screen Recording (and
Accessibility) to `whipdesk`/`node` in *System Settings → Privacy & Security* and reload the job.
That grant needs the Mini's GUI, which is why this step can't be fully done over SSH.

### Also for a true always-on box
The LaunchAgent only runs inside a logged-in GUI (aqua) session. For unattended reboots, enable
**automatic login** for `jeffmumfordmacmini` (*System Settings → Users & Groups → Automatically
log in as*). That's a security setting — decide deliberately; leaving it off means WhipDesk only
comes up after someone logs in.

## Housekeeping
- Update: `npm update -g whipdesk` (no sudo). Uninstall: `npm rm -g whipdesk` + `rm -rf ~/.whipdesk`.
- Logs (once launchd is set): `~/Library/Logs/whipdesk.log` / `whipdesk.err.log`. Ad-hoc: `whipdesk --verbose`.
