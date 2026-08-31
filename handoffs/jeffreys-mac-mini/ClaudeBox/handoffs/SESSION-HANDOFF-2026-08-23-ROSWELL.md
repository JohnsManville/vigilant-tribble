# Session handoff — Roswell archive · MBP drain verification
## From: Claude Code on the Mac mini · 2026-08-23 05:15 PDT
## To: the next session on either machine

Every number below was read off disk or a live command this session, not recalled.
Where something is inference rather than observation, it says so.

**Read order:** `~/ClaudeBox/CLAUDE.md` (identify the machine first) → this file →
`SESSION-HANDOFF-2026-08-12-ROSWELL.md` (still the substantive Roswell brief).

This is the *Roswell lane*. `PRESENT-STATE-AND-HANDOFF-2026-08-23.md` is the system
state for the same morning. Do not duplicate one into the other.

---

## 1. Headline — a superseded brief is still in circulation

A session was opened today by pasting in **`_SOURCE-Roswell_Archive_Handoff_ClaudeCode_RC.md`**
(the 2026-08-12 Cowork cloud brief) as if it were live work. It is not. It was answered
the same evening it was written, by the session that produced
`SESSION-HANDOFF-2026-08-12-ROSWELL.md`, which corrects **11** of its "verified facts."

Working that brief from the top means redoing eleven days of finished work and
re-importing its errors. Verified today:

| RC brief claims | Actual, verified 2026-08-23 |
|---|---|
| FinRecon blocked, schema unknown, format must be determined | Python package at `~/ClaudeBox/finrecon`, **schema v12**, 6.1 MB live DB. Runbook written |
| FinRecon lives in `~/.claude/projects`, 7 sessions / 37.3 MB | It does not. Mini has 6 project dirs, none FinRecon. That Notion row counted *transcripts about* it |
| Photo record 100% dark | 13 GPS-stamped assets + `metadata.csv` at `finrecon/data/roswell_photos/` |
| iMessage record 100% dark | 2,899-file export on the MBP; Roswell extract already at `07 Communications/iMessage threads` |
| Archive structure not started | Built. **196 files** across all 10 categories |
| Master Index not started | `_manifest/MASTER-INDEX-RC.csv` — **196 rows**, exact spec'd header |
| Policy Summary not started | `ROSWELL-POLICY-SUMMARY-RC.md`, 27 KB, done to the limit of local data |
| Rose City Labs correction letter to be drafted | Drafted, at `02 …/DRAFT-rose-city-labs-correction-request-DO-NOT-SEND.md` |

**Recommended:** rename the RC brief to `_SUPERSEDED-…` so the next paste can't mistake it
for live. Not done this session — renaming touches an original.

### The 8/12 handoff is itself stale on one point

Its §5 and its doc table say the FinRecon seam defect is **OPEN** with scheduled sync
**DISABLED**. Both are now false:

- Fixed by **`2d50c19`** *(2026-08-12, "fix(loader): symmetric seam guard for native feed
  over synthetic rows")* — note this commit is in the **nested `finrecon` repo**, not
  `ClaudeBox`. Looking for it in ClaudeBox returns "not a valid object name."
- `com.oddjobs.finrecon-simplefin-sync` is loaded in launchd.
- `FINRECON-SEAM-DEFECT-20260812.md` still reads OPEN. Superseded by
  `HANDOFF-2026-08-23-AUTOMATION-LANE.md`.

---

## 2. What this session actually did

Jeff put the MacBook Pro on the network mid-session. That unblocked exactly one thing:
**§9 of the 8/12 handoff**, which warned that the best build set on either machine —
permit drawings, Kasey's seven "12225" elevations, and the PNW Mold Masters **W-9**
(settles the Inc-vs-LLC question) — existed *only* on the MBP, "a backup of a backup,"
and said copy it into the archive early.

Checked by **content hash**, not filename:

| Source on MBP | Result |
|---|---|
| `Claude/Projects/Handoff Clone/Odd Jobs Bids - Backup 2026-06-10/2870 SE Roswell` | **24/24 md5-identical** to `_source-backup/`. W-9 included, filed in `03` and `04` |
| `Claude/Projects/2870 SE Roswell` (40 MB, the RC brief's "connected folder") | **22/22 present** in the archive by hash. 0 missing |

**The MacBook holds no Roswell material this archive does not already have. §9 is CLOSED.**
Recorded in `roswell-archive/_manifest/copy-log.txt` so it survives the MBP going offline.

MBP-unique and deliberately **not** copied: `Claude/Projects/imessage export` — 21 GB,
2,899 files. The Roswell-relevant extract is already in `07`. Do not drag 21 GB onto a
Mini sitting at 94% full.

---

## 3. Archive present state — verified

| Category | Files |
|---|---|
| 01 Insurance Claim | 5 |
| 02 Mold Testing, Protocols & Clearance | 2 |
| 03 Remediation & Contractors | 2 |
| 04 Design & Specs | 48 |
| 05 Renovation - Rebuild | 10 |
| 06 Photos & Video | 39 |
| 07 Communications | 40 |
| 08 Financials | 3 |
| **09 Permits & Inspections** | **0 — 100% dark** |
| 10 Property & Ownership Docs | 16 |
| **Total** | **196** |

Master Index: 196 rows, header `Date,Type,Title,Source,FromTo,Category,Link,Amount,Workstream,Version,Notes,Confidence`.

**Checkpoint status:** Jeff's standing rule is *stop after the Master Index, before
building Deliverables C–H*. The Master Index exists. **The next session is at that
checkpoint and should not start C–H without Jeff.**

---

## 4. FinRecon — Roswell slice

- `documents` table: **250 rows**. `claim_flag` breakdown: **8 `claim`**, **242 `undetermined`**.
- All 8 claim-flagged docs carry `job_ref = 'roswell:whole'`, dated 2025-04-08 → 2025-07-09,
  including **Estimate 1072 at $27,400** (PNW Mold Masters, 2025-07-08, `doc_type=invoice`)
  and Rose City Labs $412.00.
- **Deliverable G is genuinely unblocked.** All eight target fields from the RC spec have a
  home on `documents`:

  | RC spec field | FinRecon column |
  |---|---|
  | date | `doc_date` |
  | vendor | `vendor` |
  | amount | `amount_cents` |
  | payment_method | `payment_method` |
  | category | `category_id` |
  | room_or_phase | `job_ref` (`roswell:<room>`) |
  | source_document_link | `file_path` |
  | claim_eligibility_flag | `claim_flag` |

- ⚠️ **`job_ref` is on `documents`, NOT on `transactions`.** Querying `transactions.job_ref`
  returns *"no such column"* and reads like the schema work was never done. It was. This
  session made that exact mistake — it is written down here so the next one doesn't.
  `job_ref` also exists on `mileage_log` and `labor_payments`.
- **The 242 undetermined documents are the largest piece of unblocked work available** and
  need no MBP, no Gmail, and no decision from Jeff to start.

---

## 5. New finding — the archive's durability is thinner than it looks

- `roswell-archive/` is **git-ignored** (`.gitignore:83`, deliberate — 322 MB of PDFs and
  binaries). **0 files tracked.** It does not ride the nightly four-repo GitHub sync.
- **No copy on ClaudeData.** Searched for the W-9 and for `*Roswell*` to depth 6: nothing.
  `intel-mirror.sh` runs `/Volumes/ClaudeData/intel` → `~/ClaudeBox/backups/intel-mirror`,
  i.e. it pulls *onto* the Mini. It does not back the archive up.
- **Time Machine is the only backup.** `tmutil isexcluded` reports `[Included]` for both
  `roswell-archive` and `finrecon/data/finrecon.db`; latest backup `2026-08-23-042658`.
  *Not fully verified* — the snapshot could not be enumerated to confirm the files landed.
  Worth one direct restore test.
- Mini root is **12 Gi free**. The archive is 322 MB; the risk is the disk, not the archive.

Net: the build set that was "a backup of a backup on the MBP" is now a **single live copy
on the Mini plus Time Machine**. That is better than 8/12, but it is not two places.

---

## 6. Still open, ranked — none of this needs the MacBook

1. **Clearance test does not exist.** `02` holds only the E215 report and the unsent
   correction draft. Both a top-3 claim gap and Nancy moving into remediation sealed behind
   drywall. Rose City Labs **503-307-0096**, covered under **APC 10(d)**. Still the single
   clearest both-workstreams action.
2. **June 2025 discovery photos still missing.** `06` contains one folder, `2025-10 Progress`.
   Everything is 2025-10-07 or later. The carrier demanded these **four times** (6/23, 6/24,
   6/27, 11/10). Highest-value claim assets that exist. Sanctioned path is
   `~/ClaudeBox/scripts/photo-lane/`, not raw `Photos.sqlite`.
3. **Permits `09` = 0 files.** A house that cannot pass final inspection cannot be occupied.
   Bathroom drain + floor heat, City of Milwaukie.
4. **Fungi sublimit still unknown** — the ceiling if the water framing fails. Needs
   `2025 Safeco Renewal.pdf` (225 KB), a Gmail attachment on Julie Mumford's **2026-06-17
   4:38 PM "Fwd: SAFECO Renewal"**. No local reach; needs the cloud session.
5. **242 `undetermined` documents** in FinRecon (§4).
6. Suit limitation runs to **2027-06-13 (~294 days)** on the "date of loss" reading; the
   alternative provision is earlier and unresolved without the policy.

---

## 7. Open decisions — Jeff only, unchanged since 8/12

1. 🔴 **The ownership conflict.** `finrecon/data/roswell_casualty_case.md` says Nancy is on
   title only to get a primary-residence rate and the property is beneficially Jeff's. The
   policy and claim run on it being **her** primary residence. Both positions are in Jeff's
   own files. **Settle before any further position is stated to Safeco or to Melissa** —
   policy duties include examination under oath.
2. Nancy's **$8,837.38 Zelle of 2025-10-02** — exact amount of the CMG check that landed
   eight months later. Loan or reimbursement? Changes the casualty basis and the $59,771 total.
3. The casualty file **understates basis by ~$17.7k** (omits the full $17,663.38 to Mold
   Masters). That workpaper already went to Melissa.
4. **Archive location** — Drive vs local. Still unresolved. §5 raises the stakes.
5. Whether to create FinRecon accounts for the 3 unmapped Bridge accounts.

Unreconciled name conflicts, carried forward: adjuster **Jessica LaClair** vs
**"Jordan Stoddard"**; CMG **Bri Arriola** vs **Brian Stone**.

---

## 8. Do not redo

Archive structure · Master Index · Policy Summary · Workstream A build doc · FinRecon
runbook · schema v12 / `claim_flag` · seam defect · the MBP drain · the Rose City Labs
correction draft. All done. Check this file and the 8/12 handoff before starting anything
the RC brief calls "not started."

---

## 9. Rules in force

- **Read-only on originals.** No sending, no replying, no deleting. Drafts only, for Jeff's
  hand. The Rose City Labs letter is drafted and **must not be sent**.
- Never move, rename, or delete originals. Copy into the archive.
- Surface spec conflicts; never silently pick the newer.
- Labor at **$99/hr** friends-family unless Jeff says otherwise.
- Never fabricate contents of sources you cannot read. Say plainly what you cannot reach.
- **Todoist is dropped from scope.**
- Don't hand Jeff repetitive multi-step manual work — drive the clicking. State a blocker
  once and move on.

---

## 10. This session's footprint

Nothing sent, nothing deleted, no originals touched. Two writes:

1. Appended the drain verification to `roswell-archive/_manifest/copy-log.txt`
2. Created this file

**Archive completeness: 63/100** (was 61 at the 8/12 handoff; +2 for the MBP drain being
verified rather than assumed). Photos pre-Oct-2025, permits, the clearance test, and the
declarations page remain the holes — none of them moved this session.

**Confidence: 93/100** on archive state, direct hash verification. **72/100** that no further
stale copy of the RC brief is still circulating — this one reached a live session eleven days
after it was answered.

---

## ADDENDUM — 2026-08-23 10:49–10:52 PDT · commit pushed, nothing else changed

The only post-handoff action in this transcript was verifying and pushing the handoff commit. It
landed: the Roswell-lane commit is an ancestor of `HEAD` and `main` is 0-ahead of all three
remotes (mbp, mini-local, origin on ClaudeData). No archive files, index rows, or FinRecon data
changed after the body above was written — every number in §3–§10 still stands. **This is the
current Roswell brief; the checkpoint (§3) still holds — do not start Deliverables C–H without
Jeff.** Confidence 95/100 (push state read live from git).
