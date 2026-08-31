# PURCELL WORKSPACE — PRESENT STATE & HANDOFF

**Written 2026-08-23 (Sunday) on the Mini.**
**Supersedes nothing.** It is a state reading, not a new source of truth.
Source of truth remains `PURCELL-FINAL-2026-07-20/PROJECT RECORD AND ACCOUNTING — 23 July.md`,
governed by `PURCELL-FINAL-2026-07-20/PHASE PLAN — 24 July.md`.

---

## 0. HOW TO READ THIS DOCUMENT

Every factual line below is tagged. This is not decoration — this workspace has
produced three logged incidents (E-055, E-067, E-083) in which a handoff or
rollup restated stale items as current state and pointed Jeff's hand at the
wrong thing.

| Tag | Means |
|---|---|
| **[M]** | **Measured 2026-08-23** by direct inspection of disk. Trustworthy as of today. |
| **[M-0809]** | Measured 2026-08-09 by the phase audit. **14 days stale.** True then; unverified now. |
| **[U]** | **Unmeasured.** Nobody has checked. Do not act on it and do not repeat it as fact. |

**If you are the next session: the correct first move is to MEASURE, not to act.**
See §7.

---

## 1. WHAT THIS WORKSPACE IS

The Purcell matter. A deck project at **2923 SE Malcolm St, Milwaukie, Oregon**
— Odd Jobs, Oregon CCB #252070. The client terminated Odd Jobs mid-project. A
settlement letter from the client side demands **$7,500**.

The central artifact is the **PROJECT RECORD AND ACCOUNTING — 23 July** (134 KB).
Its construction is deliberate and unusual, and a reader who misses this will
misuse it:

- Drawn **only from primary records** — signed contract, platform timestamp
  exports, supplier quotes and receipts, bank/card records, messages and emails
  with their own send times, photographs with their own EXIF.
- **It computes no balance. It asserts no entitlement. It makes no demand. It
  characterises nobody's conduct.**
- Where two primary records disagree, **both are printed and neither is chosen**
  (`CONTESTED`). Questions the documents cannot answer are stated, not filled in
  (`UNKNOWN`). Payments established but unexplained are `UNPROVEN`.
- It states its own limits: the photo record is a floor not a census; the local
  mail store is a partial sync (1,188 messages) so absence is not proof;
  phone and in-person conversation leave no trace in any source used.

That restraint is the document's value. Do not "improve" it by totalling it.

---

## 2. WHERE THINGS ACTUALLY ARE  [M]

`CLAUDE.md` in this directory names the two governing documents by filename with
no path, which reads as though they sit in the workspace root. **They do not.**

```
Malicious Compliance/
├── CLAUDE.md                                  # standing orders (points into the folder below)
├── PURCELL-FINAL-2026-07-20/
│   ├── PHASE PLAN — 24 July.md                # ← the governing plan
│   ├── PROJECT RECORD AND ACCOUNTING — 23 July.md   # ← the source of truth (134 KB)
│   ├── PROJECT RECORD AND ACCOUNTING — 22 July.md/.pdf   # superseded
│   ├── HIDDEN COSTS REPORT — 22 July (second pass).md
│   ├── MISSING COSTS REPORT — 21 July.md
│   ├── ATTORNEY EMAIL — DRAFT (do not send without your hand).md   # ← SENT 7/22, see §3
│   ├── MANIFEST.csv + two addenda
│   ├── 1 FOR ATTORNEY (privileged)/          # incl. UNREDACTED record w/ margin derivation
│   ├── 2 EVIDENCE/
│   ├── 3 ON HOLD - do not send/
│   └── 4 SOURCE DOCUMENTS/
├── HANDOFF_2026-07-22_PICKUP.md               # older pickups
├── HANDOFF_2026-07-23_MBP.md
├── PURCELL_ATTORNEY_LETTER_2026-07-22_rebuilt-verified-r2.md
├── evidence/ · runs/ · us-reflection-game/ · autofill.user.js · hd.html
└── HANDOFF_2026-08-23_PRESENT-STATE.md        # this file
```

Superseded per Jeff 7/25: the 21 July rebuilt working document and **everything
earlier** — no 13–20 July counsel packet, adversarial analysis, demand letter, or
finrecon total is current. [M]

---

## 3. LAST MEASURED STATE OF THE MATTER — 2026-08-09  [M-0809]

This comes from the phase audit run 8/9 against the Mimestream store and iMessage,
recorded as **AI_ERROR_LOG E-067** (severity HIGH, direction ↓ against Jeff).

**What that audit corrected:** the 8/2 status rollup had said the matter was
"on hold pending attorney" and listed *"send the attorney email — draft complete,
needs To: + Send"* as an outstanding Jeff action. Both false.

**What was true on 8/9:**

- The attorney email was **SENT 2026-07-22 at 10:52:30** from jeff@odd-jobs.org to
  **Anthony McNamer** — subject *"Need two hours of lawyer-Anthony — deck client
  terminated me mid-project; one date matters next week."* Byte-for-byte the rev-2
  draft, sent 43 minutes after it was written.
- **Anthony had not replied in 18 days. The thread contained exactly one message.**
- Phase 3 of the plan is gated on counsel. Phase 4 (delivery, by 10 Aug) is gated
  on "whatever counsel blesses."

**The structural point, which still stands:** the rollup named the wrong blocker,
so the real one went unstated for a week. It implied the clock had not started
when in fact it had been running since 7/22 and had run out.

---

## 4. THE GAP — WHAT IS NOT KNOWN  [M]

**No Purcell content file has been modified since 2026-07-25. That is 29 days.**
(The only newer files in this tree are `.claude/launch.json` (8/5) and a
`.wrangler` cache (8/1) — neither is matter content. The 8/9 commit touching this
path was a repo-wide docs commit, not Purcell work.)

**No status entry for this matter exists in AI_ERROR_LOG after E-067 (8/9).**
Entries E-084 through E-093 were checked: all concern other projects. The only
later Purcell strings are incidental — a FinRecon transaction tag and a writing
specimen in the voice guide.

Therefore, as of today, **all of the following are [U] — unmeasured:**

1. Whether Anthony McNamer ever replied. (Last known: no reply, 18 days, 1 message.)
2. What happened at the **10 August delivery deadline**, which passed **13 days ago**.
   Nothing on disk records a delivery, a decision not to deliver, or a slip.
3. Whether anything went out by Jeff's hand on or around 8/10.
4. Whether the client, the client's counsel, or the CCB has made contact since 8/9.
5. The status of every Phase 1 evidence item — Spaeth, Karissa ¶1–7, Milwaukie
   Lumber, Metro South, Carver Rock/McFarlane's, Synchrony/Lowe's, Chase ...2585,
   the permit lookup — and the six people-asks (Steve Miller, Tanner Jackson,
   Matt Hinckley, Kari, Amber, Girgich).
6. Whether the **$8,837.38 escrow check** was deposited.

**Do not restate items 5 or 6 as a to-do list in any downstream document without
measuring them first.** That is precisely E-083's failure (open items repeated as
current state when they had been closed weeks earlier), and E-055's before it.

---

## 5. DATE-SENSITIVE — RECOMPUTED FOR 2026-08-23  [M] on arithmetic, **[U] on the underlying dates**

The three dates below are sourced from `handoffs/STATUS-2026-08-02.md` §7 — the
same document and same section that E-067 proved wrong on the adjacent line.
**They have not been re-verified against the settlement letter itself.** Treat the
arithmetic as sound and the inputs as unconfirmed.

| Item | Date | As of 2026-08-23 |
|---|---|---|
| Settlement letter deadline | 10 Aug | **passed — 13 days ago** |
| Payment deadline | 20 Aug | **passed — 3 days ago** |
| **Escrow check $8,837.38 voids** | **~26 Aug** | **3 DAYS OUT** |

**The escrow check is the one live clock.** $8,837.38, deposit at a Chase branch,
Jeff's hand. If it has not been deposited it is the single most time-critical item
in the matter, and verifying the void date against the actual instrument is worth
doing before anything else in this workspace.

---

## 6. STANDING CONSTRAINTS — unchanged, binding  [M]

- **No sends without Jeff's hand.** Drafting is welcome; transmitting is Jeff's.
- **Delete nothing.** Neutralize `To:` fields rather than discarding drafts.
- **AI_ERROR_LOG is in force here** and is append-only. Any run catching false
  data appends. Never edit or delete a prior entry; corrections get a new entry.
  Log your own errors too.
- Outbound rules absolute on anything client-facing.
- The full `1 FOR ATTORNEY (privileged)/` folder goes to counsel **unfiltered**,
  including the unredacted record and the WIP critique, per standing instruction.
  The WIP critique and phase docs **never travel** to anyone else.
- After delivery the record freezes. Anything later is a new document, never an edit.

---

## 7. WHAT THE NEXT SESSION SHOULD DO FIRST

**Measure. Do not act, and do not draft from §4's list.**

1. Read the Mimestream store for `Jeff@Odd-Jobs.org`: any reply from Anthony
   McNamer since 7/22; any client or opposing-counsel contact since 8/9; anything
   sent by Jeff on or around 8/10.
2. Ask Jeff one question: **was the escrow check deposited?** (§5 — 3 days out.)
3. Verify the 8/20 and 8/26 dates against the settlement letter itself, not
   against the 8/2 rollup.
4. Only then re-cut the phase plan. It is anchored to a deadline that has passed;
   as written it is a historical document, not a live schedule.

Anything above that turns up a false prior claim → append to AI_ERROR_LOG.

---

## 8. UNRELATED WORK DONE IN THIS SESSION (2026-08-23)

Not Purcell. Recorded so the next session is not surprised by a new directory.

**`~/odd-jobs-tools` — new git repo, commit `4791dca` on `main`.** The Odd Jobs
unified client tool suite (v4) was pulled from the MacBook
(`~/Documents/Claude/Projects/Odd Jobs Website Update/tools-v4/`) to the Mini over
the LAN SSH lane and put under version control for the first time. Verified before
commit: 11/11 files sha256-identical to the MacBook copy, and all 10 deployed
assets sha256-identical to what `odd-jobs-tools.pages.dev` serves. Tailscale to the
laptop was down; `mbp-lan` worked.

**Open on that work:**
- Repo sits at `~/odd-jobs-tools`, matching `~/odd-jobs-remote-access`. That
  precedent is broken: CONNECTIONS.md lists `odd-jobs-remote-access` as a Lane 1
  GitHub-synced repo, but it is absent from `sync-projects.sh`'s `GIT_REPOS` and
  lives outside `$CB`, where the script's `[ -d "$CB/$1/.git" ]` guard could never
  find it. **It has never synced.** A move to `~/ClaudeBox/odd-jobs-tools` plus a
  `GIT_REPOS` entry and an rsync `--exclude` is the pattern that actually works.
- The MacBook copy is still unversioned — two copies, one under git. Not resolved
  until there is a GitHub remote and the laptop clones from it.
- Next per the v4 handoff: install wrangler, test direct deploy from the Mini.
  (The v4 handoff's §4 "cannot reach Cloudflare" constraint describes the Cowork
  sandbox, not this box — the Mini reaches `api.cloudflare.com` fine.)

---

## 9. PROVENANCE OF THIS DOCUMENT

Written from direct inspection on 2026-08-23: the phase plan, the project record's
front matter, `CLAUDE.md`, `handoffs/STATUS-2026-08-02.md` §7, `AI_ERROR_LOG.md`
(E-067 read in full; E-084–E-093 checked for Purcell content), `git log` on the
workspace path, and `find`/`stat` for file freshness.

**One correction is embedded here.** Earlier in the session that produced this
document I misread `18bd174 docs sweep 8/13` as repo HEAD when HEAD is
`b56d4dd docs sweep 8/23`, and reported the date as 2026-08-13. That put the
delivery deadline "3 days" past instead of 13, called the 8/20 payment deadline
"7 days out" when it had already passed, and put the escrow void 13 days away
instead of 3. Logged as **E-094**. Every date in this document is computed from a
verified `date` call, not from a commit subject line.
