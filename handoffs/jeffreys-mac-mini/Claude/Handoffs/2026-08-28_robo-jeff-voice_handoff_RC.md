# Handoff: Robo Jeff (Jeff voice modeling)

**Version:** RC | **Date:** 2026-08-28 | **Generated from:** Claude Code CLI session (Mac mini)
**Supersedes:** none (first handoff)
**Canonical copy:** ~/Claude/Handoffs/2026-08-28_robo-jeff-voice_handoff_RC.md

---

## 1. Present State

**One-line status:** The voice document is built, tested and shipped; two reference docs and four published artifacts exist, all committed and pushed. The remaining work is Jeff sharing the artifacts and a handful of untested registers.

**Done**
- `~/ClaudeBox/JEFF_VOICE.md` (the analysis: provenance, corpus, corrections log, ~740 lines)
- `~/ClaudeBox/JEFF_VOICE_COWORK.md` (the standalone, 518 lines, self-contained, drops into any Project)
- Four published artifacts (URLs in the files table below), all private
- Ten distilled intel files, `/Volumes/ClaudeData/intel/distilled/2026-08-14.md` through `2026-08-23.md`, clearing a nine-day blocked backlog
- imsg afterhours auto-reply rule fixed and tested (14/14 cases), committed in the `imsg` repo
- imsg queue cleared: draft 190 approved and sent to Rusty, 43 others rejected
- Repo hygiene: `__pycache__` untracked in imsg, `.env` ignored in mumford-week-plan and campingteam-site, `.wrangler` untracked in campingteam-site
- Bare remotes created on ClaudeData for `imsg` and `campingteam-site`
- `~/ClaudeBox/scripts/next-error-id.sh` shipped (AI_ERROR_LOG had 14 duplicate IDs; E-101 indexes them)

**In progress**
- Nothing. Every thread reached a stopping point.

**Blocked / waiting on Jeff**
- **All four artifacts are private.** Rusty already received a text (sent 2026-08-23 10:49) containing the deck URL. It 404s for him until Jeff shares it.
- Both decks need **write** access, not view-only, or their capture boxes reject and fall back to a copy button.
- Share to the person, not as a public link: the files-form publish rejects `capability_disabled` on publicly shared artifacts.

**Decided (do not re-litigate)**
- **Email cutoff 2026-02-22.** Jeff was not using AI for email before then, so all sent mail on/after that date is excluded from the voice corpus. Rejected: artifact-by-artifact adjudication, because two of three of my "AI tells" turned out to be false.
- **Version numbers are public fiction.** Jeff told Rusty he is on v1.7. The deck's build log runs v1.0-v1.7 with 1.4-1.7 stamped SECRET. The Trials page renumbers the four real builds to 1.0 / 1.3 / 1.6 / 1.7 and invents nothing. Real commit history is in `~/ClaudeBox/_voice-tests/VERSION_HISTORY.md`.
- **Voice memos deferred.** Reassessed as largely redundant for a written-voice doc: his phone already transcribed the spoken register 1,604 times. Path recorded in JEFF_VOICE.md section 11 if it is ever wanted.
- **Em dashes are a hard zero**, one carve-out only (a `Name —` address atop a longer note). A rate guideline of "~1%" demonstrably failed to suppress them.
- **The personal lane is "With you", never "Her voice".** The document describes how Jeff writes TO people, never the people.
- **imsg live auto-respond stays off.** Only the shadow path was changed.

**Assumptions in play**
- The public version scheme (1.0-1.7) stays as-is unless Jeff renumbers again (confirmed by Jeff)
- Kari has not yet answered her intake choice; her board says there is no deadline (unconfirmed, open since July)
- `HANDOFF.md` in the imsg repo belongs to another session; it was swept into a commit of mine by accident and left tracked (unconfirmed)

**Open questions for Jeff**
1. Should `~/ClaudeBox/CLAUDE.md`'s binding AI ERROR LOG section name `scripts/next-error-id.sh`? Matters because the ID-collision defect was logged once on 11 Aug and recurred for twelve days, since a note inside the ledger is not read before the next append. Not edited unilaterally because that file carries standing orders.
2. `/Volumes/ClaudeData/archives/` is 30G (TPB) + 1.9G (mini-offload-20260811) with no backup and no second copy. Cover it, or accept the risk?
3. Scrub the Cloudflare account_id from campingteam-site's history, or leave it? It is an identifier not a credential, and that repo's only remote is the bare copy on ClaudeData.

---

## 2. Compacted Context

**Goal, and why it matters**
Build a document that lets Claude draft in Jeff's voice accurately enough that he can say "make this sound like I wrote it" and send the result. Both halves matter: sounding like him, and not inventing facts. His register is confident and specific, which makes a fabricated price or date read as true.

**Key facts and numbers**
- Corpus: 1,604 Jeff-authored iMessages (tapbacks stripped), 979 prompts to Claude, ~20 Apple Notes, ~35 sent-mail bodies out of a **3,533-message** Sent folder
- Mechanics: median 6 words; 49% are 5 words or fewer; 81% are 12 or fewer; **86% end without terminal punctuation**; 38% end in a trailing space; em dashes in ~1% of messages; **zero ellipses ever**; profanity in 2-7% of messages and it tracks **intimacy, not intensity**
- Text corpus verified 100% clean: all 211 `send_ok` events in imsg audit went to Jeff's own self-thread, zero to third parties (before draft 190)
- Test results at v1.7: **5 of 6 exact matches** on held-out emails; 0/6 at both v1.0 and v1.3
- Odd Jobs terms carried in the standalone: $128/hr standard, $99 friends/family, $149 drain/toilet, 2-hour minimum, materials +30%, 50% deposit over $1,000, Mon-Fri 8am-4pm, weekends 2x, work line 503-880-7433

**The finding that made it work:** the voice is stable across 14 years and a career change (2022 Hog Wild sales manager to 2026 handyman). The escalate-then-translate joke, truth-over-comfort, the specific excuse, and never letting the other person be the one who failed are all present at both ends.

**Files, links, and where things live**

| Item | Location | State |
|---|---|---|
| Analysis doc | `~/ClaudeBox/JEFF_VOICE.md` | final |
| Standalone doc | `~/ClaudeBox/JEFF_VOICE_COWORK.md` | final |
| Version history (unredacted) | `~/ClaudeBox/_voice-tests/VERSION_HISTORY.md` | final |
| Test run 1 | `~/ClaudeBox/_voice-tests/VERSION_TEST_2026-08-23.md` | final |
| Test run 2 | `~/ClaudeBox/_voice-tests/VERSION_TEST_2026-08-23_run2.md` | final |
| Three long-form drafts | `~/ClaudeBox/_voice-tests/LONGFORM_DRAFTS_2026-08-23.md` | draft, six blanks left unfilled on purpose |
| Rusty's deck | https://claude.ai/code/artifact/6e1b97f5-d579-4676-856c-361143cf322c | published, **private** |
| Kari's deck | https://claude.ai/code/artifact/24ce3854-3331-4581-b388-8999e5bdc948 | published, **private** |
| Kari's Board (arbiter page) | https://claude.ai/code/artifact/c53ed3aa-e356-4c4d-bba7-caf3f6527e08 | published, **private** |
| Robo Jeff Trials | https://claude.ai/code/artifact/59478c83-7a3c-47b1-ae07-ebbc88c2261f | published, **private** |
| Artifact sources | `~/ClaudeBox/_voice-tests/*.html` | final, republish same path to update same URL |
| Distilled intel | `/Volumes/ClaudeData/intel/distilled/2026-08-14.md` .. `2026-08-23.md` | final |
| Error-log helper | `~/ClaudeBox/scripts/next-error-id.sh` | final |

**Tools and connectors used**
- Gmail connector (`mcp__ef64b5a0-...`): dropped mid-session once and needed Jeff to reconnect. **`resultCountEstimate` returns a constant 201 for every query. It is not a count.** `larger:` measures total message size including attachments, so it finds deliverables not prose.
- Apple Notes MCP: two notes exceeded the output buffer (`Jeff needs:` at 83k chars, `Empire of Dirt`). Read them in chunks or skip.
- Artifact tool: capture boxes use the files-form `publish`, which rejects `capability_disabled` on publicly-shared artifacts and for read-only viewers.
- imsg CLI at `~/ClaudeBox/imsg/imsg`: verbs are `drafts`, `approve <id>`, `reject <id>`. **Drafts live in `state/drafts/`, not `drafts/`.**

**Do not redo**
- The arc mining. Five narrative arcs are already read and written up: Yakima (Director-OEM, Aug 2023-Jan 2024), Percipio/Sarah Brown, Blake Farley, Bob's Red Mill, 2022 Hog Wild. Their findings are in both docs.
- The two test runs. Six held-out emails scored, both files committed.
- The imsg queue triage. 43 drafts rejected, one sent.
- The repo hygiene sweep. All six nested repos checked; only imsg and campingteam-site had drift, both fixed.
- The Time Machine check. ClaudeData is excluded, deliberately for `intel/` (Covenant Gate 5 makes TM the wrong tool), incidentally for everything else.

**Watch-outs**
- **The session date in context was wrong.** Context said 2026-08-24; the machine clock said 2026-08-28. Run `date` before dating anything. This is a logged error class (E-094).
- **Never send.** Standing order 7/20/26: drafting is welcome, transmitting is Jeff's. The only exception is the imsg `APPROVE <id>` path, and that is his hand, not Claude's.
- **Voice Law.** Never comment on Jeff being tired, working late, or needing rest unless he asks. No wellness sign-offs anywhere.
- **AI_ERROR_LOG is append-only.** Never edit or renumber a prior entry. Corrections get a new entry. Run `scripts/next-error-id.sh` before appending.
- **Never `git add -A` in ~/ClaudeBox.** Several sessions write it at once. I violated this in the imsg repo and swept another session's `HANDOFF.md` into an unrelated commit.
- **Five of my own errors are logged this session** (E-092 through E-095, E-101). The common root, now written into the ledger: **scope every claim to the evidence that produced it.** A pattern found in texting is a claim about texting.
- Jeff corrected me twice on substance: "a large share of your sent mail is machine-written" (false, built on one artifact) and labelling the personal lane "Her voice" (inverts the doc's core boundary).

---

## 3. Phased Pickup Plan

### Phase 1: Confirm state and close the sharing gap 🟢
- **Goal:** Establish that nothing regressed, and get the artifacts usable by their intended readers.
- **Steps:**
  1. `cd ~/ClaudeBox && git status --short && git log --oneline -5` to confirm a clean tree.
  2. Ask Jeff whether he has shared the two decks yet, and whether Rusty's link worked.
  3. If not shared, remind him: share to the person (not a public link), with write access.
- **Needs from Jeff:** confirmation on sharing status.
- **Done when:** tree is clean and Jeff has confirmed the share state of both decks.

### Phase 2: Answer the three open questions 🟢
- **Goal:** Close the decisions left hanging.
- **Steps:** Put questions 1-3 from section 1 to Jeff. If he says yes to the CLAUDE.md edit, add one line naming `scripts/next-error-id.sh` in the AI ERROR LOG section. If he wants `archives/` covered, propose adding it to Time Machine specifically (never un-exclude the whole volume, that would sweep `intel/` back in and break Covenant Gate 5) or an rsync to ClaudeBoxSSD.
- **Needs from Jeff:** answers to the three questions.
- **Done when:** each of the three has a decision recorded, and any agreed edit is committed.

### Phase 3: Close the three live obligations from the rejected queue 🟢
- **Goal:** The drafts were rejected but the underlying asks were not answered.
- **Steps:** Draft (do not send) replies for: (a) Sunshine closed **Friday 2026-08-28**, Laura asked if Jeff would take the kids, note this date has now arrived or passed; (b) a bid sent to Laura's email around 2026-08-11 that was never picked up; (c) the expectation-setting thread with Laura about provisional plans. Queue via `imsg draft <contact> <text>` if he wants them in the approval path.
- **Needs from Jeff:** whether these are still live, given the Sunshine date has passed.
- **Done when:** each of the three is either drafted and queued, or confirmed dead.

### Phase 4: Test the untested registers 🟡
- **Goal:** The document is proven only on the short transactional register. Long form and the personal lane were never scored.
- **Steps:** Find held-out ground truth for long-form (scarce: most long emails with real prose bodies are already quoted in the doc, and attachment-only emails are a trap). Score the PER lane against real reply pairs from the text corpus (70 candidate pairs were extracted to a scratchpad that is now gone; regenerate from `/Volumes/ClaudeData/intel/raw/*-messages.jsonl`). Write results as a run-3 file alongside the other two.
- **Needs from Jeff:** a go-ahead, and a call on whether personal-register test cases may appear in a shareable artifact or stay local (Covenant consent gate).
- **Done when:** a run-3 test file exists with at least three long-form and three personal cases scored, and both docs updated with anything learned.
- **Cost note:** moderate. Several rounds of Gmail search plus corpus reprocessing.

### Phase 5: Mine further into the Sent folder 🟡
- **Goal:** Long-form rests on ~35 read bodies out of 3,533. It is the thinnest evidence base in the doc.
- **Steps:** Continue pre-cutoff (before 2026-02-22) sent mail. Untouched seams: the 2024 job-hunt correspondence beyond Yakima, the Tolle/DHS guardianship thread, the Purcell deck letters, and family correspondence. Use `-has:attachment` and read snippets to spot empty shells before fetching bodies.
- **Needs from Jeff:** a go-ahead.
- **Done when:** at least ten new bodies read and any new register or move written into both docs with its evidence quoted.
- **Cost note:** moderate. Each search page is large.

**Stop conditions:** Stop and check in if (a) any request would put family names or personal content into a shareable artifact, (b) anything would send a message rather than draft it, (c) a proposed change would edit `~/ClaudeBox/CLAUDE.md`, `COVENANT.md`, or a prior AI_ERROR_LOG entry, (d) a claim is about to be stated as a quantity without a measurement behind it.

---

## 4. Startup Prompt

Paste this as the first message of the new session, with this file attached or the path filled in:

```
Pick up the Robo Jeff voice handoff. Read ~/Claude/Handoffs/2026-08-28_robo-jeff-voice_handoff_RC.md and nothing else yet. Carry the assumptions forward, ask me only what actually blocks Phase 1, then start Phase 1 and report back when it's done. Don't redo anything on the "Do not redo" list. Usual rules: direct, practical, list assumptions, confidence index.
```

---

**Confidence index:** 88/100 that a fresh session can pick this up without asking anything beyond the open questions. Uncertain: whether the three queue obligations in Phase 3 are still live (the Sunshine date has now passed), and whether Jeff has shared the artifacts since this session ended.
