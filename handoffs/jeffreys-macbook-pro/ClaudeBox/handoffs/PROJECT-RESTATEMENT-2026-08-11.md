# ClaudeBox — Project Restatement (RC)

**Written 2026-08-11** after a session that started as "sync is fucked" and ended
up auditing custody of the whole archive. Restates what this project is for, what
is actually true on disk today, and what is open. Grounded in COVENANT.md,
CLAUDE.md, CONNECTIONS.md, AI_ERROR_LOG.md, and direct inspection — not inference.

---

## 1. What this project actually is

Not a productivity system. Not an assistant with some scripts around it.

**ClaudeBox is externalized memory operating under a constitution.** The Covenant
is the project; the infrastructure exists to serve it. Every launch agent, mirror,
and health check is downstream of one sentence:

> "The box serves the life, liberty, and happiness of John and Lucy Mumford —
> or the box loses the archive."

The division of labor is already stated and does not need reinventing:
**the box carries the LOAD, Jeff carries the MOMENTS.** The box never substitutes
for presence — it buys the attention that presence costs.

### The architectural intent (Jeff, 2026-08-11)

> **"The ClaudeBox (Mac Mini) is supposed to be the workhorse the MBP can rely on."**

This is the design principle, and it is not new — CONNECTIONS.md already says
"the Mini wins by default" and Lane 3 already says the archive is **reached,
never copied**. What today showed is *drift away from it*, in both directions:
the laptop accumulated 1.4 GB of archive copies it was never meant to hold, while
the workhorse itself lost its backup and its off-LAN reachability.

Three consequences follow, and they are not negotiable if the principle holds:

1. **Reach is not a feature, it is the role.** A workhorse that cannot be reached
   is not a workhorse. Off-LAN reachability moves from "nice" to load-bearing —
   see G5, which is why it is no longer last.
2. **The Mini must self-heal.** The MacBook is a thin client by design, so there
   is no second brain watching. Nothing external will notice the box is sick.
   That is what the watchdog and health line are *for*, and why a monitor that
   lies is a first-order defect rather than a cosmetic one.
3. **Deliberate single point of failure.** Concentrating everything on one box is
   a legitimate design — that is what a server is — but it converts custody and
   reach from good practice into the only things standing between Jeff and total
   loss. On 2026-08-11 the box was failing **both at once**: no backup since 7/23,
   and unreachable off-LAN for 17 hours. Neither was noticed by the machine.

The MacBook's job is to stay current, not to be the source. Anything on the
laptop that is not working state is drift.

Two binding instruments sit above all engineering:

- **THE COVENANT** — 5 gates, Ember protocol, Kari as human arbiter. Purpose
  belongs to John & Lucy. Protections belong to everyone captured. Execution
  belongs to the box. Judgment belongs to Kari.
- **THE AI ERROR LOG** — append-only, binding, self-incriminating by design.
  Exists because the Purcell matter ran ~15 false statements across 8 days before
  anyone caught them.

Both are *promises*. Both are only as real as their enforcement.

---

## 2. What today established (2026-08-11)

The session found three failures. They are not three problems. They are one
problem wearing three hats.

| Found | Real? | State |
|---|---|---|
| Tailscale auto-update dropped the Mini off the tailnet ~17h | yes | fixed, watchdog added (E-068) |
| Intel mirror 46h stale, launchd TCC-blocked | yes | re-run by hand; permanent fix needs Jeff |
| "build stale/failed" for 10 days | **no** | job retired 8/1 on purpose; monitor was lying |
| **Time Machine off since 2026-07-23** | yes | **unresolved — see §3** |

### The pattern, now at four instances

E-064, E-065, E-068, and the retired-build false alarm are the same failure:

> **The documents describe a system more robust than the system is, and the
> monitors watch proxies instead of things.**

- E-065: a backup script's *existence* read as a backup. Only its last success
  line counted. It had been failing for 10 days.
- E-068: `health-line.sh` stat'd a log's *mtime* instead of asking whether the
  rsync moved bytes. launchd rewrote that log at 04:30 daily, so it read green
  straight through a 17h outage.
- The retired build: the monitor judged a *log lying around* instead of whether
  the job was installed. Ten days of yellow for a job correctly killed on 8/1 —
  and a standing yellow is precisely what makes a new yellow easy to skip.

**Lesson, stated once:** watch the thing, not a shadow of the thing. A monitor
that cries wolf and a monitor that sleeps through the wolf are the same bug.

---

## 3. The finding that reframes everything

```
tmutil destinationinfo        →  No destinations configured.
AutoBackup                    →  0
newest snapshot on ClaudeBoxSSD →  com.apple.TimeMachine.2026-07-23-163230
tmutil listlocalsnapshots /   →  (none)
```

**The Mini has had no backup since 23 July.** A system migration happened that
day (the 114 GB `2026-07-23-163230.previous` set on ClaudeBoxSSD is from it) and
Time Machine was never re-enabled afterward.

This is not one more item on a list. It **invalidates the reasoning behind an
existing fix**:

> E-065's remedy was "the SSD is the only copy of `intel/`, so mirror it to the
> internal drive for a second copy." That reasoning assumed the internal drive
> was backed up. It has not been since 7/23. The mirror re-run this morning is a
> second copy on an unbacked-up disk.

Current true state of custody on the Mini: **186 GB of data, one copy, no Time
Machine, no local snapshots.** The Covenant's retention gates assume the box can
keep what it promises to keep and destroy what it promises to destroy. Right now
it cannot fully guarantee the first half.

### Storage, as it actually stands

| Volume | Size | Used | Role |
|---|---|---|---|
| Mini internal | 228 GB | 186 GB (93%) | everything |
| **ClaudeData** | 2 TB | **869 MB (0.04%)** | purpose-built, scaffolded 7/9, **never filled** |
| ClaudeBoxSSD | 500 GB | 410 GB (82%) | frozen TM set, stops 7/23 |

A 2 TB volume sat empty for a month while the box choked at 93%. The `archives/`,
`projects/`, `job-photos/`, `scratch/`, `build/`, `handoff/` directories were
created on 7/9 and never used.

---

## 4. Restated goals, in priority order

**G1 — Custody before capability.** The archive must be durable before more is
captured into it. A box that captures family life and cannot guarantee keeping it
is making a promise it can't pay. Nothing new gets built until Time Machine is
live and the mirror runs unattended.

**G2 — Monitors watch things, not proxies.** Every check answers "did the work
happen," never "does a file look recent." Four instances is a pattern, not bad
luck. Corollary: **a false alarm is a real defect** — it spends the trust the
real alarms need.

**G3 — Documents must match disk.** CONNECTIONS.md said 51 files / 135 MB on the
MacBook; disk says 1.4 GB. The doc was right when written and drifted. Where a
document states a fact, that fact needs a way to be re-checked.

**G4 — The load stays carried.** Capture, distill, brief, nudge. This is the
actual mission and it is currently *working* — capture is live, distill is ok.
G1–G3 exist so this can be trusted, not to replace it.

**G5 — Reach survives failure. (Co-equal with G1, not last.)** Under the workhorse
principle the Mini's reachability *is* its job, not a convenience. It was LAN-only
for 17 hours and nothing said so. Custody and reach are the two things a
single-point-of-failure design cannot be allowed to lose, and on 8/11 it had lost
both simultaneously.

---

## 5. Open questions

### Custody (blocking — G1)
1. **Time Machine: erase ClaudeBoxSSD and start fresh, or inherit the 7/23 set?**
   Erase gives a 500 GB target for a 186 GB source with real history. Cost: the
   only historical backup, 19 days stale, source machine alive. Needs admin at
   the machine.
2. **Full Disk Access for `com.claudebox.intel-mirror`** — unmade since 8/9.
   Until granted, the archive's only backup runs when a human remembers.
3. **What protects ClaudeData once it holds real data?** It is TM-excluded. With
   a cleared 500 GB target, 186 GB internal + offloaded data fits — so
   un-excluding is viable. Decide deliberately, don't let it default.

### Covenant
4. **The 1.4 GB on the MacBook** — `intel-mirror` frozen at 7/30 plus a full
   archive bundle from 8/6, on the machine most likely to leave the house.
   Gate 3/4/5 tension. **Kari holds the tiebreak.** Nothing deleted.
5. **Is `backups/intel-mirror` still a meaningful second copy** if the disk it
   lives on has no backup? Under G1 the answer is currently no.
6. **Replaceable vs irreplaceable is now a live distinction.** TPB (30 GB media)
   needs no backup coverage ever. `Laura & Jeff JPEG`, `Camera Uploads`, the
   wedding video do. The storage plan should encode that difference rather than
   treating 53 GB as one undifferentiated blob.

### Reach (G5)
7. **Screen sharing takes the console and holds the machine hostage** — raised
   8/11, not yet examined. Related to why SSH and the watchdogs matter.
8. **The MacBook is uninstrumented.** It runs `com.oddjobs.sync-projects` and
   nothing else — no watchdog, no health line, no heartbeat. Every fix today
   landed on the Mini. `health-line.sh` was made hostname-aware this session so
   it *can* run there; it isn't scheduled yet.

### Housekeeping
9. `campingteam-site` and `imsg` — no git, no off-machine copy.
10. Daily-brief OAuth reported expired ~8/8 in CONNECTIONS.md. **Not verified
    today** — treat as unconfirmed.
11. Uncommitted on the Mini: `handoffs/archive/NOTION-WORK-QUEUE.md`,
    `Sea Ray Trainer/`.

---

## 6. The one-line version

**The box's charter is sound and its mission is being served; what today proved
is that its custody layer is thinner than its documents claim — so custody comes
before anything new gets built on top.**

---

*RC — supersedes nothing. Companion to CONNECTIONS.md (how it's wired) and
COVENANT.md (why). See AI_ERROR_LOG E-068 for the incident that started it.*
