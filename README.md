# vigilant-tribble — handoff sync

Private mirror of the Cowork/Claude session handoffs that live on Jeff's Macs,
so any Claude session (remote cloud sessions included) can read and consolidate
them without filesystem access to the machines.

## Why this exists

On 2026-08-31 a remote session was asked to consolidate all handoffs into a
master status doc and couldn't reach the sources: they live only on the Macs,
and Google Drive held just stale partial copies (nothing newer than 2026-08-28).
This repo closes that gap.

## Machine topology (important)

The handoff corpus is split across two Macs, each with its *own* set of
handoff directories:

- **MacBook Pro** — `jeffmumford@Jeffreys-MacBook-Pro` — **canonical** for the
  Roswell legal thread and the newest `~/Claude/Handoffs/` set (this is where
  the `2026-08-31_roswell_handoff_v1.x` chain, the family-letter ledger, and
  `~/Claude/Roswell/{legal,build}/` actually live).
- **Mac mini** — `jeffmumfordmacmini@Jeffreys-Mac-mini` (Tailscale
  `100.115.69.54`) — keeps a **parallel, partial** set (its own
  `~/Claude/Handoffs/` and `~/ClaudeBox/handoffs/`), plus it is the
  always-on remote-access hub.

Because both machines have same-named handoff folders with *different*
contents, the sync writes each machine into its own namespace:
`handoffs/<short-hostname>/...`. Nothing collides; a consolidator reads both.

## Layout

```
handoffs/<hostname>/Claude/Handoffs/          <- mirror of ~/Claude/Handoffs/
handoffs/<hostname>/ClaudeBox/handoffs/       <- mirror of ~/ClaudeBox/handoffs/ incl. archive/
handoffs/<hostname>/Claude/Roswell/legal/     <- status notes only (*.md/*.csv/*.txt)
handoffs/<hostname>/Claude/Roswell/build/     <- status notes only
handoffs/<hostname>/.last-sync                <- UTC timestamp + who/where
bin/sync-handoffs.sh                          <- the sync script (run on each Mac)
```

Only markdown / csv / text is mirrored — no PDFs, images, or scans. The Macs
remain canonical; this repo is a read mirror.

## One-time setup, on EACH Mac

```bash
git clone https://github.com/JohnsManville/vigilant-tribble.git ~/Claude/.handoff-sync
~/Claude/.handoff-sync/bin/sync-handoffs.sh     # first sync
```

Then either:

- **Automatic (recommended):** load the launchd job so it syncs every 30 min —
  plist template at the bottom of `bin/sync-handoffs.sh`, or
- **Per-handoff:** add "run `~/Claude/.handoff-sync/bin/sync-handoffs.sh`" as
  the final step of the `session-handoff` skill, so every new handoff pushes
  the moment it's written.

## Rules for sessions using this mirror

- The Macs' files are canonical. If mirror and Mac disagree, the Mac wins, and
  the MacBook Pro wins over the mini for the Roswell/legal thread.
- A session that can only see this mirror must say so in anything it writes,
  and must never declare its output canonical over fresher Mac-side files.
- Master/consolidated docs produced from this mirror should be written back to
  the canonical Mac (`~/Claude/Handoffs/` on the MacBook Pro) as the source of
  truth, and may also be committed here for the next reader.
