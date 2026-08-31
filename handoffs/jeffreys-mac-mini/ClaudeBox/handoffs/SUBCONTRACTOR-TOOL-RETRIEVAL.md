# Subcontractor Tool — FOUND & RETRIEVED (2026-08-01)

**TL;DR:** Retrieved, same day. The "subcontractor management tool" is **Notion-native** — no code files ever existed in the mumford cloud sessions. It's the **"Handled" sub-management module**: two Notion databases + three views living in Jeff's own Notion workspace (which was never locked inside any Claude account). Full schema, IDs, and current state captured below and committed to the Handled repo's CLAUDE.md (`nightly` @ `6f9fd80`). Nothing needed to be pushed or pasted from the mumford account.

---

## What it actually is

The Notion page **"Handled"** (formerly "Odd Jobs HQ", page ID `37d3f802-1765-81b4-b041-e3633ddc0137`) is the whole business command center — leads, customers, estimates, invoices, projects, price book — renamed 2026-08-01. The sub system is a section on it: **"Sub Scheduling & Payments."**

⚠️ **Name collision, intentional:** "Handled" = the Notion command center **and** the Django app (`JohnsManville/handled`, Mini `~/ClaudeBox/handoff-clone`, MBP `~/ClaudeBox/handled`). The app deliberately excludes scheduling/dispatch (six-steps-only rule) — that's *why* the sub system lives in Notion. The Django app was never missing; only this Notion context was.

### Databases (children of the Handled page)

| DB | ID | Collection |
|---|---|---|
| **Subcontractors** | `83eeabd4-d2fe-4856-b60b-b27b117c199c` | `collection://349ea925-e80f-45f5-86b9-38b6daa87451` |
| **Assignments** | `4ea165fa-7e0b-4633-abfd-9c7ded9daba2` | `collection://08b685d7-1069-419a-ad6a-c0e8f44485ac` |

- **Subcontractors:** Name, Trade/Skills (multi-select), Rate + Rate Basis (Hourly/Daily/Per Job), Status (Active/Inactive/Do Not Use), Phone, Email, Preferred Contact (Text/Email/Call), Notes, auto-increment Sub ID, relation → Assignments.
- **Assignments:** Status (Draft → Offered → Accepted → Declined → Reminder Sent → Confirmed → Completed → No-show → Canceled), Scheduled date, Scope, Location, Pay + Pay Basis, Send Via (Email/Text), timestamps (Offer Sent / Response / Reminder / Confirmed), Job Code, relations → Subcontractor and → Project (singular). **Payment tracking:** Payment Status (Not Due/Due/Partial/Paid/Disputed), Amount Owed, Amount Paid, Balance Due (formula), Paid Date, Paid Via (Check/Cash/Venmo/Zelle/Card/Other), Sub Invoice Received ✓.
- **Views** (on the Assignments DB and embedded on the Handled page): 📅 Schedule (calendar by Scheduled), 🗓️ Dispatch Board (board by Status), 💸 Payments Due (table, Payment Status ≠ Paid/Not Due).

Links: [Handled page](https://www.notion.so/37d3f802176581b4b041e3633ddc0137) · [Subcontractors](https://www.notion.so/83eeabd4d2fe4856b60bb27b117c199c) · [Assignments](https://www.notion.so/4ea165fa7e0b4633abfd9c7ded9daba2)

### Roster state (as of 2026-08-01 evening — verified live during the TEST delete)

**Nine subs live:**
1. **Jeff Girgich** — Active. $25/hr (Jan invoice math, 7 months old — confirm). Carpentry/Deck/General. 971-460-8581 (old: 503-710-7003), Preferred = Text, pays via Cash App → "Other". Notes hold the Jan falling-out + Jul re-engagement and pending Malcolm bathroom estimate.
2. **Tanner Jackson (TJ)** — Inactive (arrangement ended 2/9/26). $20/hr (timesheet-sourced). Carpentry/Deck/Framing. 505-309-6128, Text. Notes carry two open Purcell payment items: unsettled 5-hr 12/12/25 row; 1/9–1/10 payday ~$1,050 computed but not documented paid.
3–9. **Nebbie, Steve Miller, Matt Hinckley, Tyler Carlson, Amber Purkapile, Audrey Parker, Gibb Elliott** — loaded mumford-side 8/1 (details in the Notion records).

**TEST records: DELETED 2026-08-01** — "TEST — Sample Sub (safe to delete)" + "TEST — Deck framing (safe to delete)", moved to Notion trash (recoverable 30 days) by the mumford cowork session, driven from the kari side; the empty "🗄️ Handled — TEST records" holding page trashed as follow-up. Post-delete check confirmed Girgich, TJ, and the live assignment untouched.

**Live assignment:** "Screen door install — Larysa & Mikel," Confirmed, 2026-08-01, assigned Girgich, **Pay left blank** (never discussed in the thread — set before he invoices), Location approximate.

**Bonus artifact:** "Handled dashboard" (HTML, RC) in the mumford artifact gallery — a branded snapshot dashboard over the Notion backend ($6.9k pipeline, overdue invoice, hot leads); say "refresh the Handled dashboard" in that cowork session to re-pull.

### Open items (from the sessions)

- Load remaining real subs; delete the two TEST records after.
- Set Pay on the Girgich screen-door assignment.
- Parked: Google Calendar sync for Confirmed; automated offer/reminder sends (schema supports, nothing built; any send automation runs through Jeff's no-sends standing order).

## Where the sessions live (mumford.jeffrey@gmail.com)

- claude.ai **Code** session "Set up Handled subcontractor management system" (`session_01FfWMV6Ydd1jw9zPr1wvhxw`) — schema verified live against Notion, loaded Girgich + TJ.
- claude.ai **Cowork** project "Handled" → session "Subcontractor management updates" (`cse_016Wzxknok9Enm7yHf3zsxvT`) — renamed the page to Handled, wrote the CLAUDE.md block.
- Chrome on the MBP is logged into that account, so the transcripts are readable any time.

## What was done today (kari side)

- Full context committed to the Handled repo: `CLAUDE.md` on `nightly` @ `6f9fd80`, pushed to GitHub; Mini syncs at 4:30am.
- Saved to Claude Code memory (kari account) so every future session knows.
- **Notion MCP (kari side):** server config is in place at user scope (`~/.claude.json` → `notion` @ `https://mcp.notion.com/mcp`). Only the one-time OAuth grant remains — a task chip ("Authenticate Notion MCP and verify Handled access") is queued; clicking it triggers the browser approval and then verifies both DBs read back correctly. Until that click, kari-side sessions can't touch the Notion DBs.
