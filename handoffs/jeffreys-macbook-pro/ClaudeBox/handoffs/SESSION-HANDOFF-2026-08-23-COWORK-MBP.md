# SESSION HANDOFF — Cowork session on the MacBook, 2026-08-23

**Stamped 2026-08-23 12:46 UTC (05:46 PDT).** Surface: Cowork cloud session bridged to
`jeffreys-macbook-pro`. No network to the Mini, no macOS commands, no deletes.

**Companions, read in this order:**
1. `handoffs/PRESENT-STATE-AND-HANDOFF-2026-08-23.md` — the Mini's, 04:46. Authoritative.
2. `MBP-PRESENT-STATE-2026-08-23.md` — the MacBook half the Mini could not see.
3. This file — what this session did, and what to distrust in it.

Cite error-log entries by **date and title**, not number — two agents write ClaudeBox
and the numbering collides.

---

## 1. What Jeff asked for

To explain how he uses Claude across the Mini and the MacBook, so a fresh Cowork chat
behaves correctly — then to advise how the setup could be improved, then to write a
handoff and a present-state doc.

## 2. What was produced

| Artifact | Location | State |
|---|---|---|
| Two-machine usage brief | `~/ClaudeBox/CLAUDE-TWO-MACHINE-BRIEF-v1.2.md` | current; v1.1 header corrected |
| MacBook present state | `~/ClaudeBox/handoffs/MBP-PRESENT-STATE-2026-08-23.md` | current |
| This handoff | `~/ClaudeBox/handoffs/SESSION-HANDOFF-2026-08-23-COWORK-MBP.md` | current |
| Improvement advisory | `~/ClaudeBox/_to_delete/ADVISORY-MISDATED-2026-08-11-SUPERSEDED.md` | **withdrawn — see §3** |
| Error-log entry | `AI_ERROR_LOG.md` E-095 | appended, verified single, ledger intact |

The brief was built from `CLAUDE.md`, `CONNECTIONS.md`, `COVENANT.md`, `.gitignore`,
`scripts/sync-projects.sh`, `MASTER.md`, and **703 of Jeff's own typed turns** extracted
from the 84 archived CLI sessions in `~/mini-claude-history`. The extraction ran on the
device so the bulk never entered the session; the digests are in
`~/mini-claude-history/_to_delete/usage-scan-20260811/` (misnamed — 8/23 work).

Sections 5 and 6 of the brief — how Jeff actually prompts, and why handoffs are the
load-bearing ritual — are quoted from those turns and are the part worth keeping.

---

## 3. What this session got wrong — read before trusting anything above

**Logged as E-095, 2026-08-23.** This session believed the date was **2026-08-11** for
its first three deliverables, taking it from file mtimes and its own context header
instead of calling `date`. Two documents shipped with wrong dates and every elapsed-time
claim in them understated by 12 days.

That is the **fourth** instance of this failure in the ledger — after E-064 (1 Aug vs
11 Aug), E-085, and **E-094, logged the same morning**, whose stated lesson is: *"call
`date`. Once, at the start… Repo metadata, file mtimes, and commit messages describe when
work happened; none of them is today."*

**The advisory has been withdrawn**, not just re-dated, because its errors were
substantive, not cosmetic:

- It said the ledger held **64 entries** and characterised the failure pattern as **"six
  logged incidents, E-064 through E-071."** The ledger holds **95**. The `grep -c` I used
  undercounts, and I read one window and generalised from it.
- It ranked open items partly by age, so a 14-day-old Covenant standoff read as 3 days.
- It cited entries by number, against house convention.

**What survives from it, and is still worth doing:**

1. **No hooks exist** on the MacBook — verified. A SessionStart hook injecting machine
   identity, health line, current handoff and distilled lessons would make the binding
   instructions structural instead of aspirational. Verify the hook schema against the
   installed Claude Code version first; I never ran one here.
2. **`AI_ERROR_LOG.md` is 341 KB and unreadable per-session.** Keep the ledger
   append-only forever; generate a one-page derived lessons file for sessions to actually
   read. `scripts/nightly-distill.sh` is the pattern; do not build a new mechanism.
3. **Generate the machine-verifiable half of handoffs** rather than writing it. This
   session's own state capture is the proof — it contradicted documents written an hour
   earlier.
4. **Put the Claude desktop app on the Mini.** Every Cowork session currently bridges to
   the laptop — the machine that travels, sleeps, and is not authoritative — which is why
   every plan ends in "now go run this in Terminal."

I did **not** re-issue the advisory as a corrected document. It should be rewritten from
the Mini, against real Mini state, by a session that can see `launchctl` and `/Volumes`.

**Second error, caught before it shipped:** I nearly wrote a second present-state doc
without reading `handoffs/` first. `PRESENT-STATE-AND-HANDOFF-2026-08-23.md` already
existed from 04:46 and is more authoritative than anything this surface can produce.
That would have been E-064's pattern exactly. `ls -t handoffs/` before writing a handoff.

---

## 4. New findings this session contributed

Things the Mini's 04:46 doc could not know, because the laptop read as offline to it:

- **The intel distiller has been blocked nine consecutive days, 8/14–8/22**, EPERM on the
  whole `/Volumes/ClaudeData` volume. Nine explicit `intel-distill-BLOCKED-*.md` markers
  at ClaudeBox root. **No marker for 8/23** — recovered, or stopped marking. The Mini's
  doc reports the health line as `distill ok` and does not mention the outage. If that
  green persisted across nine blocked days it is E-068's lesson recurring. **Highest-value
  open item from this session.**
- **Lane 1 GitHub fetch fails intermittently** — 8/16 and 8/23, succeeded 8/17–8/22.
  Looks like DNS not ready at the ~05:06 wake. Not a break; a retry would close it.
- **`handoff-clone` on the MacBook is 10 commits behind on `nightly` with a dirty tree**,
  so the nightly pull skips it and it will not self-resolve.
- **Covenant item D is static** — `backups/intel-mirror` frozen at Jul 31, 136 M,
  `--exclude /backups` confirmed present at line 89. Not growing. Now 14 days open.
- **MacBook disk 94%** (31 G free). `_account-transition-export-20260806/` at 1.7 G is the
  largest reclaimable item — it was built on 8/6 to be copied off and then dropped.
- **A mid-session rsync changed files under this session's feet** (the error log grew 85 KB
  between two reads). Any bridged session should re-read before relying on an early load.

---

## 5. Next actions, ranked

| # | Action | Where | Why first |
|---|---|---|---|
| 1 | Rotate the exposed API key | anywhere | 34 days old, only item with an adversary |
| 2 | Check `/Volumes/ClaudeData/intel/distilled/` for 8/23 | **Mini** | decides whether the distiller recovered or went quiet |
| 3 | Verify `health-line.sh`'s distill check against the 9 blocked days | **Mini** | if it was green, the monitor needs fixing more than the distiller does |
| 4 | Commit or stash `handoff-clone`, then pull the 10 | MBP | unblocks the nightly lane |
| 5 | Free disk — start with the 1.7 G Aug-6 export | MBP | 94%, and the Mini alerted at 95% yesterday |
| 6 | Retry/backoff around the Lane 1 fetch | either | closes an intermittent 2-in-8 failure |
| 7 | Lessons distillate, then the SessionStart hook | Mini | the structural fix |
| 8 | Covenant item D — Kari's tiebreak | Jeff | 14 days open, static, not urgent |

Items 2 and 3 are one short session on the Mini and should happen before anything else on
this list is trusted.

---

## 6. Documents to distrust

- `_to_delete/ADVISORY-MISDATED-2026-08-11-SUPERSEDED.md` — withdrawn, wrong dates, wrong
  ledger figures. Quarantined, not deleted (this bridge cannot delete).
- Anything in the two documents this session shipped before 12:46 that states an age,
  a gap, or "days since." Re-derive from `date`.
- `~/mini-claude-history/_to_delete/usage-scan-20260811/` — scratch extraction, misnamed
  with the wrong date. Content is fine; the folder name is not.

---

## 7. Confidence

**Filesystem findings in §4: 93/100** — all read from live commands at the stamp, quoted
with paths and figures.
**The distill/health-line contradiction: 70/100** that it is a real monitor blind spot —
the nine BLOCKED files are certain, the health line's actual logic is not; I could not
read the Mini.
**The improvement items in §3: 75/100** — the MacBook-side evidence is solid, but they
were formed without Mini state and one has already had to be withdrawn.

*Odd Jobs — Handyman Services · Jeff Mumford · jeff@odd-jobs.org · 503-880-7433*
