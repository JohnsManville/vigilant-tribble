# PRESENT STATE AND HANDOFF — 2026-08-23 (Sun, ~04:46 PDT)

Written from the Mini. Every number below was read off disk or a live command
this morning, not recalled. Where something is inference rather than
observation, it says so.

**Read first, in this order:** `~/ClaudeBox/CLAUDE.md` (identify the machine
before touching anything) → `COVENANT.md` → `CONNECTIONS.md` (the two-machine
map; it is more current and more detailed than this file) → `AI_ERROR_LOG.md`.

This file is the *session* handoff. `CONNECTIONS.md` is the *system* map. Do not
duplicate one into the other.

---

## 1. Present state — verified 2026-08-23 04:46

| Thing | State |
|---|---|
| Health line | `🟢 System OK · capture live 04:46 · build retired · distill ok · disk 94%` |
| Mini disk | **12 Gi free, 94% used** — see §3, this is the live risk |
| ClaudeData (2 TB) | 1.8 Ti free, 2% used |
| Intel mirror | current — `2026-08-23 03:30 OK: mirrored 81 files, 136M` |
| Nightly sync | ran `2026-08-23 04:30`, all four GitHub repos in sync |
| Briefings | current through `2026-08-22` |
| Error log | **93 entries, through E-093** |
| MacBook Pro | **offline** — Tailscale "last seen 17h ago", SSH times out |

**Loaded LaunchAgents** (`launchctl list`): sync-projects · dailybrief · capture ·
distill · intel-mirror · heartbeat · imsg · finrecon-serve · keep-awake ·
tailscale-watchdog · icloudcachecleanup · finrecon-simplefin-sync.
All present. `com.oddjobs.finrecon-simplefin-sync` is loaded again (it was
booted out of the domain on 8/13 — see the note in `CONNECTIONS.md`).

### Repo state

| Repo | Branch | Uncommitted | Remote |
|---|---|---|---|
| `handoff-clone` (= Handled) | `nightly` | **6 files** | `handled` |
| `finrecon` | `phase4-review-ui-docs-engine` | **2 files** | `finrecon` |
| `mumford-week-plan` | `main` | clean | `mumford-week-plan` |
| `bitsies-scene-builder` | `main` | clean | `bitsies-scene-builder` |
| `campingteam-site` | `main` | clean | **none** |
| `imsg` | `main` | clean | **none** |
| `Sea Ray Trainer` | `main` | clean | **none** |
| `~/ClaudeBox` (docs) | `main` | clean | Mini-local bare repo |

The uncommitted work in `handoff-clone` and `finrecon` is long-standing, not
new breakage — `.gitignore`, `config/settings.py`, estimator spec/CSVs on one
side; `ingest_roswell_docs.py` and `seam-upgrade.sql` on the other. The sync
script deliberately **skips a pull when the tree is dirty**, so this is a
slow-burn blocker, not an emergency.

---

## 2. What happened this session (8/9 → 8/23)

Started as "build a program to keep the two Macs in sync." **That program
already existed** — `scripts/sync-projects.sh` + `com.oddjobs.sync-projects`.
Proposing to build a second one is logged as **E-064**. Looking for it first is
what surfaced everything below. *If you are ever asked to build sync or backup
infrastructure here: read `scripts/` and `~/Library/LaunchAgents` first.*

Fixed, in order of how much they mattered:

- **The intel mirror had failed silently for 10 days** (7/31–8/9) — the only
  backup of the only copy of the archive. Gap closed by hand that day; a later
  session found the true root cause was a `#!/bin/zsh` shebang, not launchd
  permissions (**E-065**, corrected by **E-070**).
- **A Covenant leak to the laptop.** `backups/intel-mirror` is verbatim family
  capture, mirrored with `--delete` so burns propagate. The MacBook rsync has no
  `--delete`, so copies there outlive every burn — making gates 3, 4 and 5
  unkeepable. `--exclude /backups` added 8/9.
- **The Purcell source of truth was outside every backup lane**, living only in
  `~/Downloads`. Copied into the workspace (hash-verified).
- **`health-line.sh` now watches the mirror and the sync**, so a silent failure
  reaches the 6am text instead of dying in a logfile. It fired correctly on 8/22
  (see §3) — that alert exists because of this session.
- **`CONNECTIONS.md` written**; `~/ClaudeBox` made a git repo with a Mini-local
  bare remote (deliberately **not** GitHub — Purcell and family material).
- **rsync stopgap** for the three remote-less repos plus `_claude-session-archive`.
- **Tailscale restarted on the MacBook** (8/11), preserving `--accept-routes`
  rather than taking the `--reset` the CLI offered.

Errors I logged against myself this session: **E-064** (proposed duplicate
infrastructure), **E-066** (blamed a TCC quirk for a search I never ran),
**E-067** (the 8/2 rollup told Jeff to send an already-sent attorney email).

---

## 3. Open items — ranked

### A. Disk will wedge the box. Live.
94% used, **12 Gi free**. The 8/22 brief fired
`🔴 SYSTEM ALERT — disk 95% — critical, box will wedge`.

An 8/11 offload took this to 77%; it has climbed back in twelve days, so
something is generating, not just accumulating. **`~/ClaudeBox` is not the
problem** (3.1 G total). The weight is:

| Path | Size |
|---|---|
| `~/Library` | **86 G** |
| `~/iCloud Drive (Archive)` | 23 G |
| `~/Pictures` | 12 G |
| `~/Movies` | 3.4 G |
| `~/Downloads` | 2.4 G |

Find what inside `~/Library` is growing before deleting anything. Nothing here
has been touched — deletion is Jeff's call.

### B. Purcell — the settlement deadline passed 13 days ago
**Deadline was 10 August. Today is 23 August.** Nothing in
`Malicious Compliance/` has changed since the 8/9 audit — no new files, no
regenerated documents.

State as audited 8/9: Phase 1 roughly one-eighth done (Spaeth request sent 7/24,
**no reply**; Karissa email still an unsent draft; the other five vendor asks and
all six people asks unanswered). Phases 2 and 3 never started. The attorney email
**was** sent 7/22 to Anthony McNamer — the 8/2 rollup wrongly said it still needed
sending (**E-067**) — and had no reply in 18 days.

**This is disk evidence only.** Phone calls, in-person conversations, or anything
handled from the business mailbox after 8/1 would not appear. The Mimestream
cache ended 8/1 when I last looked. *Before acting on this section, ask Jeff what
actually happened — do not assume silence means nothing happened.*

### C. Three repos have no off-machine copy
`campingteam-site`, `imsg`, `Sea Ray Trainer` are git repos with **no remotes**,
so they are in neither sync lane. They are currently excluded from the rsync as a
**stopgap** — because with `.git` excluded, the MacBook held non-repo copies and
newer-wins could overwrite the Mini's tracked files with no commit.

Consequence: they have **no path to the MacBook at all**. The real fix is a
GitHub remote for each, then move them into `GIT_REPOS` and delete the three
exclude lines. `imsg/state/` must stay gitignored on Covenant grounds.

### D. 135 MB of intel on the MacBook — needs a human ruling
51 verbatim files, frozen at the 2026-07-30 state, copied before the 8/9 fix.
Real tension: the SSD is the only copy, so a second copy has disaster-recovery
value, but gates 3/4/5 say it should not live on the laptop. Per the Covenant
this is a gate dispute and **Kari holds the tiebreak**. Nothing deleted.

### E. The MacBook keeps falling off the tailnet
Offline 17h as of this writing; Tailscale was found stopped on 8/11 too. The
`com.claudebox.tailscale-watchdog` agent runs on the **Mini** — it does not keep
the laptop's tunnel up. Suspected fix is enabling "Run Tailscale at login" on the
MacBook, a GUI toggle. **Not verified** — two occurrences is a pattern worth
chasing, not a diagnosis.

While it is offline: no sync, and no remote path to the box from the road.

### F. Smaller
- `handoff-clone` and `finrecon` dirty — dirty trees block the nightly pull.
- The nightly sync **exits 1 on every run even when it succeeds** (E-091).
- MacBook disk was ~94% on 8/13; unverified since (machine offline).

---

## 4. How this box wants to be worked

- **Nothing sends without Jeff's hand.** Drafting is welcome. The imsg
  `APPROVE <id>` path is the one narrow exception, and it is his hand.
- **Append to `AI_ERROR_LOG.md` when you catch false data — including your own.**
  Never edit or delete a prior entry; corrections get a new entry. Fifteen of the
  last thirty entries are explicitly self-logged ("my own error") — 24 of 93
  overall. That is the system working, not a defect.
- **Confidence index (0–100) on answers and estimates.**
- **Never comment on Jeff being tired or working late.**
- Identify the machine by **username**, not hostname. Identify the SSDs by
  **name + size + marker file**, never device node.

### Four lessons this session paid for
1. A backup script existing is not a backup. Only its **last success line** counts.
2. Before asserting "not on disk," search **both machines** — `ssh mbp` is one hop.
3. `launchctl`/`lsof` will tell you a service is "not running" when launchd holds
   the socket on its behalf. **Test the actual connection.**
4. Don't explain a failure with a mechanism you haven't tested, however plausible
   (E-066). Borrowing a real known quirk to cover an unexamined failure is the
   most durable way to poison a runbook.

---

## 5. If you only do one thing

Deal with the disk (§3A) — it is the only item that can take the whole box down,
and it alerted yesterday. Then ask Jeff where Purcell actually landed (§3B).

---

# ADDENDUM — 2026-08-23 12:10 PDT · the 2 TB drive, and why the disk is full

The session continued for 2h28m after the handoff above was written. That work is captured
here so the session can close. Written by session `8c67e6c8`; re-verified live at 12:10 PDT.

## THE NEW 2 TB DRIVE IS NOT DETECTED

Jeff said at 14:15 UTC (07:15 PDT): *"I installed a 2 TB drive."* It is not there.

`diskutil list` shows three physical disks and no fourth — internal, **`disk6`** (500 GB
Portable SSD = `ClaudeBoxSSD`, the Time Machine target) and **`disk8`** (2 TB Portable SSD =
`ClaudeData`, the archive). **Re-checked at 12:10 PDT: still only those two externals.**

It does not appear as an unmounted or unformatted disk either, which is what a brand-new
drive would look like. **This is not a formatting problem — the Mac is not seeing the
hardware at all.** Check the cable, the port, and whether it needs external power; if it is
bus-powered and daisy-chained through a hub behind the other two SSDs, that is the usual
cause.

## SAFETY — READ BEFORE THAT DRIVE IS EVER FORMATTED

`~/ClaudeBox/CLAUDE.md` disambiguates the two externals partly **by size**: *"500 GB is the
one that gets erased, 2 TB is the archive."* **A second 2 TB drive breaks that rule**, and it
is the rule that exists to stop anyone erasing the archive. Both existing drives also report
the same `Device / Media Name: Portable SSD` over USB, so that will not separate them either.

Once the new drive appears, **the marker file is the only safe discriminator**:
`/Volumes/ClaudeData/.claudebox-data-volume` — present and verified, created 7/9.
`intel-mirror.sh` already gates on it. **Update CLAUDE.md's drive table before any
destructive operation touches a 2 TB device.** That table has already been wrong once during
an erase, by its own admission.

## WHY THE INTERNAL DISK IS FULL

`~/ClaudeBox` is **not** the problem at ~3.1 GB. The weight is personal and app data:

| What | Size |
|---|---|
| **iMessage attachments** (`~/Library/Messages/Attachments`) | **32 GB** |
| iCloud Drive (Archive) | 23 GB |
| Pictures | 12 GB |
| Claude Desktop (8.7 GB of it `vm_bundles`) | 12 GB |
| **Voice Memos** | 11 GB |
| Google / Chrome | 6.6 GB |
| Apple Notes | 2.9 GB |
| `chat.db` itself | 846 MB |

Plus a second user account (`karifloof`) whose size could not be measured without a password.

This is a 251 GB Mac carrying a workload that wants more. **The 8/11 offload bought twelve
days because it moved media but never touched the categories that actually grow.**

**Two line items have changed since that survey.** Caches were **6.0 GB** and are now **1.0 GB**
— cleared at 11:00 PDT, with 5 GB reclaimed only after `tmutil thinlocalsnapshots` released
the blocks an 08:19 snapshot was pinning. That took the disk 95% → 91%. **It is back to 94%
by 12:10.** The reclaim was real; the growth rate is the actual problem.

## WHAT THE NEW DRIVE IS FOR

Voice Memos, Pictures and the iCloud archive are **~46 GB of straightforward offload** in the
same pattern as the 8/11 move — copy, **byte-verify, then remove the source**. That alone
resolves the pressure. It cannot start until the drive is detected.

## FIRST MOVES

1. Get the drive seen: cable, port, direct connection rather than through a hub, external
   power if it wants it. Nothing else here can proceed first.
2. **Before formatting anything**, update the drive table in `CLAUDE.md` so the marker file —
   not size — is the discriminator.
3. Then offload Voice Memos → Pictures → iCloud archive, byte-verifying each before deleting
   the source.
4. iMessage attachments are the largest single item at 32 GB and the most delicate: they are
   Covenant-governed family data. Do not touch them without Jeff, and read `COVENANT.md` first.
