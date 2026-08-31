# HANDOFF — Handled / Subcontractor module
**Written:** 2026-08-13 · **Scope:** Odd Jobs "Handled" Notion workspace, subs + dispatch + one Customers change
**State below was read live from Notion at write time, not from notes.** Do the same before you trust it.

---

## 1. Present state in one paragraph

The **Handled** page is the Odd Jobs command center in Notion (it was called "Odd Jobs HQ" until
sometime before 8/12 — same page, renamed). Its subcontractor module is two databases,
**Subcontractors** and **Assignments**. The roster is now **12 unique subs — 5 Active, 7 Inactive** —
all built from Jeff's iMessage history, his macOS Contacts, and the finrecon labor ledger. Rates are
set for 4 of them; 8 have none. There is exactly **one** assignment on record and it is closed and
paid. Nothing is scheduled. No automation sends anything.

---

## 2. System map (IDs you will need)

| Thing | ID |
|---|---|
| **Handled** page (parent, was "Odd Jobs HQ") | `37d3f802-1765-81b4-b041-e3633ddc0137` |
| **Subcontractors** DB | `83eeabd4-d2fe-4856-b60b-b27b117c199c` |
| Subcontractors data source | `collection://349ea925-e80f-45f5-86b9-38b6daa87451` |
| **Assignments** DB | `4ea165fa-7e0b-4633-abfd-9c7ded9daba2` |
| Assignments data source | `collection://08b685d7-1069-419a-ad6a-c0e8f44485ac` |
| **Customers** data source | `collection://c4afca3e-54c6-4dc3-8748-30d27ac95b56` |
| **Projects** data source (Assignments relates to it) | `collection://17df6f04-b62c-4268-9f84-7ce616002a74` |
| 🗓️ Dispatch Board view | `view://3af3f802-1765-81ad-96b5-000c879073f7` |
| 📅 Schedule view | `view://3af3f802-1765-8179-92ce-000c38c1a60c` |
| 💸 Payments Due view | `view://3af3f802-1765-8142-8ff5-000c845efd5c` |

An older page called **"Odd Jobs Command Center"** exists and is NOT the live one.

---

## 3. The roster — 12 unique subs (verified live 8/13)

### Active (5)

| Sub ID | Name | Trades | Rate | Phone | Email |
|---|---|---|---|---|---|
| 2 | **Jeff Girgich** | Carpentry, Deck, Handyman | **$25/hr** (confirmed 8/6) | 971-460-8581 | — |
| 10 | **Margaret Paxton ("Nebbie")** | Handyman, Landscaping | **Varies per job** — agree price each dispatch | 503-444-1461 | paxtonnebbie@gmail.com |
| 14 | **Jose Hernandez** | Landscaping, Handyman | Per job — he bids | 503-290-8572 | — |
| 15 | **Peter Gowans (Mold Masters)** | Mold Remediation, Handyman | **none set** | 503-380-1962 | pnwmoldmasters@gmail.com |
| 16 | **Drew Hainsworth (Mold Masters)** | Mold Remediation, Handyman | **none set** | 503-724-6496 | — |

### Inactive (7) — Purcell-era crew, flip to Active on re-engagement

| Sub ID | Name | Trades | Rate | Phone | Email |
|---|---|---|---|---|---|
| 3 | **Tanner Jackson ("TJ")** | Carpentry, Deck, Framing | $20/hr (written) | 505-309-6128 | — |
| 4 | **Matt Hinckley** | Carpentry, Deck, Concrete | **$30/hr** (set 8/6) | 503-307-2052 | matt_h85@hotmail.com |
| 5 | **Gibb Elliott** | Carpentry, Deck | none | 503-989-9926 | gibbelliott@gmail.com |
| 6 | **Tyler Carlson** | Concrete, Handyman | Per job | 503-312-2527 | ptcarlson3@gmail.com |
| 7 | **Steve Miller** | Carpentry, Deck, Handyman | $50/hr + $25/hr helper | 503-957-7479 | sd.miller827@gmail.com |
| 8 | **Audrey Parker** | Handyman | none | 719-210-1253 | astra.sub.one@gmail.com |
| 9 | **Amber Purkapile** | Handyman | none | 503-969-9647 | need.a.hand.asap@gmail.com |

**Per-person facts worth not rediscovering** (all also in each record's Notes):
- **Girgich** pays/paid via Cash App → log as `Paid Via: Other`. Second number 503-710-7003 (older thread).
  History: worked Dec '25–Jan '26, brief falling-out mid-Jan, re-engaged late Jul '26.
- **Nebbie** coordinates other labor (Jason, James, Terri referrals) and landscaping for Fairmont/Aldercrest.
  Her contact card is saved as just **"Nebbie."** $1,000 plant budget approved 8/1 (Josh & Molly / Fairmont).
- **Peter Gowans and Drew Hainsworth are BOTH vendor and subcontractor** depending on the job (Jeff, 8/13) —
  vendor when Odd Jobs hires Mold Masters for testing/remediation, sub when they work under Jeff.
  **Peter also sends work TO Jeff**, so the relationship is two-way; do not assume a dispatch.
  Their finrecon payments are **reimbursements, not labor rates** — do not infer a rate from them.
- **Steve Miller** deals in cash, no bank trail — keep his written invoices.
- **Amber Purkapile's** contact card reads **"Amber Purple"** — verified same person 8/6, OK to dispatch.
- **Drew Hainsworth's** card reads **"Andrew Hainsworth."**
- **TJ, Gibb, Steve Miller** were partly paid in cash on Purcell; absence from the bank ledger ≠ unpaid.

**Name collision, burned twice already:** **Margaret Paxton (Nebbie) is a SUB.**
**Margarete Herzen is a CLIENT** (Owner of the Aldercrest property, 650-722-1445). Both are "Margaret."

---

## 4. Schema changes made this session

| DB | Change |
|---|---|
| Subcontractors | `Trade / Skills` +**Landscaping** (green), +**Mold Remediation** (pink) → 17 options |
| Assignments | +**`Role`** select: **Subcontractor** (blue) / **Vendor** (purple) — for the Mold Masters dual role |
| Customers | +**`Payment Standing`** select: **Good** / **Slow Pay** / **Non-Payer** |

`Role` was added to the 🗓️ Dispatch Board display (after Subcontractor) and appears in the Default
table view. It is deliberately **not** on 📅 Schedule or 💸 Payments Due.

`Payment Standing` is deliberately **blank** for everyone except Jeanie Fugate — an unverified
"Good" is worse than an empty cell.

---

## 5. Assignments — current contents

**One record, closed:**
- **"Screen door install — Larysa & Mikel"**, Job scheduled 8/1/26, Girgich.
  Status **Completed**, Payment Status **Paid**, Pay **$60 / Per Job**, Amount Owed $60, Amount Paid $60,
  Balance Due $0, Paid Via **Other** (Cash App), Paid Date 8/6/26, Role **Subcontractor**.
  Scope carries the 1/8" trim detail and the client's phone (808-707-1112).

Nothing is scheduled. Nothing is owed. The three views are correct but effectively empty.

---

## 6. Customers — one change

**Jeanie Fugate** created 8/13 (she was not in the DB at all):
Type Customer · Lead Status Won · **Payment Standing: Non-Payer** · 503-740-9561 · Last Touch 6/6/26.

She asked Jeff to invoice **~$1,000** on 6/6/26 ($50 sliding door + $750 yardwork + $200 dump fee,
framed "from one charity to another") and never paid. **No invoice or estimate exists in Handled for
this job** — the only paper is her texts. Her May '26 texts also pressed about scrap-wood cleanup,
dump receipts, and a gate key.
⚠️ **Email unverified:** she typed `jeanfugate@gmail.com`; her contact card says `jeanfudgate@gmail.com`
(extra "d"). Confirm before sending anything.

---

## 7. Waiting on Jeff — one click

Page **"🗑️ Handled — 4 records to delete (Lance + 3 dupes)"** (`3bc3f802-1765-810e-b74d-c23b87132d90`)
sits under Handled holding four pulled records. **The Notion MCP cannot move pages to trash** — moving
them out of the database is as far as tooling goes. Deleting that page finishes it. Nothing links to
any of them.

---

## 8. Open items

1. **Set rates for Peter Gowans and Drew Hainsworth** before either is dispatched — both blank.
2. **Delete the holding page** (§7).
3. **Jeanie Fugate ~$1,000** — collections decision, and no invoice was ever raised.
4. **Google Calendar sync** for Confirmed assignments — discussed, never built.
5. **Automated offer/reminder sends** — the schema supports it (Send Via, Offer Sent At, Reminder Sent At);
   no automation exists. Any build must honor the standing order in §10.
6. Candidates deliberately **not** loaded, too thin for a record: **Jason** (prospective, no contact,
   never engaged), **Fabiana** 503-453-0345 (Jose's referral, no thread, no work), **Joel Fischer**
   ($7,265 across 31 payments but all 2015–17, no contact card), **Lee** (name only),
   **James** (coordinated by Nebbie 7/5), **Steve Miller's unnamed $25/hr helper**.
7. **Lance is NOT a sub** — neighbor who lends the mixer. Do not re-add.

---

## 9. Gotchas — things that cost time this session

- **Query the live DB before writing to it.** Another session wrote to Handled on 8/6. Working from a
  stale snapshot produced three duplicate sub records (AI_ERROR_LOG **E-090**).
- **Cross-data-source SQL is Enterprise-only.** `query_data_sources` with two `collection://` URLs
  returns a 400. Query one at a time.
- **The MCP cannot trash pages.** `update_data_source` has `in_trash` for data *sources*; there is no
  page equivalent. Move to a holding page and let Jeff delete.
- **`replace_content` refuses to orphan child pages** — include them as `<page url="..."/>` tags in the
  new content or pass `allow_deleting_content`. Good guard; do not defeat it casually.
- **`ALTER COLUMN ... SET MULTI_SELECT(...)` replaces the whole option list.** Re-list every existing
  option with its color or you will silently drop tags off other records.
- **New properties do not appear in views with an explicit column list** — add them per view.
- **`Balance Due` is a formula and is not queryable in SQL** (`notAvailableInQuerySql`).
- **The contacts MCP (`search_contacts`) times out.** Go straight to the AddressBook SQLite files:
  `~/Library/Application Support/AddressBook/Sources/*/AddressBook-v22.abcddb` — note there are
  **several** source DBs, so loop over all of them. Same for `chat.db` over the iMessage MCP for bulk work.
- **Searching texts for a name is noisy** — `LIKE '%Lance%'` matches "balance". Anchor your patterns.
- **Contact cards disagree with real names** in at least three cases (Nebbie, Amber Purple, Andrew/Drew).
- **finrecon `labor_payments`** (`~/ClaudeBox/finrecon/data/finrecon.db` — note `data/`, the top-level
  `finrecon.db` is empty) is the best source for "who has Jeff actually paid for labor." But payment
  memos read "Reimburse" for vendors, so a row there is not proof of a sub relationship.
- **finrecon and the Purcell record disagree on Nebbie** — the ledger shows 19 payments ≈ $3,565
  (Oct '25–Jul '26, two payee spellings); the frozen Purcell record counts 3 ($735) as Purcell-attributed.
  Both are right for their own purpose. **The Purcell record stays source of truth for Purcell.
  Do not reconcile them.**

---

## 10. Standing orders that bind this work

- **No sends without Jeff's hand** (7/20/26). Draft anything; transmit nothing. The `imsg` APPROVE flow
  is the only exception and only for that one queued draft.
- **Client texts must come from the work number 503-880-7433**, not Jeff's personal line (noted 8/5
  after a test text went out on the personal line). The Mac's Messages app still sends from personal.
- **Do not touch public pages on odd-jobs.org** without explicit instruction. The Bid Publisher runbook
  on the Handled page governs that, and it is explicit: only pages whose WP Page ID is recorded on an estimate.
- **AI_ERROR_LOG is binding** — `~/ClaudeBox/AI_ERROR_LOG.md`, append-only, log your own errors too.
  This session logged **E-089** (misfiled Lance as a sub) and **E-090** (three duplicate records).
- Voice: direct, practical, no fluff, **confidence index 0–100** on answers and estimates.
  Never comment on Jeff being tired or working late.

---

## 11. Where the durable notes live

- Memory: `~/.claude/projects/-Users-jeffmumfordmacmini-ClaudeBox-Malicious-Compliance/memory/handled-sub-module.md`
- Error ledger: `~/ClaudeBox/AI_ERROR_LOG.md`
- Purcell source of truth: `PROJECT RECORD AND ACCOUNTING — 23 July.md` (frozen; §6.2 is the crew roster)
