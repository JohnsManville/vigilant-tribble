# Handoff: Intel Sweep v1.2 (source registry, depth control, agent install, 12-month deep sweep)

**Version:** RC | **Date:** 2026-09-03 | **Generated from:** CoWork session
**Supersedes:** none for this slug. Carries the sweep thread forward from ~/ClaudeBox/handoffs/2026-08-31_data-sources-and-family-record_handoff_v1.2.md (that file still governs the family-record thread).
**Canonical copy:** ~/ClaudeBox/handoffs/2026-09-03_intel-sweep_handoff_RC.md

---

## 1. Present State

**One-line status:** Sweep v1.2 is built and validated on the Mac mini (registry + profiles + skill); nothing has been run against it yet, and it is not installed anywhere an agent can call it.

**Done**
- Listed every intel source used to date (session tool list + Decision Data Map v1.1 + sweep v1.1 skill). Folded into the registry.
- `~/ClaudeBox/scripts/sweep/sources.yaml` written: 23 sources, tiers routine (11) / on-demand (7) / restricted (3) / dead (2), per-source depth 0-4 definitions, access IDs, flags, guards, on_fail, verify. YAML parses clean.
- `~/ClaudeBox/scripts/sweep/profiles.yaml` written: depth scale + 6 profiles (morning, full, money, pipeline, mini_only, pulse). Every profile key validated against the registry.
- `~/ClaudeBox/scripts/sweep/SKILL.md` rewritten as v1.2 (reads the two YAML files, run syntax, output structure with run table + drift + source health, hard rules, verification).
- v1.1 skill archived at `~/ClaudeBox/scripts/sweep/archive/SKILL_v1.1_2026-08-31.md`.
- Memory pointer updated in /areas/data-sources-sweep.md.

**In progress**
- Nothing mid-flight. Next concrete unit is install + `sweep pulse`.

**Blocked / waiting on Jeff**
- Go-ahead on agent install (symlink on the mini + Cowork pointer skill). Recommended, not yet approved.
- Go-ahead and pacing for the 12-month deep sweep (🔴). Jeff asked "hypothetically"; not committed.
- Jeff's current weekly usage percentage, to set pacing per his 70% rule.

**Decided (do not re-litigate)**
- Registry lives in `~/ClaudeBox/scripts/sweep/` as YAML, and SKILL.md reads it. Why: one source of truth, editable without rewriting the skill. Rejected: hard-coding sources in SKILL.md (v1.1 approach), because every change meant a skill rewrite.
- Depth is a 0-4 scale, defined per source in the registry. Why: "deep" means different things for Gmail vs Photos. Rejected: a single global depth switch.
- Restricted sources (family_timelines, kari_conditions, therapy) are locked at 0 and open only when Jeff names them with a depth in the run. Why: Jeff's standing instruction on those materials.
- Square is ground truth on payment; Calendar on time; Notion on scope. Recap emails and TRIAGE/EXECUTOR files are claims to verify. Why: the Fairmount deposit drift (recap said unpaid on Aug 28; Square showed paid Aug 22).
- Agent install order: (1) Claude Code symlink on the mini, (2) Cowork pointer skill, (3) cloud scheduled task later, not now. Why: (3) overlaps the 6am dailybrief and depends on the mini being awake and the folder attached at fire time.
- 12-month sweep, if it happens, runs in phases with a file written per source per phase, Gmail month-by-month. Rejected: one-pass run, because Gmail quality drops.

**Assumptions in play**
- Registry location and file names as above (unconfirmed by Jeff explicitly, but he did not object).
- `~/ClaudeBox/handoffs/` is where handoffs go for this project (matches the prior handoff; `~/Claude/Handoffs` was not checked).
- Claude Code on the mini may not have the cloud MCPs (Gmail, Calendar, Drive, Notion, Square, WordPress) configured; unverified.

**Open questions for Jeff**
1. Install now (symlink + Cowork skill)? Matters because nothing can call the sweep until then.
2. Current weekly usage %? Matters because the deep sweep is 2M-3.7M tokens and pacing depends on tier and remaining allowance.
3. For a 12-month sweep, do the Laura and Kari iMessage threads and the restricted sources stay locked? Matters because the record has holes without them; his call.

---

## 2. Compacted Context

**Goal, and why it matters**
Jeff wants every intel source mapped and hardened, with per-source control over how it is swept and how deep, so a Claude agent can produce trustworthy briefings on demand or on schedule without rediscovery, and so a 12-month reference sweep is possible later.

**Key facts and numbers**
- Registry: 23 sources. Routine: gmail, calendar, drive, notion, wordpress, square, finrecon, apple_notes, imessage, photos, claudebox. On-demand: email_automations, experian, week_plan, boatel, roswell, minutes, memory. Restricted: family_timelines, kari_conditions, therapy. Dead: voice_memos, wyze.
- Run syntax: `sweep` (morning), `sweep full`, `sweep money`, `sweep gmail:3 square:1`, `sweep only imessage:3`, `sweep roswell:2` (opens on-demand/restricted for that run).
- Key IDs baked into sources.yaml: Square location `LPMQT9SM90C2J`; odd-jobs.org blog_id `234704988`; Notion family collections `95d157c3-614e-4452-b07c-cc832ef69df3` and `a11c2b25-c82c-422b-8c5a-2d5b089881bd`; FinRecon at `~/ClaudeBox/finrecon`; iMessage exports at `~/ClaudeBox/imsg`.
- Sweep output path: `~/ClaudeBox/briefings/YYYY-MM-DD_sweep.md` (+ `_<profile>` if not morning).
- Existing mini automation (CONNECTIONS.md): launchd agents incl. `com.oddjobs.claudebox.dailybrief` (6am brief texted to Jeff), `com.oddjobs.finrecon-simplefin-sync` (05:30, green). Sweep should slot beside these, not duplicate them.
- Deep sweep estimate: Phase 1 150-300k, Phase 2 200-400k, Phase 3 Gmail 1M-2M, Phase 4 iMessage 300-600k, Phase 5 rollup 200-400k; total 2M-3.7M tokens, 6-8 sessions. Confidence 65/100 on the range. Weekly limits reset Wednesday ~7am PT.
- 12-month reach: full for Gmail, Calendar, Drive, Notion, Square, FinRecon, Apple Notes; ClaudeBox briefings only from 2026-07-08; iMessage needs the existing exports plus a fresh mini-side export; Photos counts only; Voice Memos none.
- Proposed deep-sweep output: `~/ClaudeBox/briefings/annual/2025-09_to_2026-09/` with one file per source and `ANNUAL_SWEEP_RC.md` rollup by month and by thread, money reconciled Square vs Notion vs FinRecon, plus a "said but never resolved" list.

**Files, links, and where things live**

| Item | Location | State |
|---|---|---|
| sources.yaml (registry v1.2) | ~/ClaudeBox/scripts/sweep/sources.yaml | final, validated |
| profiles.yaml | ~/ClaudeBox/scripts/sweep/profiles.yaml | final, validated |
| SKILL.md v1.2 | ~/ClaudeBox/scripts/sweep/SKILL.md | final, untested end to end |
| SKILL v1.1 archive | ~/ClaudeBox/scripts/sweep/archive/SKILL_v1.1_2026-08-31.md | archived |
| references/family-handling.md | ~/ClaudeBox/scripts/sweep/references/ | MISSING. Referenced since v1.1, never written. Registry guards cover it for now. |
| Decision Data Map v1.1 | ~/ClaudeBox/briefings/2026-08-31_Decision_Data_Map_v1.1.md | reference; superseded in practice by sources.yaml |
| First sweep run (v1.1) | ~/ClaudeBox/briefings/2026-08-31_sweep.md | reference for output shape |
| Prior handoff | ~/ClaudeBox/handoffs/2026-08-31_data-sources-and-family-record_handoff_v1.2.md | still governs family-record thread |
| This handoff | ~/ClaudeBox/handoffs/2026-09-03_intel-sweep_handoff_RC.md | canonical |

**Tools and connectors used**
- device bridge to `jeffreys-mac-mini-local`: folder access granted for `/Users/jeffmumfordmacmini/ClaudeBox` this session (must be re-granted next session). `device_bash` worked reliably this session (heredoc writes, python3 + pyyaml present on the mini VM).
- No cloud connectors were called this session. Available in Cowork: Gmail, Google Calendar, Google Drive, Notion, Square, WordPress.com, web search; on the mini: iMessage, Apple Notes, Minutes, Filesystem/Desktop Commander, PDF Tools, osascript, Control Chrome, computer use.
- Memory: /areas/data-sources-sweep.md holds the pointer.

**Do not redo**
- Do not re-inventory sources; the registry is complete against everything used to date.
- Do not re-read the Decision Data Map or the v1.1 skill; both are folded in.
- Do not re-estimate the deep sweep; numbers above stand until Phase 1 of it produces real volume.
- Do not rebuild the YAML; edit in place and bump the version comment.

**Watch-outs**
- Jeff's messages sometimes arrive truncated ("I", "we"). Ask for the rest rather than guessing.
- YAML gotcha hit once: a quoted string followed by unquoted text on a list item breaks parsing. Quote the whole item.
- `device_bash` on the mini has failed with generic errors in past sessions (v1.1 guard). Two tries max, then fall back to device_list_dir / osascript.
- Apple Notes long notes ("Personal To Do:") fail on buffer limits; report unreadable, not empty.
- Never modify public odd-jobs.org pages; Special Projects stays private/noindex.
- No em dashes in anything drafted for Jeff.
- 🟡/🔴 usage flags apply; Jeff cannot see the meter from here and has a 70% weekly rule that turns 🟡 into 🔴.

---

## 3. Phased Pickup Plan

### Phase 1: Install and prove reachability 🟢
- **Goal:** the sweep is callable, and every source answers.
- **Steps:**
  1. On the mini: `ln -s ~/ClaudeBox/scripts/sweep ~/.claude/skills/sweep` (check `~/.claude/skills` exists first).
  2. Check `~/.claude.json` on the mini for configured MCP servers; note which cloud sources Claude Code there can reach.
  3. From Cowork with ClaudeBox connected: run `sweep pulse` per SKILL.md v1.2. Write `~/ClaudeBox/briefings/2026-09-0X_sweep_pulse.md`.
  4. Fix any registry entry that a real call proves wrong (IDs, tool names, depth definitions).
- **Needs from Jeff:** go-ahead on the symlink (question 1).
- **Done when:** run table shows all 23 sources with ok / nothing new / unreachable: reason / locked, and the file is written.

### Phase 2: Cowork pointer skill 🟢
- **Goal:** `sweep` works from any Cowork session.
- **Steps:** propose a Cowork skill via propose_skills: reads sources.yaml + profiles.yaml from ClaudeBox on the linked mini, executes per SKILL.md v1.2; if the mini is offline, say so and offer cloud-only sources (gmail, calendar, drive, notion, square, wordpress).
- **Needs from Jeff:** save the proposal from the review card.
- **Done when:** `sweep morning` runs from a fresh Cowork session with only the folder grant as setup.

### Phase 3: First real morning run 🟡
- **Goal:** one trustworthy `sweep morning` and a corrected registry.
- **Steps:** run it, compare against `2026-08-31_sweep.md` for shape, check drift section against OJ Brief / Daily Recap, tune flags and depth definitions from what came back.
- **Needs from Jeff:** feedback on what was noise vs signal.
- **Done when:** Jeff says the morning output is usable and the registry version is bumped to v1.3.

### Phase 4: Write references/family-handling.md 🟢
- **Goal:** close the missing file the skill has referenced since v1.1.
- **Steps:** one page: factual and documentary only, never argument-building, nothing to memory as [stated], read before opening either family collection.
- **Needs from Jeff:** none; he has already stated the rules.
- **Done when:** file exists and SKILL.md's reference resolves.

### Phase 5: Deep sweep Phase 1 (Square, Calendar, Notes, FinRecon index, ClaudeBox), 12 months 🔴
- **Goal:** cheap, high-signal first slice of the annual record.
- **Steps:** create `~/ClaudeBox/briefings/annual/2025-09_to_2026-09/`; one file per source; check usage after and set pacing for Gmail.
- **Needs from Jeff:** explicit go-ahead, current usage %, answer to question 3.
- **Done when:** five source files written and usage number reported back.

### Phase 6: Deep sweep remainder (Notion/Drive, Gmail month-by-month, iMessage export, rollup) 🔴
- **Goal:** `ANNUAL_SWEEP_RC.md`.
- **Steps:** per the phase plan under Key facts; one file per month for Gmail; iMessage export scripted on the mini; rollup last.
- **Needs from Jeff:** go-ahead per phase, pacing.
- **Done when:** rollup exists with month index, thread index, money reconciliation, and unresolved list.

**Stop conditions:** the mini is unreachable (Phase 1 and 4 need it); a cloud connector auth has expired; `sweep pulse` shows more than 3 sources unreachable (fix before any deeper run); Jeff reports weekly usage at or above 70%; anything in a restricted source surfaces without Jeff having named it.

---

## 4. Startup Prompt

```
Pick up the intel sweep handoff. Read ~/ClaudeBox/handoffs/2026-09-03_intel-sweep_handoff_RC.md (or the attached file) and nothing else yet. Carry the assumptions forward, ask me only what actually blocks Phase 1, then start Phase 1 and report back when it's done. Don't redo anything on the "Do not redo" list. Usual rules: direct, practical, list assumptions, confidence index.
```

---

**Confidence index:** 88/100 that a fresh session can pick this up without asking anything beyond the open questions above. Uncertain: whether Claude Code on the mini has the cloud MCPs, and whether `device_bash` stays reliable next session.
