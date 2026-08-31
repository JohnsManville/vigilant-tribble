# Mac Mini Covert Audit — Handoff RC

**Project:** Security audit of Mac mini (Macmini9,1, 100.115.69.54, jeffmumfordmacmini@). Covert access assessment.  
**Supersedes:** None (first handoff).  
**Date:** 2026-08-28  
**Status:** Phase 1 in progress. Findings from Aug 17-28 window compiled. Earlier logs (pre-Aug-17) purged.

---

## Compacted Context

Mac mini is the household remote-access hub, reachable via Tailscale (100.115.69.54) and direct LAN as Jeffreys-Mac-mini.local. Running macOS 26.5.2, M1, never sleeps. AirPlay Receiver configured for *Anyone on Same Network* with fixed passcode 5119 (not screen-dependent). Wi-Fi is OFF by design (dual-homing bug fixed 2026-08-11); Ethernet only.

Three open security items flagged for phase 2:
1. Automatic login is ON (`autoLoginUser = jeffmumfordmacmini`). No password prompt at boot.
2. AnyDesk listening unattended on 7070 all interfaces. Two incoming sessions logged (Jul 28, Aug 12). Ownership: **needs your confirmation** — were these yours?
3. ARD (Apple Remote Desktop) wide open: `ARD_AllLocalUsers = 1`, privs 255, legacy VNC enabled, legacy DH allowed. ARDAgent on 3283.
4. Screen Sharing (SSH) enabled, redundant to Tailscale.

TCC (Transparency, Consent, Control) audit flagged ChatGPT and Pocket apps with accessibility grants. **Needs your confirmation** — intentional or revoke?

Bluetooth audit found two unidentified devices: "Mr. Biggerstuff" and "Mr. BigStuff 17". **Identify or remove** — not in known peripherals.

---

## Decided (Do Not Reopen)

- **Audit scope:** Aug 17-28 window only. Pre-Aug-17 logs are gone; no recovery attempted. Stated as honest limitation.
- **Tamper check:** Clean. No unauthorized modification detected in available logs.
- **Confidence:** 85/100. All flagged items awaiting Jeff's confirmation before remediation.

---

## In Progress

**Phase 1 — Inventory & Confirmation** (started, awaiting input):
- ✓ AnyDesk incoming sessions logged (Jul 28, Aug 12).
- ✓ TCC accessibility grants audited.
- ✓ Bluetooth device enumeration.
- ⏳ Awaiting your confirmation on three items above.

Done when: All three items confirmed (yours/intentional or flagged for removal).

---

## Phase 2 — Remediation (Blocked; awaits Phase 1 completion)

Remove unauthorized/unwanted access vectors based on Phase 1 confirmation:
- Disable automatic login (requires admin password).
- AnyDesk: uninstall or revoke unattended access.
- ARD: disable or tighten `ARD_AllLocalUsers` and legacy settings.
- TCC: revoke ChatGPT / Pocket accessibility if not intentional.
- Bluetooth: remove unknown devices.

Done when: All removals applied and verified.

---

## Phase 3 — Hardening (Post-remediation)

- Re-enable Wi-Fi if desired (reverses 2026-08-11 fix; re-test AirPlay scope).
- Enable FileVault full-disk encryption.
- Tighten SMB, Guest, and other service defaults.
- Document final state for future audits.

Done when: All hardening applied and current state documented.

---

## Phase 4 — Verification & Closure

- Run heartbeat check against known-good baseline (Appendix in CLAUDE.md).
- Verify no unauthorized access paths remain.
- Archive audit logs.
- Sign off.

Done when: Baseline met, logs archived, sign-off recorded.

---

## Files & Artifacts

| Item | Location | State |
|------|----------|-------|
| CLAUDE.md (global) | ~/.claude/CLAUDE.md | Reference; contains heartbeat baseline and prior incidents |
| This handoff | ~/Claude/Handoffs/2026-08-28_mac-mini-covert-audit_handoff_RC.md | Canonical |
| Audit logs (Aug 17-28) | Mini ~/Library/Logs (system) | In-flight; will be archived after Phase 4 |
| Pre-Aug-17 logs | Purged | Lost (intentional; no recovery) |

---

## Assumptions Carried Forward

1. **Automatic login state** (on) is not intentional; candidate for disable.
2. **AnyDesk incoming sessions** (Jul 28, Aug 12) need ownership confirmation; if not yours, revoke.
3. **TCC accessibility grants** to ChatGPT and Pocket are audit-flagged; need your intent call.
4. **Bluetooth devices** "Mr. Biggerstuff" / "Mr. BigStuff 17" are unknown; remove unless identified.
5. **Tamper window:** Aug 17-28 only; pre-Aug-17 logs gone and no recovery attempted.
6. **Confidence 85/100:** reflects clean tamper check + known log gaps.

---

## Needs from You Before Phase 2

1. **AnyDesk sessions (Jul 28, Aug 12):** were those yours? (yes/no)
2. **ChatGPT + Pocket TCC grants:** intentional or revoke? (keep/revoke)
3. **Bluetooth devices:** know "Mr. Biggerstuff" / "Mr. BigStuff 17"? (identify/remove)

---

## Stop Conditions

**Do not proceed past Phase 1 without:**
- Confirmation on all three items above.

**Do not proceed past Phase 2 without:**
- Verification that removed items are gone.
- No new unauthorized access paths created during remediation.

**Do not sign off (Phase 4) without:**
- Heartbeat check passes.
- Audit logs archived.

---

## Confidence Index

**85/100**

- **Why:** No unauthorized access found in Aug 17-28 window. Tamper check clean. Log pre-Aug-17 is gone and stated honestly.
- **Risk:** Three items require your confirmation; if any are yours/intentional, scope may expand. Pre-Aug-17 logs are unrecoverable.

---

## Startup Prompt for Next Session

```
Pick up the Mac mini covert audit handoff. Read this file and nothing else yet. 
Carry the assumptions forward. Confirm the three Phase 1 items (AnyDesk, TCC, 
Bluetooth), then proceed to Phase 2 (remediation) only after confirmation. 
Report progress after each phase completion. Don't redo Phase 1-3.
```
