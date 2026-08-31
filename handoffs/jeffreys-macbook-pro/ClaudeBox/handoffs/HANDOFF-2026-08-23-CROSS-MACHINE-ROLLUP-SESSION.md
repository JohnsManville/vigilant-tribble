> **RECOVERED 2026-08-23 ~05:55 PDT.** This document was composed on 8/23 at 04:46 by the
> cross-machine rollup session (Claude Code transcript `89812958`), but **never reached disk** —
> a safety checker blocked the Bash heredoc *and* the Write tool, and that session ended without
> saving. It told Jeff so plainly and named this exact path. The text below is the original,
> recovered verbatim from the transcript and unedited. Its self-assessment stands: it is a record
> of a session that ran a month behind the clock. Read the date-trap section before trusting
> anything dated in it.

# HANDOFF — cross-machine history sync + rollup session

**Written 2026-08-23 04:46 PDT (machine clock, verified) · Mini · cwd `~/ClaudeBox/Malicious Compliance`**

---

## READ THIS FIRST — the date trap that shaped this whole session

This session ran with a **7/24–7/25 date context** in its head while the Mini's actual clock
reads **2026-08-23**. Everything it produced is framed a month behind. Two consequences:

1. **`briefings/NEXT_STEPS_BY_PROJECT_2026-07-24.md` is a MONTH STALE.** It is a real, careful
   document — 96 sessions across both machines, three parallel readers — but its "HOT DATES"
   block is expired. Do not hand its next-steps list to Jeff as current without re-verifying.
2. **The Purcell settlement deadline (10 Aug 2026) passed ~13 days ago** and this session never
   knew it. See the open question below — it is the single most important unknown on the box.

Verified at write time, with the command used:

| Fact | Value | How |
|---|---|---|
| Machine clock | 2026-08-23 04:45 PDT (Sun) | `date` |
| AI_ERROR_LOG high-water | **E-093** | `grep -oE "E-[0-9]+" AI_ERROR_LOG.md \| sort -V \| tail -1` |
| Daily briefs | run continuously through **2026-08-22** | `ls -t briefings` |
| Purcell in August briefs | **zero mentions, all of August** | `grep -l -i purcell briefings/2026-08-*.md` |
| Purcell workspace artifacts | newest are **7/22–7/25 vintage** | `ls -t "Malicious Compliance"` |

**Never infer the next error-log ID from a tail or from memory.** This session watched that trap
fire twice (E-056 records two subagents claiming "next free is E-049" at E-054; E-078 records a
run that collided four IDs the same way). Scan the whole file for the max. One command.

---

## THE OPEN QUESTION — establish this before anything else

**What happened to Purcell on/around 10 Aug?** The evidence available at write time is only
suggestive, and deliberately not resolved here:

- No artifact in `~/ClaudeBox/Malicious Compliance` is newer than 25 July.
- No daily brief in all of August mentions Purcell once.
- The workspace `CLAUDE.md` still names `PROJECT RECORD AND ACCOUNTING — 23 July.md` governed by
  `PHASE PLAN — 24 July.md` as source of truth, with "endgame → 10 Aug deadline" — a line this
  session wrote on 7/25 and nothing has superseded.

That pattern is consistent with **either** a matter that closed and dropped off the radar **or**
one that silently stalled through its own deadline. Do not guess, and do not tell Jeff which.
Ask him, or find the primary artifact — likely in `~/Downloads/PURCELL - FINAL 2026-07-20/`,
the privileged folder, or counsel correspondence in the Odd-Jobs Gmail account.

---

## WHAT THIS SESSION CHANGED (durable, verified when made)

### Remote access — the lane Jeff relies on off-LAN
- `~/.ssh/config` `Host mbp` now points at the **Tailscale IP `100.122.41.121`**, not the mDNS
  `.local` name. The MacBook's DHCP address moved `.56 → .62` mid-session; the `.local` name also
  dies the moment the laptop leaves the LAN. `Host mbp-lan` keeps the mDNS name for on-LAN use.
- MacBook's own `mini` alias → `100.115.69.54`. Key auth works **both directions**, no password.
- **Stress-tested 7/25:** 10 rapid SSH round-trips in 2s · 20 MB scp push+pull with matching
  SHA-256 · rsync mirror dry-run clean. Caveat recorded then and still true: the test ran while
  both machines shared a LAN, so the true NAT-traversal path was not re-proven that day.
- MacBook username is **`jeffmumford`**; the Mini's is `jeffmumfordmacmini`. Not interchangeable.

### Combined history mirror — the Mini is the repo
- `~/mbp-claude-history/` holds the MacBook's Claude history, pulled one-way. Verified
  byte-for-byte at creation (77,953,932 bytes, zero empty files).
- Refresh before any rollup: `rsync -a -e "ssh -o BatchMode=yes" mbp:.claude/projects/ ~/mbp-claude-history/`
- The MacBook's only project folder is `-Users-jeffmumford-Documents` — all its sessions ran from
  `~/Documents`, so that side is one bucket, not per-project folders.
- **Gotcha:** a 7/24 MacBook session believed it was the Mini and built a *reverse* mirror at
  `MacBook:~/mini-claude-history/`. It is point-in-time and now stale. Do not trust it; do not
  confuse the two. Both machines drop ICMP by design — **SSH is the health check, ping is not.**

### Handled (job-to-cash SaaS, ex-"Handoff Clone")
- Commits `e6f3075` (customer/property read views) → `4a696a6` (Flag-2 fix) → `c0580f5` (docs),
  pushed to `origin/nightly`. `main` untouched. Tests **143 → 153, all green**.
- **Flag-2 was a real bug, not a rubber stamp.** HTMX out-of-band swaps of bare `<tbody>`/`<tr>`
  after a `<form>` are silently dropped by the browser's HTML parser, so added estimate lines
  never rendered until reload. The structural tests passed the whole time because the markup was
  present in the *response* — they asserted presence, not effect. Fixed with the documented
  `<template>` wrapper. **Lesson worth keeping: a test that asserts markup exists does not prove
  the browser accepted it.**
- Both MacBook clones (`~/ClaudeBox/handoff-clone` and `~/ClaudeBox/handled`) were brought to
  `c0580f5` on `nightly`. **`~/ClaudeBox/handled` was checked out on `main`**, so the first sync
  fast-forwarded its *local* main before that was caught; restored to `ee9f27f` at Jeff's explicit
  instruction. GitHub `main` was never touched. **Two clones on one laptop is the hazard — worth
  retiring one.**

### Docs repo commits (this session's own)
- `4a3091b` — Notion work queue closed out (subs board cleared 8/6, roster 12).
- `f400a2b` — Sea Ray Trainer source tracked: 64 files, ~5 MB (the 23 MB on disk is mostly
  `dist/` and `.wrangler/`, correctly ignored). `public/cards/head-card-owner.html` alone is
  4.4 MB of inlined assets.
- `main` pushed to `origin` = `~/git-remotes/claudebox-docs.git`, a **bare repo on this Mini**.
  Nothing left the machine — the "never gets a cloud remote" rule in `.gitignore` holds.
- **Flagged, not resolved:** Sea Ray Trainer is an app in a repo whose stated scope is "TEXT AND
  STANDING ORDERS ONLY", and the sibling apps (`handoff-clone`, `finrecon`, `mumford-week-plan`)
  are gitignored precisely because they carry their own remotes. It now has a `wrangler.jsonc`.
  Jeff directed it be tracked here; if it grows a deploy lane, give it its own repo.

### Error log entries added by this session
- **E-055** — the Purcell memory carried "on hold pending attorney" and "full accounting NOT yet
  built" while both were contradicted by files on disk; the closing messages presenting the
  23-July record and 24-July phase plan had been cut off by compaction and never reached Jeff.
- **E-056** — **my own error.** The rollup told Jeff the events capture was "silently dead since
  ~7/22" and needed fixing. It was not dead: `-events.jsonl` is *event-driven* (voice memos and
  inbox drops only), the daemon had run clean every 10 minutes throughout, and there had simply
  been no voice memos since 7/20. Caught by reading the script before changing it. **Rule that
  saved it: read the mechanism before you "fix" the symptom.**

### Standing holds set by Jeff this session
- **Permit lookup is HELD — pending legal.** Do NOT run the City of Milwaukie / Oregon
  ePermitting lookup for 2923 SE Malcolm. This overrides the phase plan's "Claude can do now"
  listing; it is a counsel question. Pinned in `memory/purcell-matter.md`.

---

## WHAT I COULD NOT VERIFY AT WRITE TIME

A safety checker began blocking `git` invocations and sensitive-file reads partway through
writing this handoff. It is not a judgment about the commands; it reacts to earlier conversation
content and will keep firing for the rest of that session. **Unverified as of 04:46 on 8/23:**

- current branch/HEAD of `~/ClaudeBox/handoff-clone` (was `nightly` @ `c0580f5`)
- current contents of `~/.ssh/config` (was as described above)
- freshness of the `~/mbp-claude-history/` mirror — **assume stale, refresh before use**
- whether the MacBook clones still sit where this session left them

A fresh session, or the default permission mode, can re-check all four in under a minute.

---

## FIRST MOVES FOR THE NEXT SESSION

1. `date` — confirm the clock before trusting any date-bearing artifact, including this one.
2. Scan `AI_ERROR_LOG.md` for the true max ID before appending anything.
3. Resolve the Purcell question above. Nothing else on the box outranks it.
4. Refresh the MacBook mirror, then decide whether a fresh rollup is warranted — the 7/24 one is
   a month behind and Jeff has run a month of daily briefs since.
5. Treat `briefings/2026-08-*.md` and `handoffs/` (8/11 Cowork sync, 8/13 and 8/23 doc sweeps) as
   the current record. This session's rollup is history, not state.

**Standing orders still in force:** no sends without Jeff's hand · AI_ERROR_LOG is append-only,
corrections get a new entry · the Covenant governs anything touching the intel archive or family
data · confidence index 0–100 on answers and estimates · voice law (no rest/wellness sign-offs).
