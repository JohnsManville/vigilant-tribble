# Master Status — All Threads Consolidated

**Compiled:** 2026-08-31 · Release Candidate
**Sources:** every file in `~/Claude/Handoffs/` (9), `~/ClaudeBox/handoffs/` incl. `archive/` (48), and status notes under `~/Claude/Roswell/legal/` and `/build/` (17) — pulled live from the MacBook Pro (`jeffmumford@Jeffreys-MacBook-Pro`), which is canonical for the Roswell/legal thread. The Mac mini holds a parallel, thinner copy of some of these.
**How to read this:** organized by thread, not by session. Overlapping handoffs are merged into one picture. Where two handoffs disagree, the newest timestamp is trusted and the conflict is logged in the Consolidate Check at the end. Dollar figures and dates in the Roswell/legal section are legal-grade — the newest authoritative value is used and older values are flagged, not silently dropped.

**Collision resolved:** the two files named `2026-08-31_roswell_handoff_v1.2.md` are different documents. The `~/Claude/Handoffs/` copy is authoritative (has Dale's full contact block, both letters transcribed, the full money picture). The `~/ClaudeBox/handoffs/` copy was written by a session blind to `~/Claude` that wrongly declared itself canonical; it is superseded. The only fragment in it not captured elsewhere is a mention of a possible separate tort claim against Nancy via an attorney named "Anthony" — flagged for Jeff, unconfirmed.

---

## 1. MANIFEST

Status key: **not started / in progress / blocked (on Jeff or external) / done**.

### Roswell cluster
| # | Thread | Status | Last activity |
|---|--------|--------|---------------|
| 1 | Roswell — property transfer negotiation (Nancy / Dale) | in progress (reply drafted, unsent) | 2026-08-31 |
| 2 | Roswell — insurance claim (Safeco / CMG) | in progress | 2026-08-31 |
| 3 | Roswell — build / finish & occupy (incl. electrical) | blocked on Jeff decisions | 2026-08-31 |
| 4 | Family letter to Nancy + evidence ledger | in progress (letter v1.19, ledger v1.2) | 2026-08-31 |
| 5 | Roswell FinRecon dataset load ("Deliverable G") | in progress (schema ready, data not loaded) | 2026-08-23 |
| 6 | Fresno Family Timeline (confidential) | in progress / maintenance | 2026-08-31 |

### FinRecon
| # | Thread | Status | Last activity |
|---|--------|--------|---------------|
| 7 | FinRecon — cash lane / 2024–25 tax reconstruction | blocked on Jeff (payee names) | 2026-08-23 |
| 8 | FinRecon — SimpleFIN seam defect + automation feed | done (feed fixed & green); 3 accounts open | 2026-08-23 |
| 9 | FinRecon — remote access / Mini sleep / victory-lap deck | in progress (runbooks to merge, deck stale) | 2026-08-23 |

### Handled
| # | Thread | Status | Last activity |
|---|--------|--------|---------------|
| 10 | Handled — Learning/AI Estimator | blocked on Jeff (site→customer mapping) | 2026-08-23 |
| 11 | Handled — Django app (Square go-live / e-sign) | blocked on Jeff | 2026-08-02 |
| 12 | Handled — Subcontractor module (Notion) | done / maintenance | 2026-08-13 |

### Jobs & clients
| # | Thread | Status | Last activity |
|---|--------|--------|---------------|
| 13 | Fairmount deposit (Josh Loerzel) | done (paid 2026-08-21) | 2026-08-23 |
| 14 | Purcell deck matter | blocked / on hold (status unknown — ask Jeff) | ~2026-08-23 |
| 15 | DGUTS '26 raft trip (campingteam.us) | done bar one tail action; Form never edited | ~2026-08-02 |

### Infrastructure / tooling / meta
| # | Thread | Status | Last activity |
|---|--------|--------|---------------|
| 16 | Mac mini covert security audit + tripwire/canary | in progress — armed, blocked on Jeff | 2026-08-29 |
| 17 | Two-machine sync (lanes + GitHub key) | blocked (laptop online + Jeff's key add) | 2026-08-23 |
| 18 | Session-management / evening-sweep / morning-open | done (end-to-end 2026-08-28) | 2026-08-28 |
| 19 | SSD keys mirror / API key rotation | blocked on Jeff (OpenAI key, 2-min fix) | 2026-08-23 |
| 20 | Time Machine repair + disk offload | largely done; Trash-empty pending Jeff | 2026-08-26 |
| 21 | Cloud-brief sanitizer | orphaned (keep-it-local pivot) — Jeff's disposition | 2026-08-28 |
| 22 | iMessage export tool | on hold per Jeff | 2026-08-23 |
| 23 | Jeff-voice / Robo-Jeff corpus | done; Rusty share pending Jeff | 2026-08-28 |
| 24 | Mini display resets / Screen Sharing | done (2026-08-13) | 2026-08-23 |
| 25 | WhipDesk remote-access setup | in progress (launchd auto-start pending) | undated |
| 26 | ClaudeBox custody charter / restatement (G1–G5) | foundational (informs all infra) | 2026-08-11 |
| 27 | Cowork files organization (sidebar folders) | blocked on Jeff (manual drag) | 2026-08-31 |
| 28 | mac-sync skill + CONNECTIONS.md | done | 2026-08-23 |
| 29 | AI_ERROR_LOG fork / duplicate IDs | blocked (hand-merge; do not sync) | 2026-08-23 |
| 30 | Account transition (off personal org) | blocked, undecided | 2026-08-23 |
| 31 | Second 2 TB drive detection | blocked (hardware) | 2026-08-28 |
| 32 | Covenant intel dispute (135 MB on MacBook) | blocked (Kari's tiebreak) | 2026-08-23 |
| 33 | `archives/` (~32 GB) backup gap on ClaudeData | blocked on Jeff | 2026-08-28 |
| 34 | Three remoteless repos (campingteam / imsg / Sea Ray) | open (need GitHub remotes) | 2026-08-23 |
| 35 | Handoff-sync mirror + end-of-day routine (this session) | in progress (repo built; sync not yet on Macs) | 2026-08-31 |

### Smaller / dormant
| # | Thread | Status | Last activity |
|---|--------|--------|---------------|
| 36 | Bitsies Scene Builder (client John) | blocked (missing factory-doc assets) | ~2026-08-02 |
| 37 | Us — A Reflection Game | blocked on Jeff (send link codes) | ~2026-08-02 |
| 38 | Mumford Week Plan (family schedule) | in progress, low movement | ~2026-08-02 |
| 39 | Sea Ray Trainer | exists (split to own repo); no detail | 2026-08-23 |
| 40 | Bills / overdue-bills Gmail sweep | in progress (BILLS_STATE stale) | ~2026-08-23 |

---

## 2. THREAD STATUS + PHASED PLANS

### ROSWELL CLUSTER

The center of gravity across the whole corpus. 2870 SE Roswell St, Milwaukie OR: bought 2020 for Jeff's mother Nancy, refinanced 2022 under Jeff + Nancy (Laura on deed), mold/water loss June 2025, Jeff acting as GC. Three intertwined problems: (1) Nancy's attorney wants to transfer the property to Jeff + Laura on terms; (2) an under-paid Safeco insurance claim; (3) a half-finished renovation that has to pass inspection and be occupied. A companion "family letter" track is emotional, not legal. Standing order across all of it: **nothing is sent to Nancy, her attorney, or the carrier without Jeff's go, and the counter-proposal's Section 5 must not go out as written.**

---

#### Thread 1 — Roswell property transfer negotiation (Nancy / Dale)
**Status (one line):** Counter-proposal drafted through v1.1 and a holding reply to Nancy's attorney is written but UNSENT, pending Jeff's own real-estate counsel and his go-ahead.

**Key decisions**
- Do not reply to Nancy's attorney or confirm any term in writing until Jeff has independent counsel. Elliott Dale represents Nancy, not Jeff.
- Posture is a hard anchor with a three-option ladder (A: 12 escrow payments + vacate Mar 1 2027; B: 9 + Dec 1 2026; C: 6 + Oct 1 2026), not a single demand to restore the original 12 months. Protect the **vacate date**, not the payment count; Option C (Oct 1 vacate) best lines up with the October reno target.
- The deed change (quitclaim → bargain-and-sale) is a mild improvement for Jeff (implied covenant against grantor encumbrances); the substantive hit is the escrow cut from 12→6 months (~$11,466 at ~$1,911/mo shifted onto Jeff, and the carrying date pulled 6 months forward).
- No psychiatric characterization of any named third party in any document (defamation exposure).
- The wrist injury is not a claim against Nancy — it belongs in the lost-time / GC-hours case.

**Open items**
- Holding reply to Dale (`legal/2026-08-31_reply-to-dale_RC.md`): six questions, each a request for a fact/document (escrow start date; escrow agent + deed location; deed executed/deposited?; escrow instructions copy; exact monthly payment + which loan — resolves the $1,911 vs $2,246.17 ambiguity; does the offer carry an expiration). Still says "revised terms dated August 30" — needs correction to **Aug 28**.
- Counsel packet (`legal/2026-08-31_counsel-packet_RC.md`): 6 questions for Jeff's attorney, not yet reviewed.
- CMG monthly-payment figure unresolved: $1,911/mo (letter) vs $2,246.17/mo (Jeff's own records, possibly a different loan) — ~$2,000 swing.

**Blockers**
- Jeff must (a) confirm he has/gets his own real-estate attorney and (b) give the go to send the reply. The escrow start date is the single most load-bearing unknown and only Dale can supply it.

**Deadlines**
- Dale letter #1 (Aug 11) response deadline was **Aug 24, 2026 — passed, no response on file** (letter was misaddressed to jeff@odd-jobs.**com**, resent by paralegal Lauren Lewis Aug 13).
- Dale revision dated **Aug 28, 2026** (bargain-and-sale, 6-month escrow).
- Jeff's counter sets a response deadline of **Sept 15, 2026**. Escrow assumed to start on/before Sept 30 2026 (Sept 1 in the letter, unconfirmed). Utilities to Jeff Jan 1 2027; belongings/Dry Box out by Mar 1 2027.

**Next action + owner:** Jeff — confirm counsel + approve the reply; then Claude refreshes the reply (Aug 28 date, recipients incl. Laura at lauramumford1@gmail.com) and routes it for attorney review. **Do not send.**

**Parties / contacts:** Nancy Mumford (mother, grantor/occupant, mumford.nancy@gmail.com, +1-503-333-0720); Elliott P. Dale, PC (Nancy's attorney — edale@elliottdale.com, office 503-726-5940, mobile 503-703-2210, 5200 Meadows Rd Ste 200, Lake Oswego OR 97035); paralegal Lauren Lewis (llewis@elliottdale.com); Patrick Todd (Jeff's uncle, holds Nancy's real-estate POA, offered as a back channel, +1-651-788-1833); Laura Mumford (named party, lauramumford1@gmail.com); CMG/Shellpoint (servicer).

**Phased plan**
- **Phase 1 (Jeff, then Claude):** Jeff confirms counsel and gives go. Claude refreshes the reply-to-Dale (correct date to Aug 28, fill recipients), routes to attorney. Send only after attorney review.
- **Phase 2:** Attorney answers the 6 counsel-packet questions (tax/title consequences, due-on-sale, silence risk, what to demand to see, what's lost by the shortened escrow, argument to restore the escrow period). Resolve the $1,911 vs $2,246.17 payment figure via Dale's answer.
- **Phase 3:** Finalize which ladder option to put forward (protecting the vacate date) and settle whether Section 5 (money claim against Nancy) goes through counsel at all.
- **Phase 4:** Transmit the counter through counsel; track against the Sept 15 self-imposed deadline.

---

#### Thread 2 — Roswell insurance claim (Safeco / CMG)
**Status (one line):** Coverage is accepted (carrier has paid a bathroom-only scope); the live problems are a possible double-count of $8,837.38, an unlocated Mold Masters invoice, and no kitchen-specific carrier scope.

**Key decisions**
- Coverage is ACCEPTED, not in dispute — Safeco paid a portion, so the June 2025 Reservation of Rights is historical, not a live coverage position. FinRecon's "$0 received" was correct only because funds flowed to CMG (loss payee) into escrow.
- The finish-delta claim (Section 5.2) cannot be computed without a carrier baseline — request the scope directly from Safeco.

**Open items**
- Safeco **bathroom** scope found (Gmail 2025-09-23, Adrian.DeMarre@libertymutual.com): Total Cost of Repairs $10,981.03, Payment To You $8,837.38 — the source of CMG/Proctor check #00001432. Still need: the two attached PDFs for line detail; whether a **kitchen-specific** carrier scope exists; confirm whether public adjuster **Scott Hedges** (Precision Public Adjusting NW) was engaged and by whom.
- Mold Masters payment #2 — **$8,840.00 (2025-10-31) has no invoice anywhere** (third-highest-value receipt to recover; Peter Gowans can produce it in one email).
- Possible **$8,837.38 double-count**: Nancy's Zelle of 2025-10-02 ($8,837.38) vs the CMG check (also $8,837.38) — unresolved, and it changes the casualty basis. A real error currently in Jeff's favor.
- `$546.93` duplicate transaction (txn 5397/5398, 2025-11-24) to clear; `$885.90` "rocwll" typo charges recovered.

**Blockers**
- No kitchen carrier baseline; some source PDFs behind a Gmail/Chrome re-sign-in that needs Jeff.

**Deadlines**
- Date of loss 2025-06-13. Suit limitation ~2027-06-13. CMG check #00001432 ($8,837.38) issued 2026-05-28, landed in Chase 2026-07-21 (the only carrier money to reach Jeff, ~13 months post-loss).

**Key figures:** Policy OP6225045, Claim 059560682-01, Safeco Insurance Co. of Illinois (Liberty Mutual). Adjuster **Jordan Stoddard** (Jessica LaClair earlier — see Consolidate Check). Mold Masters total **$18,673.88** across six payments (47% documented). Estimates on file: 1072 ($27,400, accepted 2025-07-11), 1091 (kitchen $9,175, no acceptance), Claim Support Report ($14,005), whole-house Claim_Report_Mumford_Updated ($28,255–$32,805). CMG loss-draft loan 0174928853.

**Phased plan**
- **Phase 1:** Pull the two Safeco PDFs ("FA initial estimate.pdf", "Coverage letter.pdf") for line detail; determine whether any kitchen carrier scope exists.
- **Phase 2:** One email to Peter Gowans requesting the $8,840 invoice + four crew-payment receipts ($350/$50/$250/$350) + clearance/post-remediation docs + his Safeco copies (Jeff's hand to send).
- **Phase 3:** Resolve the $8,837.38 double-count and the $546.93 duplicate; confirm whether Scott Hedges was engaged.
- **Phase 4:** Fold the corrected claim numbers into the counter-proposal's insurance section and the evidence ledger.

---

#### Thread 3 — Roswell build (finish & occupy)
**Status (one line):** The house sits at a pre-drywall gate; the electrical plan is set (new 9-circuit load center) but permits are dark and several finish decisions are Jeff's.

**Key decisions**
- Range is **electric** (30" slide-in, matte white, SKU 1004562323, delivered 2026-01-11) — the gas spec is dead.
- The $8,269.00 (2025-12-05, HD H4017-567029) is **appliances**, not cabinets; cabinets are the separate $4,599.76 (2025-12-02, H4017-565922). Confirmed finish spend $12,868.76.
- Electrical: install a **new panel / load center** (service is 200A — no upgrade, no utility involvement; the constraint is the obsolete Gould ZQC 24 MVB with only 4 open spaces that can't take modern GFCI/AFCI). New 9-circuit design, all old wiring replaced.
- **STOP:** do not re-enter the attic until the **vermiculite is tested** (presumed asbestos; also an unsubmitted claim item and a future disclosure item).

**Open items / Jeff's decisions**
- Pick the sink (gates countertop template → backsplash → the rest); book the clearance/post-remediation test with Rose City Labs (occupancy gate); pull permit status (bathroom relocated drain into cast iron + floor heat = permit work in Milwaukie); confirm grab-bar blocking locations before drywall closes (accessibility for Nancy, most irreversible); decide backsplash variant.
- Countertop (Silestone Halcyon, HD design H4017-566989) quoted, never bought.
- Panel sub-decision (load center vs sub-panel vs tandem breakers) turns on whether AFCI applies — an inspection question. Second electrician opinions in flight (Gibb; one other).

**Blockers**
- Unsigned "Approved to Drywall" sign-off; permits/inspections 100% dark (no permit numbers, cards, or sign-offs); clearance test never done. Vanity light box blocked by a vent-stack pipe (unresolved). Vermiculite untested.

**Next action + owner:** Jeff — the five build decisions above (sink, clearance test, permit status, grab-bar blocking, backsplash). Matt (electrician) — verify dishwasher/disposal dedicated-circuit code, range plug type, which 220 doubles are mini-split vs baseboard.

**Phased plan**
- **Phase 1 (safety gate):** Test vermiculite; do not enter attic until cleared.
- **Phase 2 (permits):** Pull Milwaukie permit status for the relocated bathroom drain + floor heat; get the drywall sign-off routed.
- **Phase 3 (decisions that gate trades):** Jeff picks sink → countertop template → backsplash; confirm grab-bar blocking before drywall.
- **Phase 4 (electrical):** Finalize panel decision with the second opinions; Matt verifies the circuit-code questions; execute the 9-circuit rewire.
- **Phase 5 (occupancy):** Book and pass the Rose City Labs clearance test; drywall; finish; occupy (October reno target).

---

#### Thread 4 — Family letter to Nancy + evidence ledger
**Status (one line):** Truth-copy of the letter is at v1.19 with 3 fills outstanding; the money ledger is rebuilt to v1.2 with the $20k repayment settled (outstanding balance **$38,921.38**); a send version waits on deed sequencing.

**Key decisions**
- Letter leads with labor, owns Nancy's bridge loans in one sentence, keeps the $20k repayment OUT until documented, and the Diana-rehab line OUT unless Jeff supplies a date. No em dashes; one dry-humor line max. Truth copy and send copy are separate deliverables.
- The $20,000 repayment is settled at **$15,000 via CMG/Shellpoint HELOC + $5,000 via Chase account …2585** — do not reopen the amount, only finish the paperwork.
- Account **…2585 is Jeff's own second Chase account** (Nancy is a signer, not owner) — this retracts an earlier wrong finding that …2585 was a source of $24,269 in uncounted Nancy advances.

**Open items**
- 3 letter fills; finish the Mac mini iMessage/chat harvest (laura_export group chats, CallHistory, HWA folder, USAA 2026 statements) → ledger v1.2 is current source (`legal/family-evidence-ledger-v1.2_REBUILT.md`); still to do in the ledger: locate the CMG check #00001432 photo, resolve the $8,837.38 double-count, then reconstruct GC hours.
- Document the $15k HELOC draw (statement/check image) — though it's corroborated by Nancy's iMessage 2026-06-04 "The $15,000 cleared and everything's OK," so this is now backup, not a blocker.

**Blockers**
- HD PDF downloads bounce to a jeff@odd-jobs.org re-sign-in (needs Jeff); a few mini-harvest items unmined.

**Money picture (authoritative, newest):** Nancy advanced **$59,771.38** across 14 Zelle transfers (2025-08-01 → 2026-05-01); repaid $850 (2026-05-22) + $20,000 → **outstanding $38,921.38**. Jeff's corrected documented Roswell spend **$32,998.09**. Rate $128/hr; 86 documented working days (~"north of sixty grand" labor). HELOC: Shellpoint (was CMG) loan 0697312494, secured on 2908 SE Malcolm, $75k limit, $73,790.37 principal, 8.09% APR, interest-only $507.16/mo.

**Cast (for the letter):** Nancy (Mom); Julie (+1-503-327-9808); Diana (Gregg); Tracy (Minneapolis); Laura (+1-503-709-9395); Kelsey Dobrenz (chosen sister); Rusty Olds (chosen brother); Patrick Todd (Nancy's partner, holds POA). Laura's rehab: Betty Ford, Newberg, checked in Jun 16 2025.

**Phased plan**
- **Phase 1:** Read/confirm the current ledger (v1.2 REBUILT); finish the mini harvest (laura_export chats, CallHistory, HWA, USAA 2026) → ledger updates.
- **Phase 2 (Jeff):** Paper the $20k (HELOC draw statement/check image); nothing else on …2585 needed.
- **Phase 3:** Resolve the $8,837.38 double-count and reconstruct GC hours (feeds both the letter's labor line and the counter-proposal's Section 5.3).
- **Phase 4:** Letter v2.0 (truth copy) with the 3 fills.
- **Phase 5 (ask first):** Produce the send version, sequenced against the deed transfer. Do not send without Jeff's explicit go.

---

#### Thread 5 — Roswell FinRecon dataset load ("Deliverable G")
**Status (one line):** The database schema is ready (migration 12 added `documents.claim_flag`), but the Roswell receipt/document dataset has not yet been loaded.

**Key decisions:** Migration 12 (applied 2026-08-12, committed on the Mini) added `documents.claim_flag` (claim/owner/both/undetermined) as a second axis orthogonal to the tax `business_flag`, with room/phase convention `job_ref = 'roswell:<room>'`. All 8 target fields now map to `documents` columns; 345 tests green.

**Open / blocker:** Loading the Roswell dataset (Lane B) goes through the FinRecon web app or `finrecon.documents.store` — this is the next actual work and needs no Gmail/Jeff. 242 existing documents remain `undetermined`.

**Next action + owner:** Claude — load the Roswell document dataset into `documents`, tagging `claim_flag` and `job_ref`.

**Phased plan**
- **Phase 1:** Load the Roswell receipts/documents via the web UI / `documents.store`, tagging claim vs owner and room.
- **Phase 2:** Reconcile the loaded documents against the money ledger (Thread 4) and the claim (Thread 2).

---

#### Thread 6 — Fresno Family Timeline (confidential)
**Status (one line):** A private, factual family-history archive (WordPress + two Notion DBs, raw + sanitized) — maintenance mode; kept factual, never built into a "case."

**Key decisions:** Stays factual documentation, not an argument. Sensitive content is NOT written into persistent memory. Two Notion DBs: "Our Family — A Shared Timeline" (sanitized) and "Fresno Family — Timeline" (raw).

**Open items:** Whether more support instances exist (Jeff to say); a "Roswell ledger" location question; a neighbor child-welfare matter ("the Tolle kids"); two possibly-redundant conversations ("handoff" vs "tool").

**Next action + owner:** Jeff — confirm whether additional instances belong on record. Otherwise dormant. (Do not surface specifics unprompted.)

---

### FINRECON

Python package at `~/ClaudeBox/finrecon`; the Mac mini is the authoritative system of record, the MacBook Pro is a read-only replica. It backs the 2024/2025 Schedule C. As of late Aug: ~7,781 transactions, ~250 documents, 16 accounts, schema v12, ~348 tests. **Note:** the "FinRecon is a CLI project in `~/.claude/projects` / 7 sessions / 37.3 MB" claim in the old cloud brief is wrong — that Notion row counted session transcripts, not the tool.

---

#### Thread 7 — FinRecon cash lane / 2024–25 tax reconstruction
**Status (one line):** A 162-row cash worksheet ($45,741.39 of withdrawals) is built and waiting on Jeff to name payees; the ledger itself is untouched.

**Key decisions:** Cash-source rules settled by test (BofA/Chase branch debits = cash; 7-Eleven store + ATM). Cash-lane logic rewritten in `finrecon/scripts/cash_lane.py`.

**Open items (ranked by dollars, all Jeff):** (1) name payees on the cash worksheet, starting with the 29 crew-named rows; (2) ~$21k unidentified 2024 deposits (Jeff's memory only); (3) Amazon residual — 315 items / $7,810 (unlocks 65 more charges); (4) ADU cash split Oct-2025 $2,107 (Tyler/Sid + Sid's surname); (5) Hinckley→Roswell ~$2,090 confirm as rebuild labor (Form 4684, not Schedule C); (6) deferred — Laura's Venmo export.

**Blockers / traps:** `seam-dedupe.sql` committed but NOT RUN — 53 known duplicates still in the ledger. 2024 gross receipts $15,148.50 / net −$75.11; 2025 gross $42,140.75 / net −$39,220.57.

**Phased plan**
- **Phase 1 (Jeff):** Name payees on the 29 crew rows, then the rest of the 162.
- **Phase 2:** Run `seam-dedupe.sql` to clear the 53 known duplicates (after a backup).
- **Phase 3 (Jeff):** Identify the ~$21k 2024 deposits and the Amazon residual.
- **Phase 4:** Close the ADU split and the Hinckley/Roswell (Form 4684) items; finalize the Schedule C figures.

---

#### Thread 8 — FinRecon SimpleFIN seam defect + automation feed
**Status (one line):** DONE — the double-import seam defect is fixed and the nightly SimpleFIN sync is loaded and green; three unmapped accounts remain a decision.

**Key decisions:** The seam guard was made symmetric (commits 2d50c19 / ba366f5); the disabled launchd job (`com.oddjobs.finrecon-simplefin-sync`, 05:30) was re-enabled. The original defect had double-imported 148 of 319 rows (net distortion $39,598.54) and was rolled back.

**Open items:** 3 unmapped SimpleFIN accounts skipped nightly (`USAA YOUTH SAVINGS 3067`, `FIXED RATE LOAN 1690`, `FIXED RATE LOAN 1004`) — Jeff to decide inclusion; the loan accounts also need a schema path (the `accounts` CHECK has no `loan` type). $1.50 coverage test never run since 7/14.

**Next action + owner:** Jeff — decide the 3 accounts + loan-account schema; Claude — run the coverage test. Otherwise this thread is done.

**Phased plan**
- **Phase 1 (Jeff):** Decide whether the 3 accounts join the nightly feed and how to type the two loan accounts.
- **Phase 2:** Register them / migrate the CHECK constraint; run the $1.50 coverage test.

---

#### Thread 9 — FinRecon remote access / Mini sleep / victory-lap deck
**Status (one line):** Remote access is live (tailnet-bound web UI, no auth by design) and the Mini sleep bug is fixed for good; two runbooks need merging and the victory-lap deck is stale.

**Key decisions:** `finrecon serve --host 100.115.69.54` (tailnet-only bind, v1.32); accepted trade-off that the UI has no authentication (any tailnet device can read/edit). Sleep fixed permanently via `sudo pmset -a disablesleep 1 powernap 0`.

**Open items:** Merge the two overlapping runbooks (`finrecon/RUNBOOK-remote-access.md` + `handoffs/FINRECON-RUNBOOK-RC.md`, Aug 12 as survivor); regenerate `FinRecon-Victory-Lap.pptx/.pdf` (built against stale 7,539/242, now ~7,781/250; generator needs rebuild) before showing Laura again. SimpleFIN `--setup` Keychain "Always Allow" needs one GUI click on the Mini or the 05:30 job fails silently.

**Next action + owner:** Claude — merge runbooks + rebuild deck; Jeff — the one-time Keychain "Always Allow" on the Mini.

**Phased plan**
- **Phase 1:** Merge the two runbooks into one (Aug 12 doc survivor, URL + sleep fix folded in).
- **Phase 2 (Jeff):** Click "Always Allow" once in a GUI Terminal on the Mini.
- **Phase 3:** Regenerate the victory-lap deck against current numbers before any re-show.

---

### HANDLED

Name collision (intentional): "Handled" is both a Notion command center AND a Django job-to-cash app (repo `JohnsManville/handled`, ex-"Handoff Clone"; two clones on the laptop — `handoff-clone` and `handled` — one to retire).

---

#### Thread 10 — Handled Learning/AI Estimator
**Status (one line):** Built and green (296 tests) behind its feature flag but parked ~11 days; blocked on Jeff confirming a site→customer mapping.

**Key decisions:** Explainable math (shrunk exponentially-weighted average of actual÷estimated hours), not ML; the tool learns **hours, never prices** (rate card $128/$99/$149 stays Jeff's). Spec at v1.2. Resume session `local_fec01e5e` (Opus 5); archive the duplicate; close the stray.

**Open items:** The real blocker — `import_reconstructed_hours` imports **zero of 54 rows** (473.9 on-site hours) because `confirmed_client` is empty on all 54; Jeff must confirm the fuzzy `client_match_candidates` (do not invent a mapping — E-075 failure mode). Phase 5 (explainability/calibration reporting) skipped; Phase 6b (estimator UI) unbuilt. Three wrong spec lines to fix (journal_mode; no Stripe; 10 vs 11 modifiers). Delete any RC-era duplicate spec before a build session runs. Merging `nightly`→`main` is Jeff's call.

**Next action + owner:** Claude — fix the three spec lines + delete stale spec; Jeff — confirm the site→customer mapping and the Phase 5/6b scope.

**Phased plan**
- **Phase 1 (Claude):** Fix the three spec lines; grep/delete any RC-era duplicate spec; confirm weekend-2× billing landed in `core/pricing.py`.
- **Phase 2 (Jeff):** Confirm the 54-row site→customer mapping so `import_reconstructed_hours` actually loads.
- **Phase 3 (Jeff):** Decide whether to backfill Phase 5 before building Phase 6b, and the 6b UI scope.
- **Phase 4:** Build Phase 6b (estimator in builder + proposal); Jeff decides the `nightly`→`main` merge.

---

#### Thread 11 — Handled Django app (Square go-live / e-sign)
**Status (one line):** In production on `nightly` (merged to `main` a978f73, 155 tests) but Square go-live and e-sign are blocked on Jeff; the app holds 0 customers/invoices/estimates so "who owes Jeff" lives nowhere yet.

**Open items:** Square go-live ("blocked on you"); e-sign gate; retire one of the two laptop clones; `handoff-clone` is 10 commits behind on `nightly` with a dirty tree (won't self-resolve — needs a manual commit/stash + pull).

**Next action + owner:** Jeff — Square go-live decision; Claude — reconcile/retire the duplicate clone, resolve the dirty `handoff-clone` tree.

**Phased plan**
- **Phase 1:** Commit/stash then pull `handoff-clone`; retire the redundant clone.
- **Phase 2 (Jeff):** Square go-live + e-sign decisions.
- **Phase 3:** Populate real customers/invoices so receivables ("who owes Jeff") live in the system (ties to FinRecon P3 gap).

---

#### Thread 12 — Handled Subcontractor module (Notion)
**Status (one line):** DONE / maintenance — roster of 12 subs live, work-queue file closed 2026-08-06; a few small open items.

**Open items:** Set rates for Peter Gowans & Drew Hainsworth before dispatch; delete a Notion holding page (Lance + 3 dupes — Notion MCP can't trash, so Jeff clicks); Jeanie Fugate ~$1,000 collections decision (Non-Payer, invoiced 6/6/26, never paid). Parked (needs Jeff's go): Google Calendar sync for confirmed assignments; automated offer/reminder sends.

**Next action + owner:** Jeff — set the two rates, delete the holding page, decide Fugate collections.

**Phased plan**
- **Phase 1 (Jeff):** Set Gowans/Hainsworth rates; delete the holding page.
- **Phase 2 (Jeff):** Jeanie Fugate collections call (~$1,000).
- **Phase 3 (on Jeff's go):** Turn on calendar sync + automated sends.

---

### JOBS & CLIENTS

#### Thread 13 — Fairmount deposit (Josh Loerzel) — **DONE**
$3,000 flat materials deposit (Square invoice #000004) was found already **PAID Aug 21, 2026 (Visa 7989)** — the earlier "dead pay link, do not send Josh anything" alarm was false (nobody had opened the link). Deposit lane closed. Next natural billing event: labor + remaining balance at substantial completion (materials cost +30% with receipts). Job "3360 SW Fairmount Blvd — make-ready for sale." No action outstanding.

#### Thread 14 — Purcell deck matter
**Status (one line):** BLOCKED / on hold — the formal accounting is done and the attorney email was sent, but the current status is genuinely unknown and needs Jeff.

**Key facts:** 20'×20' Trex deck for Darin & Lisa Purcell (2923 SE Malcolm St, Milwaukie); contract $23,841.96, deposit received $12,000, balance unpaid $11,841.96; documented cost of work $25,663.66 (Jeff wrote "out of naivety I underbid your project to the tune of 10-15k"). Terminated by Lisa 2026-07-13. The "PROJECT RECORD AND ACCOUNTING — 22 July" is the evidentiary record (flags CONTESTED/UNKNOWN items — substantial-completion definition, railing spec/kit count, several credits). Attorney email sent 2026-07-22 to Anthony McNamer (anthony@mcnamerlaw.com); no reply in ~18 days as of late Aug.

**Blockers:** Settlement deadline was **Aug 10, 2026 — passed ~13 days before any August session noticed**; nothing in the Purcell workspace newer than July 25. Whether it settled, lapsed, or stalled is unknown. Uninstalled railing on site $3,017.50 (HD return ceiling $1,615.53, offer status unknown).

**Next action + owner:** Jeff — say where Purcell actually landed (settled / lapsed / still live). This gates everything else. (Note: `odd-jobs.org/purcell` should be taken down per OEC 408 if not already.)

**Phased plan**
- **Phase 1 (Jeff):** State the current Purcell status — did it settle Aug 10, lapse, or is it live?
- **Phase 2 (if live):** Chase Anthony McNamer for a reply; confirm the railing-return path with Home Depot.
- **Phase 3 (if closed):** Archive the matter; ensure the public page is down.

#### Thread 15 — DGUTS '26 raft trip (campingteam.us)
**Status (one line):** Effectively DONE — site rebuilt and live, RSVP form and jobs Worker deployed; the only unfinished pieces are one site redeploy for the job board and the Google Form itself (never edited).

**Key facts:** Annual raft trip "Don't Give Up The Ship II," trip Aug 12–16 2026, RSVP deadline Aug 7 (both now past). Site on Cloudflare Pages (`dont-give-up-the-ship`), Worker `dguts-jobs` deployed. The last handoff's one open action was a single site redeploy to pick up the new job board; the Google Form was never edited (blocked on Drive/Forms access).

**Status note:** Since the trip has passed, this is effectively closed for 2026; the redeploy and Form edits are moot unless kept as a template for next year.

**Phased plan (only if carried to next year):**
- **Phase 1:** Redeploy the site folder once so the live crew page shows the job board.
- **Phase 2:** Edit the Google Form for the next cycle (needs Drive/Forms access).

---

### INFRASTRUCTURE / TOOLING / META

The ClaudeBox "custody charter" (Thread 26) frames all of this: the Mini is the workhorse/source of truth, the MacBook a thin client, and the governing rule is **custody before capability** — nothing new gets built until backups are live. The finding that drove it: **Time Machine was OFF since 2026-07-23**, leaving the Mini as a single 186 GB copy with no snapshots.

#### Thread 16 — Mac mini covert security audit + tripwire/canary
**Status (one line):** Phase 1 forensics found no unauthorized access (Aug 17–28 window); Jeff armed Phase 2 on Aug 29, so two network services and canary bait are now running — but blocked on Jeff's four Phase-1 confirmations and without reboot persistence.

**Key decisions:** Read-only forensics clean (confidence 85). All Screen Sharing/SSH/CRD traced to Jeff's MBP or iPhone. Jeff armed Phase 2 ("1") on 8/29.

**Open / live exposure:** Two services running — `covert-service.py` (PID 14983, `*:7734`) and `dashboard.py` (PID 14985, `*:8765`, **no token, bound to `*` on a shared family machine**). `DELIVERY_ARMED` marker set; 4 canary bait files armed. launchd daemons NOT loaded (needs interactive sudo at the Mini), so no reboot persistence. The `.covert-token` was in a transcript in cleartext — **treat as burned, rotate**.

**Blockers:** Jeff's 4 Phase-1 answers: (1) were the AnyDesk sessions (Jul 28 / Aug 12) his; (2) keep or revoke ChatGPT + Pocket TCC grants; (3) identify/remove two Bluetooth devices ("Mr. Biggerstuff" / "Mr. BigStuff 17"); (4) — plus the standing Mini exposures: auto-login ON, ARD wide open (`ARD_AllLocalUsers=1`, legacy VNC), AnyDesk on 7070.

**Next action + owner:** Next session must treat this as a decision, not a build — ask Jeff whether the two services keep running and whether `:8765` should bind to loopback/Tailscale-only; do NOT load launchd daemons without his word. If stood down: kill PIDs, remove `DELIVERY_ARMED`, rotate/delete the token, remove the 4 canaries, delete `~/Claude/Security/bin/`.

**Phased plan**
- **Phase 1 (Jeff):** Answer the 4 confirmations; decide keep-running vs stand-down.
- **Phase 2a (if keep):** Rebind `:8765` to loopback/Tailscale + add a token; rotate `.covert-token`; load launchd daemons at the Mini (interactive sudo) for persistence.
- **Phase 2b (if stand down):** Kill PIDs, remove markers/canaries/token, delete the security bin.
- **Phase 3:** Harden the standing exposures Jeff approves (auto-login, ARD/VNC, AnyDesk).

#### Thread 17 — Two-machine sync (lanes + GitHub key)
**Status (one line):** rsync lane healthy; the GitHub lane is blocked because the MacBook's key is only a deploy key and adding an account key is Jeff's hand (and the laptop keeps going offline).

**Root cause (found):** Not OAuth/gh — the MacBook uses HTTPS remotes with no stored credential while the Mini uses SSH; the MacBook's `id_ed25519` is a deploy key on `mumford-week-plan` only, so 4 of 5 repos are denied.

**Blockers:** Jeff must add the MacBook pubkey as an account key at github.com/settings/keys (title `macbook-pro`); the laptop must be online (it repeatedly drops off Tailscale). Then Claude flips the 5 remotes HTTPS→SSH.

**Next action + owner:** Jeff — add the account key; Claude — re-test all 5 repos, flip remotes when green.

**Phased plan**
- **Phase 1 (Jeff):** Bring the laptop online; add the MacBook account key on GitHub.
- **Phase 2 (Claude):** Re-test SSH on all 5 repos; flip HTTPS→SSH; verify via `sync-projects.sh`.

#### Thread 18 — Session-management / evening-sweep / morning-open — **DONE**
End-to-end as of 2026-08-28: capture → distill (21:30) → handoff (22:00) → daily brief (06:00) → morning-open (06:10). The 9-night distiller outage (8/14–8/22, a TCC/Full-Disk-Access monitor defect that reported false green) is closed and retry-hardened; `morning-open.sh` built. Residual: 19 registry rows are "missing" because Cowork sessions can't be enumerated via API (a platform limit, not a bug); the "morning destination" question was resolved as local.

#### Thread 19 — SSD keys mirror / API key rotation
**Status (one line):** The 2 TB SSD integration and nightly intel mirror are DONE; the OpenAI key rotation has been stuck at the last step since 7/30 (a 2-minute fix that's Jeff's hand), leaving OpenAI-dependent scripts dead.

**Blocker:** The Keychain holds 505 chars of stray clipboard (interactive `security add-generic-password` truncates at 128 bytes) → API returns 401; the 7/30 key is unrecoverable.

**Next action + owner:** Jeff — create a new OpenAI key `claudebox-mini`, store it via `security add-generic-password … -w "$(pbpaste)"`, verify HTTP 200, revoke the orphan. Also outstanding: Anthropic console revokes, Apple Notes hygiene (an OpenAI key sat in plaintext as a Note title — rotate), Mini account-password rotation.

**Phased plan**
- **Phase 1 (Jeff):** Rotate + store the OpenAI key correctly; verify 200.
- **Phase 2 (Jeff):** Revoke exposed Anthropic keys; delete the plaintext key from Apple Notes; rotate the Mini account password.

#### Thread 20 — Time Machine repair + disk offload — **largely done**
Root cause was the internal disk at 99% (Messages-in-iCloud backfill, 33.7 GB, intended cargo — do not touch). TM recovered 2026-08-26; a 24 GB offload of the iCloud Drive Archive was executed (rsync → md5-verify → Trash) and a disk monitor built (`disk-monitor.sh`, alert <25 GB). **Pending Jeff:** empty the Trash (~24 GB), and decide Voice Memos (12 GB)/Movies (4 GB)/Pictures. Note the offloaded data now sits single-copy on the SSD until the second 2 TB drive is detected (Thread 31).

#### Thread 21 — Cloud-brief sanitizer — orphaned
`sanitize-brief.sh` + `briefings/cloud/` were built, then orphaned by Jeff's 2026-08-28 "keep it local" pivot. **Open question for Jeff:** was "keep it local" permanent or provisional? Recommended disposition: leave dormant with an unwired-header comment. Also surfaced the **E-106 trap**: the global CLAUDE.md/mac-sync skill claim a Drive "Handoffs folder" auto-syncs to both Macs + phone, but **Google Drive for Desktop is not installed on the Mini** — so that sync path does not exist. (This is exactly the gap this session's handoff-mirror addresses — Thread 35.)

#### Thread 22 — iMessage export tool — on hold
CLI export-by-date-range-with-images is DONE (`~/ClaudeBox/scripts/imessage-export`). iCloud attachment download is unsolved (35,787 of 36,618 attachments are cloud-only; Jeff denied computer-use screen access, so it must be driven via AppleScript AX). ON HOLD per Jeff. Resume plan documented.

#### Thread 23 — Jeff-voice / Robo-Jeff corpus — done
Corpus + voice docs built (`JEFF_VOICE.md`, `JEFF_VOICE_COWORK.md`, kept separate); the 8/14–8/22 intel backlog cleared; session self-closed 2026-08-28. **One time-sensitive residual:** Rusty holds a dead link to a private voice-test artifact (404s until shared) — Jeff needs to share the two decks with WRITE access. Also open: decide the ~32 GB `archives/` backup (Thread 33).

#### Thread 24 — Mini display resets / Screen Sharing — done
Root cause of the Mini "sleeping"/hard-resetting was macOS Screen Sharing High Performance mode creating a virtual display; fixed 2026-08-13 by switching the MBP Screen Sharing client to Standard mode, verified 8/23. Recovery ladder documented (power-cycle monitor → `killall WindowServer` → `reboot`; never the power cord — 2 TB drive attached).

#### Thread 25 — WhipDesk remote-access setup
Running on the Mini (mobile-first remote access, port :8787, signed in). **Pending:** auto-start on boot via a launchd LaunchAgent, which must be finished AT THE MINI (GUI) — TCC Screen Recording/Accessibility are tied to the responsible process, and automatic login must be on for unattended reboots. Next action: at the Mini, install `com.whipdesk.agent.plist`, bootstrap it, grant Screen Recording/Accessibility.

#### Thread 26 — ClaudeBox custody charter / restatement (G1–G5)
Foundational, not an actionable task: ClaudeBox is "externalized memory under a constitution (the Covenant)"; goals G1 custody-before-capability … G5 reach-survives-failure. The load-bearing finding (TM off since 7/23) is now addressed by Thread 20. Kari is the human arbiter for Covenant disputes.

#### Thread 27 — Cowork files organization (sidebar folders) — blocked on Jeff
A 5-folder scheme (Roswell / Family Letter / Fresno Family Timeline / Claude Tooling / Personal) was proposed for 9 "Ungrouped" Cowork conversations. **Blocked:** Claude can't manipulate the Cowork sidebar (hard platform block) — Jeff does the drag-and-drop. Three questions for Jeff (more Ungrouped items below a cutoff; is "Email to mom about home purchase" superseded by Letter to Nancy v1.19; is "Fresno Family Timeline handoff" vs "tool" one thread or two).

#### Thread 28 — mac-sync skill + CONNECTIONS.md — done
User-level `mac-sync` skill built atop the authoritative `CONNECTIONS.md`; 4 undocumented LaunchAgents documented. Residual ties into Thread 8 (loan-account schema) and disk offload.

#### Thread 29 — AI_ERROR_LOG fork / duplicate IDs — blocked
The append-only `AI_ERROR_LOG.md` forked across machines (Mini reached ~E-097/E-101/E-105, MacBook ~E-095; two different incidents both numbered E-095; 14 duplicate IDs on the Mini). **Must NOT be scp-synced in either direction** (would destroy append-only entries) — needs a by-hand merge + renumber. Interim rule: cite entries by date+title, not number.

#### Thread 30 — Account transition (off personal org) — blocked
Staged since 2026-08-06, go/no-go undecided (Jeff's call). The individual org (`519217cd-…`) was never exported (403).

#### Thread 31 — Second 2 TB drive detection — blocked (hardware)
The new 2 TB drive intended as the backup target does not enumerate (`diskutil list` empty; both TB/USB4 ports "No device connected"). Physical — Jeff to try cable/port/power. Blocks getting the disk offload (Thread 20) and archives (Thread 33) onto a second copy.

#### Thread 32 — Covenant intel dispute — blocked (Kari)
51 intel files / ~135 MB on the MacBook are a Covenant dispute with Kari holding the tiebreak; static ~14+ days.

#### Thread 33 — `archives/` (~32 GB) backup gap on ClaudeData — blocked on Jeff
~32 GB of `archives/` (TPB media + a mini offload) sit single-copy on the TM-excluded ClaudeData volume. Jeff to decide: targeted Time Machine inclusion vs rsync to ClaudeBoxSSD — do NOT un-exclude the whole volume (Covenant Gate 5).

#### Thread 34 — Three remoteless repos — open
`campingteam-site`, `imsg`, and `Sea Ray Trainer` have no GitHub remotes, so they can't enter the sync lanes or reach the MacBook. Give each a remote to bring them under sync.

#### Thread 35 — Handoff-sync mirror + end-of-day routine (THIS session)
**Status (one line):** New; the mirror repo and sync tooling are built and pushed, but the sync script isn't yet installed on the Macs, so the mirror is empty until it runs.

**What was built this session:** the `vigilant-tribble` repo now carries `bin/sync-handoffs.sh` (host-namespaced: writes each Mac into `handoffs/<hostname>/…` so the MacBook and Mini don't clobber each other) + a launchd template + README documenting the two-Mac topology. An end-of-day Routine (`trig_01YE6hEjHnNjCmsVPByRnYNv`) is set for **5:00pm Pacific daily** to re-run this consolidation from the mirror.

**Why it exists:** this consolidation was requested from a remote cloud session that could not see the Macs' filesystems; Google Drive had only stale partial copies. The mirror closes that gap (and fixes the E-106 gap from Thread 21 — there is no working Drive-based Handoffs sync).

**Blocker:** the Routine reads the repo mirror, which is empty until `sync-handoffs.sh` runs on the Macs.

**Phased plan**
- **Phase 1:** Install the sync on both Macs — clone `vigilant-tribble` into `~/Claude/.handoff-sync`, run `bin/sync-handoffs.sh` once, load the 30-min launchd job (or bolt it onto the `session-handoff` skill). (Can be done now over the SSH bridge if Jeff approves modifying the Macs.)
- **Phase 2:** Confirm tomorrow's 5:00pm Routine reads a fresh mirror and produces the master doc.
- **Phase 3 (Nov):** Adjust the Routine cron from `0 0 * * *` to `0 1 * * *` when Pacific leaves daylight time (else it fires at 4pm).

---

## 3. CONSOLIDATE CHECK

### Completeness — what was consolidated, and what was intentionally dropped

Every named thread from all four gather passes appears in the manifest. Items deliberately NOT carried forward as live, with the reason (all "superseded/resolved," none "forgotten"):

- **ClaudeBox `2026-08-31_roswell_handoff_v1.2.md` and `…v1.3.md`** — superseded blind-session artifacts (written without visibility into `~/Claude`); their content is captured better in the authoritative `~/Claude` chain. The one non-duplicated fragment (a possible tort claim via attorney "Anthony") is preserved in the header note.
- **`_SOURCE-Roswell_Archive_Handoff_ClaudeCode_RC.md`** — the original cloud brief, explicitly superseded on 2026-08-12 (11 of its "verified facts" were corrected: FinRecon location, range spec, HD $8,269 = appliances, adjuster, coverage posture, etc.). Kept only as a historical pointer.
- **`…2585` as a source of $24,269 in Nancy advances** — retracted (it's Jeff's own account). Dropped from the money picture, though the retracted row still sits in `ROSWELL-TIMELINE-v1.1.csv` (see consistency #4).
- **Older Purcell labor figures, the DGUTS pre-trip redeploy, the FinRecon "npm project" description, the "7,539/242" ledger counts** — all superseded by newer numbers; the current values are used.
- **Roswell RC-level counter-proposal (`counter-proposal_RC.md`)** — superseded by `counter-proposal_v1.1.md`.
- **NOTION-WORK-QUEUE / SUBCONTRACTOR-TOOL-RETRIEVAL detail** — folded into Handled Thread 12 (both mark the sub module effectively closed).
- **Sensitive personal content** (recovery/sobriety history, a suicide, non-monogamy details, psychiatric characterizations) — noted as present in the Fresno Family Timeline but deliberately not detailed here, consistent with the source handoffs' own data-minimization and the "keep it factual, not a case" decision.

Threads carried as their own manifest rows rather than folded (so nothing is lost): the smaller/dormant items (Bitsies, Us game, Mumford Week Plan, Sea Ray Trainer, Bills sweep) each appear in the manifest even though several have had no movement since early August.

### Consistency — contradictions between handoffs, and which was trusted

Trust rule throughout: **newest timestamp wins**, and each is flagged either way.

1. **Roswell outstanding balance to Nancy — $58,921.38 vs $43,921.38 vs $38,921.38.** Trusted: **$38,921.38** (v1.4 handoff + `family-evidence-ledger-v1.2_REBUILT`, both 2026-08-31, both repayment legs settled). The higher figures are earlier states before the $20k was resolved.
2. **Dale revision date — Aug 30 vs Aug 28.** Trusted: **Aug 28** (proven by the verbatim email extract; email timestamp 2026-08-28 23:45 UTC). The counter-proposal, counsel-packet, reply draft, and both timeline CSVs still say Aug 30 and need correcting — flagged as an open cleanup.
3. **The 6/1/26 $5,000 (…2585) — repayment vs Jeff's internal transfer.** Trusted: **repayment** (Jeff-confirmed, per v1.4 + ledger v1.2). The `2585-account-finding` file argued it was NOT a repayment and was never edited to match the later reinstatement.
4. **…2585 as source of $24,269 in Nancy advances.** Trusted: **retracted** (it's Jeff's account). But the retracted row and three inflow rows still sit in `ROSWELL-TIMELINE-v1.1.csv` — the CSV was never corrected. Flagged for cleanup.
5. **Gross advance/spend figure — $32,659.12 vs $32,998.09.** Trusted: **$32,998.09** (corrected for a $546.93 duplicate + $885.90 "rocwll" recovery). The counter-proposal still carries the old $32,659.12.
6. **Documentation level — 28% vs ~93%.** Trusted: the newer, higher substantiation — the counter-proposal's "28%" premise is stale; `HOME-DEPOT-ORDERS-RC.md` (2026-08-14) already itemizes the appliance + cabinet orders (+$12,868.76).
7. **Safeco scope of loss — "none exists" vs "found."** Trusted: **a bathroom-only scope exists** (found 2025-09-23, $10,981.03 / $8,837.38). A kitchen-specific carrier scope still does not exist — so the older "no scope" statements are only half true now.
8. **Adjuster — Jessica LaClair vs Jordan Stoddard.** Unreconciled in the source corpus. The newest handoffs treat **Stoddard as current, LaClair as earlier**; used that way here but flagged — this was never definitively reconciled.
9. **Mold Masters total — $17,663.38 vs $18,673.88.** Trusted: **$18,673.88** (six payments, newer). The $8,840 payment still has no invoice.
10. **HD $8,269 (2025-12-05) — cabinets vs appliances.** Trusted: **appliances** (H4017-567029); cabinets are the separate $4,599.76.
11. **CMG monthly payment — $1,911 vs $2,246.17.** Unresolved (possibly two different loans); the reply-to-Dale is written to make Dale state the exact figure.
12. **Fairmount invoice — "stuck / do not send" vs "already paid."** Trusted: **paid Aug 21, 2026** (E-104). The alarm propagated through four docs because nobody opened the link.
13. **FinRecon SimpleFIN sync — "disabled/OPEN" vs "loaded and running."** Trusted: **fixed and running** (2d50c19/ba366f5). `FINRECON-SEAM-DEFECT-20260812.md` still reads OPEN and is stale.
14. **Distiller "green" vs "9 nights blocked."** Trusted: **it was blocked 8/14–8/22** — a real monitor defect (tested whether the job ran, not whether it worked). Now fixed.
15. **MacBook offline vs reachable (same morning 8/23).** Both true at different times — the laptop came back between 04:46 and 12:46. (The laptop dropping off Tailscale is a recurring pattern, relevant to Thread 17.)
16. **AI_ERROR_LOG high-water number.** Genuinely forked across machines (Thread 29) — no single correct number; cite by date+title.
17. **Covert-audit AnyDesk incoming-session count — "2" vs "5".** Same dates (Jul 28 / Aug 12), different counts across two 8/28 docs — unreconciled; flagged, low stakes.
18. **Purcell — settled vs silently stalled.** Unknown; the deadline (Aug 10) passed unnoticed and nothing is newer than July 25. Explicitly flagged as needing Jeff (Thread 14).

### Low-confidence items flagged (not guessed)
- Whether Purcell settled, lapsed, or is still live (Thread 14).
- The "Anthony" tort-claim-vs-Nancy thread from the ClaudeBox v1.2 — mentioned once, unconfirmed.
- Three unverified Roswell items from v1.4: Invoice #1101 ($5,000, no matching txn after 3 searches), Estimate #1091 discrepancy ($9,175 vs $11,050), and a $4,000 Pacific Contracting drywall bill (2026-06-04) — all unreconciled.
- The tax-position conflict: the Form 4684 casualty file says Jeff is sole beneficial owner (Nancy contributed $0), which conflicts with billing Nancy for counter-proposal Sections 5.1 and 5.4.
- The job-site voice recording (`recording-evidence-note_RC.md`) is adverse to Section 5.2 and must be disclosed to counsel before that section is asserted — a legal-strategy flag, not a data gap.

---

*End of master status. This document was compiled by a remote session from a live pull of the MacBook Pro; the Macs remain the canonical source. Regenerated daily at 5pm Pacific by the end-of-day Routine once the handoff mirror is syncing.*
