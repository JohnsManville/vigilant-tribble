# PRESENT STATE + HANDOFF — two-machine docs & the `mac-sync` skill
**Written 2026-08-23 05:20 PDT on the Mini** (`whoami` = `jeffmumfordmacmini`, `Macmini9,1`).

**Scope: this lane only** — the two-machine documentation (`CONNECTIONS.md`), the
`mac-sync` skill, and the SimpleFIN LaunchAgent thread. It does **not** restate general
Mini state or Purcell state. Those have their own docs written earlier today:
`handoffs/HANDOFF-2026-08-23-MINI-STATE.md` (04:47) and
`Malicious Compliance/HANDOFF_2026-08-23_PRESENT-STATE.md`. Read those for their lanes;
nothing here supersedes them.

---

## 0. Read this first — this session spans a 10-day gap

The session opened **2026-08-13** and was resumed **2026-08-23**. The box clock read
`Thu Aug 13 22:39 PDT` at the top and `Sun Aug 23 05:16 PDT` at the bottom. That is a
resume, not a clock fault — `sntp` puts the box at **+0.081 s** against time.apple.com,
artifacts carry 8/13 mtimes, and the ledger advanced normally through 8/22.

**Everything stamped `(verified 8/13/26)` in `CONNECTIONS.md` and the `mac-sync` skill was
true on the 13th and is now ten days old.** One of those numbers has already gone wrong —
see §3.

| Tag | Means |
|---|---|
| **[M]** | **Measured 2026-08-23 05:16–05:20** by direct inspection. Trustworthy today. |
| **[M-0813]** | Measured 2026-08-13. **Ten days stale.** True then, unverified since. |
| **[U]** | **Unmeasured.** Do not act on it, do not repeat it as fact. |

---

## 1. What this session produced

| Artifact | State |
|---|---|
| `~/.claude/skills/mac-sync/SKILL.md` | **[M]** exists, 9,836 B, untouched since 8/13 22:57 |
| `~/ClaudeBox/CONNECTIONS.md` | **[M]** edited 8/13 22:56, since **committed** — clean in `git status` |
| `AI_ERROR_LOG.md` E-086, E-087, E-088 | **[M]** all three present |

**The skill.** A user-level skill operating the two-machine system. It does **not**
duplicate `CONNECTIONS.md` — that file is declared authoritative and the skill is the
procedure layer on top (identify the machine, run the ladder, Covenant constraints, what
is built vs. still open). First version was built from a stale `~/Downloads` snapshot and
was wrong; it was rewritten against `CONNECTIONS.md`. See E-086.

**`CONNECTIONS.md` additions.** Four LaunchAgents that were running undocumented are now
in the job table with cadence and script path: `tailscale-watchdog`, `keep-awake`,
`icloudcachecleanup`, `finrecon-simplefin-sync`.

---

## 2. The SimpleFIN thread — prediction held, then a NEW failure appeared

On 8/13 this agent was not loaded. The diagnosis was: booted out after the 8/12 16:00
reboot, never `disable`d, therefore **it will re-bootstrap at the next login or reboot**.

**That held. [M] `com.oddjobs.finrecon-simplefin-sync` is LOADED as of 05:16 today.**
No manual `launchctl bootstrap` was ever run.

**It is green as of tonight. [M]** Verified on the live 05:30 run, 2026-08-23:
**`sync ok`**, 12 accounts written and imported, 6 new transactions, ledger current.

Two separate things looked like one bug, and this session initially reported both wrong:

* **8/14-8/22 it exited `rc=1` nightly while the bank feed succeeded every night.** On
  the 8/22 run all 11 mapped accounts fetched, imported and archived, landing 8 new
  transactions. The non-zero exit came from ~243 unrelated JSON files under
  `data/incoming/` (the Costco receipt dump, which belongs to `docs ingest-costco`, plus
  `trailer-justin-2026-05.json`) failing their own import attempts *after* the real work
  had already succeeded.
* **It was fixed in code at 04:52 today by `ba366f5`** — a regression from `a1bc378`
  that added `.json` to the folder-walk set. The fix narrows the rule: JSON is
  importable only when the filename is one sync wrote (`simplefin-*`). 352 tests pass.

**No data needs moving. The quarantine decision is closed** — it was proposed here at
~05:22 against a log tail, thirty minutes after the code fix had already landed (E-097).

**Still open: two UNMAPPED accounts.** FIXED RATE LOAN (1690) and (1004), 4 txns each,
silently skipped every run. See §5.

## 3. Verified present state — 2026-08-23 05:16 PDT

| Check | Value | vs. 8/13 |
|---|---|---|
| Agents loaded (`com.oddjobs` + `com.claudebox`) | **[M]** 12 of 12 | +1 (simplefin self-healed) |
| `sync-projects` last run | **[M]** 04:30 today, all repos in sync | was 04:30 8/13 |
| `intel-mirror` last success | **[M]** `2026-08-23 03:30:04 OK: 81 files, 136M` | 71 → **81 files** |
| **Mini data volume** | **[M] 93% of 228 GB** | **was 83% — +10 points in 10 days** |
| `ClaudeData` SSD | **[M-0813]** 2% of 1.8 TB | unverified today |
| AI error log head | **[M]** E-094 | was E-088 |

**Disk is the number that moved.** 83% → 93% in ten days. `CONNECTIONS.md` "known gaps"
had recorded 77% on 8/11; that line has been updated to today's reading. At this rate the
headroom question returns within weeks. **[U]** what consumed the 10 points — not
investigated.

**Measuring it correctly:** `df -h /System/Volumes/Data`, **not** `df -h /`. On APFS `/`
is the sealed system snapshot and reads ~26%, which is not a real figure.

---

## 4. Error log — three entries from this session, one pattern

| # | Claim | Reality |
|---|---|---|
| **E-086** | Built `mac-sync` from `~/Downloads/CLAUDE.md`; called the Mini/MBP hostname question open and omitted the running sync | Resolved 8/11 in a file already in context; skill omitted `sync-projects`, `intel-mirror`, the three lanes |
| **E-087** | "Four agents missing from `CONNECTIONS.md`," naming `finrecon-serve` | `finrecon-serve` was already documented; `icloudcachecleanup` was missed entirely. Right count, wrong membership |
| **E-088** | "No log file exists"; "has never been running"; likely cause of the stale ledger | Log existed in `finrecon/logs/` (looked in the wrong directory); it *had* run 8/12 05:30; ledger was stale because the Keychain token was unset, not because of the agent |

**The through-line: absence asserted cheaply.** Presence needs one hit; absence needs the
full search space. All three were caught by Jeff pushing back rather than by self-check.

**Log hygiene, [M] and not mine to fix:** the ledger now contains **duplicate entry
numbers** — two `E-090` (dated 08-13 and 08-14) and two `E-094` (both 08-23). The file is
append-only, so this is a note for the next writer, not an edit: **check the tail for the
highest number before assigning one.**

---

## 5. Open items

1. ~~Decide on the 243 unrecognised files in `finrecon/data/incoming/`.~~
   **CLOSED 8/23** — fixed in code by `ba366f5`, not by moving files. The loader now
   ignores them and `sync` exits 0. They stay where they are for `docs ingest-costco`.
2. **UNMAPPED accounts — one done 8/23, two blocked on a schema decision.**

   **Done:** `usaa-youth-savings-3067` registered (`savings`, owner `joint`, last4 3067)
   and `ACT-12cffe39-…` mapped. Account row was created **before** the map entry —
   mapping a slug that has no `accounts` row turns a silent skip into a hard
   `AccountNotFoundError`, which is worse than the warning it fixes. Map and DB backed
   up first (`simplefin_map.json.bak-20260823-052608`,
   `data/backups/finrecon-premap-20260823-052608.db`). Owner `joint` matches every other
   USAA account; **the schema has no custodial/child owner value**, so if 3067 belongs to
   John or Lucy that field is a compromise, not a fact.

   **Blocked — FIXED RATE LOAN (1690) and (1004), 4 txns each.** The `accounts` table
   CHECK allows only `checking, savings, credit, payment_platform, merchant`. **There is
   no loan type, and `loan` appears nowhere in `src/` or the schema.** Two ways forward,
   and it is Jeff's call:
   - **Type them `credit`** — one command each, no schema change, but `credit` means
     revolving card everywhere else in this ledger, so every later report that groups by
     `account_type` inherits the lie.
   - **Migrate the CHECK to add `loan`** — correct, and the codebase already has the
     pattern (`_002_ACCOUNTS_REBUILD` in `db/schema.py` rebuilds the table to change a
     CHECK). Costs a migration against a live financial DB plus a test run (345 tests).

   Until one is chosen the two loans stay UNMAPPED and their 8 transactions stay out of
   the ledger. **Nothing was guessed.**
2. **Mini disk at 93%** — decide whether another offload round to `ClaudeData` is due.
3. **Dotfiles → private git repo**, still the largest open settings-parity item.
   **[M]** still undone as of 8/13; **[U]** today. Scrub `.npmrc` tokens before first commit.
4. **The 51 intel files (135 MB) on the MacBook** — unchanged, still a Covenant gate
   dispute, **Kari holds the tiebreak**. Nothing deleted.
5. **Trim the sync sections from `~/.claude/CLAUDE.md`?** Offered on 8/13, never answered.
   The `mac-sync` skill now covers that ground on demand instead of loading into every
   session on this box.
6. **[U] 8/15–8/18 gap** in the simplefin log — no entries. Worth one look.

---

## 6. Where things live

- **Authoritative machine map:** `~/ClaudeBox/CONNECTIONS.md` — wins over the skill on any conflict.
- **Skill:** `~/.claude/skills/mac-sync/SKILL.md` (loads on triggers: "sync the Macs", "the MBP", "out of sync", "dotfiles", "Tailscale"…).
- **Ladder when something feels out of sync:** `CONNECTIONS.md` §"First things to check".
- **This lane's errors:** `AI_ERROR_LOG.md` E-086 / E-087 / E-088.

**Confidence: 93.** Everything tagged **[M]** was read from `launchctl`, the plists, the
logs, `df`, and `git` within four minutes of writing. The soft spots are labelled **[U]**:
the 8/15–8/18 log gap, what consumed 10 points of disk, and today's `ClaudeData` figure.
