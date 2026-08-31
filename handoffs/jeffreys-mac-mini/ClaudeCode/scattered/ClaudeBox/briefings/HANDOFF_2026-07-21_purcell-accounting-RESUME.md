# HANDOFF — PURCELL ACCOUNTING · resume point

**Written 21 July 2026 · for a fresh Claude Code session · cwd `~/ClaudeBox/Malicious Compliance`**

---

## READ THIS FIRST — three traps that have already cost ~20 hours

1. **`find -name "*urcell*"` is CASE-SENSITIVE and misses the current package.** Always `-iname`.
2. **The operative package is `~/Downloads/PURCELL - FINAL 2026-07-20`** (20 Jul 16:23, has a
   SHA-256 `MANIFEST.csv`). It **supersedes** `~/Downloads/Purcell_Settlement_Package` (15:39).
   Multiple prior sessions burned hours analysing the superseded one. Start with
   `START HERE — 21 July.md` inside the FINAL folder.
3. **Do not import conclusions from AI-generated files on disk** — several contain confident
   errors. Open the primary artifact or don't claim it. `~/ClaudeBox/AI_ERROR_LOG.md` is the
   append-only ledger of prior false statements; read it, append to it, never edit prior entries.

---

## WHAT JEFF ASKED FOR (both incomplete)

**A. Full accounting** — "what was planned, what was supposed to happen, what happened, all tied
to evidence" — to share **once** with the clients before they take legal action.

**B. Hidden costs** — find money spent on this job that is not in the accounting. This is the
active priority; he redirected to it last.

## WHY THEY DIDN'T FINISH

Two workflows launched and **all 22 agents failed on "You've hit your weekly limit · resets 7am
America/Los_Angeles"**. Zero agents completed. **Both journals are empty — resuming gets no cache
hits, it is a full re-run.** Scripts are saved and reusable:

- `~/.claude/projects/-Users-jeffmumfordmacmini-ClaudeBox-Malicious-Compliance/4753846e-d952-4e4d-bd78-56479008fc9e/workflows/scripts/purcell-full-accounting-wf_21a3243d-982.js`
- `~/.claude/projects/-Users-jeffmumfordmacmini-ClaudeBox-Malicious-Compliance/4753846e-d952-4e4d-bd78-56479008fc9e/workflows/scripts/purcell-hidden-costs-2-wf_231bc80e-944.js`

Re-run with `Workflow({scriptPath: "<path>"})`. **Both scripts are good** — they carry the full
ground-truth briefing and the exclusion rules. Reuse rather than rewrite. Consider running the
hidden-cost one first and with fewer lanes if quota is tight.

---

## ACCESS THAT NOW WORKS (it did not earlier — don't re-diagnose)

- **Full Disk Access is granted.** `~/Library/Messages/chat.db` → copy to a readable dir first
  (`cp` to `~/ClaudeBox/_tmp_msg/`, take `.db` + `-wal` + `-shm`). **422,124 messages, 938 groups.**
  `message.date` is Apple-epoch **nanoseconds**; text is often in `attributedBody`, not `text`.
- **Photos**: `~/Pictures/Photos Library.photoslibrary/database/Photos.sqlite` → copy to /tmp.
  41,678 assets. `ZASSET.ZDATECREATED` = Apple-epoch **seconds, UTC**.
- **Mimestream** (both mail accounts): `~/Library/Containers/com.mimestream.Mimestream/Data/
  Library/Application Support/Mimestream/Mimestream.sqlite`. **Partial sync** ~1,056 msgs; Home
  Depot history only reaches back to 23 May 2026. Absence there is NOT proof.
- **PDFs**: `pypdf` is installed; **poppler is NOT**, so the Read tool cannot render PDF pages.
  Extract text with pypdf.
- **HEIC**: convert with `sips -s format jpeg -Z 1400 in.heic --out out.jpg`, then Read.

---

## VERIFIED FACTS — do not re-derive these

### The agreement
- Executed contract: `PURCELL - FINAL 2026-07-20/4 SOURCE DOCUMENTS/Purcell Lisa Darin —
  DECKadent Dreams 20x20 TREX DECK (2).pdf` — 100,654 bytes, 5 pp,
  sha256 `e5cc11c475daff53ad31573a9ab43f312f64e143137ee209cc0be4f43d6fe211`.
- **§11 Termination present verbatim.** Only one of four variants containing it.
- Signature block: "Jeff Mumford … Nov 5, 2025" over "**DP / DP / Client Nov 12, 2025**".
  Caveats: **one client mark only** (no Lisa signature), rendered text with **no signature
  dictionary / audit trail**, PDF `/CreationDate` **28 Dec 2025** (7 weeks after the date shown).
- Contract total **$23,841.96**; deposit **$12,000** received 14 Nov 2025.
- **§4** says only *"50% balance due upon substantial completion"* — **no definition**. The
  *"functional and usable for its intended purpose"* wording is in the **18 Oct 2025 proposal
  ($19,385.43)**, a different unexecuted document, and the packet quotes it **truncated**, dropping
  *"…regardless of minor outstanding punch list items"* — the clause that helps Jeff. **CONTESTED.**
- **§6 puts permits on the CLIENT.** Work was unpermitted (Darin asked to skip them 7 Nov 2025).
- §5 governs change orders. §12 entire agreement.

### The claim
- Asking **$7,500** settlement; balance for work performed **$8,265.67**; due **10 Aug 2026**.
- ~85% complete — only railing installation outstanding.
- **The claim rests on contract value of completed work, NOT on cost.** Higher costs strengthen
  the equity argument; they do **not** raise the entitlement. Say this every time costs move.

### Money
- Materials **$18,781.26** = $18,010.62 receipted (HD 566634 $14,171.28 · 576810 $766.26 ·
  576851 $758.66 · 587703 $2,008.08 · 588863 $306.34) + $770.64 counter runs ($165.98 12 Jan ·
  $284.21 16 Jan · $320.45 16 Feb).
- **Spaeth Lumber $3,915.41, 4 Dec 2025** — the ONLY Spaeth charge in the entire ledger. Contract
  names *"Spaeth Lumber Materials — Foundation system installation using Diamond Pier supports."*
  Quote 29 Oct was **$2,681.87** for 17 × DP50 @ $156.86. **Overage $1,233.54.** 25 piers at quote
  price = $3,921.50. **No invoice located — attribution solid, itemisation UNPROVEN.**
  Jeff confirmed verbally: Spaeth is the sole Diamond Pier supplier, only one charge should exist.
- Labor **$9,253.65** claimed ($5,253.65 traceable + $4,000 cash to Steve Miller). A prior verified
  pass found **$590 belongs to other jobs** and **$5,320 has nothing under it**. Jeff's own 6 Mar
  letter to the clients states labor to that date ≈ **$5,500**. **Pressure this number DOWNWARD,
  not up.** (An earlier claim by me that labor was "materially low" was wrong — see error log.)
- Timesheet `matt_gibb_timesheet_split_roswell_deck.xlsx` has **NO headers**. Derived from
  arithmetic: 13 working days **5–27 Feb 2026**; worker columns 29.0 h + 42.5 h = 71.5 h; job
  columns 7.0 h + **64.5 h**; rate **$60/hr** (`Settings!B5` of the companion pay workbook).
  **Which job column is the deck is INFERRED, not proven — Jeff has not confirmed it.**

### The concrete stair landing — fully evidenced
- Required because Trex specs need a poured pad with cemented posts; Diamond Pier does not meet
  the hard-surface requirement at the landing. **Not in any contracted scope document.**
- **Disclosed in writing 6 Mar 2026**: *"we'll need to pour a concrete pad."* **Lisa acknowledged
  9 Mar**: *"It somehow ended up in my Junk and I've just now read it."*
- Formed 5–6 Apr (Hinckley: *"Form is 80% set"*), **poured 9 Apr** (13 photos + 2 videos,
  geotagged, mixer + Quikrete + two post bases set), **cured 10 Apr**.
- Exhibit built: `~/Documents/Purcell_Evidence_Staging/10_Concrete_Pad_2026-04-09/` — 13 JPEGs,
  SHA-256 manifest, `EXHIBIT — Concrete Stair Landing.md`.
- **Cost $290.40, already inside the existing totals. DO NOT add a pad line — it double-counts.**
  The $129 wheelbarrow on the same receipt is a durable tool and should not be billed to the client.

### Photos
- Site coordinate **45.4564, −122.6322**. A ±130 m radius returns **886 assets (234 video)**
  across 150+ days — **but that radius also catches Jeff's own property on the same street**
  (verified: a 20 Jan "site" photo is a skunk on a driveway). **Do not quote 886 as a site count.**
- Only **67 of 886 are on local disk**; the rest are iCloud-only and cannot be opened.
- Jeff maintains a curated Photos album named **"Purcell"** — 13 photos + 2 videos, April 2026.
- **The Counsel Packet's claim *"I have 5 of 243 site photos"* is WRONG** and needs correcting.

### People
Matthew Hinckley `+15033072052` (crew lead, forms/framing, also a Venmo/Zelle payee) ·
"Gibb" `+15039899926` · Lee `+15038803314` · Tyler Carlson `+15033122527` ·
Steve Miller `+15039577479` / sd.miller827@gmail.com (foreman, paid $4,000 cash) ·
Jeff Girgich · Margaret Paxton · Audrey Parker · Amber Purkapile.
Crew group = iMessage `display_name = 'OJHS'`, chat_identifier `6cf1579874804bd49c6fcf8a715c2a31`.

### Communications status
- **Exhibit E was SENT**: 13 Jul 2026 19:39 PDT, jeff@odd-jobs.org → Lisa, cc Darin,
  *"Purcell deck — acknowledgment of termination"*, asserting Odd Jobs' ownership of on-site
  materials. This is the fact the settlement letter relies on. It holds.
- **Nothing has gone to the clients since 13 July.**
- Three unsent drafts to the clients sat in Personal Gmail; Jeff reported clearing the recipients.
  **Unverified** — they vanished from the Mimestream store, which is consistent with either
  clearing or deletion. A fourth draft, `Z_PK 342` "Re: Accountability" (29 Apr, Odd-Jobs account),
  **is still addressed to Lisa**.
- **Public exposures closed**: `odd-jobs.org/purcell` → 404 (WordPress page ID 314 set to draft,
  not deleted; rendered capture archived in `Purcell_Evidence_Staging/09_Public_Page_Capture/`).
  Square link `square.link/u/Kve7TFb2` → 404.

---

## OPEN LEADS — the hidden-cost hunt that never ran

**Purchase events evidenced in messages; no payment located:**
- **Gravel** — *"12,000lbs of gravel"* (30 Jan), *"6 more yards being delivered Monday"* (31 Jan),
  plus a December load. Supplier and cost unknown. Real tonnage, not obviously booked anywhere.
- **Plate compactor** — *"I ordered compactor"* (16 Mar). Note: a prior pass found **no equipment
  rental anywhere in this ledger for any job, ever** — verify, because if true it means rentals
  were borrowed or paid on an unimported card.
- **Concrete mixer** — borrowed from Lance 8 Apr, returned 10 Apr. Probably $0; confirm.
- **Fiberglass fibre** for the mix (9 Apr) · **#6 rebar pins from Lowe's** (3 Apr) · form lumber
  and stakes · possible ready-mix delivery (*"Truck pulls up, dispenses concrete…"*, 29 Mar).

**Untagged vendor charges needing attribution:**
- Milwaukie Lumber, ten charges ≈ **$1,102**, none tagged. The repeating $202.99/$102.99 entries
  described "J Milwaukie" may be an **account payment**, not material — prove it either way.
  Jeff says receipts likely exist; Milwaukie Lumber runs contractor accounts and can print a
  full purchase history.
- Home Supply Warehouse $548.85 (9 Dec) + $88.89 (16 Dec) · Ace Hardware $127.13 · Masons Supply
  $13.06 (9 Apr) · assorted Lowe's.

**Labor gaps:**
- Steve Miller, 11 Jun: *"end of week will be 2k to get us all caught up. That covers **the
  parcels hours i had yet to claim** as well the full cab install"* — a **mixed Purcell/Roswell
  payment**. Split if the record allows.
- $100 Venmo to Amber Purkapile, 8 Jan, note **"Labor - Deck"** — contemporaneous memo, appears
  genuinely missing from the accounting.

## REDUCTIONS — hunt these HARDER than the additions

A missed credit damages Jeff more than a missed cost. Nothing below has been resolved.

1. **Post caps return.** 14 Feb, Hinckley: *"Jeff, you get to return the post caps. They're not
   needed for cocktail rail."* Was the return made? Is there a credit?
2. **Karissa's 6 June written position** that unopened railing kits return with **no restocking
   fee**. What is the credit worth against order 566634? (Note: this **contradicts** the Will Call
   CSAs, which state a 15% restocking fee on special-order merchandise.)
3. **Concealed damage credit.** 15 Dec 2025, Jeff → `prodesk_4017@homedepot.com`, subject
   *"Concealed damage, Purcell deck"*, photo attached, asking **"Credit?"** Was one issued?
4. **Durable tools inside material totals** — the $129 wheelbarrow is known; look for others.
5. **Material bought but never installed** and still on site.

## ALSO STILL OPEN
- **The Karissa / Home Depot email drafted 14 July has never been sent.** It asks her to confirm
  the no-restock position and to quantify *"what the credit would be against the original order
  H4017-566634"* — the unanswered number under the railing figure. **Do not send it** (see
  standing order); it may also want counsel's sequencing since it creates a number in a dispute.
- **Railing count**: design of record specifies **7 × WT0836HRKFS**; only **5** were purchased.
- A **$1,000 client completion bonus** appears in the proposals and in no accounting.
- A **Handoff records package from 15 July** has never been opened.
- The **Counsel Packet and Adversarial Analysis in the FINAL package still need the §4 citation
  fixed** (attribute to the 18 Oct proposal, restore the punch-list carve-out) and the photo
  claim corrected. **Regenerate — do not annotate.**

---

## STANDING ORDERS — binding

- **"No sends without my hand"** (Jeff, 20 Jul). Draft anything; transmit nothing. Email, letters,
  vendor correspondence, forms. Approving content ≠ approving send.
- **Delete nothing.** The file is marked *"prepared in anticipation of litigation"*, so a
  preservation duty attaches. Neutralize send paths (clear To: fields); keep the documents.
- **The PDFs are the source of truth, not finrecon.** The ledger undercounts — four transactions
  were mis-tagged (`percell`, `Purcel`, `deck`, `Deck additional` = $2,129.58) and $4,000 of
  foreman labor was cash. Any analysis starting from `LIKE '%purcell%'` will be wrong and low.
- **Voice**: no commentary on Jeff being tired or working late. No wellness sign-offs.
- Give a **confidence index (0–100)** with answers and estimates.

## OUTBOUND-DOCUMENT RULES (for the shareable accounting)

Absolute exclusions — this document goes to the other side:
1. **Nothing privileged** — not the Counsel Packet, Adversarial Analysis, or Personal Context, not
   quoted and not paraphrased. Use only underlying primary sources.
2. **No third-party personal information.** The crew archive contains private medical and family
   circumstances belonging to named workers. They appear as name, role, dates, work performed.
3. **No argument, no characterisation of the clients, no speculation about motive.**
4. **Nothing about Jeff's finances** beyond this job's costs.
5. **No unsupported facts.** If a primary document doesn't back it, omit it or label it an
   estimate with the basis stated.

---

## SUGGESTED ORDER OF WORK

1. Re-run `purcell-hidden-costs-2-wf_231bc80e-944.js` (hidden costs is the active priority).
   Trim lanes if quota is tight — `reductions` and `aggregate-haul` are the highest value.
2. Then `purcell-full-accounting-wf_21a3243d-982.js` for the shareable record.
3. Fold the results into the FINAL package; regenerate the two attorney documents.
4. Ask Jeff to confirm: **which timesheet column is the deck**, and the $60/hr rate.

**Confidence in this handoff: 95.** Every fact above was verified against a primary source during
the session; the two flagged inferences (timesheet column, Milwaukie account-vs-material) are
labelled as inferences.
