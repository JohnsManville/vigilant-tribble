# Account ...2585 — RETRACTED
**Version:** v1.1 | **Date:** 2026-08-31
**Status:** 🔴 **The v1.0 conclusion in this file was WRONG. Do not use it.**
**Caught by:** Jeff, who said it looked like double counting. It was.

---

## 1. What v1.0 claimed, and why it was wrong

v1.0 concluded that account ...2585 was Nancy's, that it had advanced Jeff
$24,269.00 nobody had counted, and that Nancy's total advances were $84,040.38.

**All of that is withdrawn.** The raw OFX feed settles it:

```
"NAME": "Online Transfer from CHK ...2585"
```

**"Online Transfer from CHK" is Chase's language for a transfer between the
customer's own linked Chase accounts.** Money from a third party does not
arrive that way. It arrives as a Zelle, an external ACH, or a deposit, and it
carries the sender's name.

## 2. The tell I should have checked first

Every one of Nancy's 14 bridge advances arrives on the same rail, with her name
on it:

```
"Original Description": "Zelle: NANCY MUMFORD"
```

**Fourteen of fourteen are Zelle. Not one is an "Online Transfer from CHK."**
The two rails are not interchangeable, and I let matching amounts and dates
carry an identification that only the rail could support.

## 3. What ...2585 actually is

Jeff's own Chase account. He already holds `chase-checking-0922` and
`chase-prime-2586` in this ledger, so a second Chase checking ending 2585 is
unremarkable. The four rows are Jeff moving his own money:

| Txn | Date | Amount | What it actually is |
|---|---|---:|---|
| id35 | 2025-12-23 | +$9,269.00 | Jeff to Jeff, own accounts |
| id32 | 2026-01-26 | +$10,000.00 | Jeff to Jeff, own accounts |
| id26 | 2026-04-13 | +$5,000.00 | Jeff to Jeff, own accounts |
| id5 | 2026-06-01 | −$5,000.00 | Jeff to Jeff, own accounts |

## 4. This also breaks the prior session's finding

`2026-08-31_20k-repayment-resolution_RC.md` identifies the 2026-06-01 −$5,000
as **Part 2 of the $20,000 repayment to Nancy.** On this evidence it is not. It
is an internal transfer between Jeff's own accounts.

**That leaves only the $15,000 HELOC draw as repayment, and it is still
unverified by any document.**

## 5. Corrected balance

| | |
|---|---:|
| Nancy advanced (14 Zelle bridge loans) | $59,771.38 |
| Less Zelle repayment 2026-05-22 | −$850.00 |
| **Outstanding, documented** | **$58,921.38** |
| *If the $15,000 HELOC repayment verifies* | *−$15,000.00* |
| *Outstanding, best case* | *$43,921.38* |

## 6. The Jan 26 "two separate $10,000" claim

Also withdrawn. There was one $10,000 from Nancy that day (the Zelle into
USAA). The Chase row was Jeff moving his own $10,000. Note that $10,000 left
Chase again the next day (id31, 2026-01-27), which is the shape of moving money
through to cover something, not of receiving a gift.

## 7. The appliance-subtotal match

v1.0 made much of Nancy wiring $9,269.00, the exact Café appliance subtotal.
**She did not wire it. Jeff moved it between his own accounts** on 2025-12-23,
eighteen days after the $8,269.00 posted to the Amex. The innocent reading is
that he moved money to cover the card. The exact-subtotal match is a
coincidence of round-ish numbers, and it should never have carried the weight
I put on it.

**Section 5.2 of the counter proposal is still weak**, but for the reasons that
were already on the record before this file existed: the walkthrough recording
has Jeff saying "she bought the fanciest new appliances" and telling her to buy
the nice things. That evidence stands on its own and does not depend on ...2585.

## 8. Method note for whoever works this next

This ledger identifies counterparties inconsistently. Zelle rows name the
person. Internal transfers name only an account number, in `raw_json`, not in
`description`.

**Match on the rail and the counterparty name, never on amount and date alone.**
Two transactions of the same size on the same day are usually one movement of
money seen twice, or two unrelated things. They are almost never two gifts.
