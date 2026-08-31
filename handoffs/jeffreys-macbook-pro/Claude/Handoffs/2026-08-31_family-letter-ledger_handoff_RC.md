# HANDOFF: Family Letter + Evidence Ledger + Mini Harvest
**Date:** 2026-08-31 | **Version:** RC | **Supersedes:** none (companion track to ~/Claude/Roswell/legal/, which has its own files and is NOT this handoff's scope)

## Present State
- **Letter to Mom (truth copy) v1.19**: complete except three fills. Delivered as chat file card `letter-to-mom-truth-copy-v1.19.md`. Cloud copy will be wiped; canonical copy needs to land in ~/Claude on the MacBook.
- **Family evidence ledger v1.1**: same status, chat card `family-evidence-ledger-v1.1.md`.
- **Mac mini harvest**: launched, interrupted when the MacBook bridge dropped. Results file waiting at `/tmp/harvest1.txt` ON THE MINI. Read it first.
- **$20k repayment question**: resolved on Jeff's word, partially verified. Note written to MacBook at `~/Claude/Roswell/legal/2026-08-31_20k-repayment-resolution_RC.md`.

## Compacted Context
Jeff is writing a no-holds-barred letter to his mother Nancy about six years of the Roswell house (2870 SE Roswell St, Milwaukie: bought 2020 for her, refi 2022 under Jeff+Nancy, Laura on deed, mold loss June 2025, Jeff acting GC). Companion evidence ledger documents everything. Deep sweeps already run: Gmail (all family), full iMessage chat.db on the MacBook (433k messages, decoded from attributedBody blobs), Kelsey Dobrenz, Rusty Olds, Patrick Todd, and Nancy threads, FinRecon SQLite, CMG HELOC email.

**Cast and handles** (verified from Contacts/threads): Nancy (Mom) +1-503-333-0720, mumford.nancy@gmail.com. Julie +1-503-327-9808. Diana (Gregg) +1-503-830-9494. Tracy +1-503-799-2908 (Minneapolis). Laura +1-503-709-9395. Kelsey Dobrenz +1-408-398-8335 (chosen sister). Rusty Olds +1-971-277-8021 (chosen brother). Patrick Todd +1-651-788-1833 (Nancy's partner, now holds her POA).

**Documented final-chapter timeline** (full table in ledger v1.1): May 29 good-faith email, Jul 26 Patrick: "Your mom transferred her Power of Attorney from Julie to me" after doing his own repairs at Roswell Jul 19-22, Aug 4-6 Jeff+Laura cancel her tenancy (Jeff to Rusty: "My Mom tried to fuck with me for the last time"), Aug 11 first Dale proposal, Aug 28 Jeff to Nancy: "I'm not sure I wanna talk to you again", ~Aug 30 revised terms.

**Corrections the record forced into v1.18/19** (do not reintroduce the errors): the June 2025 rehab was Laura's (Betty Ford, Newberg, checked in Jun 16, 2025), no Diana rehab exists anywhere in texts, so the letter uses the documented Diana rupture instead (June 2025 blowup, "get the fuck off my property", Mom: "hurting because her baby Diana is hurting"). The "unsafe" story dates summer 2025 to June 2026 and started in Laura's family (Jessica), letter says "this last year". Diana's Lucy-birth terrible-sister admission is verbal only, letter says "to my face". Jeff and Laura are very much together; write them as a unit.

**FinRecon figures now in the letter (must stay matched to the counter-proposal):** $32,998.09 corrected documented spend by Jeff; $59,771.38 Nancy bridge advances, $850 repaid 2026-05-22; 86 documented working days since the loss; $128/hr; "north of sixty grand" labor (86d x ~6h x $128, deliberately conservative). $20k repayment = $15,000 CMG Flex HELOC draw (loan #111677504415027 / NFT0000005594, Laura+Jeff, funding ~May 18-19, 2026, amount/payee NOT yet documented) + $5,000 Chase checking Jun 1, 2026 "Online Transfer to CHK ...2585". If confirmed: $38,921.38 outstanding to Nancy. Account ...2585 UNIDENTIFIED and also sent Jeff $24,269 total (Dec 23 2025 $9,269; Jan 26 2026 $10,000 SAME DAY as a $10,000 bridge Zelle, possible double-count; Apr 13 2026 $5,000). This swings the balance up to $34k either direction.

**Access that works:** Desktop Commander on the MacBook has full disk (chat.db, FinRecon at ~/ClaudeBox/finrecon/data/finrecon.db, ~/Claude/Roswell/). Mini reachable from MacBook via `ssh mini` (Tailscale, key configured). Mini holds: ~/ClaudeBox/finrecon (canonical), Amazon Order History.csv, USAA statement PDFs in ~/Downloads, family group-chat text exports at `/Volumes/ClaudeData/archives/mini-offload-20260826/iCloud Drive (Archive)/Desktop/laura_export/` (incl. "Grandma & Portland Mumfords - 137.txt"), full message export jsonl at `/Volumes/ClaudeData/intel/raw/backfill/messages-history-through-2026-07-09.jsonl` (zero HELOC hits confirmed), CallHistory.storedata, Hog Wild era financials at `~/Library/Mobile Documents/com~apple~CloudDocs/Personal/HWA/`. attributedBody decode trick: find b'NSString' then b'+', length byte or 0x81+2-byte LE.

## Decided (do not re-litigate)
- Letter goal: make her understand the toll; include money/terms; laid thick (Jeff chose all three explicitly).
- Money paragraph leads with LABOR, owns Nancy's bridge loans in one sentence. Reason: "I paid for everything" dies against her attorney's copy of the ledger. "Paid the least" became "thanked the least" for the same reason.
- $20k repayment stays OUT of the letter until documented.
- Diana rehab sentence stays OUT unless Jeff supplies a date the record lacks.
- Final chapter pivots on the Patrick POA transfer, not letterhead-from-nowhere. Truer and stronger.
- No em dashes anywhere in Jeff's letter. One dry-humor line max.
- Truth copy vs send copy are separate deliverables; send version waits for deed sequencing (rekey, escrow close, kids policy, Laura's full read).

## Do not redo
Gmail per-person sweeps; MacBook chat.db keyword sweeps (shotgun, rehab, unsafe, Minneapolis, mediat, my place, terrible sister: all done, results in ledger); Kelsey/Rusty/Patrick/Nancy thread mines; FinRecon 2585/15k/20k queries; HELOC email verification; the jsonl HELOC grep (zero hits).

## Files
| File | Where | State |
|---|---|---|
| letter-to-mom-truth-copy-v1.19.md | chat card (cloud copy wiped at session end) | needs 3 fills: Greggs list, Julie list, closing phrase |
| family-evidence-ledger-v1.1.md | chat card (cloud copy wiped) | current through the Patrick/Nancy mine |
| 2026-08-31_20k-repayment-resolution_RC.md | MacBook ~/Claude/Roswell/legal/ | durable |
| /tmp/harvest1.txt | MINI, unread | read first on reconnect |
| Deep-sweep prompt v1.1 | chat text only | superseded by work already done in-session |

## Open questions for Jeff
1. The two bracketed lists: what he did for the Greggs and for Julie's girls, specifics.
2. The closing phrase (placeholder "To the moon and back, even now").
3. Whose account ends ...2585, and were its three inflows from Nancy?
4. Pull the $15k draw statement from flexheloc.cmghomeloans.com.
5. Did Diana ever actually go to rehab, and when?
6. Destination call: truth copy only, send to Mom, or split versions.

## Phased Pickup Plan
**Phase 1** (light) Confirm MacBook bridge is up (any Desktop Commander call). `ssh mini 'cat /tmp/harvest1.txt'`, report findings (2585 hits, Amazon Ring order, bk_download.csv, monthly-statement.pdf, laura_export listing). Done when: harvest1 contents reported to Jeff.
**Phase 2** (heads-up) Finish the mini harvest (rough cost: a dozen SSH calls): read "Grandma & Portland Mumfords - 137.txt" and the family group export for ledger material; grep Amazon Order History.csv for the Ring order (date + ship-to = the morning-after proof); mine CallHistory.storedata (ZCALLRECORD; Apple epoch) for family calls; inventory ~/.../HWA/ for Hog Wild-era proof of Jeff's role; strings the USAA 2026 statement PDFs for the HELOC deposit and 2585. Done when: ledger v1.2 delivered with new entries.
**Phase 3** (light) Close the $20k: Jeff logs into the Flex HELOC portal, capture the draw statement; Jeff answers ...2585. Update the resolution note and flag Section 5 of the counter-proposal accordingly. Done when: outstanding-balance number is single and defensible.
**Phase 4** (heads-up) Cut letter v2.0: fold in Jeff's two lists, closing phrase, any harvest gold. Done when: no brackets remain and figures still match the legal track.
**Phase 5** (ask first) Only on Jeff's explicit go: produce the send version(s) per the sequencing plan (deed recorded or signed, rekeying done, kids policy set with Laura, Laura's full read). Done when: Jeff has final copies and has made the send/hold call himself.
**Stop conditions:** anything leaving for family or attorneys needs Jeff's explicit go and Laura's read; if the ...2585 answer moves the balance materially, sync the legal track before any number is used anywhere; if Jeff's messages shift from anger toward something heavier, stop the production line and check in with him first.

## Assumptions
1. One handoff covering letter + ledger + harvest; the Roswell legal negotiation keeps its own files in ~/Claude/Roswell/legal/.
2. The letter remains a truth copy until Jeff says otherwise.
3. Mini paths are stable; ClaudeData volume stays mounted.
