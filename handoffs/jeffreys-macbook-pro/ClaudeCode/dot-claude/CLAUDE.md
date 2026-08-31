# CLAUDE.md — Machine & Settings Sync Context

Handoff + current state for Jeff Mumford's two Macs. Last updated: 2026-08-11.

## Setup

- Two Macs to keep in sync: **Mac Mini** and **MacBook Pro (MBP)**.
- Same Apple ID on both: mumford.jeffrey@gmail.com. Same Logi account too.
- RESOLVED 2026-08-11: the machine the Cowork device-bridge reaches IS the Mac Mini.
  Verified on-box: `scutil --get ComputerName` = "Jeffrey's Mac mini",
  `sysctl -n hw.model` = **Macmini9,1** (M1, 2020), macOS 26.5.2.
  The MBP is a separate machine, **Mac14,7**, seen on the LAN as a distinct AirPlay
  peer. Mini/MBP labels in the docs can be trusted from here.

## Canonical docs (single source of truth — edit in place, don't duplicate)

Google Drive → Odd Jobs shared drive → **Handoffs** folder:
- Folder: https://drive.google.com/drive/folders/1cAhzezW3VinbBuJ9dZyHUT7s_AyPNVBh
- README/index: https://docs.google.com/document/d/1ZcsIsENYOd5H0atVtleqFp0mOOMBRivxTsCmjFW7UFs/edit
- Logitech Setup: https://docs.google.com/document/d/1QCHDCqfBv5EqR4Q1rCLojPXoJONups5kOWoMrjcL9Dc/edit
- Cross-Machine Sync Plan: https://docs.google.com/document/d/10a7Gd3bmgAKc6NxMlmd8B2l-8Kp6eMciimjvA8SAifY/edit

Rule: one living doc per topic; version + change log live INSIDE the doc, not the
filename. Drive auto-syncs to both Macs + phone.

## Done

- Logitech: MX Master 3S Flow live across both Macs (mouse ch1 = Mini, ch2 = MBP).
  Options+ device settings cloud-backup created 2026-07-23; auto-backup ON.
- Handoffs system stood up in Drive (folder + README + Logitech doc).
- Cross-Machine Sync Plan (RC) written from a read-only inventory of the bridged Mac.
- **FIXED 2026-08-11 — AirPlay to the Mini from other people's iPhones.** Marked fixed
  by Jeff. Config now: Receiver ON, scope *Anyone on the Same Network*, fixed passcode
  5119, Wi-Fi off (Ethernet only). Full diagnosis chain archived at the bottom of this
  doc. The live constraints that keep it working are in Heartbeat check > Gotchas.

## Inventory of the bridged Mac (apps present)

AnyDesk, ChatGPT, Chrome, Claude, Mimestream (email), Pocket, Private Internet Access,
Python 3.13, Safari, Spotify, Tailscale, WhatsApp, Logi Options+, qBittorrent, Zoom.
Dev dotfiles present: `.zshrc`, `.zprofile`, `.gitconfig`, `.npmrc`, `.ssh`.
Chrome profiles: Default + Profile 4.

## Open decisions (need Jeff)

1. ~~Confirm which physical Mac is hostname `jeffreys-mac-mini-local`~~ — RESOLVED
   2026-08-11, see Setup. It's the Mini.
2. SSH: generate a NEW key on the second Mac (recommended) vs. copy the keypair.
3. Which local MCP power-tools to mirror to the other Mac (Desktop Commander, PDF Tools,
   Minutes, Filesystem, Notes/iMessage bridges).
4. Whether the dev/terminal setup belongs on both Macs or one only.

## Next actions (not yet done)

- Tier 2 (free): turn on Chrome Sync on both; confirm matching iCloud toggles; sign into
  account-based apps (Spotify, WhatsApp, Pocket, ChatGPT, Claude, Zoom).
- Tier 1 (real work): dotfiles -> private git repo cloned on both; replicate macOS
  keyboard/trackpad/Dock settings; re-create Mimestream signatures; then SSH + MCP per
  decisions above.
- Tier 3 (per-machine): enroll both in Tailscale/PIA; set up AnyDesk on each.

## Guardrails

- SENSITIVE — do not copy around or commit: `.ssh` private keys, `.npmrc` tokens,
  VPN creds. Prefer per-machine keys added to the same remotes.
- Keep all handoff edits in the one Drive doc per topic. No `v2`/`final`/`copy` files.

## Heartbeat check (run at session start, or when something "isn't reachable")

One paste, ~20 seconds, read-only. Confirms the Mini is up, on one address, and
serving the things that break most often. Baseline values recorded 2026-08-11.

FIRST: check which machine you're on — `sysctl -n hw.model`. **Macmini9,1** = the Mini,
and the baseline below applies. **Mac14,7** = the MBP, where the baseline does NOT apply
(the MBP keeps Wi-Fi on and has its own addresses). This doc is a shared handoff and
lives on both Macs; the AirPlay/Wi-Fi rules below are Mini-only.

Accounts differ: Mini user is `jeffmumfordmacmini`, MBP user is `jeffmumford`.
Mini → MBP over SSH works today via the `mbp` alias in `~/.ssh/config` (Tailscale
100.122.41.121, key auth, no password). That is how this file gets pushed:
`scp ~/.claude/CLAUDE.md mbp:~/.claude/CLAUDE.md`

```sh
echo "--- identity ---";  scutil --get ComputerName; sysctl -n hw.model; sw_vers -productVersion
echo "--- network ---";   ipconfig getifaddr en0; ipconfig getifaddr en1
route -n get default 2>/dev/null | grep -E 'gateway|interface'
echo "--- addresses advertised (want exactly ONE LAN IP) ---"
T=/tmp/hb.txt; (dns-sd -G v4 "$(scutil --get LocalHostName).local" > $T 2>&1 & P=$!; sleep 4; kill $P) 2>/dev/null
grep -i "$(scutil --get LocalHostName)" $T
echo "--- airplay receiver ---"; lsof -nP -iTCP:7000 -sTCP:LISTEN | tail -1
echo "--- power (want all 0) ---"; pmset -g | grep -E '^ (sleep|displaysleep|disksleep)'
echo "--- locked? ---"; ioreg -n Root -d1 -a | grep -A1 CGSSessionScreenIsLocked || echo unlocked
echo "--- tailscale ---"; /usr/local/bin/tailscale status | head -3
```

### Known-good baseline (2026-08-11)

| Check | Expected | Notes |
|---|---|---|
| ComputerName / model | Jeffrey's Mac mini / Macmini9,1 | macOS 26.5.2 |
| en0 (Ethernet) | 192.168.68.58 | default route, gateway 192.168.68.1 |
| en1 (Wi-Fi) | **no address — Wi-Fi is OFF on purpose** | see Gotchas |
| Advertised A records | exactly one LAN IP | two = the dual-homing bug |
| Port 7000 | ControlCenter LISTEN | AirPlay receiver |
| sleep / displaysleep / disksleep | 0 / 0 / 0 | AC profile, never sleeps |
| Screen lock | may be locked; that's fine | does NOT block AirPlay |

### Gotchas this check exists to catch

1. **Wi-Fi is deliberately OFF on the Mini** (`networksetup -setairportpower en1 off`).
   Ethernet and Wi-Fi were both live on the same /22, so `Jeffreys-Mac-mini.local`
   resolved to TWO addresses; senders connected to one and the Mini answered from the
   other, producing "Unable to connect to Jeffrey's Mac mini." One NIC = one address.
   Turning Wi-Fi back on re-breaks AirPlay. Side effect: AirDrop shows "No One,"
   because AirDrop rides the Wi-Fi radio even when wired.
2. **AirPlay Receiver scope resets its password requirement.** Widening
   "Allow AirPlay for" to *Anyone on the Same Network* makes macOS re-enable
   "Require password" on its own. With no fixed passcode the 4-digit code renders on
   the Mini's screen — unreadable if it's locked or headless, so senders just time out.
   Fixed AirPlay passcode: **5119** (set 2026-08-11). Senders are prompted on their own
   device, so this works whether the Mini is locked, headless, or both.
3. **Screen lock blocks GUI automation, not AirPlay.** `CGSSessionScreenIsLocked = true`
   means an assistant driving System Settings is stuck until Jeff unlocks; AirPlay
   itself is unaffected once a fixed passcode exists.

### Open security items (audited 2026-08-11, NOT yet changed — need admin password)

- **Automatic login is ON** (`autoLoginUser = jeffmumfordmacmini`) — the Mini boots
  straight into the account with no password. Highest-value single fix.
- **AnyDesk** running unattended, listening on 7070 on all interfaces.
- **Screen Sharing / ARD wide open**: `ARD_AllLocalUsers = 1`, privs `255`,
  `VNCLegacyConnectionsEnabled = 1`, `allowInsecureDH = 1`. ARDAgent on 3283.
- **Remote Login (SSH) enabled** — redundant if Tailscale is the real path in.
- Already good: firewall on, stealth mode on, SMB off, Guest off, single admin user,
  Tailscale not running SSH and not advertising routes.

---

## Archive — resolved incidents

### 2026-08-11 · AirPlay to the Mini failed from a non-Apple-ID-matched iPhone — FIXED

**Symptom, in two stages.** First the Mini did not appear at all in another person's
AirPlay picker, while the MBP, Apple TV, and Home Theater did. After the first fix it
appeared but threw "Unable to connect to Jeffrey's Mac mini."

**Cause 1 — access scope.** *Allow AirPlay for* was at the macOS default, **Current
User**: only devices signed into Jeff's Apple Account can see the Mac. A different Apple
ID filters it out of the picker entirely. Visible in the Bonjour TXT record as `act=2`
plus `rsf=0x8`; the working MBP advertised neither. Fixed by setting scope to *Anyone on
the Same Network* — TXT then matched the MBP's shape exactly.

**Cause 2 — dual-homed on one subnet.** Ethernet `192.168.68.58` and Wi-Fi
`192.168.68.65`, both inside 192.168.68.0/22, so `Jeffreys-Mac-mini.local` resolved to
both (plus `127.0.0.1`). Senders connected to one address while the Mini answered from
the other and the handshake died. Fixed by `networksetup -setairportpower en1 off`.

**Cause 3 — on-screen passcode on a headless/locked Mac.** Widening the scope made
macOS silently re-enable *Require password*, which renders a 4-digit code **on the
Mini's display**. Nobody could read it, so senders timed out — reported to the user as
"Unable to connect," which reads like a network error and is not one. Fixed with a fixed
passcode (5119) that prompts on the sender's device instead.

**Dead ends worth not repeating.** The AirPlay Receiver setting does NOT live in
`com.apple.controlcenter`, `com.apple.AirPlayReceiver`, `com.apple.airplay`, or
`com.apple.sharingd` on macOS 26 — `defaults write` against any of them is inert and
silently appears to succeed. It has to be set through System Settings' GUI. Verify the
real state by reading the Bonjour TXT record, not a plist:

```sh
T=/tmp/ap.txt; (dns-sd -Z _airplay._tcp local > $T 2>&1 & P=$!; sleep 5; kill $P) 2>/dev/null
grep -i 'mini._airplay' $T | grep TXT | head -1
# acl=0, no act=, no rsf=  -> open to the network
# flags 0x...200 bit       -> password required
```

**Also learned.** Screen lock (`CGSSessionScreenIsLocked`) halts GUI automation but not
AirPlay. The Mini already never sleeps (`sleep`/`displaysleep`/`disksleep` all 0 on AC),
so "it went to sleep" was never the problem — it was locking, which is a different thing.
