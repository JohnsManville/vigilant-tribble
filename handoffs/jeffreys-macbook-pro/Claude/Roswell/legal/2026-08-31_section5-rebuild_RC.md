# Section 5 Rebuild + GC Hours Reconstruction
**Version:** RC | **Date:** 2026-08-31
**Replaces:** Section 5 of the counter proposal v1.1
**Read this before sending anything.**

---

## PART 1 — What the ledger actually shows

### 1.1 The bridge loans are confirmed exactly

14 lumps, **$59,771.38**, Aug 1 2025 to May 1 2026. Every one tagged
*"Loan from Nancy — Roswell bridge (short-term; repay from insurance)."*

| Date | Amount | Date | Amount |
|---|---:|---|---:|
| 2025-08-01 | $3,000.00 | 2026-02-09 | $1,800.00 |
| 2025-10-02 | $8,837.38 | 2026-02-11 | $5,000.00 |
| 2026-01-07 | $750.00 | 2026-02-13 | $1,000.00 |
| 2026-01-20 | $2,484.00 | 2026-02-18 | $5,000.00 |
| 2026-01-26 | $10,000.00 | 2026-03-25 | $10,000.00 |
| 2026-02-06 | $1,500.00 | 2026-03-26 | $400.00 |
| | | 2026-04-09 | $5,000.00 |
| | | 2026-05-01 | $5,000.00 |

### 1.2 🔴 The $20k repayment is not in this ledger

Searched all 94 Roswell-tagged rows. **One** outbound payment to Nancy exists:

| 2026-05-22 | **−$850.00** | Zelle Transfer to Nancy Mumford |

No refi, cash-out, or escrow row appears anywhere in the extract.

**Documented net: $59,771.38 in, $850.00 out, $58,921.38 outstanding.**

This does not mean the repayment did not happen. Three places it could be
without showing here:

1. **The full finrecon ledger.** This extract is Roswell-tagged rows only. A
   repayment categorized as personal or as a transfer would not carry the tag.
2. **After 2026-08-12.** That is the extract date.
3. **Off-ledger.** A check, a wire, or an account not in the dataset.

**Find it before you assert anything.** A $20,000 swing decides whether you are
$58,921 down or $38,921 down, and you should not be guessing at that number in
front of two attorneys.

### 1.3 🔴 Her money paid for your materials

The dates line up too well to argue with.

| Nancy sends | Amount | You pay | Amount |
|---|---:|---|---:|
| 2025-08-01 | $3,000.00 | 2025-08-06 Mold Masters | −$8,823.38 |
| 2025-10-02 | $8,837.38 | 2025-10-31 Mold Masters | −$8,840.00 |
| 2026-01-26 | $10,000.00 | (rebuild period) | |
| 2026-02-11 / 18 | $10,000.00 | (rebuild period) | |
| 2026-03-25 | $10,000.00 | (rebuild period) | |

Her October advance of **$8,837.38** is within $2.62 of the Mold Masters
payment you made 29 days later. Her loans begin five days before your first
large remediation payment and continue through the entire rebuild.

**This is the fact that breaks Section 5.1.** You cannot bill Nancy for
spending money Nancy lent you. Against $58,921.38 outstanding, a claim to be
reimbursed $23,821.74 for materials her advances funded does not survive
first contact with her attorney.

### 1.4 🔴 The $8,837.38 appears twice, in your favor

Nancy Zelled you **$8,837.38** on 2025-10-02, tagged as a bridge loan.
CMG/Proctor check #00001432 for **exactly $8,837.38** was issued 2026-05-28
and landed in Chase 2026-07-21. Your own master index flags it:
*"Loan or reimbursement? OPEN — changes casualty basis."*

The likely reading: Nancy fronted you the insurance money eight months before
the carrier released it. When the check landed, that money repays her.

Counter proposal v1.1 netted that $8,837.38 against your own spend to reach
$23,821.74. **If it repays Nancy, you do not get to net it.** Your advance
figure goes up and her balance stays put. The v1.1 math was wrong in your
favor, which is the worst direction for it to be wrong.

### 1.5 Corrected spend figure

| | |
|---|---:|
| Identified in substantiation file | $32,659.12 |
| Less confirmed duplicate (txn 5397/5398) | −$546.93 |
| Plus recovered "rocwll" orders | +$885.90 |
| **Corrected advance** | **$32,998.09** |

Do not net the CMG check against this until 1.4 is resolved.
