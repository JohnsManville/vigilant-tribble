# Head system cards — handoff

Two printable, two-sided letter cards for the 1988 Sea Ray 345 Sedan Bridge
(OR 249AEJ), SeaLand Vacu-Flush head into a holding tank.

## Deliverables

| File | What it is |
| --- | --- |
| `Head Card.dc.html` | Guest / owner card. Front: flush procedure, part labels, plain-English glossary, do/don't. Back: consequences scored by hours, grossness and money. |
| `Head Card — Crew.dc.html` | Crew triage card. Front: it won't flush. Back: full or wet. Every row is *what we can see → what likely happened → what we do*, tagged Stop / Fix / Watch. |
| `export/head-card-owner.html` | Owner card, single self-contained file (fonts, CSS, photos inlined). Works offline. |
| `export/head-card-crew.html` | Crew card, same. |

Both cards are explicitly paginated: one `<section class="page">` per printed
side, letter, full bleed. Each side is designed to fill the page box exactly —
if you edit content, re-check that `.page` scrollHeight still equals 1056px or
the bottom will be clipped at print.

## How the files are built

- `Head Card.dc.html` / `Head Card — Crew.dc.html` are Design Components. Open
  either directly in a browser; edit the markup in place.
- `doc-page.js` — the paged-document shell. Owns the page box, the print CSS
  and the screen chrome. Do not add your own `@page` rule.
- `support.js` — Design Component runtime. Generated; do not edit.
- `_ds/broadsheet-.../` — the Broadsheet design system: `styles.css` carries
  every color, font and spacing token; `_ds_bundle.js` carries the components.
  All styling in the cards references `var(--*)` from that sheet.

## Source material

- `uploads/1988_345 Sedan Bridge_1988_345_SedanBridge.pdf` — the factory owner's
  manual. Head Systems is manual pages 26–28 (PDF pages 29–31).
- `scraps/p29-0.png`, `p30-0.png`, `p31-0.png` — those three pages rendered out.
  p29 is the Vacu-Flush / holding tank / San-X One text; p30 is the holding tank
  with overboard discharge diagram and the Y-valve wording; p31 is the San-X One
  schematic and the two indicator panels.
- `uploads/photos-*.jpeg` — the owner's photographs of the head compartment,
  the pedal, and the vacuum gear under the aft berth.
- `assets/head.jpeg`, `assets/tank.jpeg` — the two used in the cards.

## Facts the cards are built on, and where they came from

From the manual (PDF p29–30):

- Vacu-Flush head, 15 amp "Head System" breaker on the main distribution panel.
- Start-up order: "Water System" breaker, then "Head System" breaker.
- The foot pedal opens a mechanical seal; vacuum forces waste through the bowl
  to the accumulator tank, through the vacuum pump, then to the holding tank.
- Holding tank is in the aft starboard side of the bilge.
- Indicator panel in the head: ¾ Full, Full, Do Not Flush. When Full is lit,
  Do Not Flush is lit, and the tank must be emptied before the head can be used.
- Pumpout goes into the deck plate marked "waste".
- Y-valve is on the holding tank platform, aft starboard bilge. Aft position
  sends waste to the tank; forward sends it overboard, and the overboard
  discharge seacock on the bilge floor must be opened first. Sea Ray's wording:
  "discharge of sewage directly overboard is for use where approved only."

Regulatory (EPA / Oregon State Marine Board):

- Untreated sewage may not be discharged in inland or coastal waters, or within
  three miles of the coast.
- In Oregon fresh water — lakes, reservoirs, enclosed impoundments — no sewage
  may be discharged at all, treated or untreated.

## Open item

Dollar figures on the owner card's back are estimates for a 34-footer, not
quotes. Swap in real yard rates before this goes in front of anyone who will
hold you to them.
