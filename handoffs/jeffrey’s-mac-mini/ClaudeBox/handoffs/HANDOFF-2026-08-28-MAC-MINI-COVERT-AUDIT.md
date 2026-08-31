# HANDOFF — Mac Mini covert security audit + tripwire build (PHASE 2 ACTIVATED 2026-08-29 by Jeff — see update block below; no longer dormant)

**Written 2026-08-28 evening sweep · Mini (`Macmini9,1`, `whoami`=`jeffmumfordmacmini`)**
**Covers Claude Code session `35f6a0e1`** — activity 2026-08-28 14:47–16:33 PDT
(21:47–23:33Z). Was UNREGISTERED; this file registers it. Project slug
`mac-mini-covert-audit`; bucket ClaudeBox → security (new standalone lane, first session).

> **READ THIS FIRST.** Jeff commissioned a "covert security audit" of a machine he owns.
> Phases 1–4 were legitimate **read-only forensics**. Phase 5 built a going-forward
> tripwire/canary system that **includes a compiled camera/mic capture binary, a disguised
> token-gated network service, and off-box delivery scripts.** All of it is **dormant** —
> nothing is loaded or armed (verified below). But dual-use surveillance tooling with
> off-box delivery on a **shared family machine** is Covenant-governed and is **Jeff's to
> authorize before any activation.** This handoff documents it and flags it; it does not
> arm, extend, or endorse it. Do not load any of it without Jeff's explicit word.

---

## UPDATE — 2026-08-29 evening sweep (refresh; supersedes the "dormant" state above)

**Session `35f6a0e1` resumed 2026-08-29 13:52–13:53 PDT (20:52–20:53Z) and Jeff armed
the stack.** The premise of the original handoff — "all dormant, nothing loaded or armed"
— is **no longer true.** Sequence, from the transcript:

- Jeff: *"Can you drive on Mac mini via ssh?"* → clarified the session runs locally on the
  Mini (no SSH needed). Jeff replied **"1"** = *activate Phase 2 now.*
- Phase 2 was activated. **State verified live on disk at 2026-08-29 22:00 PDT this sweep:**
  - `covert-service.py` **RUNNING**, PID **14983**, `LISTEN *:7734` — token-gated service
    disguised as a `/health` uptime API (returns fake `{"status":"ok"}` without the bearer
    token, real dashboard with it).
  - `dashboard.py` **RUNNING**, PID **14985**, `LISTEN *:8765` — real-time state UI,
    **no token required.**
  - `~/Claude/Security/DELIVERY_ARMED` marker present (created 13:53) → off-box push to the
    MBP over Tailscale is **ARMED**.
  - Canaries: **4 bait files armed.** Audio capture: **OFF.** Fingerprint baseline: still
    training, **1 of 14** sessions — not yet reliable.

- **NOT loaded (still requires interactive sudo):** the two daemon-level launchd agents
  (`com.oddjobs.claudebox.state-tracker`, `...auth-watcher`). Verified this sweep: the
  plists are **not** in `/Library/LaunchDaemons` and nothing `oddjobs.claudebox` audit-related
  is in the system domain. `sudo launchctl bootstrap` was attempted in-session and failed
  ("a terminal is required to read the password"). So persistence across reboot is **not**
  in place — the two running services are `nohup` background processes and die on reboot
  unless re-launched.

**LOAD-BEARING CONSTRAINT (new, overrides the old dormancy note):** two network services
are now listening on **all interfaces (`*`), not localhost** — on a shared family machine,
Covenant-governed. The `:8765` dashboard has **no token** and exposes real security state
to anyone who can reach the Mini's LAN/Tailscale address. This is a live exposure, not a
plan. The bearer token for `:7734` is in the session transcript in cleartext; it is **not**
reproduced here and should be treated as burned if this lane is kept — rotate it.

**Phase 1 confirmations Jeff owes are STILL open** (he armed Phase 2 without answering them):
AnyDesk incoming (Jul 28 + Aug 12), ChatGPT/Pocket TCC grants, Bluetooth "Mr. Biggerstuff",
auto-login. See the four questions at the bottom of this handoff.

**First move for the next session (revised):** this is now a decision, not a build. Ask Jeff
whether the two services should keep running and, if so, whether `:8765` should be bound to
`127.0.0.1`/Tailscale-only rather than `*`. Do **not** load the launchd daemons without his
explicit word — that converts a session-lifetime process into reboot-persistent surveillance.
If he stands the lane down: kill PIDs 14983/14985, remove `DELIVERY_ARMED`, rotate/delete
`.covert-token`, remove the 4 canary bait files, and delete `~/Claude/Security/bin/`.

**Status after this refresh: WIP → armed and running, blocked on Jeff.** Confidence **90/100**
— every running process, port binding, marker file, and the non-loaded launchd state verified
on disk this sweep; the LAN-exposure characterization follows directly from the `*:` bind.

---

## THE AUDIT FINDING (Phases 1–4, read-only)

- **No evidence of unauthorized access** in the retained unified-log window (**Aug 17–28,
  2026**). Confidence **85/100** — capped honestly because macOS purges logs older than
  ~11 days, so pre-Aug-17 is unrecoverable, not "clean."
- Remote-vs-physical intrusion: **NO to both.** All Screen Sharing / SSH / CRD traced to
  Jeff's own MBP (Tailscale `100.122.41.121`) or his iPhone.
- Tamper check clean: no clock change, no log deletion, zero failed auth, no unauthorized
  persistence found.
- Report: `~/Claude/Security/covert-audit-RC.md` (13,054 B). Session's own handoff:
  `~/Claude/Handoffs/2026-08-28_mac-mini-covert-audit_handoff_RC.md` (5,535 B). Memory node:
  `memory/project_mac-mini-covert-audit.md` (1,070 B). All verified on disk.

## WHAT SHIPPED — Phase 5 tooling (all under `~/Claude/Security/`, verified on disk)

`bin/`: `state-tracker.sh`, `fingerprint.py` (presence-based anomaly model, **no**
time-of-day rules), `trigger.sh`, `watch-auth.sh`, `watch-canary.sh`, `deliver.sh`
(off-box), `escalate.sh`, `canary-setup.sh`, `capture.swift` + **compiled `capture` binary
(68,984 B, camera/mic)**, `covert-service.py` (token-gated service disguised as a `/health`
uptime API), `dashboard.py`. Plus `baseline/` (fingerprint training, 1 of 14 sessions
ingested — not yet reliable), `state/host-state.jsonl` (first snapshot), `.covert-token`
(43 B bearer token — **not reproduced here; rotate if this lane is abandoned**), and
`launchd/` with **3 plist templates** (`auth-watcher`, `canary-watcher`, `state-tracker`).

**DORMANCY CONFIRMED this run:** `launchctl list` shows **none** of the three
`com.oddjobs.claudebox.{auth-watcher,canary-watcher,state-tracker}` labels loaded (only
Apple's own `com.apple.security.*` jobs). No `DELIVERY_ARMED`, no `AUDIO_ON`; the plists are
templates, not installed. The camera/mic binary exists but is not wired to anything running.

## PLANTED CANARY BAIT FILES — one is a git-commit hazard

Four fake "bait" files were planted as exfiltration tripwires (real content is trivial/6 B):
`~/Documents/Odd Jobs - passwords.txt` (110 B), `~/Documents/tax_2024_final.pdf` (15 B),
`~/Desktop/Purcell - settlement figures.xlsx` (6 B), and
**`~/ClaudeBox/SSH-keys-BACKUP.txt` (6 B)**.

**The last one sits UNTRACKED inside the git repo.** A careless `git add -A` would ship a
file literally named `SSH-keys-BACKUP.txt` to three remotes — harmless content, alarming
name, and it defeats the canary's purpose. **Do not commit it.** It is intentionally left in
the working tree as a tripwire; this sweep did not stage it.

## LOAD-BEARING CONSTRAINTS (do not undo)

- **Activate nothing without Jeff.** Launch agents stay templates; delivery stays off; audio
  stays off. This is the whole safety posture.
- The covert-service is **deliberately disguised** as a boring `/health` API (adversary-reads-
  my-code assumption). Do not rename it or the agents to "monitor/surveillance/security."
- Everything read-only against the system; Phase-5 scripts write **only** under
  `~/Claude/Security/`.
- Audit scope is **Aug 17–28 only**; pre-Aug-17 is unrecoverable — don't claim otherwise.
- Fingerprint baseline may be poisoned and needs ~14 sessions before scores mean anything.

## OPEN — needs Jeff's confirmation before any remediation

1. **AnyDesk** — 5 incoming sessions (Jul 28 + Aug 12) from an unknown source; AnyDesk
   listening unattended on 7070; ARD wide open (`ARD_AllLocalUsers=1`, legacy VNC).
   **Jeff's, or revoke?** (First remediation move: pull the AnyDesk connection log for the
   source IPs.)
2. **TCC grants** — ChatGPT + Pocket hold Accessibility + ScreenCapture. Intentional?
3. **Bluetooth** — "Mr. Biggerstuff" / "Mr. BigStuff 17" unidentified. Identify or remove?
4. **Automatic login is ON** (`autoLoginUser=jeffmumfordmacmini`) — candidate to disable.
   (This overlaps the long-standing FinRecon "Mini security posture" item.)

Self-caught in-session issues (not `AI_ERROR_LOG` entries): Flask install needed; canary
filenames with spaces broke path handling (fixed); `deliver.sh` truncated mid-write (rewritten).
**Path discrepancy to flag:** the final chat claimed the token lives at
`~/.claude/security/.covert-token`, but on disk it is `~/Claude/Security/.covert-token`
(the lowercase path does not exist).

## FIRST MOVE FOR THE NEXT SESSION

**Do not touch the tooling.** Surface items 1–4 to Jeff and let him decide scope and whether
this lane lives at all. If he abandons it: rotate/delete `.covert-token`, remove the four
canary bait files (especially the repo one), and delete `~/Claude/Security/bin/` — leaving a
dormant camera/mic + off-box-delivery stack on a family machine is not a neutral default.

**Status: WIP.** Forensics + RC report FINISHED and delivered; Phase-5 tooling built,
self-tested, and intentionally dormant; blocked on Jeff's four confirmations.
**Confidence 88/100** — every artifact and the dormancy state verified on disk this run; the
audit's "no intrusion" verdict is the session's, cross-checked only to the extent that no
security agent is loaded and the log window is genuinely 11 days.
