# SESSION HANDOFF — Time Machine Repair + Disk Offload (v1.2)

**Lane:** COWORK (Mini) → pickup in Claude Code **on the Mini**
**Date:** 2026-08-26 (v1.1 was 8/25) | **Status:** AUDITED, AWAITING JEFF'S GO. NOTHING MOVED.
**v1.2 supersedes v1.1 after a full read of CLAUDE.md, COVENANT.md, CONNECTIONS.md
and a growth/dependency audit. One v1.1 recommendation was wrong — see E-105.**

## 0. Identify yourself first (per CLAUDE.md — binding)

```sh
[ "$(whoami)" = jeffmumfordmacmini ] && echo MINI || echo MBP
```

MINI-only work. COVENANT.md read this session as required (writes touch ClaudeData).

## 1. Problem

TM red badge on ClaudeBoxSSD. Root cause: internal 228 GB disk at 99%
(2.1 GB free) — TM cannot create its pre-backup local snapshot.
Log: `BACKUP_FAILED_NO_SPACE_FOR_LOCAL_SNAPSHOT (50)`, error 28 on
`/System/Volumes/Data`. Backup destination itself healthy (70 GB free,
hourly cadence intact until the disk filled).

## 2. Audit findings (2026-08-26) — these reshaped the plan

1. **The growth driver is Messages in iCloud backfill.** CONNECTIONS.md flagged
   77%→93% (8/11→8/23) "cause not yet investigated." Answer: 33.7 GB of new
   files in `~/Library/Messages` since 8/11. `CloudKitMetaData` present =
   Messages in iCloud is ON; this always-on box is downloading full attachment
   history. This is intended cargo, not bloat. Plateau = total iCloud history
   size (unknown); monitor.
2. **Messages is load-bearing and sync-coupled.** `capture-intel.sh` reads
   `Messages/Attachments`; the imsg daemon works chat.db; 431k messages are the
   Covenant's externalized memory. And with iCloud sync, local deletions/trims
   propagate to ALL devices. → **Messages: DO NOT TOUCH. No retention trims.**
   (v1.1 said "Keep Messages: 1 Year" was safe — wrong; logged as E-105.)
3. **vm_bundles (9 GB of App Support/Claude) is the LIVE Cowork VM** for the
   session doing this work. Not cleanable. Old-session cleanup upside is ~1 GB,
   not 10. Dropped from the plan.
4. **ClaudeData layout verified**: `archives/` exists with precedent
   (`TPB`, `mini-offload-20260811` — 30 GB, byte-verified, 8/11). intel-mirror
   mirrors ONLY `/Volumes/ClaudeData/intel` → offloads under `archives/` do
   NOT bounce back to the internal disk. Offload there, never under `intel/`
   (intel/ is burn-governed and mirrors to the internal disk).
5. **TM-coverage tradeoff, stated honestly:** ClaudeData is deliberately
   excluded from TM (Covenant gates 3/5 — TM keeps deleted files). Anything
   offloaded leaves TM coverage and becomes single-copy on the SSD. The
   undetected second 2 TB drive (open hardware issue, 8/23) was the natural
   backup for this; until it's alive, offload only what Jeff accepts as
   single-copy (or replaceable).
6. Downloads shows 8.5 GB of post-8/11 file writes vs ~3 GB on disk —
   qBittorrent sparse/churn. Check active torrents before sweeping.

## 3. Ecosystem constraints (unchanged from v1.1, still binding)

- ClaudeData = archive + offloaded data; marker-identified; never erase;
  verify with `~/ClaudeBox/scripts/verify-volume.sh` before anything
  destructive on any volume. Size/name/node are NOT discriminators.
- ClaudeBoxSSD = TM only; contents untouched.
- MBP is a thin client; SSH keys and lanes must keep working.
- DO NOT TOUCH: `~/ClaudeBox`, `~/git-remotes`, `~/.whipdesk`, `~/.npm-global`,
  `~/bin`, `~/Library/LaunchAgents`, remote-access dirs, handoff docs.
- Git in ~/ClaudeBox: stage explicit paths only; push via git-push-all.sh.

## 4. The offload plan (revised) — target ClaudeData/archives/mini-offload-20260826/

Method for every item: **rsync copy → byte-verify (rsync -c second pass) →
original to Trash → Jeff empties Trash.** Follows the 8/11 precedent.

| # | Item | GB | Risk | Gate |
|---|---|---|---|---|
| 1 | ~/iCloud Drive (Archive) | 23 | none found — no script refs, static | GO on Jeff's word |
| 2 | ~/Library/Caches + Chrome caches | 3–4 | rebuilds; quit Chrome | GO on Jeff's word |
| 3 | ~/Downloads installer sweep | 2 | check qBittorrent active torrents first | GO after check |
| 4 | ~/Movies | 4 | contents unreviewed | Jeff reviews list |
| 5 | Voice Memos (export → in-app delete) | 12 | **iCloud-synced: in-app delete propagates to iPhone/other devices** | Jeff decides after export verified |
| 6 | Pictures/Photos libraries | 17 | growing since 8/11; likely iCloud Photos | Phase 3: prefer "Optimize Mac Storage" over offload; moving a live library onto the archive drive is role-mixing — flag |
| — | Messages (44 GB) | — | **DO NOT TOUCH** — E-105 | — |
| — | App Support/Claude | — | live VM + sessions; ~1 GB stale at most | skip |

Items 1–3 ≈ **28 GB, immediately safe** → ~30 GB free, TM unblocked with margin.
Items 4–5 add ~16 GB pending Jeff's review.

## 5. Standing pressure — plan for it, don't fight it

Messages backfill continues until iCloud history is fully local (unknown total;
44 GB so far, +2.2 GB/day recent average). The internal disk must carry it.
If free space trends back toward critical after the offload, options in order:
(a) revive the second 2 TB drive and rebalance; (b) Jeff prunes huge old
attachments FROM AN APPLE DEVICE knowingly (propagates everywhere — his hand,
never automated); (c) bigger internal. Weekly free-space monitor lane
(alert < 25 GB) is the tripwire — fits the existing lane pattern, log to
~/ClaudeBox/logs.

## 6. Verification / done

1. Items 1–3 offloaded, byte-verified, originals in Trash; Jeff empties Trash.
2. `df -h /System/Volumes/Data` ≥ 25 GB free.
3. `tmutil startbackup --auto` succeeds; confirm via
   `/usr/bin/log show --last 30m --predicate 'subsystem == "com.apple.TimeMachine"'`
   (use `/usr/bin/log`; zsh shadows `log`).
4. Red badge gone; stale `2026-08-25-145507.previous` container clears after
   2–3 good backups (leave it alone otherwise).
5. Next-cycle check: imsg daemon, 04:30 distiller, 06:00 brief all ran;
   `health-line.sh` green; `grep "OK: mirrored" logs/intel-mirror.log | tail -1` fresh.

## 7. Session log

- 8/25 PM (Cowork): diagnosed error 50; audited disk; RC → v1.1.
- 8/26 (Cowork): deep audit per Jeff — read CLAUDE.md/COVENANT/CONNECTIONS in
  full; identified Messages-in-iCloud backfill as the 8/23 mystery growth;
  found capture-intel dependency on Attachments; killed the v1.1 Messages-trim
  option (E-105); confirmed archives/ offload path safe from mirror bounce;
  named the TM-coverage tradeoff. **Nothing moved yet.**

Confidence: diagnosis 95/100 · offload safety (items 1–3) 90/100 ·
Messages-hands-off verdict 97/100 · size estimates 85/100.

## 8. Addendum — 2026-08-26 afternoon: monitor built; TM recovered on its own

- **Monitor lane live.** `scripts/disk-monitor.sh` + `com.claudebox.disk-monitor`
  (daily 07:15, RunAtLoad): logs free/Messages/Claude GB to `logs/disk-space.log`,
  maintains `logs/DISK_ALERT` under 25 GB. Sends nothing (standing order); the
  6am brief's health line carries the alarm.
- **health-line.sh disk check fixed** from percent to GB thresholds (<25 W,
  <15 P). The old >=95% red equaled ~11 GB — it could only fire after TM was
  already failing. E-102's lesson, applied.
- **State change, cause unverified:** between ~09:00 and 14:30, free space went
  2→22 GB and Messages/Attachments went 44→19 GB (6,833 files remain, logical
  ≈ on-disk, so files were removed, not made dataless). Most likely macOS purged
  iCloud-synced attachments under storage pressure — UNVERIFIED, no session did
  it. Watch the trend log: if backfill re-downloads, free space will sag again.
- **TM recovered:** backup `2026-08-26-142039` succeeded; plist `RESULT = 0`;
  red badge clear. First run of the monitor correctly logged `status=ALERT`
  (22 < 25).
- **Offload plan (§4) stands, urgency lowered.** 22 GB free is inside the warn
  band and depends on opaque OS eviction; the iCloud Archive move (23 GB) is
  still the right buffer. Awaiting Jeff's go. Pre-existing health-line watches
  seen today (triage brief missing, sync DIVERGED/FAILED) are NOT from this work.

## 9. EXECUTED — 2026-08-26, Jeff said proceed

**Offload target:** `/Volumes/ClaudeData/archives/mini-offload-20260826/`
(gate run first: verify-volume.sh returned the expected never-erase refusal —
we write there, never erase. 1,829 GB free at start.)

| Item | Result |
|---|---|
| iCloud Drive (Archive) | **copied + verified + trashed.** 8,691 files / 24,337,089,377 bytes. `ditto` (openrsync 2.6.9 rejected `--info=stats2` and no-oped first — nothing was copied by that attempt). Verified twice: exact file-count and byte-total match, then a **full md5 manifest, 8,691/8,691 identical**. Manifest kept at `archives/mini-offload-20260826/iCloud-Drive-Archive.md5` with `OFFLOAD-NOTE.txt`. |
| Downloads installers | 12 app installers trashed (~1.5 GB): Claude, Chrome, Plex, PIA ×2, Pocket ×2, ChatGPT, python pkg, qBittorrent, lghub ×2. qBittorrent confirmed not running, no `.!qB` partials. |
| Downloads content | **KEPT, not touched** — Bitsies_Master_Archive.zip, Bitsies Claude Code Builder.zip, Scrolling Bead Tech Pack.zip, boatel-site.zip, mumford-week-plan-full.zip, Your Orders ×2, pocket_recordings. These are content, not installers. |
| Caches | Spotify cache (288 MB) **skipped — Spotify was running.** Total cache pool measured only ~665 MB, well under the 3–4 GB v1.2 estimated; CloudKit/claude-cli-nodejs left alone (system/live-session managed). |

**Trash holds ~24 GB. Space does not free until Jeff empties it** — that is the
last step and it is deliberately his. Internal free reads 19 GB pre-empty;
expect ~42 GB after, which clears the 25 GB runway line and the DISK_ALERT flag
(next monitor run 07:15 will drop it, or run `scripts/disk-monitor.sh` by hand).

**Not done, still on the table:** Voice Memos (12 GB, iCloud-propagating delete —
Jeff's call), Movies (4 GB, unreviewed), Pictures (Phase 3, prefer Optimize
Storage). Messages untouched per E-105.

**Note for the next session:** internal free moved 22→19 GB during this work
while 23 GB was being copied OUT to an external volume. Consistent with the
Messages backfill re-downloading (§8's unverified eviction). The trend log
(`logs/disk-space.log`) is the witness — read it before assuming the offload
under-delivered.
