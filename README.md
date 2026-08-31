# vigilant-tribble — handoff sync

Private mirror of the Cowork/Claude session handoffs that live on the Mac mini,
so any Claude session (remote cloud sessions included) can read and consolidate
them without filesystem access to the Mac.

## Why this exists

On 2026-08-31 a remote session was asked to consolidate all handoffs into a
master status doc and could not: `~/Claude/Handoffs/`, `~/ClaudeBox/handoffs/`,
and `~/Claude/Roswell/{legal,build}/` exist only on the Mac mini. Google Drive
held only stale partial copies (nothing newer than 2026-08-28; none of the
Roswell 08-29 → 08-31 handoffs). This repo closes that gap.

## Layout

```
Claude/Handoffs/          <- mirror of ~/Claude/Handoffs/ (*.md, *.txt)
ClaudeBox/handoffs/       <- mirror of ~/ClaudeBox/handoffs/ incl. archive/
Claude/Roswell/legal/     <- status notes only (*.md, *.txt)
Claude/Roswell/build/     <- status notes only (*.md, *.txt)
bin/sync-handoffs.sh      <- the sync script (run on the Mac mini)
RERUN-PROMPT.md           <- paste-ready consolidation prompt
```

Only markdown/text is mirrored — no PDFs, images, or scans. The Mac mini
remains the canonical copy; this repo is a read mirror for other sessions.

## One-time setup on the Mac mini

```bash
git clone https://github.com/JohnsManville/vigilant-tribble.git ~/Claude/.handoff-sync
cp ~/Claude/.handoff-sync/bin/sync-handoffs.sh ~/Claude/.handoff-sync/bin/sync-handoffs.local.sh  # optional: local tweaks
~/Claude/.handoff-sync/bin/sync-handoffs.sh     # first sync
```

Then either:

- **Automatic (recommended):** load the launchd job so it syncs every 30 min —
  see the plist template at the bottom of `bin/sync-handoffs.sh`, or
- **Per-handoff:** add "run `~/Claude/.handoff-sync/bin/sync-handoffs.sh`" as
  the final step of the `session-handoff` skill, so every new handoff is pushed
  the moment it's written.

## Rules for sessions using this mirror

- The Mac mini's files are canonical. If mirror and Mac disagree, the Mac wins.
- A session that can only see this mirror must say so in anything it writes,
  and must never declare its output canonical over fresher Mac-side files.
- Consolidated/master docs produced from this mirror should be committed back
  here (into `Claude/Handoffs/`) so the next sync run can be checked for
  conflicts before copying them onto the Mac.
