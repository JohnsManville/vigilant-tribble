# HANDOFF — Jeff-voice corpus work + the 8/14–8/22 intel-distill backlog

**Written 2026-08-23 ~05:55 PDT · Mini (`Macmini9,1`, verified) · cwd `~/ClaudeBox/Malicious Compliance`**
**Covers Claude Code session `d68c524c`** — opened 2026-08-23 04:59 PDT, last activity 05:34 PDT,
151 user turns. This session produced the most output of any lane on 8/23 and was the **only**
active session that ended without a handoff. That is the gap this file closes.

Opening ask, verbatim: *"please do deep dive into my available intel sources to create a
'Make Claude sound indistinguishable from Jeff' md."*

---

## WHAT SHIPPED — all committed, working tree clean at write time

| Artifact | Size | Purpose |
|---|---|---|
| `~/ClaudeBox/JEFF_VOICE.md` | 551 lines | Full voice guide, 12 sections, for the box |
| `~/ClaudeBox/JEFF_VOICE_COWORK.md` | 458 lines | Standalone "Write As Jeff" contract to attach to a Cowork/Claude Project |
| `/Volumes/ClaudeData/intel/distilled/2026-08-14 … 08-22.md` | 9 files | The distil backlog, cleared |
| `~/ClaudeBox/intel-distill-BLOCKED-2026-08-1{4..9}.md`, `-2{0,1,2}.md` | 9 files | Each appended a **RESOLVED (backlog only)** footer |
| `AI_ERROR_LOG.md` | +4 entries | E-092, E-093, E-094, E-095 |

Commits, newest first: `a6c41fd` (Yakima arc) · `f1ae236` (COWORK BIZ/PER split) ·
`0edde25` (retract a false "never", E-095) · `badc5e9` (corpus size, E-094) ·
`6b71bf0` (distil the backlog, mark blocks resolved).

---

## THE THING A FRESH SESSION MUST NOT UNDO

**The corpus has a hard cutoff: 2026-02-22.** Per Jeff on 8/22, he was not using AI for email
before that date. Everything sent **on or after** it is excluded. That boundary is what makes the
document evidence rather than a mirror of prior AI output — if you widen the corpus to "all sent
mail," you are training the voice guide on Claude's own writing and the whole instrument rots.
The cutoff is stated in the `JEFF_VOICE.md` header. Leave it there.

Measured corpus as it stands: **1,604 Jeff-authored iMessages, 979 prompts to Claude, ~20 Apple
Notes**, plus a sampled subset of a **~3,533-message Sent folder**. That Sent-folder figure is a
correction — see E-094 below.

---

## THE FOUR ERRORS THIS SESSION LOGGED AGAINST ITSELF

All four are its own. Read them before extending the voice work; three of the four are failures
of *this specific kind of task* — inferring a general rule from one artifact.

- **E-092** — claimed "a large share" of Jeff's sent email was machine-written on the strength of
  exactly one artifact. Over-reach stated as fact.
- **E-093** — two of the three "AI authorship tells" built into `JEFF_VOICE.md` were detecting
  *formatting and paste behavior*, not authorship. Follow-on to E-092.
- **E-094** — read a commit subject line as the calendar and told Jeff it was 8/13 when it was
  8/23; every deadline figure in that answer was off by ten days.
- **E-095** — put `I hope this message finds you well` on a hard never-uses blocklist in **two**
  voice documents. Jeff uses it. Retracted in both.

**Ledger defect worth knowing:** `AI_ERROR_LOG.md` has **14 duplicated IDs**, not one —
E-044, E-049, E-052, E-053, E-059, E-060, E-061, E-062, E-064, E-072, E-077, E-078, E-090 and E-094 each appear twice. (E-094's pair are the date-misread at line
3557 and a Gmail `resultCountEstimate` misread at 3573.) The ledger is append-only, so none
were touched. High-water mark is **E-098**. Before appending, take the true max with
`grep -oE "E-[0-9]+" AI_ERROR_LOG.md | sort -V | tail -1` — do not eyeball the tail, and
**cite entries by date and title, never by number.**

---

## WHERE THE TWO DOCUMENTS DIVERGE

They are not copies. Keep them that way.

- **`JEFF_VOICE.md`** — the box's reference. Carries the source ledger (§1), the thin-corpus
  admissions (§11), and an append-only corrections log (§12). Corrections go to §12; nothing
  upstream gets overwritten.
- **`JEFF_VOICE_COWORK.md`** — self-contained, no filesystem dependencies, meant to be pasted
  into a Claude Project. Its §0 splits the trigger into **BIZ** and **PER** lanes so the register
  is chosen before a word is drafted, and it carries pre-2024 professional registers the box copy
  does not need.

A correction that matters to voice fidelity belongs in **both**. E-095 was applied to both; that
is the pattern.

---

## THE LAST FINDING, AND WHY IT'S THE BEST ONE

The **Yakima arc** (Aug 2023 → Jan 2024, Director-OEM at Yakima Products; Jeff did not get the
role) is the only complete narrative in the Sent folder — the same man writing to five different
people about the same day. Three things came out of it that now sit in the docs as rules:

1. **He drafts to a second reader before sending.** A 20:23 email to Laura titled "Thank You
   Drafts"; the real notes went out 21:39–21:48. The review loop is his own habit, which is worth
   knowing given the no-sends-without-Jeff's-hand architecture built on top of it.
2. **If a draft compliments someone, it must name the specific thing.** Five thank-yous in nine
   minutes, not one a template. Generic praise is not his register even when he is laying it on.
3. **He does not proofread in any register.** The Kevin note opens `Dear Kevin,` twice — pasted,
   salutation changed, duplicate missed. Same class as the doubled signature in the Jeep email.
   Documented now rather than inferred.

---

## OPEN / NOT DONE

1. **Length scaling is asserted, not counted.** The claim that length runs *inversely* to
   familiarity rests on the five Yakima thank-yous. It wants a real count before it hardens into
   a rule — this is exactly the E-092 failure mode.
2. **`~/ClaudeBox/CLAUDE.md` does not mention either voice document.** Nothing points a fresh
   session at them. If they are meant to be load-bearing, they need a line there.
3. **Nothing has been drafted *through* the Cowork contract yet.** It has never been used in
   anger. First real use is also its first test.
4. **`/Volumes/ClaudeData/intel/distilled/` still has gaps before 8/14** — `2026-08-04` then
   `2026-08-12` then the new run. The 8/14–8/22 backlog is closed; earlier holes are not.
5. **The BLOCKED reports were marked resolved *for backlog only*.** Whatever broke the nightly
   distiller between 8/14 and 8/22 was never diagnosed — the backlog was filled by hand from the
   raw captures. If the nightly job is still wired the same way, it will block again.

---

## FIRST MOVES FOR THE NEXT SESSION

1. `date` first. Two of this session's four logged errors were date/number misreads taken from
   artifacts instead of the machine.
2. Take the true max E-number before appending to the ledger (command above). Do not trust the
   tail — there is a duplicate in it.
3. If you extend the voice work: the corpus cutoff is **2026-02-22** and every claim needs a
   count behind it. One artifact is not a pattern. That is what E-092 and E-093 are for.
4. If the nightly distiller is in scope, diagnose the 8/14–8/22 block before trusting it —
   resolved-for-backlog is not the same as fixed.

**Standing orders still in force:** no sends without Jeff's hand (imsg `APPROVE <id>` excepted) ·
AI_ERROR_LOG is append-only, corrections get a new entry · the Covenant governs anything touching
the intel archive or family data · confidence index 0–100 on answers and estimates · voice law.

---

# ADDENDUM — 2026-08-23 afternoon (10:53–12:17 PDT) · the session pivoted off voice work

The morning above is complete and unchanged. **This same transcript (`d68c524c`) resumed in the
afternoon and did work that has nothing to do with the voice corpus** — that is why it re-read
STALE against this handoff. Recorded here so the pivot is not lost and no one re-derives it.

## What shipped in the afternoon, verified on disk

1. **imsg after-hours auto-reply suppression.** `imsg/lib/autorespond.py` now suppresses the
   after-hours auto-reply on junk, sales, and already-live threads (a `rule_for` that returns
   `None` for those classes). Verified present: `grep "suppress" imsg/lib/autorespond.py` hits.
   The `APPROVE <id>` send path is untouched — this only stops an *automatic* junk reply, it
   does not send anything.
2. **`.gitignore` hygiene across the sub-projects.** Nine tracked `.pyc` files were removed from
   tracking and secrets-ignore blocks were added to `mumford-week-plan` and `campingteam-site`
   (mirroring the root policy). Every `git change` had been showing a binary `.pyc` diff; that
   noise is gone.
3. **Off-box git backups on ClaudeData.** New bare remotes created and pushed:
   `/Volumes/ClaudeData/git-remotes/imsg.git` and `.../campingteam-site.git` (both verified to
   exist). `finrecon`, `handoff-clone`, and `mumford-week-plan` were pushed to their existing
   origins. "do campingteam-site too" was the last instruction of the session.

## Constraint a fresh session must not undo

The afternoon used **`git add -A`** inside `~/ClaudeBox/imsg` (a nested repo) to commit the
autorespond change. That is the pattern `~/ClaudeBox/CLAUDE.md` forbids at the repo root; inside
`imsg` it was scoped to that repo, but the safer habit is explicit paths everywhere. Nothing was
mis-shipped this time — flagged so the next session stages `imsg` changes by path.

## Open, carried forward

- The five OPEN voice items above (length-scaling count, CLAUDE.md pointer, first Cowork use,
  pre-8/14 distil holes, the un-diagnosed nightly-distiller block) are **all still open** — the
  afternoon did not touch them.
- The registry `NEXT` for this session still reads *"Length-scaling claim needs a real count"*;
  the real next action is now split — either finish the voice count **or** pick up the imsg /
  backup lane. Left as WIP.

**Confidence 90/100** — afternoon artifacts confirmed on disk (bare remotes, autorespond
suppression, pushed refs); the exact `.pyc` count is from the transcript, not re-counted here.

---

# ADDENDUM — 2026-08-23 13:45 PDT · one more repo-hygiene fix, then the session went quiet

Written by the evening sweep. `d68c524c` did nothing more on the voice corpus after the
afternoon addendum above; its last action was a small git-hygiene fix, recorded so the
STALE re-read has an accounting.

- **`campingteam-site/.wrangler` untracked.** The tracked wrangler file carried the
  Cloudflare **account_id** (an identifier that appears in dashboard URLs and API paths,
  **not** a credential). `git rm --cached` only — the file stays on disk and wrangler keeps
  working — plus `.wrangler/` at the top of `.gitignore` to match the sibling repos
  (`mumford-week-plan`, `imsg`), verified with `check-ignore`. Pushed; the bare remote on
  ClaudeData was already at `ahead=0`.
- **Deliberately left alone:** the account_id still sits in this repo's earlier eleven
  commits. Untracking stops it going forward but does not rewrite history. That was a
  judgment call — an account_id is an identifier, not a secret, and the repo's only remote
  is the local bare on ClaudeData — and it is Jeff's to overrule.

The five OPEN voice items at the top of this file are **all still untouched**: the
length-scaling count, the CLAUDE.md pointer to the two voice docs, first real use of the
Cowork contract, the pre-8/14 distil holes, and the nightly-distiller diagnosis. That last
one is now **closed** — see the coverage-audit handoff's distiller addendum; the fix landed
in a different session (`8c67e6c8`) and ran clean unattended at 21:31 tonight.

**Confidence 90/100** — the `.wrangler` fix is confirmed pushed; the history-not-rewritten
choice is flagged for Jeff rather than settled.

---

# ADDENDUM — 2026-08-24 21:17–21:18 PDT · Time Machine coverage audit of ClaudeData

Written by the evening sweep. `d68c524c` was dormant all of 8/24, then resumed for ~90
seconds tonight on a wholly new question — *"check if Time Machine covers ClaudeData"* —
and ended without a handoff of its own. Recorded here; nothing above changed.

## What was found, verified on-box tonight

- **Time Machine itself is healthy.** Destination `ClaudeBoxSSD`; last backup **2026-08-24
  at 20:48** (`tmutil latestbackup`). Not the problem.
- **`/Volumes/ClaudeData` is excluded from Time Machine at the volume level.** `tmutil
  isexcluded` returns `[Excluded]` for the volume and for `intel/`, `git-remotes/`,
  `job-photos/`. A volume-level exclusion silently swallows everything placed on the drive.
- **The working trees ARE backed up.** `~/ClaudeBox`, `~/ClaudeBox/imsg`,
  `~/ClaudeBox/campingteam-site` all return `[Included]`. Losing ClaudeData costs no
  working-tree state.
- **Per-directory exposure on ClaudeData:** `intel/` 137M · `git-remotes/` 12M ·
  `archives/` **32G** · `job-photos/` 0B · `git-remotes` holds 3 bare repos.

## The constraint a fresh session must not undo

**`intel/`'s exclusion is deliberate and correct — do not "fix" it.** `.gitignore:76`
records the reason verbatim: *"Same reason intel/ stays out of Time Machine: retention by
design."* That is Covenant Gate 5 — verbatim family transcripts purge at 90 days, and TM
snapshots would preserve them past the purge, breaking a Covenant promise. **The fix for
the gap below is NOT to un-exclude the volume** — that would sweep `intel/` back into
backups and make the purge unkeepable. Cover `archives/` specifically, or rsync it to
`ClaudeBoxSSD` separately.

## Open — blocked on Jeff's decision

- **`archives/` (32G) is the real gap: no backup and no second copy.** Holds the `TPB` and
  `mini-offload-20260811` sets — one copy, on a drive with no protection. Session offered
  two fixes (targeted TM inclusion of `archives/`, or a separate rsync to `ClaudeBoxSSD`)
  and stopped for Jeff to choose. Nothing was changed.
- `git-remotes/` (12M) is unbacked but each is a *second* copy of a repo whose working tree
  is already in TM — redundancy, not primary storage. Low priority; left as-is.

No AI error was logged tonight — the analysis cross-checked against `.gitignore` and
`tmutil` on-box and matches disk.

**Confidence 92/100** — exclusion states, last-backup time, and directory sizes all read
live from the box tonight; the `archives/` contents (TPB, mini-offload) are named from the
directory listing, not re-inspected file by file.

---

## REFRESH — 2026-08-26 evening sweep (delta since 8/24 22:02 mtime)

Session `d68c524c` resumed for a single **~70-second** burst on **2026-08-25 17:39–17:40
PDT** (ask, verbatim: *"give me standalone doc"*), then went dormant again — that is the
entire delta. **Read-only. No files created or modified, no commits, no errors logged.**

- Re-measured the backup gap against disk (unchanged, values confirmed live): ClaudeData
  33Gi used of 1.8Ti; `archives/TPB` = **30G**, `archives/mini-offload-20260811` = **1.9G**
  (~32G total). ClaudeBoxSSD TM target 88% full, **28 backups**, latest **2026-08-25 14:55**.
  intel raw captures: **45 `.jsonl`** (Gate-5 90-day purge posture intact).
- Audited `JEFF_VOICE_COWORK.md` currency: now **518 lines / 5,389 words** (the existing
  handoff above records 458 lines). All 8 arc-mining findings confirmed present.
- **Delivered** `JEFF_VOICE_COWORK.md` to Jeff as an attachment — the travel copy that
  carries no local paths, so it drops cleanly into a Claude Project. Companion `JEFF_VOICE.md`
  stays here as the provenance version; **do not merge them.**

**Still open, unchanged:** the ~32G `archives/` backup gap (blocked on Jeff's decision —
targeted TM inclusion vs. rsync to ClaudeBoxSSD; **do not un-exclude the volume**), the
`CLAUDE.md` pointer to the voice docs, and the count behind the length-scaling claim.
**Left unverified:** the 458→518-line growth of `JEFF_VOICE_COWORK.md` is not attributable
to any event in this window — it happened earlier; reconcile which session/commit added it.

**Refresh confidence 93/100** — delta window read event-by-event; the burst was read-only
and self-contained.

---

## REFRESH — 2026-08-28 evening sweep · session CLOSED ITSELF OUT (delta since 8/26 22:03 mtime)

Session `d68c524c` was dormant through 8/26–8/27, then ran a single **close-out burst on
2026-08-28 15:05–15:50 PDT** (22:05–22:50Z) and explicitly ended ("we're done"). No
voice-corpus edits, no new artifacts in this window, **no new `AI_ERROR_LOG` entries**
(verified: no `## 2026-08-2[78]` headers). What it actually did:

- **Wrote a new standalone RC handoff for the project** — `/Users/jeffmumfordmacmini/Claude/Handoffs/2026-08-28_robo-jeff-voice_handoff_RC.md` (159 lines / 14,493 bytes, verified on disk, one deliberate em dash). **This is now the canonical pickup doc** for the Robo-Jeff voice project. It does **not** supersede this file — this one is the evening-sweep provenance record; that one is the working handoff. Two docs coexist for the project by design; reconcile which is authoritative but do not merge them.
- **Wrote a memory node** `memory/project_robo-jeff-voice.md` (1,279 bytes) + pointer in `MEMORY.md:4`.
- **Pushed the one outstanding ClaudeBox commit** — `34691cb` "morning-open: the brief opens itself at 06:10". It did **not author** that commit (session `8c67e6c8` did, 14:58 PDT); `d68c524c` pushed it at 15:05. All four repos (ClaudeBox, imsg, campingteam-site, mumford-week-plan) verified `ahead: 0`. **Note:** `34691cb` is the bulk-stage that also swallowed session `45e1c5ce`'s sanitizer files — see this run's brief; nothing lost, git history for `scripts/sanitize-brief.sh` is misattributed.
- **Caught a live date-drift** mid-handoff (context said 8/24, clock said 8/28) and dated the file from `date`, not context — the **E-094 error class**, handled correctly, not re-logged.

**New load-bearing constraints (codified in the new RC handoff, do not undo):** all four
published artifacts (Rusty deck, Kari deck, Kari's Board, Robo Jeff Trials) are **PRIVATE** —
share to the named person with **WRITE** access; public/read-only links reject
`capability_disabled`. Public version numbers 1.0–1.7 are a "public fiction" told to Rusty;
real build history is only in `~/ClaudeBox/_voice-tests/VERSION_HISTORY.md` — don't reconcile.
Personal lane is **"With you," never "Her voice"** (Covenant weaponization gate).

**Still open, carried to Jeff:** artifacts remain private and **Rusty holds a dead link**
(texted 8/23, 404s until shared) — sharing the two decks with write access is the only
time-sensitive item. Also unchanged: the ~32G `archives/` backup gap (**do not un-exclude
the ClaudeData volume** — Covenant Gate 5), the `CLAUDE.md` pointer to the voice docs, and
the count behind the length-scaling claim.

**Status this session: FINISHED** — self-closed, tree clean, repos pushed, handoff + memory
delivered. Everything remaining is Jeff's to action.

**Refresh confidence 92/100** — RC handoff, memory node, and pushed refs all confirmed on
disk this run; the "Rusty link still dead" state is from the transcript, not re-tested.
