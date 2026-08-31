# HANDOFF — PURCELL ACCOUNTING · resume point

**Written 22 July 2026 · supersedes the 21 July handoff · cwd `~/ClaudeBox/Malicious Compliance`**

---

## STATE IN ONE PARAGRAPH

The **hidden-cost hunt (second pass) is DONE and verified** — 45 agents, 0 errors, report saved.
The **full accounting is NOT done** — it was launched, then every one of its 14 agents died on
"You've hit your session limit · resets 4:20pm America/Los_Angeles." **The full-accounting run is
a clean re-run after 4:20pm PT** (its journal is empty — no cache to recover). Everything the
re-run needs has already been folded into its script, so just re-launch it.

---

## DO THIS FIRST (after 4:20pm PT, when the session limit resets)

Re-launch the full-accounting workflow. Its script was **edited 22 July** to carry all the
second-pass corrections in its ground-truth briefing, so it is ready as-is:

```
Workflow({scriptPath: "/Users/jeffmumfordmacmini/.claude/projects/-Users-jeffmumfordmacmini-ClaudeBox-Malicious-Compliance/4753846e-d952-4e4d-bd78-56479008fc9e/workflows/scripts/purcell-full-accounting-wf_21a3243d-982.js"})
```

Do **not** resume-from-runId — that run's agents all errored, nothing is cached, a fresh launch is
correct. It fans out 7 readers → assemble → 5 adversarial challenges → final document, and
`return`s `{ final }` (a shareable Markdown project record). When it completes, **save `final` to
disk** (the hidden-cost run's `final` came back fine but I had to write it out by hand — see
below) and drop it in this FINAL package.

**Watch quota**: the hidden-cost run (45 agents, ~4.5M tokens) ran clean at ~1:00pm; the
full-accounting run died at ~3:15pm. The reset is 4:20pm. If it dies again immediately, the limit
hasn't cleared — wait, don't burn retries.

---

## WHAT GOT DONE THIS SESSION

1. **Re-ran `purcell-hidden-costs-2-wf_231bc80e-944.js`** — the run that died on the weekly limit
   on 21 July. This time: **45 agents, 0 errors, 16 costs survived adversarial testing.**
2. **Saved its report** to
   `PURCELL - FINAL 2026-07-20/HIDDEN COSTS REPORT — 22 July (second pass).md` (27,710 chars).
   The workflow returned the report text in its result; I extracted it with a small python
   snippet and wrote the file. The raw task output (full 981-line result incl. per-agent
   previews) is at
   `/private/tmp/claude-501/-Users-jeffmumfordmacmini-ClaudeBox-Malicious-Compliance/0ab615c5-a05d-4d2b-ab6c-5dc00fad0d9e/tasks/wm5subzom.output`
   and the per-agent journal at
   `…/subagents/workflows/wf_ae602ab8-375/journal.jsonl`.
3. **Verified the run's error-log entries E-040–E-043 are on disk** in `~/ClaudeBox/AI_ERROR_LOG.md`
   (the workflow's agents appended them mid-run). No action needed; they're logged.
4. **Edited the full-accounting script** to inject a new
   `=== VERIFIED 22 JULY ===` block ahead of its TOOLS section, carrying every second-pass
   correction so the re-run builds on them. **This is the only change to that script; it is good.**

---

## THE HIDDEN-COST HEADLINE (for whoever briefs Jeff)

Read the full report before quoting anything. The one-paragraph version:

- **Verified new Purcell money: $2,418.39** (net $2,400.39 after an $18 scrap offset). Small —
  ~9¢ on the dollar against the $28,034.91 booked. Jeff's instinct that spend was missing is
  right, but the amount is minor.
- **The bigger finding runs the OTHER way**: the message archive shows **$2,910–$4,710 of booked
  labor cannot stand as written.** Restated total cost ≈ **$29,469–$31,269** vs $28,034.91 booked.
- **This does NOT change the entitlement.** The claim is contract value of completed work under
  §11; cost doesn't drive it. Higher verified cost only strengthens the equity/anti-profiteering
  story. Say this every time the numbers move.
- **The exposure is in the OVERSTATED lines, not the missing ones** — fix these before any number
  leaves the building:
  - The **"$4,000 cash to Steve Miller"** line is contradicted. Steve's Purcell involvement
    starts 5/1/26 (recruited 4/30). Documented band **$1,200–$3,000** ($950 written invoice 5/5 +
    ~$900 drop 5/16 + at most ~$1,150 of the mixed 6/11 "$2k to get us all caught up" which
    expressly includes Roswell cab work).
  - **Identity correction (E-042):** every pre-May "foreman" text (number **+1-505-309-6128**) is
    **TJ / Tanner Jackson**, the winter crew boss at $20/hr cash — **not** Steve Miller. If the
    $4,000 line went into a filing with Steve's name on winter work, one subpoena breaks it.
  - **Paxton:** only **$735** of her counted $2,645 carries a contemporaneous Purcell memo; −$590
    memo'd to other jobs, −$1,320 unmemo'd → non-deck. 
  - **Hinckley:** the two $1,000s (Venmo txn 4861 + Zelle txn 1623) are **one** $2,000 payroll
    event for a 71.5-h timesheet, 42.5 h deck → deck share **$1,188.81**.
  - **$3,017.50 of "materials" is uninstalled railing** sitting at the client's property =
    recoverable inventory, not consumed cost. HD (Karissa) made a **written no-fee return offer
    6/6/26**. This is both money Jeff can recover AND the other side's mitigation argument.
  - **Post caps $103.09 — UNRESOLVED.** Told to return 2/14, caps left the site, no credit found
    anywhere. Either an untracked credit exists (materials overstated) or 13 paid caps vanished.
    Must be resolved before any materials number is published.
- **Additive & documented** (fold into labor): TJ $850 settlement + TJ $200 Nov–Dec; Tyler
  Carlson $300 (concrete-pad labor); Amber Purkapile $100 (Venmo memo "Labor - Deck", verified
  OUTSIDE the counted $5,253.65 — E-043). **Verified new material/disposal:** Metro South 12/2
  $207.98 + 12/4 $68.54 (net $18 scrap); Masons fiber $13.06; demo hammer $400 (durable-tool
  valuation open); Hinckley $90 4/3 (purpose pending Jeff).
- **Phantoms killed — claim NOTHING for these** (they protect Jeff): VEVOR compactor $399.99 =
  Silverman job (E-040); Carver Rock $333.13 + McFarlane's $284 gravel = geolocated to
  **Aldercrest**, not Purcell (E-041); Home Supply Warehouse 12/9 $548.85 = HD-tagged "JENN";
  porta-potty / temp power / ready-mix truck = never existed; earlier Milwaukie Lumber "≈$1,102"
  = mostly ATM cash withdrawals.
- **Probable, not yet verified** (label as such if used): Milwaukie Lumber $715.84 on Citi;
  HD $300 rental deposit 12/1 (invoice 6905388, never refunded); HD $88.89 12/16; Metro South
  $52.32 4/9. Total ~$1,157.05.

### UPDATE 23 July — TJ's Drive timesheet OPENED. "Go get these" item 3 is CLOSED. (E-044)

Jeff pointed to it: **`2025 - Timesheet  - TJ.xlsx`**, Google Drive, owner jeff@odd-jobs.org,
file id `1c8OIpJSmUx51XNxk0lv3Urvo_5BJYZtv`, modified **2026-02-12** (envelope-pickup day). Read
it with the Drive connector (`read_file_content`, `includeComments: true` — **the comments are
TJ's own contemporaneous hour submissions and are half the evidence**).

What it settles:
- **$850 CONFIRMED as an amount** — 42.5 h, $20.00/h, Total Due $850.00, Approved=Y/Paid=Y, and
  TJ's 2/3/26 comment lists exactly those 8 dates. **But the Task/Job Description column is EMPTY
  on all 8 rows**, and the comments carry no job names. **The timesheet does NOT attribute the
  $850 to Purcell.** Report §2 item 1 was graded `receipt-or-invoice` @ 90 for deck attribution —
  that grade does not survive. Deck-evidenced portion is ~25.5 h ≈ **$510**, leaving **~$340
  unattributed**. Re-grade before this number goes anywhere.
- **$200 Nov–Dec CONFIRMED and upgraded** — the November sheet job-names them: 11/16 "Purcell
  Deck Kickoff" 1.0 · 12/1 "Deck Decon" 3.0 · 12/2 "Site Prep" 3.0 · 12/3 "Site Prep" 3.0 =
  10.0 h = $200. (The two "Site Prep" rows carry no job name — minor caveat.) The sheet's own
  note **"Cash $400 12/5"** corroborates the 12/5 cash payout finding.
- **$60 gap:** November sheet totals 17.0 h = $340; annotated cash paid = $400.
- **12/12/25 "Purcell" 5.0 h ($100) still Approved/Paid BLANK** — unpaid, not a missing cost.
- **The $1,050 payday is off by an hour:** TJ's 1/10/26 comment (Dec 15,16,17,18,30 + Jan 5–9)
  sums to **53.5 h = $1,070**, not 52.5 h / $1,050. Those rows were **never transcribed into the
  sheet and carry no job names** → the Dec 15–Jan 9 window stays **fully unattributed**. The
  spreadsheet cannot split it. **Only TJ can.** Move that to the five-minute-asks list.

**"GO GET THESE"** (report §7, ranked by $ at stake): Spaeth itemized invoice (swings $1,233.54) ·
Steve Miller's written payment allocation + Chase ...2585 statement · ~~TJ's Google Drive
timesheet~~ **(CLOSED 23 Jul — see above)** ·
Synchrony/Lowe's ...3676 statements · HD Pro Xtra receipt pulls · Amex/Citi Feb–Mar statements ·
Milwaukie Lumber account statement · Carver/McFarlane's delivery-address tickets · Metro South
scale tickets · execute-or-price the rail-kit return · City of Milwaukie permit lookup · five
five-minute asks (Hinckley, Tanner, Kari, Amber, Girgich).

---

## AFTER THE FULL ACCOUNTING RUNS

Per the 21 July handoff, still open — do these once the accounting document exists:

3. **Fold both workflow outputs into the FINAL package** and **regenerate the two attorney
   documents** (Counsel Packet + Adversarial Analysis). They still need: the **§4 citation fixed**
   (attribute the "functional and usable" language to the **18 Oct 2025 proposal**, restore the
   dropped punch-list carve-out) and the **photo claim corrected** ("5 of 243 site photos" is
   wrong). **Regenerate — do not annotate.**
4. **Ask Jeff to confirm two inferences** that everything downstream rests on:
   - Which timesheet column is the deck (`matt_gibb_timesheet_split_roswell_deck.xlsx`, no headers).
   - The **$60/hr** rate (from `Settings!B5`).
   - (New this pass) What the **Hinckley $90 on 4/3** covered — post bases or day labor.

---

## STANDING ORDERS — BINDING (do not relax these)

- **"No sends without my hand"** (Jeff, 20 Jul). Draft anything; **transmit nothing** — email,
  letters, vendor correspondence, forms. Approving content ≠ approving send. See
  [[no-sends-without-jeffs-hand]].
- **Delete nothing.** File is "prepared in anticipation of litigation" → preservation duty.
  Neutralize send paths (clear `To:` fields); keep the documents. The Karissa/HD credit email
  (drafted 14 July) and the "Re: Accountability" draft (Z_PK 342, still addressed to Lisa) are
  **not to be sent**.
- **The PDFs are the source of truth, not finrecon.** Any analysis starting from
  `LIKE '%purcell%'` is wrong and low. Current source of truth = the **21 July rebuilt working
  document**, not any 13–20 July packet.
- **AI ERROR LOG is binding and append-only** (`~/ClaudeBox/AI_ERROR_LOG.md`, now at E-043).
  Catch a false claim → append a new entry. Never edit/delete a prior one. Log your own errors.
- **Voice**: confidence index (0–100) on every estimate. No commentary on Jeff being tired /
  working late / needing rest. No wellness sign-offs.
- **Covenant** governs anything touching the intel archive / family data (`~/ClaudeBox/COVENANT.md`).

## OUTBOUND-DOCUMENT RULES (the accounting goes to the other side)

Absolute exclusions: (1) nothing privileged — not the Counsel Packet / Adversarial Analysis /
Personal Context, not quoted, not paraphrased; use only primary sources. (2) No third-party
personal info — crew appear as name, role, dates, work performed only (the archive holds private
medical/family detail — none of it goes in). (3) No argument, no characterisation of the clients,
no motive speculation. (4) Nothing about Jeff's finances beyond this job's costs. (5) No
unsupported facts — primary document or it's omitted / explicitly labelled an estimate with basis.

---

## KEY PATHS

- FINAL package: `~/Downloads/PURCELL - FINAL 2026-07-20/` (`START HERE — 21 July.md` inside)
- Hidden-cost report (this session): `…/HIDDEN COSTS REPORT — 22 July (second pass).md`
- Full-accounting script (edited, ready to re-run):
  `~/.claude/projects/-Users-jeffmumfordmacmini-ClaudeBox-Malicious-Compliance/4753846e-d952-4e4d-bd78-56479008fc9e/workflows/scripts/purcell-full-accounting-wf_21a3243d-982.js`
- Hidden-cost script (already run clean): same dir, `purcell-hidden-costs-2-wf_231bc80e-944.js`
- Ledger `~/ClaudeBox/finrecon/data/finrecon.db` · iMessage `~/ClaudeBox/_tmp_msg/chat.db`
  (Apple-epoch **nanoseconds**; text often in `attributedBody`) · Photos
  `~/Pictures/Photos Library.photoslibrary/database/Photos.sqlite` (Apple-epoch **seconds** UTC) ·
  Mimestream store under `~/Library/Containers/com.mimestream.Mimestream/…/Mimestream.sqlite`
  (copy + wal/shm; partial sync — absence ≠ proof).
- `find` for this matter is **case-sensitive** — always `-iname "*urcell*"`.

**Confidence in this handoff: 96.** The only untested item is whether the 4:20pm reset actually
clears quota for the full-accounting re-run.
