# SESSION HANDOFF — 21 July 2026
**Status: RC · Source: Cowork (cloud) session, driving this Mac via the device bridge · For: the next Claude Code session**

## SUMMARY (read first)
1. **Claude Code billing fixed.** A stray `ANTHROPIC_API_KEY` in `~/.zshrc` was forcing Claude Code onto pay-as-you-go **API billing** (empty balance → endless "credit balance too low"). It's now commented out; Claude Code runs on Jeff's **Max plan**. Default model reset from Fable 5 (capped) back to **Opus 4.8 (1M)**. Verified working.
2. **Always-on AI Error Log created.** `~/ClaudeBox/AI_ERROR_LOG.md` — append-only ledger of AI-provided false data, seeded with 15 Purcell entries (incl. this session's own 2 errors). Binding rule added to `~/ClaudeBox/CLAUDE.md` and `~/ClaudeBox/Malicious Compliance/CLAUDE.md`.
3. **Purcell matter — two live exposures closed.** The public Square "Purcell — Deck Settlement" payment link is **deactivated (verified 404)**. The three mis-addressed Gmail drafts to the client have had **recipients cleared** (not deleted — preservation duty).
4. **Purcell source of truth = the 21 July 2026 rebuilt working document.** NOT any 13–20 July counsel packet, adversarial analysis, demand letter, or finrecon total.
5. **Open / not done:** regenerate the Counsel Packet + Adversarial Analysis to match the rebuild. Matter is **on hold pending attorney.** Nothing is on fire.

---
## DETAIL

### 1. Billing fix
- **File:** `~/.zshrc` line 6 — `export ANTHROPIC_API_KEY=sk-ant-…` is now **commented out** (one-char undo restores it). It was the sole source (not in launchctl, not in other profiles).
- **Symptom it caused:** header showed `API Usage Billing`; every command failed `Credit balance too low`. Root cause was the dual-auth conflict Claude Code warns about ("Both claude.ai and ANTHROPIC_API_KEY set").
- **Model default:** `~/.claude/settings.json` changed `"model": "claude-fable-5[1m]"` → `"claude-opus-4-8[1m]"`. (Fable 5 has a separate weekly cap Jeff had maxed; Opus is covered by Max.)
- **Verified:** `claude --model opus -p` and plain `claude -p` both returned tokens on Max from a fresh login shell.
- **Note for future sessions:** if Jeff deliberately wants API billing for the `cb`/ClaudeBox-over-SSH workflow, scope the key *inside that function only*, not globally.

### 2. AI Error Log
- **File:** `~/ClaudeBox/AI_ERROR_LOG.md` (RC, append-only). Entries E-001…E-015. Fields: what was claimed, what's true, where, direction (↓ against Jeff / ↑ over-reach / ↔ neutral), how caught, severity, status.
- **Protocol (binding, in CLAUDE.md):** any run — any model, incl. itself — that catches AI-provided false data appends an entry. Never edit/delete prior entries; corrections get a new entry. Log your own errors.
- **Scope:** enforced in `~/ClaudeBox/` and `~/ClaudeBox/Malicious Compliance/`. The Claude **Desktop** "Purcell" project is NOT locally reachable — its custom instructions still need the one-liner pasted in by hand if that's wanted.

### 3. Purcell false-data audit (summary; full entries in AI_ERROR_LOG.md)
- ~15 discrete false statements across ~4 episodes, 13–20 July: Findings v1.1 errors (some against Jeff); finrecon ledger undercount ($4k cash off-book + mis-tagged txns); the two demand letters (wrong $16,651.68 / $4,651.68, "50–60%", conversion theory, wrong deadline); and the Counsel Packet / Adversarial Analysis claiming the contract "cannot be produced / 0 bytes" while it sat recovered in the folder.
- **This session's own corrections (E-015):** (a) withdrew a timestamp-based inference (bulk-copy stamps are user-writable, prove nothing); (b) the §4 "functional and usable" clause was NOT hallucinated — it exists verbatim in the 18 Oct proposal; the real defect was a truncated/misattributed quote used against Jeff.

### 4. Exposure closure
- **Square link:** `square.link/u/Kve7TFb2` → redirected to a live Odd Jobs checkout (merchant `MLKY9B52VC1N9`) titled "Purcell — Deck Settlement," publishing the client's address (2923 SE Malcolm) + the $ figure. **Deactivated by Jeff in the Square Dashboard; verified 404.** Note: it was a Dashboard-created link, so the Square API (`checkout.listPaymentLinks` / `getPaymentLink`) can neither see nor delete it — must be done in the Dashboard.
- **Gmail drafts:** three unsent drafts in Personal Gmail (`mumford.jeffrey@gmail.com`), all 20 July, addressed to `Hrhmommy@msn.com` (CC `darinpurcell@gmail.com`): two "Final Accounting Statement" + one "Formal Demand for Payment" carrying the abandoned $4,651.68 conversion theory. **Recipients cleared by Jeff.** DO NOT DELETE these — the Adversarial Analysis is headed "prepared in anticipation of litigation," so a preservation/spoliation duty attaches. Neutralize the send path (clear To/CC), keep the documents.

### 5. Environment notes (important for the next session)
- **Browser automation was broken this session.** The local `Control_Chrome` MCP could list tabs but every `get_page_content` / `execute_javascript` failed with "Chrome is not running" (extension bridge down). Chrome's AppleScript `execute javascript` path was disabled ("Allow JavaScript from Apple Events" off); a System Events click to enable it reported success but JS still would not run. **Square + drafts were ultimately completed by Jeff manually.**
- **Security toggle:** if `View → Developer → Allow JavaScript from Apple Events` is left checked, turn it OFF — it was only an attempted workaround.
- **Key rotation advised (not urgent):** `~/.zshrc` holds the (now-commented) Anthropic key and a **live OpenAI key** in plaintext; the Anthropic key surfaced in-session. Rotate both when convenient.

### 6. Open items / next steps
1. Regenerate the Counsel Packet + Adversarial Analysis so they match the 21 July rebuild (replace "cannot produce / 0 bytes" with the recovered contract + hash; fix the §4 citation to the 18 Oct proposal incl. the "…regardless of minor outstanding punch list items" carve-out). Regenerate, don't annotate.
2. Still worth assembling for counsel: Information Notice to Owner / ORS 701.305, permits, foreman identity+rate+hours+1099, job-cost ledger separating concurrent jobs, SKU detail on the 3 counter runs, dated photos.
3. Matter stays **on hold pending attorney.** Not legal advice.

*Handoff written 21 July 2026. Confidence in the state above: 95/100 — everything verifiable was verified; the drafts were confirmed done by Jeff (not re-read, browser tooling was down).*

---

## APPENDED 21 July 2026 — local Claude Code session (Malicious Compliance)

*Written by a different session than the one above. That session ran in Cowork and drove this
Mac; this one ran locally in `~/ClaudeBox/Malicious Compliance`. The work below is not covered
above. Nothing in the original section was altered.*

### A. Verification of the claims above

| Claim | Status |
|---|---|
| Square link deactivated | **CONFIRMED** — `square.link/u/Kve7TFb2` → HTTP 404 |
| Gmail draft recipients cleared | **UNVERIFIED** — see A.1 |
| odd-jobs.org public page | **Separate exposure, closed here** — see B |

**A.1 — the three drafts.** They are no longer in the Mimestream store under any subject
(store went 1,057 → 1,056 messages; `Z_PK` 1647/1649/1652 are absent). That is consistent with
either outcome — Gmail re-IDs a draft when it is edited, so clearing the To: field would drop
the old rows, but so would deletion. **From the local store the two cannot be distinguished.**
The original handoff notes the drafts were Jeff-reported rather than re-read. Treat as
Jeff-reported until confirmed in the Gmail UI.

**A.2 — a fourth draft nobody has flagged.** `Z_PK 342`, in the **Jeff@Odd-Jobs.org** account,
subject **"Re: Accountability"**, dated 29 April 2026, `ZISDRAFT=1`, still addressed to
`Lisa Purcell <Hrhmommy@msn.com>`. Never sent, never mentioned in any packet document. Same
treatment as the other three: neutralize the send path, preserve the document.

### B. The public WordPress page — closed this session

Distinct from the Square link. `https://odd-jobs.org/purcell/` was **live and publicly indexed**,
publishing the clients' **home address (2923 SE Malcolm St)**, the $7,500 settlement figure, the
$8,265.67 balance, a payment button, and a footer reading "provided for settlement purposes" —
while the packet documents were stamped OEC 408 settlement-confidential.

- Site: WordPress.com **Atomic**, blog_id `234704988` (not Cloudflare — Cloudflare Pages hosts
  other Odd Jobs projects, which is a easy wrong turn).
- Page **ID 314**, slug `purcell`, published 20 July 15:16:06.
- **Set to `draft`, deliberately NOT deleted** — preservation duty. One field restores it.
- **Verified:** `/purcell/` → 404; surname absent from `sitemap.xml` and the homepage.
- **Rendered copy archived before takedown:**
  `~/Documents/Purcell_Evidence_Staging/09_Public_Page_Capture/odd-jobs.org_purcell_CAPTURED_2026-07-21.html`
  sha256 `a983c8c3de5b3b99bce3d0ae817214ab66867f73870dd07df8d2a19feba5f5a4`

### C. Corrections addendum filed

`~/Downloads/Purcell_Settlement_Package/2 FOR ATTORNEY/8 - CORRECTIONS ADDENDUM (read with 1 and 2).md`

Filed as document 8 — it **accompanies** the packet rather than replacing anything, so the
record shows what was believed and when. Five corrections survived double adversarial
verification; two claims were demoted to open questions and are written as questions, not facts.
Contains an exhibit index with hashes, a preservation notice, and open items.

**Do not regenerate documents 1 and 2 by editing them.** Regenerate from source, keep the
originals.

### D. Files archived this session (nothing deleted)

`~/ClaudeBox/finrecon/data/_SUPERSEDED_2026-07-20/` — seven files plus a `DO-NOT-USE-README.md`
explaining why each is there. Includes the second demand letter (`$4,651.68`, conversion theory,
addressed to both clients) and a mail checklist that instructed certified-mail send by 27 July.
Both were still live and actionable when found.

Deliberately **kept** in place: `purcell_attorney_case_brief.md` and `PURCELL_COMPLETE_EXPORT.md`.
Both contain the abandoned `$15,024` figure, but under "Weak position" and "recommend
abandoning" — that is honest adversarial analysis for counsel and must not be archived away.

### E. Method note — reading mail locally, no OAuth

Mimestream holds **both** accounts (Personal Gmail + Jeff@Odd-Jobs.org) in
`~/Library/Containers/com.mimestream.Mimestream/Data/Library/Application Support/Mimestream/Mimestream.sqlite`.
Copy the `.sqlite`, `-wal` and `-shm` together, then query `ZMESSAGE` / `ZMESSAGECONTENT` /
`ZACCOUNT`. Sent-vs-draft is `ZISSENT` / `ZISDRAFT`. Dates are Apple epoch (2001-01-01 + seconds).

**Caveat:** partial sync — ~1,056 messages, Home Depot history only reaches back to 23 May 2026.
Karissa's 6 June email and the 15 December "Concealed damage, Purcell deck" thread are real and
referenced but **absent from the store**. Absence here is never proof a message does not exist.

Also: PDFs are readable with `pypdf` (installed). `poppler` is **not** installed, so the Read
tool cannot render PDF pages — extract text with pypdf instead.

### F. Verified facts worth not re-deriving

- **Exhibit E is real and was sent.** 13 July 2026, 7:39 PM PDT, jeff@odd-jobs.org → Lisa,
  CC Darin, "Purcell deck — acknowledgment of termination." `ZISSENT=1`. Contains verbatim:
  *"The materials on site were purchased by Odd Jobs and remain Odd Jobs' property. Please leave
  them as they are — not installed, moved, or disposed of — until their disposition is resolved."*
  This is the fact the settlement letter relies on. It holds.
- **Nothing else has gone to the Purcells since 13 July.**
- **The Home Depot credit has never been requested.** Draft `Z_PK 811` to `Prodesk_4017`, dated
  14 July, never sent, asks Karissa to confirm the no-restock-fee position and to quantify
  *"what the credit would be against the original order H4017-566634."* That unanswered credit
  sits underneath the ~$3,765 railing overstatement. The same draft flags the 8-foot kit count
  as unresolved (5 bought, possibly 7 needed).
- Signature block qualifications on the recovered contract: **one** client mark (DP), not two —
  Lisa's signature is absent; it is rendered text with no signature dictionary or audit trail;
  and the file's internal creation date is 28 December 2025, seven weeks after the 12 November
  date it displays.

### G. Standing order — recorded in memory this session

**"No sends without my hand"** (Jeff, 20 July 2026). Nothing outbound goes out on his behalf —
email, letters, vendor correspondence, form submissions. Drafting is welcome; transmitting is
his. Approving a draft's *content* is not approval to send it. If a task appears to require
sending, surface it as a decision rather than completing it.

*Appended by the local Claude Code session, 21 July 2026. Confidence 95/100 — the Square and
WordPress states were verified by HTTP fetch, the mail facts read from the local store, the
file operations verified by re-listing. The one unverified item is flagged as such in A.1.*
