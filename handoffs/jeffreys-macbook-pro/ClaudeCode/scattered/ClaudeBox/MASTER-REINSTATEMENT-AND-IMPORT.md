# MASTER REINSTATEMENT / IMPORT DOC — Account Transition

**Prepared:** 2026-08-06 evening (America/Los_Angeles) · **By:** the local-backup Cowork session
**Requested by:** Kari Floof / Jeff Mumford
**Covers:** everything exported and archived for the move off *mumford.jeffrey@gmail.com's Organization* — local ClaudeBox files, claude.ai chats, claude.ai memory, Claude Code CLI history, and every handoff document.

This is the **single entry point** for the transfer. If you only move one folder, move `~/ClaudeBox/_account-transition-export-20260806/` and `~/ClaudeBox/backups/full-archive-since-jul21-20260806/` — together they contain or index everything below.

---

## 1. What to transfer — the four containers

| # | Container (on this MacBook) | What it holds | Size | Verified |
|---|---|---|---|---|
| 1 | `~/ClaudeBox/_account-transition-export-20260806/` | Per-project markdown digests (22 + INDEX), claude.ai chat transcripts zip, claude.ai memory export, both handoff/status docs | ~8 MB | ✅ 2026-08-06 |
| 2 | `~/ClaudeBox/backups/full-archive-since-jul21-20260806/` | Full-fidelity tar.gz of every actual file modified Jul 21→Aug 6 (17 archives), the all-dates handoffs bundle, BACKUP-MANIFEST.md | ~1.3 GB | ✅ 2026-08-06 |
| 3 | `~/mini-claude-history/_export/claude-history-handoff-2026-08-01.tar.gz` | Claude Code CLI session history from the Mac mini (84 sessions, 316 transcripts, Jul 9–25) | 146 MB | ✅ re-checked 2026-08-06 (sha256 starts `3bc7d01c6dd0bfacba51`) |
| 4 | `~/ClaudeBox/mumford-week-plan/mumford-week-plan-handoff-20260806.zip` (+ `HANDOFF-NEW-ACCOUNT.md`, `HANDOFF.md` beside it) | Week-plan app handoff for the new account | ~1.1 MB | ✅ unzip -t clean |

Copy them to the new machine/storage by AirDrop, external drive, or cloud — all four are self-contained.

---

## 2. Handoff documents — inventory (all verified present & non-empty)

Every handoff doc found on this machine, regardless of date, is ALSO bundled in
`backups/full-archive-since-jul21-20260806/handoffs-bundle-all-dates.tar.gz`
(32 files, sha256 `7d54f80ce36aa1da…`, member count verified). Locations of the originals:

**Transition-level**
- `_account-transition-export-20260806/HANDOFF-AND-STATUS.md` — the Aug 6 export handoff (what was exported, gaps, security flags)
- `~/mini-claude-history/HANDOFF-AND-STATUS.md`, `HANDOFF-IMPORT.md`, `INDEX.md` — CLI-history handoff + import instructions

**Working handoffs (`~/ClaudeBox/handoffs/`)**
- `STATUS-2026-08-02.md` · `NEXT-STEPS-BY-PROJECT-2026-07-25.md` · `HANDOFF-DGUTS26-SESSION-IMPORT.md` · `SUBCONTRACTOR-TOOL-RETRIEVAL.md` · `whipdesk-handoff.md` (Jul 19 — pre-window, captured only in the bundle) · `PROJECT RECORD AND ACCOUNTING — 22 July (copy).md`
- `archive/`: HANDOFF_2026-07-22_PICKUP, HANDOFF-2026-07-29-MORNING, HANDOFF-2026-07-30-DGUTS-RAFT, HANDOFF-2026-08-01-DGUTS-SITE, NOTION-WORK-QUEUE

**Project-level**
- `mumford-week-plan/HANDOFF-NEW-ACCOUNT.md` + `HANDOFF.md` + handoff zip
- `Malicious Compliance/HANDOFF_2026-07-22_PICKUP.md`, `HANDOFF_2026-07-23_MBP.md` (+ .bak)
- `briefings/HANDOFF_2026-07-21_billing-errorlog-purcell.md`, `HANDOFF_2026-07-21_purcell-accounting-RESUME.md` (pre-window — captured in bundle)
- `logs/handoff-nightly-2026-07-10 … 07-18.log` (9 files, pre-window — captured in bundle)

---

## 3. Import / reinstatement steps on the new account & machine

**A. ClaudeBox working files (projects, dispatches, briefings, logs…)**
1. Copy the whole `~/ClaudeBox` folder if you're keeping the machine layout — it is already the live data. The archives are your belt-and-suspenders copy.
2. To restore from archive instead: `cd ~/ClaudeBox && tar -xzf <archive>.tar.gz` (paths inside are relative to ClaudeBox). Multi-part sets (Malicious_Compliance ×5, finrecon ×2) are independent tars — extract each part.
3. Checksums for every archive are in `BACKUP-MANIFEST.md` next to them; verify with `shasum -a 256 <file>`.

**B. Claude Code CLI history (from the Mac mini)**
1. Copy `claude-history-handoff-2026-08-01.tar.gz` to the new machine and `tar -xzf` it.
2. Move the encoded project folders (e.g. `-Users-jeffmumfordmacmini-ClaudeBox`) under the new machine's `~/.claude/projects/`, keeping the encoded names. Pull anything out of `archive/` you want active.
3. `gunzip -k "<file>.jsonl.gz"` to read/resume any compressed session. (Full details: `HANDOFF-IMPORT.md` inside the tarball.)

**C. claude.ai chats (old org)**
- Transcripts live in `claudeai-chat-export-20260806.zip` (18 conversations, Jul 21–Aug 6, with INDEX grouped by project). These are reference markdown — claude.ai has no chat-import, so keep them as the archival record. Start fresh chats on the new account and link/paste context as needed.

**D. claude.ai memory**
- `claudeai-memory-export-20260806.md` holds the org-level memory, the one memory control, and all 17 project memories verbatim.
- To reinstate on the new account: open the new account's Settings → Memory (or a new chat) and paste the relevant sections, or attach the file to a first conversation in each new project and ask Claude to internalize it. Project memories rebuild naturally as you work; this file is the seed.

**E. Week-plan app**
- Follow `mumford-week-plan/HANDOFF-NEW-ACCOUNT.md`; the zip beside it is the portable copy. Remember the standing item: `status.js` timezone flips to `-08:00` in November.

**F. Standing context docs worth re-reading first on the new account**
- `CLAUDE.md` (ClaudeBox root — rates, voice law, send rules, AI error log rule), `COVENANT.md`, `AI_ERROR_LOG.md` — all in `_root-loose-files.tar.gz` and live at ClaudeBox root (COVENANT predates the window but is live on disk).

---

## 4. Verification record

- **17 since-Jul-21 archives** — member counts matched source file lists, full gzip/tar decode pass, spot extraction tested, sha256 recorded in BACKUP-MANIFEST.md (2026-08-06).
- **handoffs-bundle-all-dates.tar.gz** — 32/32 members verified (2026-08-06).
- **ClaudeBox-local-export zip / claudeai-chat-export zip / mumford-week-plan handoff zip** — `unzip -t` clean (2026-08-06).
- **mini-claude-history tarball** — gzip integrity pass (2026-08-06); prior full verification (700 members, all 316 sessions, test decompression of the 112 MB session) on 2026-08-01.
- **All handoff docs** — present and non-empty, checked individually (2026-08-06).

## 5. Known gaps & open items

1. **Jeff Mumford's Individual Org** (`519217cd-…`) — chats *and* memory still unexported (403 permission error for this browser login). Sign into that org and re-run the export if it holds anything.
2. **Generated-artifact bodies** are not inside chat transcripts (claude.ai API limitation).
3. **claude.ai archiving — DONE for projects (2026-08-06 ~5:17 PM PT):** all 17 projects in the old org were archived and verified (each now carries an `archived_at` timestamp). **Chats cannot be archived on this org** — the conversation API exposes no archive control (only star/delete), so the 111 conversations were left in place untouched. The 18 in-window ones are fully transcribed in the chat export zip; deleting anything was deliberately NOT done. If you want the old chats gone from the sidebar, that's a delete decision to make explicitly after confirming the exports.
4. **Disk space** — this Mac is at ~97%. Safe to delete: `~/mini-claude-history/_to_delete/` (~272 MB) and `~/ClaudeBox/_to_delete/PARTIAL-DISCARD-Malicious_Compliance.tar.gz` (~93 MB).

---

*Everything in sections 1–2 is on this MacBook and verified. Once copied off, the transfer is complete; nothing else on the old account is needed except the Individual Org noted above.*
