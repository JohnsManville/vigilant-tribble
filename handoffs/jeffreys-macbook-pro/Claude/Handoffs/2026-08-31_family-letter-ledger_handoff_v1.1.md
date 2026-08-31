# HANDOFF: Family Letter + Evidence Ledger + Mini Harvest
**Date:** 2026-08-31 | **Version:** v1.1 | **Supersedes:** 2026-08-31_family-letter-ledger_handoff_RC.md (companion track to ~/Claude/Roswell/legal/ on the MacBook, which is NOT this handoff's scope)

## Present State
- **Letter to Mom (truth copy) v1.19**: complete except three fills. Durable at MACBOOK `~/Claude/Family/letter-to-mom-truth-copy-v1.19.md` (clean copy) and as a chat card (annotated copy with figure sources and change log).
- **Evidence ledger v1.1**: chat card `family-evidence-ledger-v1.1.md` only. Not yet on disk.
- **$20k repayment**: RESOLVED on the facts, one document still to pull. $15,000 HELOC draw (payee Nancy, confirmed by Jeff 2026-08-31) + $5,000 Chase 2026-06-01 to CHK ...2585. Working outstanding balance: **$38,921.38**. Full detail in MACBOOK `~/Claude/Roswell/legal/2026-08-31_20k-repayment-resolution_RC.md` (updated with the Shellpoint statement facts).
- **HELOC statement obtained and read** (Laura's Aug 30 email, subject "HELOC"): Shellpoint (was CMG; loan sold ~Jul 30), loan 0697312494, secured on Malcolm, limit $75,000, principal balance $73,790.37, available $1,209.63, APR 8.09%, interest-only $507.16/mo, YTD finance charges $732. Extracted PDF existed only in the cloud workspace (wiped at session end) but the original lives in Gmail permanently.
- **Mac mini harvest**: partially complete. /tmp/harvest1.txt on the mini WAS read: zero HELOC hits in the message jsonl; Amazon order rows captured (candidate Ring order ASINs with ship-to Malcolm, dates incl. 2026-05-28, 2025-07-19); bk_download.csv confirmed as USAA export incl. the $15,000 Mobile Deposit 2025-09-22; mini's monthly-statement.pdf is a Cash App statement, not the HELOC; laura_export family group-chat text files enumerated. NOT yet mined: the laura_export group chats (esp. "Grandma & Portland Mumfords - 137.txt"), CallHistory.storedata, the HWA/Hog Wild iCloud folder, USAA 2026 statement PDFs.

## Compacted Context
Jeff is writing a no-holds-barred letter to his mother Nancy about six years of the Roswell house (2870 SE Roswell St, Milwaukie: bought 2020 for her, refi 2022 under Jeff+Nancy, Laura on deed, mold loss June 2025, Jeff acting GC). Companion evidence ledger documents everything. Sweeps already run: Gmail (all family), full MacBook iMessage chat.db (433k messages, decoded), Kelsey Dobrenz, Rusty Olds, Patrick Todd, Nancy threads, FinRecon SQLite, CMG/Shellpoint HELOC email trail.

**Cast and handles**: Nancy (Mom) +1-503-333-0720, mumford.nancy@gmail.com. Julie +1-503-327-9808. Diana (Gregg) +1-503-830-9494. Tracy +1-503-799-2908 (Minneapolis). Laura +1-503-709-9395. Kelsey Dobrenz +1-408-398-8335 (chosen sister). Rusty Olds +1-971-277-8021 (chosen brother). Patrick Todd +1-651-788-1833 (Nancy's partner, holds her POA since Jul 26).

**Documented final-chapter timeline** (full table in ledger): May 29 good-faith email, Jul 19-22 Patrick doing his own repairs at Roswell, Jul 24-26 Patrick pressing "the plan for the Roswell property" lunches, Jul 26 Patrick: "Your mom transferred her Power of Attorney from Julie to me", Aug 4-6 Jeff+Laura cancel her tenancy, Aug 11 first Dale proposal, Aug 28 Jeff to Nancy: "I'm not sure I wanna talk to you again", ~Aug 30 revised terms.

**Corrections the record forced (do not reintroduce)**: the June 2025 rehab was Laura's (Betty Ford, Newberg, Jun 16, 2025); no Diana rehab anywhere in texts, letter uses the documented summer 2025 Diana rupture and Mom's "hurting because her baby Diana is hurting". "Unsafe" story: summer 2025 to June 2026, originated in Laura's family (Jessica); letter says "this last year". Diana's Lucy-birth admission is verbal, letter says "to my face". Jeff and Laura are very much together, write them as a unit.

**Money figures (letter and counter-proposal MUST match)**: $32,998.09 Jeff's corrected documented spend; $59,771.38 Nancy bridge advances, $850 repaid 2026-05-22, $20,000 repaid ($15k HELOC + $5k Chase), working balance $38,921.38; 86 documented working days since the loss at $128/hr ("north of sixty grand", 6 hr/day conservative). NEW for Section 5 carrying costs: the near-maxed $75k HELOC at 8.09% costs $507.16/mo; the Roswell-attributable share of draws is claimable. Open swing: account ...2585 also SENT Jeff $24,269 (Dec 23 2025 $9,269; Jan 26 2026 $10,000, same day as a $10,000 bridge Zelle, possible double-count; Apr 13 2026 $5,000). Identify whose account ...2585 is before asserting any balance anywhere.

**Access and technique notes**: Desktop Commander runs a real shell on the MACBOOK with full disk (chat.db, ~/ClaudeBox/finrecon/data/finrecon.db, ~/Claude/). The Cowork device-bridge folder tools cannot see ~/Claude; use Desktop Commander for anything under it. Mini reachable via `ssh mini` from the MacBook (Tailscale; user jeffmumfordmacmini; both machines have ~/Claude and ~/ClaudeBox). Gmail attachments: no attachment tool exists, but `get_message` with messageFormat RAW returns the full MIME; decode in the cloud with python email + base64 (worked for the 224KB HELOC PDF). iMessage attributedBody decode: find b'NSString' then b'+', length byte or 0x81 + 2-byte LE.

## Decided (do not re-litigate)
- Letter goal: make her understand the toll; money/terms included; laid thick. Jeff chose all three.
- Money paragraph leads with LABOR and owns Nancy's bridge loans in one sentence; "paid the least" became "thanked the least". Reason: her attorney holds the same ledger.
- Final chapter pivots on the Patrick POA transfer, not letterhead-from-nowhere.
- Diana rehab sentence stays out unless Jeff supplies a date. Lucy-birth admission reads "to my face".
- No em dashes in anything written as Jeff. One dry-humor line max in the letter.
- Truth copy vs send copy are separate deliverables; any send waits for deed sequencing (rekey, escrow close, kids policy with Laura, Laura's full read).
- The $20k is settled at $15k HELOC + $5k Chase; do not reopen the amount, only finish the paperwork.

## Do not redo
Gmail per-person sweeps; MacBook chat.db keyword sweeps (shotgun, rehab, unsafe, Minneapolis, mediat, my place, terrible sister); Kelsey/Rusty/Patrick/Nancy thread mines; FinRecon 2585/15k/20k queries; HELOC email trail; the jsonl HELOC grep (zero hits); reading /tmp/harvest1.txt (done, contents summarized above); extracting the Shellpoint statement (facts recorded in the resolution note).

## Files
| File | Where | State |
|---|---|---|
| letter-to-mom-truth-copy-v1.19.md | MACBOOK ~/Claude/Family/ + chat card | needs 3 fills: Greggs list, Julie list, closing phrase |
| family-evidence-ledger-v1.1.md | chat card only | current through Patrick/Nancy mine; not on disk |
| 2026-08-31_20k-repayment-resolution_RC.md | MACBOOK ~/Claude/Roswell/legal/ | updated with Shellpoint facts + payee confirmation |
| HELOC Monthly Statement.pdf | Gmail, Laura's Aug 30 "HELOC" email (msg 1a0559ed3c8fa1a7) | durable in Gmail; re-extract via get_message RAW if needed |
| /tmp/harvest1.txt | mini | read; may be cleared by reboot, contents already summarized |
| This handoff | MACBOOK ~/Claude/Handoffs/ + chat card | canonical |

## Open questions for Jeff
1. The two bracketed lists: what he did for the Greggs and for Julie's girls, specifics.
2. The closing phrase (placeholder "To the moon and back, even now").
3. Whose account ends ...2585, and were its three inflows ($24,269) from Nancy or already counted?
4. Did Diana ever actually go to rehab, and when?
5. Destination call: truth copy only, send to Mom, or split versions.

## Phased Pickup Plan
**Phase 1** (light) Finish the mini mine: `ssh mini` and read the laura_export family group chats, starting with "Grandma & Portland Mumfords - 137.txt" and the +15033279808/+15037992908/+15033330720 combinations (base dir `/Volumes/ClaudeData/archives/mini-offload-20260826/iCloud Drive (Archive)/Desktop/laura_export/`). Hunt: ownership-story claims by Nancy, corrections by Jeff, kindness receipts. Done when: findings reported.
**Phase 2** (heads-up, a dozen SSH calls) Mine mini CallHistory.storedata (ZCALLRECORD, Apple epoch) for family calls; inventory ~/Library/Mobile Documents/com~apple~CloudDocs/Personal/HWA/ for Hog Wild-era documentation of Jeff's role and the Tracy/Diana hires; match the candidate Amazon ASINs (B0C7LFKWB7 shipped 2026-05-28, B0CT94D1BB 2025-07-19, etc.) against Ring products for the camera receipt. Done when: ledger v1.2 written to MACBOOK ~/Claude/Family/ and sent as a card.
**Phase 3** (light) Paper the $20k: pull the May/June Shellpoint (or CMG Flex) draw history or check image showing the $15,000 to Nancy; get Jeff's answer on ...2585; update the resolution note and the counter-proposal Section 5 accordingly. Done when: one defensible balance number exists with documents behind it.
**Phase 4** (heads-up) Cut letter v2.0: fold in Jeff's two lists, closing phrase, harvest gold. Save to ~/Claude/Family/ and send card. Done when: no brackets remain and figures match the legal track.
**Phase 5** (ask first) Only on Jeff's explicit go: produce send version(s) per the sequencing plan. Done when: Jeff has final copies and made the send/hold call himself.
**Stop conditions:** anything leaving for family or attorneys needs Jeff's explicit go and Laura's read; resolve ...2585 before any balance number is used anywhere; if Jeff's messages shift from anger toward something heavier, stop the production line and check in first.

## Assumptions
1. One handoff for letter + ledger + harvest; the legal negotiation track keeps its own files and pointers.
2. The letter remains a truth copy until Jeff says otherwise.
3. Mini paths stable; ClaudeData volume mounted.

## ADDENDUM (same day, after v1.1 was cut): parallel-session updates that supersede lines above
- Open question 3 is ANSWERED: account ...2585 is Jeff's own Chase account with Nancy as a signer, not owner. The Jun 1 $5,000 into it was passed on to Nancy and counts as repayment. Its other three movements are Jeff's own money, not additional Nancy loans.
- The evidence ledger was REBUILT on disk by a parallel session: MACBOOK ~/Claude/Roswell/legal/family-evidence-ledger-v1.2_REBUILT.md. Treat that as current instead of the chat-card v1.1. Its open items: locate CMG check #00001432 photo, resolve a possible $8,837.38 double-count, then the GC hours reconstruction (needs Jeff's go).
- Balance $38,921.38 now stands on both repayment legs settled.
