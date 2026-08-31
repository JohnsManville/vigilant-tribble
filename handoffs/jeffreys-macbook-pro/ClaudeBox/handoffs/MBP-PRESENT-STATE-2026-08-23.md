# PRESENT STATE — MacBook Pro, 2026-08-23

**Stamped 2026-08-23 12:46 UTC (05:46 PDT).** Every figure below was read off a live
command against the MacBook's filesystem at the stamp, not recalled. Inference is
labelled as inference.

**This is the MacBook half only.** The system present-state doc is
`handoffs/PRESENT-STATE-AND-HANDOFF-2026-08-23.md`, written from the Mini at 04:46 —
it is more authoritative for everything Mini-side and should be read first. It reports
**"MacBook Pro — offline, Tailscale last seen 17h ago, SSH times out,"** so it carries
no MacBook figures at all. This file fills that hole and nothing else. Do not duplicate
one into the other.

**Instrument used:** a Cowork cloud session bridged to `jeffreys-macbook-pro`. The bridge
is a Linux VM with `~/ClaudeBox`, `~/mini-claude-history` and `~/odd-jobs-remote-access`
mounted read-write. **It cannot run macOS commands** — no `launchctl`, no `tailscale`,
no TCC state, no `/Volumes`, and no reach to the Mini. Everything below is filesystem
evidence.

---

## 1. Machine

| | |
|---|---|
| Host | `jeffreys-macbook-pro` · user `jeffmumford` |
| Disk | **461 G total · 430 G used · 31 G free · 94%** |
| `~/ClaudeBox` | 6.1 G |
| Reachable now? | yes — bridge live at the stamp (contradicts the Mini's 04:46 "offline" reading; the laptop came back between 04:46 and 12:46) |

Heaviest paths inside `~/ClaudeBox`:

| Path | Size |
|---|---|
| `_account-transition-export-20260806/` | 1.7 G |
| `backups/` | 1.4 G |
| `Malicious Compliance/` | 1.4 G |
| `finrecon/` | 431 M |
| `bitsies-scene-builder/` | 416 M |
| `roswell-archive/` | 321 M |
| `Sea Ray Trainer/` | 306 M |

`_account-transition-export-20260806/` (1.7 G) is the August 6 account-move bundle. Per
`MASTER-REINSTATEMENT-AND-IMPORT.md` it was built to be copied off-machine and then no
longer needed here. **It is the single biggest reclaimable item on a 94%-full disk.**
Nothing has been deleted — that is Jeff's call.

---

## 2. Repo state — MacBook working copies

Measured with read-only `git` against the mounted trees.

| Repo | Branch | Uncommitted | Ahead | Behind | HEAD |
|---|---|---|---|---|---|
| `handoff-clone` | **`nightly`** | **4** | 0 | **10** | `4a3a37e` 2026-08-05 |
| `finrecon` | `phase4-review-ui-docs-engine` | 0 | 0 | 0 | `fa13f48` 2026-08-13 |
| `mumford-week-plan` | `main` | **4** | 0 | 0 | `8220bfd` 2026-08-08 |
| `bitsies-scene-builder` | `main` | 0 | 0 | 0 | `bf2da67` 2026-07-18 |
| `odd-jobs-remote-access` | `main` | 1 | 0 | — | `10735a7` 2026-08-01 |

**These figures do not match the Mini's.** The Mini's 04:46 doc reports `handoff-clone`
dirty **6** and `finrecon` dirty **2**; the MacBook shows **4** and **0**. That is
expected — Lane 1 syncs commits, not working trees, and the two machines have different
uncommitted edits. It is worth stating plainly because a reader comparing the two docs
will otherwise assume one is wrong.

**`handoff-clone` is 10 commits behind on `nightly` with a dirty tree.** The sync script
deliberately skips a pull when the tree is dirty, so this will not self-resolve. It is
the reason `handoff-clone` never appears in the nightly "in sync" lines.

---

## 3. The two sync lanes, MacBook side

### Lane 2 (rsync) — healthy
`.sync-stamp-mbp` reads **`2026-08-23 05:07:16`**. The 05:06 run logged
`pulled Mini -> MBP` · `pushed MBP -> Mini` · `finrecon data synced both ways` ·
`stamped OK`.

An rsync pull also landed **mid-session, while this capture was running** — `AI_ERROR_LOG.md`
grew from 256,502 to 341,810 bytes between two reads roughly ten minutes apart, as the
Mini's newer copy arrived. **Consequence for any bridged session: a file read early in
the session may be a stale MacBook copy.** Re-read before relying on anything you loaded
at the start.

### Lane 1 (GitHub) — intermittent DNS failure, not a break
The nightly `git fetch` failed for all four repos with
`Could not resolve host: github.com` on **2026-08-16** and **2026-08-23**, and succeeded
on 8/17, 8/18, 8/19, 8/20, 8/21 and 8/22.

**Inference, not verified:** the sync fires at ~05:06 as the laptop wakes, and DNS is not
yet up on some mornings. Two failures in eight days, both on the first resolution attempt
of the run, with the rsync lane (which uses a host alias and Tailscale IPs) succeeding in
the same run. A retry-with-backoff around the fetch would likely close it. **Do not call
Lane 1 broken** — it is 6-for-8 and self-recovers the next night.

---

## 4. Covenant item D — the intel on the laptop. Unchanged, and not growing.

`backups/intel-mirror` on the MacBook: **136 M**, directory mtime **Jul 31 05:05**.
Frozen exactly as `CONNECTIONS.md` describes ("51 files, 135 MB, frozen at the 2026-07-30
state"). `backups/` totals 1.4 G, of which 1.3 G is
`full-archive-since-jul21-20260806/` — the Aug 6 archive, not verbatim capture.

**The exclusion is holding.** `--exclude /backups` is present at line 89 of
`scripts/sync-projects.sh`. Newest file anywhere under `backups/` is dated **2026-08-07**.
Nothing has arrived since the 8/9 fix.

So the gate dispute is static, not deteriorating — but it is now **14 days old**, and
Kari still holds the tiebreak. Nothing deleted.

---

## 5. Live finding — the intel distiller has been blocked for 9 consecutive days

Nine files sit at `~/ClaudeBox` root:
`intel-distill-BLOCKED-2026-08-14.md` through `intel-distill-BLOCKED-2026-08-22.md`.
**8/14, 8/15, 8/16, 8/17, 8/18, 8/19, 8/20, 8/21, 8/22 — nine days, unbroken.**

Each one is explicit, and the distiller deserves credit for reporting rather than
failing silently:

> **Status:** FAILED to run. No `distilled/2026-08-14.md` was produced.
> **Do NOT record 2026-08-14 as a "quiet day."** It was not. 26 KB of captured messages
> exist and simply could not be read this run.

The diagnosis in the file: the whole `/Volumes/ClaudeData` volume returns **EPERM on
`open()` while `stat()` succeeds** — the macOS TCC signature for the host app lacking
Full Disk Access / Removable Volumes. `/Volumes/ClaudeBoxSSD` is EPERM too.

**Two things make this worth chasing today:**

1. **There is no `BLOCKED` file for 2026-08-23.** Either it recovered this morning, or it
   stopped writing the marker. Those are very different, and the difference is one
   `ls /Volumes/ClaudeData/intel/distilled/` on the Mini.
2. **The Mini's 04:46 present-state doc reports the health line as
   `🟢 System OK · capture live 04:46 · build retired · distill ok`** and does not mention
   the outage anywhere. If "distill ok" was green across nine blocked days, that is
   **E-068's lesson recurring** — a monitor watching a proxy rather than the lane's
   actual result. **Unverified:** I cannot read `health-line.sh`'s distill check against
   the Mini's real state from here.

Related: E-070 concluded the intel *mirror*'s TCC problem was really a `#!/bin/zsh`
shebang and that "no Full Disk Access grant needed." The *distiller* is now failing on
what looks like the genuine TCC path for the same volume. **Inference:** E-070's fix was
correct for the mirror and does not cover the distiller. Worth confirming rather than
assuming — the whole point of E-070 is that the obvious TCC diagnosis was wrong once
already.

---

## 6. Automation and config, MacBook side

- **No hooks exist.** `~/ClaudeBox/.claude/` contains exactly one file,
  `settings.local.json`, holding a permissions allowlist and nothing else. Every
  "BINDING — READ EVERY RUN" instruction in `CLAUDE.md` is currently enforced by the
  model choosing to comply. **Verified on the MacBook only** — the Mini's `.claude/`
  was not inspected.
- `AI_ERROR_LOG.md` — **341,810 bytes**, newest entry **E-095** (appended this session).
- `logs/intel-mirror.log` is **absent on the MacBook**, which is correct and not a
  finding: the mirror runs on the Mini and `logs/` is machine-local and unsynced.

---

## 7. Security — open since 2026-07-20, 34 days

An `ANTHROPIC_API_KEY` was set by pasting it as a plain terminal command. It is in the
shell history, in the archived CLI transcript under `~/mini-claude-history/`, and inside
`_export/claude-history-handoff-2026-08-01.tar.gz`. `README.md` already states the rule.
**Revoke, reissue, set via an editor.** Confidence this is a real exposure: **95/100**.

---

## What this doc cannot tell you

Mini disk, LaunchAgent status, Tailscale state, `/Volumes` reachability, the health
line's actual output, and whether the distiller recovered today. All of that needs a
session on the Mini, or `ssh mini` from a Terminal on this laptop.

*Odd Jobs — Handyman Services · Jeff Mumford · jeff@odd-jobs.org · 503-880-7433*
