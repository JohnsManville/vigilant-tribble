# Program Tracker — Odd Jobs / Mumford
**As of:** 2026-08-31 · Source of truth: `~/Claude/Handoffs/2026-08-31_master-status_handoff_RC.md` (full detail) · Companion: this tracker (scan view)

**Status legend:** ✅ Done · 🟢 On track · 🟡 In progress / at risk · 🔴 Blocked · ⚪ Dormant / not started
**Owner:** J = Jeff · C = Claude · X = external party (attorney, carrier, contractor)

## Dashboard
| Portfolio | ✅ | 🟢 | 🟡 | 🔴 | ⚪ | Total |
|---|---|---|---|---|---|---|
| Roswell cluster | 0 | 2 | 2 | 2 | 0 | 6 |
| FinRecon | 1 | 0 | 1 | 1 | 0 | 3 |
| Handled | 1 | 0 | 0 | 2 | 0 | 3 |
| Jobs & clients | 2 | 0 | 0 | 1 | 0 | 3 |
| Infrastructure / tooling | 5 | 3 | 1 | 9 | 0 | 18 |
| Smaller / dormant | 0 | 0 | 1 | 2 | 4 | 7 |
| **Total** | **9** | **5** | **5** | **17** | **4** | **40** |

**Critical path — the few blockers gating the most:**
1. **Jeff's own real-estate counsel** → gates the entire Roswell legal negotiation (T1) and the counter-proposal (T2, T4).
2. **Jeff confirms he has Purcell's status** (T14) → the one item that "outranks everything" per multiple handoffs; deadline already passed unnoticed.
3. **MacBook GitHub account key** (T17) → gates two-machine sync; also the reason the handoff mirror is mini-driven.
4. **The $8,837.38 double-count** (T2/T4) → gates the final Roswell money figure used in both the letter and the legal claim.
5. **Jeff's covert-audit stand-up/stand-down decision** (T16) → two unauthenticated services currently live on a shared family machine.

---

## Roswell cluster
*2870 SE Roswell St, Milwaukie — property transfer + insurance claim + renovation. Standing rule: nothing goes to Nancy, her attorney, or the carrier without Jeff's go.*

| ID | Thread | Summary | Status | Owner | Depends on | Next action |
|---|---|---|---|---|---|---|
| T1 | Property transfer negotiation (Nancy/Dale) | Counter-proposal drafted (v1.1); holding reply to Nancy's attorney written but unsent. | 🟡 | J→C | Jeff's own counsel; Dale to give escrow start date | **Jeff:** confirm counsel + approve reply. Then **Claude:** correct date to Aug 28, fill recipients, route for attorney review. Do not send. |
| T2 | Insurance claim (Safeco/CMG) | Coverage accepted; bathroom scope found ($8,837.38 paid); kitchen scope + one invoice missing. | 🟢 | T4 ($8,837 double-count); Peter Gowans (invoice) | **Claude:** pull the two Safeco PDFs; **Jeff:** email Peter Gowans for the $8,840 invoice + crew receipts. |
| T3 | Build — finish & occupy (incl. electrical) | Pre-drywall gate; new 9-circuit panel decided; permits dark; several finish picks open. | 🔴 | Jeff's 5 build decisions; vermiculite test; Milwaukie permits | **Jeff:** test vermiculite (safety gate), pick sink, book Rose City Labs clearance test, pull permit status, confirm grab-bar blocking. |
| T4 | Family letter + evidence ledger | Letter at v1.19 (3 fills); ledger v1.2; $20k repayment settled → balance **$38,921.38**. | 🟢 | Finish mini harvest; $8,837 double-count; GC hours | **Claude:** finish mini harvest → ledger; resolve double-count + GC hours. **Jeff:** paper the $15k HELOC draw. |
| T5 | FinRecon Roswell dataset load ("Deliverable G") | Schema ready (`claim_flag`, 345 tests); Roswell documents not yet loaded. | 🟡 | none (unblocked) | **Claude:** load the Roswell receipts/docs into `documents`, tagging claim/owner + room. |
| T6 | Fresno Family Timeline (confidential) | Private factual archive (WordPress + 2 Notion DBs); maintenance only. | 🟢 | Jeff (any more instances) | **Jeff:** confirm whether more instances belong on record; else dormant. Keep factual, never a "case." |

## FinRecon
*Python package `~/ClaudeBox/finrecon`; mini = system of record. Backs the Schedule C.*

| ID | Thread | Summary | Status | Owner | Depends on | Next action |
|---|---|---|---|---|---|---|
| T7 | Cash lane / 2024–25 tax reconstruction | 162-row cash worksheet ($45,741.39) built; ledger untouched, awaiting payee names. | 🔴 | Jeff (payee names) | **Jeff:** name payees, starting with the 29 crew-named rows. **Claude:** then run `seam-dedupe.sql` (53 dupes). |
| T8 | SimpleFIN seam defect + automation feed | Fixed & green; nightly sync loaded; 3 accounts unmapped. | ✅ | Jeff (3 accounts + loan schema) | **Jeff:** decide the 3 unmapped accounts + loan-account type. **Claude:** run the $1.50 coverage test. |
| T9 | Remote access / Mini sleep / victory-lap deck | UI live (tailnet-bound); sleep fixed; runbooks to merge, deck stale. | 🟡 | Jeff (Keychain "Always Allow") | **Claude:** merge the two runbooks; rebuild the deck vs current numbers. **Jeff:** one-time Keychain "Always Allow" on the Mini. |

## Handled
*Notion command center + Django job-to-cash app (`JohnsManville/handled`).*

| ID | Thread | Summary | Status | Owner | Depends on | Next action |
|---|---|---|---|---|---|---|
| T10 | Learning/AI Estimator | Built & green (296 tests), parked; 54 hour-rows won't import (no client mapping). | 🔴 | Jeff (site→customer mapping) | **Claude:** fix 3 spec lines + delete stale spec. **Jeff:** confirm the 54-row mapping; decide Phase 5/6b scope. |
| T11 | Django app (Square go-live / e-sign) | In prod (155 tests); Square go-live + e-sign blocked; holds 0 customers. | 🔴 | Jeff (Square go-live) | **Claude:** commit/stash + pull the dirty `handoff-clone`, retire the duplicate clone. **Jeff:** Square go-live decision. |
| T12 | Subcontractor module (Notion) | Roster of 12 live; work-queue closed; small items open. | ✅ | Jeff (2 rates, 1 delete, Fugate) | **Jeff:** set Gowans/Hainsworth rates, delete the holding page, decide Jeanie Fugate (~$1,000) collections. |

## Jobs & clients
| ID | Thread | Summary | Status | Owner | Depends on | Next action |
|---|---|---|---|---|---|---|
| T13 | Fairmount deposit (Josh Loerzel) | $3,000 deposit found already PAID (Aug 21); false "stuck link" alarm cleared. | ✅ | — | **None.** Next natural billing = labor + balance at substantial completion (materials cost +30% w/ receipts). |
| T14 | Purcell deck matter | Accounting done, attorney email sent 7/22; deadline passed unnoticed; status unknown. | 🔴 | Jeff (status); Anthony McNamer (reply) | **Jeff:** state where Purcell landed — settled / lapsed / live. This gates everything else; also confirm `odd-jobs.org/purcell` is down (OEC 408). |
| T15 | DGUTS '26 raft trip | Site live, Worker deployed; trip (Aug 12–16) has passed; Form never edited. | ✅ | — | **None for 2026** (trip over). Next year: one site redeploy + edit the Google Form. Keep as template. |

## Infrastructure / tooling
*Governed by the ClaudeBox custody charter (T26): custody before capability; mini = source of truth.*

| ID | Thread | Summary | Status | Owner | Depends on | Next action |
|---|---|---|---|---|---|---|
| T16 | Mac mini covert audit + tripwire/canary | Forensics clean; Jeff armed Phase 2 → 2 unauthenticated services live, no reboot persistence. | 🔴 | Jeff (4 confirmations + keep/stand-down) | **Jeff:** answer 4 Phase-1 questions + decide keep vs stand-down. **Claude:** rebind `:8765` to loopback + token, or tear down. Rotate the burned token either way. |
| T17 | Two-machine sync (lanes + GitHub key) | rsync lane healthy; GitHub lane blocked (MacBook has deploy-key-only auth). | 🔴 | Jeff (add MacBook account key); laptop online | **Jeff:** bring laptop online, add MacBook pubkey at github.com/settings/keys. **Claude:** flip 5 remotes HTTPS→SSH. |
| T18 | Session-mgmt / evening-sweep / morning-open | End-to-end pipeline done (capture→distill→handoff→brief→morning). | ✅ | — | **Monitor.** 19 "missing" registry rows are a Cowork API limit, not a bug — no action. |
| T19 | SSD keys mirror / API key rotation | SSD + mirror done; OpenAI key rotation stuck since 7/30 (scripts dead). | 🔴 | Jeff (2-min key fix) | **Jeff:** create OpenAI key `claudebox-mini`, store via `security add-generic-password … -w "$(pbpaste)"`, verify 200, revoke orphan; also Apple-Notes key + Mini password. |
| T20 | Time Machine repair + disk offload | TM recovered; 24 GB offloaded; monitor built. | ✅ | Jeff (empty Trash); T31 (2nd drive) | **Jeff:** empty Trash (~24 GB); decide Voice Memos/Movies/Pictures. Offload is single-copy until the 2nd drive (T31) is detected. |
| T21 | Cloud-brief sanitizer | Built then orphaned by "keep it local" pivot; surfaced the E-106 no-Drive-sync gap. | 🔴 | Jeff (disposition) | **Jeff:** was "keep it local" permanent? **Claude:** if dormant, add unwired header comment. (E-106 gap now fixed by T35.) |
| T22 | iMessage export tool | CLI export done; iCloud attachment download unsolved. | 🔴 | Jeff (lifted the hold) | **On hold per Jeff.** Resume via AppleScript AX to drive the Messages download control. |
| T23 | Jeff-voice / Robo-Jeff corpus | Corpus + voice docs done; session self-closed. | ✅ | Jeff (share decks) | **Jeff:** share the two voice-test decks with WRITE access — Rusty currently holds a dead (404) link. |
| T24 | Mini display resets / Screen Sharing | Root cause found + fixed (Screen Sharing High-Perf virtual display). | ✅ | — | **Monitor.** Recovery ladder documented; any new `ResetCounter` file = recurred. |
| T25 | WhipDesk remote-access setup | Running on the Mini; auto-start on boot not yet installed. | 🟡 | Jeff at the Mini (GUI) | **At the Mini:** install `com.whipdesk.agent.plist`, bootstrap, grant Screen Recording/Accessibility, enable auto-login. |
| T26 | ClaudeBox custody charter (G1–G5) | Foundational governance; the "TM off since 7/23" finding drove custody-first. | 🟢 | — | **Ongoing frame,** not a task. Its driving risk is closed via T20. Kari = Covenant arbiter. |
| T27 | Cowork files organization | 5-folder scheme proposed for 9 Ungrouped chats; Claude can't touch the sidebar. | 🔴 | Jeff (manual drag + 3 answers) | **Jeff:** answer the 3 questions and drag the 9 conversations into folders. |
| T28 | mac-sync skill + CONNECTIONS.md | Skill built atop authoritative CONNECTIONS.md; 4 agents documented. | ✅ | — | **None** beyond the loan-account schema (tracked under T8). |
| T29 | AI_ERROR_LOG fork / duplicate IDs | Append-only log forked across machines; duplicate E-numbers. | 🔴 | — (needs a careful hand-merge) | **Claude:** hand-merge + renumber the two forks; **do NOT scp-sync** either direction. Interim: cite entries by date+title. |
| T30 | Account transition (off personal org) | Staged since 8/06; go/no-go undecided. | 🔴 | Jeff (go/no-go) | **Jeff:** decide whether to proceed with the account/org transition. |
| T31 | Second 2 TB drive detection | New backup drive doesn't enumerate (both ports "no device"). | 🔴 | Hardware (Jeff to try) | **Jeff:** try a different cable/port/power; if still dead, the drive/enclosure may be faulty. Blocks 2nd-copy backup (T20/T33). |
| T32 | Covenant intel dispute (135 MB) | 51 intel files on the MacBook contested; static ~14+ days. | 🔴 | Kari (tiebreak) | **Jeff/Kari:** get Kari's tiebreak on whether the 51 files stay. |
| T33 | `archives/` (~32 GB) backup gap | 32 GB single-copy on the TM-excluded ClaudeData volume. | 🔴 | Jeff (method choice); T31 | **Jeff:** choose targeted TM inclusion vs rsync to ClaudeBoxSSD. Do NOT un-exclude the whole volume (Covenant Gate 5). |
| T35 | Handoff-sync mirror + EOD routine (this session) | Mini-driven mirror installed & running; 5pm PT routine set; empty until first sync (now done). | 🟢 | DST (Nov cron shift) | **Claude:** confirm tomorrow's 5pm run reads a fresh mirror. **Nov:** shift cron `0 0`→`0 1 * * *` when PT leaves DST. |

## Smaller / dormant
| ID | Thread | Summary | Status | Owner | Depends on | Next action |
|---|---|---|---|---|---|---|
| T34 | Three remoteless repos | `campingteam-site`, `imsg`, `Sea Ray Trainer` have no GitHub remotes. | ⚪ | — | **Claude:** create a GitHub remote for each so they enter the sync lanes. |
| T36 | Bitsies Scene Builder (client John) | Live in prod but blocked on missing factory-doc assets. | 🔴 | Client (assets) | **Jeff:** get `support.js`, `sample-flat.jpeg`, `sample-loop.jpeg` from John. |
| T37 | Us — A Reflection Game | Built; link codes unsent. | 🔴 | Jeff (send codes) | **Jeff:** send Kari's link code (HXCYAM) and Laura's (MYRDRA), or shelve it. |
| T38 | Mumford Week Plan | Family schedule site in prod; low movement. | 🟡 | Jeff (Laura's bug + overnights) | **Claude:** reproduce Laura's changes-tab bug; **Jeff:** decide the overnights proposal. |
| T39 | Sea Ray Trainer | Split into its own repo; no further detail captured. | ⚪ | Jeff (scope) | **Jeff:** say what this is / whether it's active; give it a remote (see T34). |
| T40 | Bills / overdue-bills Gmail sweep | `BILLS_STATE_AND_HANDOFF.md` exists but is stale (Aug 23). | ⚪ | Jeff (priorities) | **Claude:** re-run the bills sweep to refresh state; **Jeff:** decide which overdue accounts to act on (HD Pro Xtra, USAA, Milwaukie utility, OHSU/Legacy medical). |

---
*Tracker regenerated alongside the master status doc. Full narrative, money figures, and the consolidate/consistency check live in `2026-08-31_master-status_handoff_RC.md`.*
