# $8,837.38 Double-Count — Resolution
**Date:** 2026-08-31 · Status: mechanics RESOLVED; one factual input needed from Jeff
**Resolves:** finding 2 in `family-evidence-ledger-v1.2_REBUILT.md` §6 (previously "open, unresolved")

## The problem
The figure **$8,837.38** was being used in two places at once:

1. As one of **Nancy's 14 bridge advances** (the 2025-10-02 Zelle), inside the $59,771.38 total Jeff owes her.
2. As **insurance received**, netted against Jeff's own advances in counter-proposal v1.1 §4.2 to reach the "**$23,821.74 net**" claim ($32,659.12 gross − $8,837.38).

It is almost certainly the **same money**: Nancy fronted the expected insurance in Oct 2025, and the carrier's bathroom-scope check for exactly $8,837.38 (CMG/Proctor check #00001432, issued 2026-05-28, landed Jeff's Chase …0922 on 2026-07-21, dual payee "Nancy Mumford AND Jeffrey Mumford") is that same loss being paid ~8 months later. Using it in both places counts it twice.

## The fix (mechanical — certain)
The $8,837.38 must appear **once**, and it belongs on **Nancy's ledger**, not as a reduction of Jeff's own-advance claim. Two corrections follow, both independent of the open question below:

- **A. Un-net Jeff's advances.** The insurance receipt is not a reimbursement of Jeff's finish/advance spending, so it must not reduce his advance claim. Jeff's documented advances are the corrected **gross $32,998.09** (= $32,659.12 − $546.93 duplicate + $885.90 "rocwll"). **The "$23,821.74 net" figure in counter-proposal v1.1 §4.2 is wrong and is retired.**
- **B. Move the $8,837.38 to Nancy's side.** Because her 2025-10-02 advance and the carrier payout match to the dollar, the $8,837.38 is treated as the reimbursement of that specific fronted advance.

## The one open input (Jeff only)
**Did the $8,837.38 that landed in your Chase …0922 on 2026-07-21 get passed to / credited to Nancy — or did you keep it?** The check was dual-payee but landed in your account. This single fact picks the outcome:

| | If forwarded / credited to Nancy | If retained by Jeff |
|---|---|---|
| Nancy's Oct-2 advance | repaid by the insurance | still outstanding |
| **Nancy's outstanding balance** | **$30,084.00** ($38,921.38 − $8,837.38) | **$38,921.38** (unchanged) |
| The $8,837.38 insurance | Nancy's money, in and back out — nets to zero on both ledgers | offsets the bathroom loss on Jeff's side; does **not** reduce Nancy's balance |
| Jeff's advance claim | $32,998.09 gross (unchanged either way) | $32,998.09 gross (unchanged either way) |

Either way, **Jeff's advance claim is $32,998.09 gross** and **the $23,821.74 net figure is dead** — that correction stands now. Only Nancy's outstanding balance ($30,084.00 vs $38,921.38) waits on the answer above.

## Recommended default until Jeff answers
Carry Nancy's outstanding at **$38,921.38** (the conservative "retained" figure — it doesn't credit a repayment that isn't documented), with a footnote that it drops to **$30,084.00** if the insurance was passed to her. Do not send any counter-proposal that still shows "$23,821.74 net"; state Jeff's advances at $32,998.09 gross with the $8,837.38 handled separately as above.

## Downstream edits this forces
- `counter-proposal_v1.1.md` §4.2: replace "$32,659.12 advanced … $23,821.74 net" with "$32,998.09 documented advances (gross); the $8,837.38 CMG receipt is Nancy's fronted insurance, resolved on her ledger, not netted here."
- `family-evidence-ledger` §6 finding 2: mark RESOLVED, pointing here.
- Master status doc + tracker: double-count no longer "open"; the only residual is the one Jeff input above.
