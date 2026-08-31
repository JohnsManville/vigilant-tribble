# FinRecon — Remote Access & Input Runbook (RC)

**Written:** 2026-08-12 · Claude Code on **jeffreys-macbook-pro** (Mac14,7)
**Purpose:** fill the blank Notion page tagged `RUNBOOK — do not archive`, and unblock
Roswell **Deliverable G**.
**Status:** schema determined with certainty from source. One field has no home — see §6.

---

## 1. First correction: FinRecon is not where the handoff says it is

The Roswell handoff (§5) states FinRecon is *"a local CLI project living in
`~/.claude/projects`"*, citing the Notion page **"CLI · FinRecon — 7 sessions, 37.3 MB."**

That Notion page is measuring **Claude session transcripts about FinRecon**, not the tool.
`~/.claude/projects` on this Mac holds exactly one directory (`-Users-jeffmumford-Documents`,
81 MB of `.jsonl` conversation logs). There is no FinRecon project in it, on this machine or
on the Mini.

**FinRecon is a real Python package:**

| | |
|---|---|
| Repo | `~/ClaudeBox/finrecon` (git, has `.githooks`) |
| Package | `src/finrecon/` — importers, reconcile, documents, db, web |
| Entry point | `finrecon = "finrecon.cli:app"` (Typer) via `pyproject.toml` |
| Venv | `~/ClaudeBox/finrecon/.venv` |
| **Live DB** | `~/ClaudeBox/finrecon/data/finrecon.db` |
| Decoy | `~/ClaudeBox/finrecon/finrecon.db` — **0 bytes, ignore it** |
| Backups | `data/backups/` (14+ dated snapshots) |

**Live contents as of 2026-08-12:** 7,539 transactions · 242 documents · 16 accounts ·
81 labor payments · 2014-03-06 → 2026-07-22.

Do not treat this as a scratch project. It is the system of record behind the 2024/2025
Schedule C.

---

## 2. Commands

> ### ✅ FIXED 2026-08-12 — on the Mini, `finrecon` now means the real CLI
>
> It previously aliased a **different tool**. `~/.zshrc` line 9 was:
>
> ```
> alias finrecon='PYTHONIOENCODING=utf-8 python3 ~/ClaudeBox/finrecon-analyzer.py'
> ```
>
> **zsh aliases take precedence over PATH**, so `source .venv/bin/activate` did not help. Typing
> `finrecon sync --setup <token>` launched the **FinRecon Analyzer** REPL — a separate
> Claude/ChatGPT query tool — which ignored the arguments and sat at a `Query:` prompt. It looked
> like it worked. Nothing happened, and it burned a SimpleFIN setup attempt.
>
> Now on the Mini:
>
> | Command | Runs |
> |---|---|
> | **`finrecon`** | the real CLI, as a **shell function** (see below) |
> | `finrecon-ai` | the Claude/ChatGPT analyzer REPL (its former name) |
> | `fra` | same analyzer, short form |
>
> ```zsh
> finrecon() { ( cd /Users/jeffmumfordmacmini/ClaudeBox/finrecon && ./.venv/bin/finrecon "$@" ) }
> ```
>
> ### 🔴 Why a function and not an alias — FinRecon's paths are CWD-relative
>
> A plain alias to the absolute binary path was tried first and **caused a second, subtler
> failure**: FinRecon resolves several paths against the **current working directory**, not the
> project root —
>
> ```python
> MAP_PATH = Path("data/simplefin_map.json")   # sync.py:52
> ```
>
> …plus `data/incoming/<slug>/` and the default `--db`. Running `finrecon sync --list` from `~`
> looked for `~/data/simplefin_map.json`, found nothing, and reported **every account UNMAPPED**
> even though the map was correctly written. No error, no warning — just a wrong answer that
> looks like a mapping problem.
>
> The function `cd`s into the project **in a subshell**, so the paths resolve and the caller's
> working directory is untouched. Verified: `finrecon status` from `~` lists all 16 accounts, and
> `cd /tmp && finrecon --help; pwd` still prints `/tmp`.
>
> ⚠️ **Caveat:** bare relative file arguments now resolve against the project dir. Use absolute
> paths — a leading `~` is expanded by the shell before the function body runs, so `finrecon
> import ~/Downloads/x.csv` is fine; `finrecon import ./x.csv` is not.
>
> `zsh -n ~/.zshrc` clean. Backups: `~/.zshrc.bak-20260812-alias`, `~/.zshrc.bak-20260812-fn`.
>
> **The MacBook Pro deliberately has no such alias** — it is the read-only replica, and a
> convenience shortcut there invites exactly the accidental writes the replica marker forbids.
> Call the binary by path if you need it for a read.
>
> The **launchd jobs were never affected** — `.zshrc` aliases only load in interactive shells,
> and `scripts/simplefin-sync.sh` calls the real CLI directly.

```bash
cd ~/ClaudeBox/finrecon && source .venv/bin/activate   # MacBook Pro only
```

`init` · `import` · `rollback-batch` · `backup` · `inspect` · `transfers` · `categorize`
· `classify` · `unclassify` · `review` · `checkpoint` · `status` · `sync` · `serve`

Always snapshot before writing:

```bash
finrecon backup
```

---

## 3. Lane A — bank & card transactions (`finrecon import`)

Only for feeds from a **registered institution importer**. Not the lane for a project
cost ledger.

```bash
finrecon import <file-or-folder> --account <slug> [--importer <name>]
```

- Registry: `venmo`, `cashapp`, `ofx`, `usaa-card`, plus USAA/Citi statement,
  Home Depot, Lowe's, QBO, SimpleFIN importers.
- Walk-filter suffixes: `.csv` `.ofx` `.qfx` `.json`. An explicit file path bypasses the filter.
- Account slug defaults to the **parent directory name** — lay files out as
  `data/incoming/<account-slug>/file.csv`.
- **Parse by name, never position.** A missing required column raises `HeaderDriftError`
  and imports nothing.
- **Fail loudly.** Unknown enum value → `UnknownValueError`. Nothing is skipped or guessed.
- Idempotent on `UNIQUE(account_id, source_txn_id)`. Re-running a file is a no-op.
- Diagnose before trusting: `finrecon inspect <importer> <file>` — no DB, no account.

**Amounts are integer cents. Positive = money in.** (`DECISIONS.md` §4.)

The 16 account slugs: `amex-41009` `amex-81000` `cashapp` `chase-checking-0922`
`chase-prime-2586` `chase-united-5925` `citi-costco-3425` `hd-proxtra-8761`
`lowes-commercial` `qb-checking-6210` `usaa-checking-1923` `usaa-savings-1696`
`usaa-savings-1915` `usaa-visa-2188` `usaa-visa-9952` `venmo-personal`

---

## 4. Lane B — receipts & paperwork (`documents`) ← **this is Deliverable G's lane**

The Roswell financial dataset is a **document/receipt ledger**, not a bank feed. It belongs
in the `documents` table.

**There is no `finrecon documents` CLI subcommand.** Ingestion is through the web app
(`finrecon serve`) or by calling `finrecon.documents.store` directly:

| function | does |
|---|---|
| `ingest(conn, path, *, docs_root, ...)` | hash → copy into content-addressed store → insert. `file_sha256` is UNIQUE, so re-ingesting returns the existing doc instead of duplicating |
| `set_fields(conn, doc_id, **fields)` | fill extracted fields. **Unknown keys fail loud** — a typo cannot silently no-op. Editing a verified doc reopens it to review |
| `link_transaction(conn, doc_id, txn_id)` | attach the doc as proof of a bank transaction |
| `mark_cash_expense(conn, doc_id, category_name)` | cash purchase with no bank line — becomes a substantiated expense in its own right |
| `add_labor_payment(conn, *, transaction_id, ...)` | itemize named cash labor. Sum cannot overshoot the funding withdrawal — overshoot fails loud |
| `verify(conn, doc_id)` | mark reviewed-and-correct. **Requires a date and an amount.** Always a human act |
| `labor_1099_summary(conn, year, ...)` | per-payee cash labor + 1099-NEC threshold flags |

---

## 5. The schema, field by field

`documents` — the answer to "what is FinRecon's expected input format":

```
id · file_path · file_sha256 (UNIQUE) · original_name · mime_type
doc_type (default 'receipt') · doc_date · vendor · amount_cents · job_ref
payment_method · notes · linked_transaction_id → transactions(id)
creates_expense (0/1) · category_id → categories(id) · extracted_by
status (default 'needs_review') · imported_at · verified_at
```

Mapping the handoff's eight target fields:

| Handoff field | FinRecon column | Notes |
|---|---|---|
| `date` | `documents.doc_date` | TEXT, ISO `YYYY-MM-DD` |
| `vendor` | `documents.vendor` | TEXT, free |
| `amount` | `documents.amount_cents` | **INTEGER CENTS.** `$27,400.00` → `2740000` |
| `payment_method` | `documents.payment_method` | TEXT, free |
| `category` | `documents.category_id` | FK → `categories.id`. Category must already exist |
| `room_or_phase` | `documents.job_ref` | TEXT, free. **Currently NULL on all 242 rows** |
| `source_document_link` | `documents.file_path` | Do not set by hand — `ingest()` writes it |
| `claim_eligibility_flag` | `documents.claim_flag` | Added by **migration 12**. `claim` / `owner` / `both` / `undetermined`. See §6 |

Dates are TEXT throughout. Encoding is UTF-8 (`utf-8-sig` on CSV reads, so a BOM is fine).

---

## 6. `claim_eligibility_flag` — RESOLVED, migration 12 applied 2026-08-12

The field had no home. FinRecon carried exactly one classification axis and it was tax, not
insurance: `transactions.business_flag CHECK IN ('business','personal','unreviewed')`.
`documents.status` is a review lifecycle, not an eligibility flag.

Jeff approved the migration. **Schema version 11 → 12:**

```sql
ALTER TABLE documents ADD COLUMN claim_flag TEXT NOT NULL DEFAULT 'undetermined'
    CHECK (claim_flag IN ('claim', 'owner', 'both', 'undetermined'));
CREATE INDEX idx_documents_claim_flag ON documents (claim_flag);
```

`claim_flag` is a **second axis, orthogonal to the tax one**. `business_flag` answers *whose
money, for tax*; `claim_flag` answers *does the carrier owe for it*. They are not the same
question and a document can be personal-use **and** claim-funded. Overloading `business_flag`
would have corrupted the Schedule C the first time a claim item was personal-use.

`'both'` is a real answer, not a hedge — a shared-scope line the carrier part-funds.

All 242 pre-existing documents default to **`undetermined`**, which is the honest state: none
has ever been assessed for claim eligibility. Defaulting them to `owner` would have
manufactured a finding.

**`claim_flag` is now in `SETTABLE`** and validated against `CLAIM_FLAGS` before the DB
CHECK, so a bad value fails loud with the valid list. The old name still fails loud:

```
store.set_fields(conn, id, claim_flag='maybe')
  → DocumentError: unknown claim_flag 'maybe'; one of ['both','claim','owner','undetermined']
store.set_fields(conn, id, claim_eligibility_flag='claim')
  → DocumentError: cannot set ['claim_eligibility_flag']; settable: [...]
```

**Room/phase convention:** `job_ref = 'roswell:<room>'` — e.g. `roswell:kitchen`,
`roswell:sewing_room`, `roswell:master_bath`. `job_ref` was NULL on all 242 existing rows,
so Roswell defines it without colliding with anything.

Full suite green: **345 passed** (`tests/test_migrations.py` expected-list updated to include 12).
DB snapshotted to `data/backups/finrecon-20260812-165700.db` before the change.

**Deliverable G is unblocked.** All eight target fields now have a home.

---

## 7. Remote access

From the Mini, over Tailscale (key auth, no password):

```bash
ssh mbp
```

Reverse, from this MacBook Pro:

```bash
ssh mini
```

`~/.ssh/config` has `mini` → `100.115.69.54` (user `jeffmumfordmacmini`) and `mini-lan` →
`Jeffreys-Mac-mini.local`. Peers: `jeffreys-macbook-pro` 100.122.41.121 ·
`jeffreys-mac-mini` 100.115.69.54 · `iphone182` 100.104.37.85.

### ✅ RESOLVED 2026-08-12 — the Mac mini is authoritative

Jeff's decision. The Mini is the system of record; the MacBook Pro copy is a **read-only
replica**, marked on disk at `data/REPLICA-DO-NOT-WRITE.md`.

| | MacBook Pro | **Mac mini (master)** |
|---|---|---|
| Schema | 12 | **12** |
| Transactions / documents | 7,539 / 242 | **7,539 / 242** |
| Git HEAD | `4849912` | **`4849912`** |
| Web UI (only `documents` ingestion path) | — | **running** |
| Scheduled SimpleFIN sync, 05:30 | — | **installed** |
| SimpleFIN Access URL in Keychain | — | **yes** |

**Never run a writing command on the MacBook Pro** — `import`, `sync`, `categorize`, `classify`,
`review`, `checkpoint`, `serve`, or direct SQL writes. Reads are fine. Refresh the replica by
pulling, never pushing:

```bash
scp mini:'~/ClaudeBox/finrecon/data/finrecon.db' ~/ClaudeBox/finrecon/data/finrecon.db
```

Migration 12 was committed **on the Mini** (`4849912`) and pushed to
`github.com/JohnsManville/finrecon`, branch `phase4-review-ui-docs-engine`; the MacBook Pro then
pulled it. 345 tests green on both. Mini DB backed up to
`data/backups/finrecon-20260812-201020.db` before the migration, and the web server was stopped
and restarted around it.

<details>
<summary>The hazard this resolved (kept for the record)</summary>

### There were TWO live databases. Correcting an earlier claim in this runbook.

An earlier draft of this document said *"FinRecon lives on the MacBook Pro; the Mini has no copy
of `data/finrecon.db`."* **That is wrong.** Verified 2026-08-12:

| | MacBook Pro | Mac mini |
|---|---|---|
| `data/finrecon.db` | present | **present** (6,197,248 bytes, 2026-08-11 10:32) |
| Transactions | 7,539 | 7,539 |
| Latest `posted_at` | 2026-07-22 | 2026-07-22 |
| **Schema version** | **12** | **11** |
| Web UI | not running | **`com.claudebox.finrecon-serve` RUNNING (pid 912)** |
| Scheduled sync | none | `com.oddjobs.finrecon-simplefin-sync`, daily 05:30 |

Content is identical; they differ only by **migration 12**, which was applied to the MacBook Pro
copy only.

**This is a live hazard.** The web app — the only ingestion path for `documents` (§4) — runs on
the **Mini**, against the **Mini's** database, which does **not** have `claim_flag`. Any receipt
ingested through the web UI today lands in a v11 database. Two copies of a financial system of
record, one of them served over HTTP, is how silent divergence happens.

**Decide which machine is authoritative before loading the Roswell dataset.** Recommendation:
the **Mini** — it is always-on, never sleeps, already runs the server and the scheduled sync.
That means pushing the code changes (git) and migration 12 to the Mini and treating the MacBook
Pro copy as a working replica, not a second master.

*Done — see the resolution box above.*

</details>

### 🔴 Scheduled sync has NEVER succeeded

`~/ClaudeBox/finrecon/logs/simplefin-sync.log` on the Mini, in full:

```
2026-08-11 15:47:20 skip: no Access URL in Keychain — run 'finrecon sync --setup <token>' once
2026-08-12 05:30:05 skip: no Access URL in Keychain — run 'finrecon sync --setup <token>' once
```

The launchd job was installed 2026-08-11 15:47, has fired twice, and skipped both times. **There
is no SimpleFIN Access URL in either Mac's Keychain** (`security find-generic-password -s
finrecon-simplefin` → not found on both). The ledger stops at 2026-07-22 because it has only ever
been populated by hand-run imports.

**Unblocking it is a one-time action only Jeff can take:** get a Setup Token from
<https://bridge.simplefin.org> (his login), then run **on the Mini, by absolute path** (see the
alias warning in §2 — plain `finrecon` launches the wrong tool and swallows the token):

```bash
~/ClaudeBox/finrecon/.venv/bin/finrecon sync --setup <token>
```

The token is single-use and is exchanged for an Access URL stored in the Keychain. After that the
05:30 job works on its own.

⚠️ **Run it in a GUI session on the Mini, not over SSH.** The login Keychain is not readable from
a non-interactive SSH session, so both `--setup` and later reads fail there even once the
credential exists. Verified 2026-08-12: after a successful `--setup` in the GUI, `sync --list`
over SSH still reported "no Access URL in the Keychain."

**Status 2026-08-12: `--setup` succeeded.** *"Access URL claimed and stored in the Keychain
(service finrecon-simplefin)."*

### 🔴 The `-T ""` trap — do this once or the 05:30 job keeps failing silently

`sync.store_access_url()` writes the item with:

```python
"-T", "",  # no application is pre-authorised to read it silently
```

Deliberate hardening, with a consequence: **every read triggers a macOS Keychain authorization
dialog** until an application is added to the item's ACL. When the launchd job fires at 05:30 on
an unattended Mini, nobody clicks the dialog, the read fails, and `load_access_url()` raises the
*same* generic message as a missing credential:

```
no SimpleFIN Access URL in the Keychain.
```

So a fully-configured system looks identical to an unconfigured one in the log. **This is the
single most misleading failure mode in FinRecon.**

**Clear it once:** run `sync --list` in a **GUI Terminal on the Mini** and click **"Always
Allow"** on the prompt — not "Allow", which authorises only that one read. That adds `security`
to the item's ACL and every unattended run afterwards succeeds.

If the 05:30 log ever reports "no Access URL" again, check the ACL before assuming the credential
is gone:

```bash
security find-generic-password -s finrecon-simplefin -a <account> -g
```

---

## 8. Non-negotiables (from `SPEC.md` / `DECISIONS.md`)

1. Integer cents. Never floats.
2. Parse by column name. Never by position.
3. Fail loudly. A wrong number in a tax workpaper is worse than no number.
4. Every batch rolls back — but a batch with transfer links **cannot** be rolled back
   (no `--force`), and one with reviewed transactions needs `--force`.
5. Identity is `(date, amount, occurrence)` and deliberately **description-independent**.
6. `finrecon backup` before anything that writes.
