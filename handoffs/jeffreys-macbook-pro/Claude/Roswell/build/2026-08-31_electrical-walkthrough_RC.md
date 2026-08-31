# Roswell Electrical — Walkthrough Action List
**Version:** RC | **Date:** 2026-08-31
**Source:** job-site voice memo, Jeff + Matt, kitchen and bath walkthrough
**Confidence note:** transcribed from audio with heavy crosstalk. Items marked
⚠️ are garbled in the source and need confirming before anyone buys or cuts.

---

## 🔴 STOP FIRST — attic

You described the attic as **blown-in over vermiculite**. Most US vermiculite
attic insulation came from the Libby, Montana mine and is **presumed to contain
asbestos** unless tested otherwise.

A respirator and a Tyvek suit is not the protocol for disturbing it. The plan
on the tape was you and Lee going up with headlamps.

**Do not go back up until it is tested.** Three reasons: the exposure, the fact
that disturbing it can contaminate the living space below, and that an
asbestos finding is both a claim item you have not submitted and a disclosure
item if this house is ever sold.

---

## 1. The panel — the finding that changes the budget

| | |
|---|---|
| Existing | Gould **ZQC 24 MVB** |
| Service | **200 amp** — confirmed by Jeff 2026-08-31 |
| Empty spaces | **4** |
| Decision on the tape | **New panel.** Both of you landed there over cutting circuits. |

**Service capacity is not the problem. Spaces and breaker availability are.**
200A is plenty for this house plus the new kitchen. What you are short of is
physical positions in an obsolete load center, and modern breakers that fit it.

Possible recovered spaces: the double 220 breakers that fed **baseboard heating
now removed** (mini-splits replaced it). ⚠️ Unconfirmed which doubles are
baseboard and which are mini-split. Verify before counting on them.

### Three ways to get the spaces

| Option | What it costs you | When it wins |
|---|---|---|
| **Replace the load center** | Most labor, no utility involvement since service stays 200A | Cleanest. You need ~9 new circuits with GFCI and likely AFCI, and the Gould cannot give you those. |
| **Add a sub-panel** off the main | Cheaper, less disruptive, keeps the Gould | If the Gould is sound and you only need the kitchen and bath circuits grouped |
| **Tandem breakers** in existing spaces | Cheapest | Only if the panel label permits them and you do not need GFCI or AFCI on those legs. Probably not enough for this scope. |

**Gould is ITE lineage, so Siemens often cross-references** for standard
breakers. That helps for a plain 20A. It does not solve GFCI or AFCI, which is
the actual driver here.

⚠️ **Code note to confirm with Matt:** a kitchen rewire of this scope typically
pulls in GFCI on counter, sink-adjacent, and bath receptacles, and AFCI on
kitchen and bath branch circuits. Oregon amends the NEC, and how hard this
binds depends on whether there is an inspection — which is still open question
#3 below. If AFCI applies, the old Gould is effectively disqualified and the
decision makes itself.

## 2. Existing wiring — condition

- House has been **wired or rewired roughly six times**.
- **Original metal-clad with rubber insulation.** The rubber dries, cracks, and
  is a fire risk. The sheathing was the ground conductor. All of it goes.
- **White Romex = 14 gauge.** Fine for lighting, undersized for outlets on
  20 amp breakers. All of it goes.
- **Circuit 5 is the mess:** bathroom vanity, kitchen ceiling, east counter,
  northwest wall, other counter outlets, and laundry all on one.
- **The Cadet heater you planned to steal for the microwave is 240V piggybacked
  off the water heater.** Already pulled. That circuit is not available.
- **The "dedicated" fridge power** behind the peninsula box is not dedicated.

Because all the old wire comes out, **every circuit below qualifies as a new
run.**

---

## 3. New circuit design

| # | Circuit | Spec | Status |
|---|---|---|---|
| 1 | **Refrigerator** | Dedicated 20A, new run | Settled. Priority one, liability item |
| 2 | **OTR microwave** | Dedicated 20A, new run | Settled. Must be its own |
| 3 | **Dishwasher** | Dedicated 20A | ⚠️ code check |
| 4 | **Garbage disposal** | Possibly shared with dishwasher | ⚠️ code check |
| 5 | **Range** | New **10 ga** run, new box and outlet | Settled. ⚠️ verify plug type on the new Café range |
| 6 | **Counter outlets + peninsula** | 20A, new run | Settled |
| 7 | **Sink outlets + north** | Separate 20A, new run | Settled |
| 8 | **Kitchen overhead + bath vanity + bath fan** | One new circuit, GFCI | Settled |
| 9 | **Bath vanity outlet** | Tied into #8 | Settled |
| — | Bathroom floor heat | Runs off the water heater | No dedicated circuit needed |
| — | Baseboard heating | Removed | Spaces may free up |

**Why 6 and 7 are split:** so the kettle, crock pot, blender, and air fryer do
not land on one circuit. Motor startup inrush is the constraint, not running
load. Your point about the fridge only pulling 7 amps is right about steady
state and beside the point on startup.

**Note on the appliances:** the range has an air fry mode and the microwave is
the ventilation. There is no separate hood in the order. ⚠️ Confirm the OTR
microwave satisfies the ventilation requirement for that range, and that the
plan set is not drawn for a chimney hood.

## 4. Switching

- **Kitchen overhead:** all on one switch, **3-way**.
- **Sink light:** separate switch. This is the dim-lighting run.
- **North wall double switch:** rewire. Was in series for the fans. Already
  addressed once.
- **Move switches down the wall.**

## 5. Vanity

| | |
|---|---|
| Original spec | 48" — agreed too big |
| **New spec** | **56" on center from the northwest corner** |
| Outlet | Moves to the other side |

**Vanity light box problem:** a metal pipe (vent stack) is in the way of the
new-work boxes you bought. Options on the tape: a different box type, or a
drywall box after the fact. The pipe may be removable if the vent relocates.
⚠️ Unresolved.

---

## 6. WHAT WE NEED

**Electrical**
- [ ] New panel / load center, sized above 100A ⚠️ spec the service size first
- [ ] 12/2 Romex, quantity TBD (Costco 215 ft roll ~$100; you have been finding
      them at estate sales)
- [ ] 10 ga for the range run
- [ ] GFCI devices
- [ ] New work boxes that clear the vent pipe (the ones on hand do not fit)
- [ ] Junction box for the vanity light
- [ ] Range box and outlet

**PPE and access**
- [ ] Respirators (two)
- [ ] Tyvek suits
- [ ] Flashlights and headlamps
- [ ] Additional ambient lighting for attic and crawl, not just task lighting
- [ ] Knee pads

**Other**
- [ ] Drywall — mixed thickness on hand, all half inch minimum

## 7. Open questions

1. **Code:** must the dishwasher and garbage disposal be separately dedicated?
   Matt to verify.
2. **Code:** kitchen sink outlet requirements.
3. **Is there an inspection?** Uncertain on the tape, described as an insurance
   requirement that came up recently. This decides how much of the above has to
   be to code versus merely safe.
4. **Range plug type** — verify before running the 10 ga.
5. **Which 220 doubles are mini-split and which were baseboard.**
6. ~~Service size~~ — **resolved. 200A.** Matt's "about 100" on the tape was
   wrong and Jeff corrected it in the moment. No service upgrade, no utility
   involvement, no mast or meter work. Scope is the load center only.

## 8. Second opinions in flight

- **Gibb** — expected to weigh in tomorrow.
- **Your other electrician contact** — send him the circuit path and a photo of
  the panel with "here's what I'm thinking, any obvious no's."

## 9. Schedule

- Matt available **Thursday and Friday**; deck work with Lee.
- Matt's window is roughly **11 to 2** around school dropoff, flexible.
- Baseline Mon–Fri 8 to 5, occasional Saturday.
- **March 20** referenced as a date this needs to be done by. ⚠️ Confirm what
  that date is anchored to.

**Matt's critical path framing, worth keeping:** what it is now → what it
should be → what new runs need laying → if there is an overage, what gets cut.

⚠️ The job sequence after Roswell (deck, then Hinckley) is garbled in the
transcript and not reliable.
