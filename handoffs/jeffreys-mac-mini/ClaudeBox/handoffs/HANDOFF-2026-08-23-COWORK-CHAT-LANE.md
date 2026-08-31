# HANDOFF — the Cowork / chat lane: recovered artifacts, a forked ledger, and a false green

**Written 2026-08-23 ~06:10 PDT · Mini (`Macmini9,1`) · session `8c67e6c8`**
**Companion to** `HANDOFF-2026-08-23-SESSION-COVERAGE-AUDIT.md`, which this file corrects.

---

## WHY THIS EXISTS

The coverage audit written an hour earlier counted 119 sessions and declared them accounted for,
with a caveat that Cowork and claude.ai chats could not be enumerated from the Mini. Jeff then put
four screenshots of the desktop app in front of me. The caveat was right and badly understated:
**the chat/Cowork lane is not merely unseen — it has been producing handoffs that never reached
the Mini.** One of them says so in its own body:

> *"The bridge dropped again, so these are in your conversation rather than on the Mini."*

The Claude Code audit was structurally incapable of noticing that, because a document that never
lands leaves no trace on this disk.

---

## 1. RECOVERED — two Cowork artifacts, now on the Mini

Both were written by a Cowork session bridged to the **MacBook** at 05:46–05:50 PDT and existed
only under `/Users/jeffmumford/` — the laptop, which `~/ClaudeBox/CLAUDE.md` explicitly defines as
the thin client that must never be the source. Pulled over the `mbp` SSH alias:

| File | Size | Was |
|---|---|---|
| `handoffs/SESSION-HANDOFF-2026-08-23-COWORK-MBP.md` | 8,371 B | MBP only |
| `handoffs/MBP-PRESENT-STATE-2026-08-23.md` | 8,682 B | MBP only |

Both are careful documents. The session handoff opens by withdrawing its own advisory and logging
its own date error, and it states its confidence per-claim. Read it.

## 2. STILL STRANDED — three artifacts that exist only inside conversations

Google Drive holds **nothing** handoff-shaped newer than **2026-08-12**. The "Google Drive" chips
visible under those chat outputs are **save offers, not confirmations** — the files were rendered
into the conversation and never persisted anywhere I can reach.

| Artifact | Chat | Where it is |
|---|---|---|
| `STATE-2026-08-07.md` (v1.2) | Mumford week plan password security concern | conversation only |
| `HANDOFF-2026-08-11.md` | MBP and Mini sync issue | conversation only |
| `PRESENT-STATE.md` | MBP and Mini sync issue | conversation only |

**These cannot be retrieved from the Mini.** Recovering them means using the chat's own download
or save-to-Drive control, or pasting them. Until then they are one cache-eviction from gone. The
week-plan one carries a specific instruction worth not losing: save it as `STATE-2026-08-07.md`,
**not** `HANDOFF.md`, because the existing handoff is authoritative on architecture.

---

## 3. THE LEDGER HAS FORKED — fix this before any sync runs

`AI_ERROR_LOG.md` is a **binding append-only ledger**, and it now exists as two divergent files:

| | Mini | MacBook |
|---|---|---|
| Size | 350,173 B | 341,810 B |
| Max ID | `E-097` | `E-095` |
| mtime | 08-23 05:32 | 08-23 05:46 |

**Two different incidents are both numbered E-095.** The Mini's is the "I hope this finds you well"
blocklist retraction; the MacBook's is two documents misdated from file mtimes. The Mini
additionally holds `E-096`, `E-097` and `E-098`, which the MacBook has never seen.

**And the collision is not new.** The Mini's copy alone carries **14 duplicated IDs**:
E-044, E-049, E-052, E-053, E-059, E-060, E-061, E-062, E-064, E-072, E-077, E-078, E-090 and E-094. Numbering has been unreliable for a long
time; the two-machine fork just made it visible.

**The danger is concrete:** the documented sync idiom in `~/.claude/CLAUDE.md` is a straight
`scp` push, Mini → MBP. Run that against this file and the MacBook's `E-095` is destroyed — an
append-only ledger silently losing an entry, which is exactly the failure the append-only rule
exists to prevent. The reverse direction loses three.

**Until merged:** cite entries by **date and title, never by number.** That convention is the
Cowork session's, and it is correct. A merge needs to be a union by date+title with renumbering,
done once, by hand.

---

## 4. RESOLVED — the Cowork session's two top open items, both answered here

It listed items 2 and 3 as *"one short session on the Mini [that] should happen before anything
else on this list is trusted."* Done:

**Item 2 — is there a distilled file for 8/23?** Yes, but it is **backfill, not recovery.**
`distilled/2026-08-14.md` … `2026-08-23.md` all carry mtimes of **04:47–04:51 on 8/23** — written
by hand this morning by the Mini's voice/intel session. The 8/23 file itself records only 3
messages, all before 03:30, and notes `raw/2026-08-23-events.jsonl` **absent**. The distiller did
not come back; a human-driven session filled the hole.

**Item 3 — was the health line green through the nine blocked days?** **Yes. Confirmed defect.**
The Cowork session hedged this at 70/100 because it could not read the Mini. It was right.

- `scripts/nightly-distill.sh:13` — `echo "distill done $(date)" >> "$LOG"` runs
  **unconditionally** after the `claude -p` call. No exit-code check.
- `scripts/health-line.sh:46` — sets `D=ok` on a log newer than 30h **plus**
  `grep -q "distill done"`. It never checks that the day's output file exists.

The monitor tested whether the job *ran*, never whether it *worked*. The 8/20–8/22 logs each end
with `distill done` directly below their own EPERM failure reports; the 8/21 log says *"this is
the eighth straight failure of a nightly job."* Root cause per the 8/22 log is **TCC / Full Disk
Access at confidence 97**, and it needs a human at the machine.

Logged as **E-098, 2026-08-23** (title: health line reported `distill ok` for nine consecutive
blocked nights). **Logged, not fixed** — both scripts are unchanged and the defect will re-arm on
the next failure.

**One claim I checked and could not fault:** the Cowork doc calls `backups/intel-mirror` frozen at
Jul 31. That is true **of the MacBook's copy**, which is what it says. The Mini's mirror updated
today at 03:26. No error.

---

## 5. WHAT REMAINS UNREACHABLE — and the inventory to work from

Cowork runs in a VM with no local transcripts; browser chats are entirely server-side. From the
screenshots, the chat lane holds at least these conversations, and **I cannot tell which have a
current handoff, or when any of them last ran:**

LG front loader washing machine · Mumford week plan password security · Claude usage across
devices · Google accounts merge strategy · MBP and Mini sync issue · Multiple Gmail accounts ·
Bitsies project · Josh's move from Fairmount · Learning estimator tool for Handled · Estimate
pricing module architecture · Mac Mini and MBP workflow · Organizing mold remediation documents ·
Recent "handled." presentation · Davinci sleep cycle · Diesel cost for boat trip to Portland

Plus the project spaces: Fairmount Job Jacket · Handled Invoice/Proposal Template · Handled
Dashboard · Odd Jobs Reliable Stack · Odd Jobs Automation Dashboard · Mumford Week Plan ·
Claudebox Diagnostic Console · Opossum Designs · Loerzel Structure · Boater candidates · Roswell
property claim · Mumford Family POW.

**The structural fix, in the Cowork session's own words:** *"Put the Claude desktop app on the
Mini."* Every Cowork session currently bridges to the MacBook, so every Cowork artifact is born on
the thin client and has to be hauled back. That inverts the architecture `CLAUDE.md` defines. It
is the single change that would stop this class of loss.

---

## FIRST MOVES FOR THE NEXT SESSION

1. **Do not sync `AI_ERROR_LOG.md` in either direction** until the fork is merged by hand. §3.
2. Rescue the three stranded chat artifacts from their conversations, or accept losing them. §2.
3. Decide on `health-line.sh` — a one-line fix (assert the day's distilled file exists) closes
   E-098's monitor half. The distiller's own TCC block still needs a human at the Mini.
4. `handoff-clone` is reportedly 10 commits behind on `nightly` with a dirty tree, so the nightly
   pull skips it permanently. Unverified from here.
5. The exposed API key flagged in the Cowork doc is the only open item with an adversary. It was
   34 days old at 05:46 today.

**Standing orders still in force:** no sends without Jeff's hand (imsg `APPROVE <id>` excepted) ·
AI_ERROR_LOG is append-only, corrections get a new entry · the Covenant governs anything touching
the intel archive or family data · confidence index 0–100 on answers and estimates · voice law.
