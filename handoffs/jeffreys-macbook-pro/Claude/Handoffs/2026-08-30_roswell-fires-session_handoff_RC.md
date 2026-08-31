# Handoff: Roswell terms, fire triage, tooling
**Version:** RC | **Date:** 2026-08-30 | **Supersedes:** none
**Canonical copy:** ~/Claude/Handoffs/2026-08-30_roswell-fires-session_handoff_RC.md

> There was also a personal/relationship thread in this session. It is CONFIDENTIAL, access-on-request only. It is NOT in this file by design. The handling rule and pointer live in memory at `/areas/kari-conditions.md`; source material is on Jeff's own machine. Do not surface, summarize, or carry it forward unless Jeff raises it himself.

---

## 1. Present State

**One-line status:** Nancy's attorney sent revised Roswell transfer terms (support cut 12 months to 6); a full fire triage was produced; several deliverables are drafted and unsent, waiting on Jeff.

**Done**
- Read and compared both versions of the Roswell ownership-transfer terms (original Aug 11 letter PDF vs the revised Aug 30 email).
- Produced a triaged board of ~11 real-world fires (money, security, legal, Roswell).
- Built a downsize timeline against the new 6-month clock.
- Drafted a non-committal reply to Nancy's attorney (unsent).

**In progress / drafted, unsent**
- Reply to attorney Elliott Dale (buys time, asks the one open question). Text is in the conversation, not yet saved to a file.

**Blocked / waiting on Jeff**
- Whether he has his own real estate attorney, or needs one. This gates the attorney reply going out.
- Payment decisions on every overdue account (see fires).
- The escrow start date (only the attorney can give it; Jeff must ask).
**Decided (do not re-litigate)**
- Do not reply to the attorney or confirm any terms in writing until Jeff has independent counsel. Why: Elliott Dale represents Nancy, not Jeff; a bargain-and-sale deed with escrow holdback has tax/title implications.
- Read the deed change (quitclaim to bargain-and-sale) as a mild improvement for Jeff, not a red flag. Why: an Oregon bargain-and-sale deed carries an implied covenant against grantor encumbrances; a quitclaim carries none.

**Assumptions in play**
- Escrow starts ~Sept 1, 2026 (original letter's date; the revision does not restate it). UNCONFIRMED and load-bearing.
- The ~$1,911/mo figure (incl. taxes+insurance) is the Roswell CMG payment per the letter; bills doc separately lists a CMG payment of $2,246.17 that may be a different loan. Reconcile before quoting.

---

## 2. Compacted Context

**The Roswell change, precisely.** Nancy's Aug 11 proposal (attorney Elliott P. Dale, PC; Nancy's POA is Jeff's uncle Patrick Todd) offered: quitclaim deed held in escrow, recorded after a 12-month escrow; ~$24,000 escrowed for 12 monthly CMG payments (~$1,911/mo) starting ~Sept 1, 2026; utilities paid through Dec 31, 2026; belongings out by ~Mar 1, 2027. The Aug 30 revision cut this to: bargain-and-sale deed, recorded after a 6-month escrow; 6 escrowed payments; utilities still through Dec 31, 2026; belongings still through Mar 1, 2027; framed as "we will proceed on this timeline" with no confirm-by date.

**The cliff this creates.** Utilities flip to Jeff Jan 1, 2027. Roswell mortgage fully on Jeff after ~6 payments (~Feb/Mar 2027). Belongings block full occupancy until Mar 1, 2027. The vise: finish Roswell reno (Jeff's target: October), move out of Malcolm and into Roswell, and sell or rent Malcolm, all before ~Feb 2027 or Jeff is carrying two mortgages on already-negative cash flow.

**Business context (from FinRecon on the Mini).** Odd Jobs went from ~+$6,101 net in 2024 to ~-$34,379 in 2025. Jeff's read: casualty-loss events are behind him; the business is in negative cash flow until he can get capacity back for standard handyman work, which is blocked until the fires are out.

**Do not redo**
- The 12-vs-6 month diff and the deed-type analysis. Captured above.
- The fire triage below. Captured.
- Reading both Roswell letters. Done.

**Watch-outs**
- Jeff's stated prefs: direct, practical, no coaching or lecturing, list assumptions, confidence index, no em dashes, ready-to-use output. He pushed back hard on a coaching tone this session.
- Bills state file (`~/ClaudeBox/BILLS_STATE_AND_HANDOFF.md`) is dated Aug 23, so its "due soon" items are now overdue. Re-verify before quoting deadlines.
---

## 3. The Fire Triage (carry forward)

Ranked by live clock or live adversary.

**Act now**
1. Home Depot Pro Xtra 8761 (Odd Jobs): was $5,006 balance / $1,419 min / due Aug 16 (passed), with a written hardship offer. No feed sees it. Action: Citi retail portal or 1-888-809-4207; take hardship terms if open.
2. USAA 9952: min $242 due Sep 2; was over-limit (killed overdraft backstop). Pay past the minimum.
3. Milwaukie utility $441.92 (acct 15-2070-07): autopay failing since May on dead Visa 7441. Delete card, re-enroll, pay.

**Bleeding**
4. OHSU medical: ~$280 (bills doc) plus a ~$1,475 past-due found in email. Set MyChart interest-free plan, do not lump-pay.
5. Legacy Health: possible double-pay ($60.54 autopay + separate $200/mo plan, acct 7201). Reconcile.
6. Planner5D $49.99/mo and spotlightsourcing workspace ~$8/mo: cancel both.

**Security (Jeff's own Mini triage flagged these)**
7. Covert-audit exposure live: dashboard on :8765, no token, bound to all interfaces, on the family box; bearer token for :7734 in cleartext in a transcript. Kill or bind to localhost; rotate the token.
8. Exposed API key, 34 days old: rotate.
9. Mini wide open: auto-login on, ARD/VNC open, AnyDesk unattended on 7070. Needs Jeff's admin password.

**Legal**
10. Purcell: Aug 10 deadline passed 20 days ago, no activity since Jul 25. Status unknown. Find out if closed or stalled.

**Root**
11. Roswell: the fire under the fires. Clearing it turns the cash flow and returns Jeff's billable hours. Section 2 has the terms and timeline.

---

## 4. Tooling notes (this environment had many broken tools)

- **Filesystem MCP** (`mcp__remote-devices__Filesystem__*`): broken all session (schema draft-07 error). Do not rely on it.
- **device_bash**: failed repeatedly. Flaky.
- **Desktop Commander** (`mcp__remote-devices__Desktop_Commander__*`): installed mid-session and works. Use for file reads/writes, searches, and `start_process` (ssh to the Mini works key-only via `ssh mini`).
- **Chrome via `mcp__remote-devices__Control_Chrome__*`**: works, and reads local files via `file://` URLs. Reliable fallback for reading Mac files.
- **Mimestream**: rejects synthetic clicks/keys. Jeff must drive it; read via screenshot only.
- **Google Workspace docs (jeff@odd-jobs.org)**: require a real Google sign-in only Jeff can complete; returned Access Denied. Drive connector is bound to the personal account only, cannot see Workspace docs.
- **chat.db extraction gotchas**: text lives in `attributedBody` blob not `text` (NULL on modern macOS); `strftime('%s',...)` returns a string and `number > string` is always false in sqlite (silent zero rows), so do date math in Python; get both directions via 1:1 chats through `chat_handle_join` (outgoing messages have handle_id 0). The Mini's Messages DB is stale; the MacBook's is current.
---

## 5. Phased Pickup Plan

### Phase 1: Attorney reply + counsel 🟢
- Confirm whether Jeff has his own real estate attorney. If not, that is the first action.
- Once counsel is lined up, finalize and (with Jeff's yes) send the drafted reply to Elliott Dale asking the escrow start date. Draft is in the conversation; regenerate it.
- **Done when:** reply is sent or explicitly held, and the escrow start-date question is out.

### Phase 2: Money fires 🟢
- Work the "Act now" three (Home Depot, USAA, Milwaukie). Jeff makes payment calls; Claude can pull exact balances via the Citi/USAA portals (Jeff authenticates) or draft the reasoning.
- **Done when:** each of the three has a decision and an action taken or scheduled.

### Phase 3: Downsize timeline as a working doc 🟡
- Turn Section 2's timeline into a doc Jeff and Laura can work: cliff dates, a Malcolm sell-vs-rent decision, checkpoints against October.
- **Done when:** a dated timeline with the Feb 2027 cliff and a Malcolm decision checklist exists.

### Phase 4: Security hardening 🟡 (needs Jeff at the Mini)
- Kill/rebind the :8765 dashboard, rotate the burned token and the API key, and (with his password) close auto-login/ARD/AnyDesk.
- **Done when:** the exposed dashboard is off the LAN and both tokens are rotated.

**Stop conditions:** stop and check in if the escrow terms need a signature (counsel's call, not Claude's); if Purcell turns out to have money or a live counterparty; or if Jeff shifts to the confidential personal thread (governed by the memory handling rule, not this plan).

---

## 6. Startup Prompt

```
Pick up the Roswell/fires handoff. Read the attached handoff file (or
~/Claude/Handoffs/2026-08-30_roswell-fires-session_handoff_RC.md) and nothing else yet.
Carry the assumptions forward, ask me only what blocks Phase 1, then start Phase 1 and
report back. Don't redo anything on the "Do not redo" list, and leave the confidential
thread alone unless I raise it. Usual rules: direct, practical, list assumptions,
confidence index, no coaching.
```

---

**Confidence index:** 88/100 that a fresh session can pick up the Roswell and fires work cleanly. The gaps: the escrow start date is unconfirmed, and whether Jeff has his own attorney is unknown, both surfaced as Phase 1.