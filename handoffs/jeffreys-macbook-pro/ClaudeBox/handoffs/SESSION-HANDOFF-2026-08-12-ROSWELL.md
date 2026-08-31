# Session handoff — Roswell archive + FinRecon
## From: Claude Code on jeffreys-macbook-pro · 2026-08-12 evening
## To: a fresh Claude Code session on the Mac mini

**Start here. Read §1 and §2, then §7 for what to do next.**

Source brief that started this: `~/Downloads/Roswell_Archive_Handoff_ClaudeCode_RC.md`
(written by a Cowork cloud session). **Several of its "verified facts" are wrong — see §3.**

---

## 1. Orientation

Two workstreams, running in tandem, not sequentially:

- **A — FINISH AND OCCUPY.** Nancy is displaced from 2870 SE Roswell after a June 2025 water
  loss + secondary mold. Get the house done and her home.
- **B — CLAIM ADVANCEMENT.** Safeco claim 059560682-01, policy OP6225045.

The same receipt is a build-book line and a claim line. Index once, tag for both.

**The Mac mini is now the authoritative machine** for FinRecon (decided 2026-08-12). The
MacBook Pro is a read-only replica, marked at `data/REPLICA-DO-NOT-WRITE.md` on that machine.

Paths on the Mini:

| | |
|---|---|
| FinRecon repo | `~/ClaudeBox/finrecon` |
| Live DB | `~/ClaudeBox/finrecon/data/finrecon.db` — **7,539 txns, schema v12** |
| Handoff docs | `~/ClaudeBox/handoffs/` |
| Roswell design files | `~/Claude/Projects/2870 SE Roswell/` *(MBP — may not be on the Mini)* |
| Roswell claim PDFs | iCloud → `Personal/Financial/2870 SE Roswell St Milwaukie, OR 97222/Mold Remediation/` |

`finrecon` on the Mini is now a **shell function** that cds into the project in a subshell.
Plain `finrecon <cmd>` works from anywhere. New shells only.

---

## 2. Documents this session produced — read in this order

All in `~/ClaudeBox/handoffs/`.

| Doc | What it is |
|---|---|
| **`ROSWELL-LOCAL-RECON-RC.md`** | What actually exists locally, and the corrections to the cloud brief. **Read first.** |
| **`ROSWELL-POLICY-SUMMARY-RC.md`** | Deliverable B. Policy language verbatim, deadlines, the CMG payment chain. **This is the Step 2 checkpoint.** |
| **`ROSWELL-WORKSTREAM-A-BUILD-RC.md`** | The build side. Spec conflicts resolved, what's blocking occupancy. |
| **`FINRECON-RUNBOOK-RC.md`** | How FinRecon actually works + every trap found. |
| **`FINRECON-SEAM-DEFECT-20260812.md`** | 🔴 Open bug. Scheduled sync is disabled because of it. |

Also updated: two Notion pages — *"FinRecon remote access runbook"* (was blank, now the full
runbook) and *"CLI · FinRecon — 7 sessions, 37.3 MB"* (retitled and corrected; it was the
source of the cloud session's wrong-location error).

---

## 3. Corrections to the cloud brief — do not carry these forward

| Brief says | Truth |
|---|---|
| FinRecon is a CLI project in `~/.claude/projects`, 7 sessions / 37.3 MB | It is a Python package at `~/ClaudeBox/finrecon` with a live DB. The Notion row counted *session transcripts about* it |
| Photo record 100% dark | 13 GPS-stamped assets at `~/ClaudeBox/finrecon/data/roswell_photos/` + `metadata.csv`. **But all from 2025-10-07 onward — the June 2025 discovery photos are still missing** |
| iMessage 100% dark | Full export exists: 2,896 conversations at `~/Claude/Projects/imessage export/imessage_mine/` |
| Peter Gowans phone discrepancy unresolved | Both numbers live. Active thread at `+15033801962` |
| `COUNSEL_PACKET.pdf` may be Roswell counsel | **Not Roswell — different project entirely (Jeff, 2026-08-12).** No attorney engaged. Never opened |
| Home Depot $8,269 = cabinets | **Appliances.** Order H4017-567029, reconciles to the cent. Cabinets are likely the **$4,599.76 on 2025-12-02** |
| Range spec conflict (gas vs electric) open | **Settled — electric**, delivered 2026-01-11 |
| Adjuster Jessica LaClair | Confirmed by PDFs, direct **(509) 608-4046**. But `roswell_casualty_case.md` names **"Jordan Stoddard"** — unreconciled |
| CMG contact Bri Arriola | Casualty file says **Brian Stone**. Unreconciled |
| Claim check "returned to sender, unexplained" | Checks are issued by **Proctor Financial Inc.** for CMG out of restricted escrow, with a **90-day void fuse**. The Oct 2025 check is long void — it needs *reissue*, not re-mailing |

---

## 4. The claim, as currently understood

**Coverage is accepted** — Safeco has paid. Money flows
`Safeco → CMG escrow → Proctor issues checks → Nancy AND Jeff (both must endorse)`.

First release confirmed: **check #00001432, $8,837.38, dated 2026-05-28, deposited 2026-07-21**
into Chase Premier Plus Checking (0922). Jeff withdrew **$1,000 the same day, same account, for
subcontractor labor** — escrow money straight to labor.

Money out to date, from the ledger: **$17,663.38** to PNW Mold Masters (2025-08-06 $8,823.38 +
2025-10-31 $8,840.00), **$13,989.39** Home Depot, **$412.00** Rose City Labs.
Estimate 1072 accepted 2025-07-11 at **$27,400**.

Policy language (all quoted verbatim in the policy summary, sourced from the ROR which quotes
the form):

- **Fungi sublimit is a single aggregate across Coverages A+B+C+D.** Dollar amount **unknown**.
- **Exclusion 5** — continuous/repeated seepage "over a period of **more than 14 days**", with
  an anti-concurrent-causation preamble. The **Water Seepage endorsement** is the only thing
  overriding it.
- ⚠️ The E215 lab report's own findings (chronic amplification, Chaetomium) tend to prove
  duration > 14 days. **Argue extent, never duration.**
- **Suit limitation: 2 years.** The ROR gives two alternative provisions; "date of loss" →
  **2027-06-13 (~305 days)**, "inception of the loss or damage" → earlier. Which one applies is
  unknown without the policy.
- **Proof of loss: 90 days from receipt of POL forms.** No evidence they were ever sent. Unchecked.

**Still needed and not on either Mac:** `2025 Safeco Renewal.pdf` (225 KB) — the declarations
packet with every dollar figure. It is a Gmail attachment on Julie Mumford's **2026-06-17
4:38 PM "Fwd: SAFECO Renewal"** (also carries two contractor voicemails from 6/17/2025, never
transcribed). Requires the cloud session's Gmail reach.

---

## 5. FinRecon state

- **Schema v12.** Migration 12 added `documents.claim_flag`
  (`claim`/`owner`/`both`/`undetermined`) + index — the insurance axis, deliberately orthogonal
  to `business_flag` (tax). Committed on the Mini as `4849912`, pushed, branch
  `phase4-review-ui-docs-engine`. 345 tests green. **Deliverable G is unblocked** — all eight
  target fields have a home. Room/phase convention: `job_ref = 'roswell:<room>'`.
- **SimpleFIN is connected.** Access URL in the Mini's Keychain (`finrecon-simplefin`), account
  map at `data/simplefin_map.json` — 11 accounts, verified correct including the two ambiguous
  USAA Visas.
- 🔴 **Scheduled sync is DISABLED** — see `FINRECON-SEAM-DEFECT-20260812.md`. Do not re-enable
  until the seam is fixed.
- Web UI `com.claudebox.finrecon-serve` running on the Mini. It is the **only** ingestion path
  for `documents`.

### Traps, all real, all cost time today

1. `finrecon` on the Mini used to alias a *different tool* (the analyzer REPL) that silently
   swallowed CLI args. **Fixed** — analyzer is now `finrecon-ai` / `fra`.
2. FinRecon resolves `data/simplefin_map.json`, `data/incoming/`, and the default `--db`
   **relative to the current working directory**. Running from `~` silently reported every
   account UNMAPPED. **Fixed** by making `finrecon` a cd-ing function.
3. The Keychain item is stored with `-T ""` — **no app pre-authorised**. Every read prompts.
   A denied/unattended prompt produces the *same* "no Access URL" message as a missing
   credential. Click **Always Allow**, not Allow.
4. **The Keychain is unreadable over SSH.** Anything touching SimpleFIN must run in a GUI
   session on the Mini. Everything else works fine remotely.

---

## 6. Open decisions — Jeff only

1. 🔴 **The ownership conflict.** `~/ClaudeBox/finrecon/data/roswell_casualty_case.md` says
   Nancy is on title *only* to get a primary-residence mortgage rate and that the property is
   beneficially Jeff's. The policy and claim run on it being **her** primary residence. Both
   positions are in Jeff's own files. **Settle this before any further position is stated to
   Safeco or to Melissa (tax preparer)** — the policy's duties include examination under oath.
2. **Nancy's $8,837.38 Zelle of 2025-10-02** is the exact amount of the CMG check that landed
   eight months later. Loan (as the casualty file treats it) or reimbursement? Changes the
   casualty basis and the $59,771 loan total.
3. **The casualty file understates basis by ~$17.7k** — its repair table omits the entire
   $17,663.38 paid to Mold Masters. That workpaper already went to Melissa.
4. **Archive location** — Google Drive vs local. Unresolved. Weak preference for Drive so both
   sessions can write.
5. **Seam fix design** — three questions in the defect doc; do not guess them.
6. Whether to create FinRecon accounts for the 3 unmapped Bridge accounts (USAA Youth Savings,
   two Fixed Rate Loans — real debt, currently invisible).

---

## 7. What to do next, in order

### Immediately actionable on the Mini

1. **Fix the seam defect**, then re-import the 11 archived JSONs from
   `data/archive/<slug>/simplefin-2026-08-13T034614Z.json` and re-enable the launchd job. This
   restores the CMG deposit and the $1,000 sub withdrawal to the ledger.
2. **Load the Roswell dataset into `documents`** via the web UI — now possible with
   `claim_flag`. Start with the receipts already identified in the recon report.
3. **Pull the Home Depot cabinet receipt** for 2025-12-02 ($4,599.76) and the countertop order
   (Silestone Halcyon, HD design H4017-566989 — no matching charge exists anywhere yet).

### The five things that actually move the house (Workstream A)

Detail in `ROSWELL-WORKSTREAM-A-BUILD-RC.md` §8. None of them costs meaningful money:

1. **Pick the sink** — gates the countertop template, which gates backsplash, which gates the rest.
2. **Book the clearance test** with Rose City Labs (503-307-0096). Covered by the policy under
   APC 10(d). Protects Nancy from moving into unverified remediation sealed behind drywall, and
   closes a top-3 claim gap. **The single clearest both-workstreams action.**
3. **Pull permit status** for the bathroom drain + floor heat in Milwaukie. Category 09 is 100%
   dark and a house that can't pass final inspection can't be occupied.
4. **Confirm grab-bar blocking** locations before drywall closes. Cheap now, destructive later.
5. **Decide backsplash Variant A vs B** before the overstock tile price moves.

### Needs the cloud session (Gmail/Drive reach)

6. `2025 Safeco Renewal.pdf` → the fungi sublimit and every other number.
7. Whether **Estimate 1072 was shared with Safeco before work completed** — the carrier required
   it in writing on 2025-06-24. Decides whether the $27,400 is defensible.
8. The 2025-11-10 Safeco information request and any response.
9. Whether **proof-of-loss forms** were ever issued (90-day clock).

### Checkpoints Jeff set — respect them

- ✅ Step 1 preflight — done
- ✅ **Step 2 POLICY SUMMARY — done to the limit of local data.** Numbers still missing.
- ⬜ **Stop after the Master Index, before building Deliverables C–H.**

---

## 8. Operating rules — carried forward, non-negotiable

- **Read-only on originals.** No sending, no replying, no deleting. **Drafts only, for Jeff's
  approval.** The Rose City Labs correction request (wrong property address on E215 — it says
  2908 SE Malcolm St, and the defective report was circulated to five family members and the
  contractor) is the first draft due. **Do not send it.**
- Never move, rename, or delete originals. Copy into the archive.
- OCR scans; index content, not filenames.
- Where specs conflict, surface both and let Jeff decide. Never silently pick the newer.
- Legally/financially significant items go at the **top** of the gap list.
- Labor at **$99/hr** friends-family basis unless Jeff says otherwise.
- Never fabricate contents of sources you cannot read. Say plainly what you cannot reach.
- Versioning **RC → v1.1 → v1.2**. No "final" unless Jeff says it first.
- **Todoist is dropped from scope.** Do not search it or suggest it.

### Two house rules about how Jeff wants to be worked with

- Don't hand him repetitive multi-step manual tasks — drive the clicking wherever possible.
- State a blocker once and move on. No re-warnings, no hedging, no rest sign-offs.

---

## 9. Fragile things worth protecting

- **The best build set on either machine** — permit drawings, bathroom line sets, Kasey's seven
  "12225" elevations, and the PNW Mold Masters **W-9** (which settles the Inc-vs-LLC question) —
  lives only in `~/Claude/Projects/Handoff Clone/Odd Jobs Bids - Backup 2026-06-10/2870 SE
  Roswell/`. A backup of a backup, on the MacBook Pro. **Copy it into the archive early.**
- The June 2025 discovery photos are the most claim-valuable assets that exist and the carrier
  demanded them **four separate times** (6/23, 6/24, 6/27, 11/10). They are presumably in the
  Photos library. Reading `Photos.sqlite` and `chat.db` was **blocked by the permission
  classifier** on the MacBook Pro this session — the existing `~/ClaudeBox/scripts/photo-lane/`
  tooling is the sanctioned path.
- **Archive completeness: 61/100** (was 34 at cloud handoff). Photos pre-Oct-2025, permits,
  clearance test, and the declarations page are the remaining holes.
