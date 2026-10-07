# Gaps — 09_report, Marketing Email Acceptance

Logged before building `content.yaml`, per the stage contract (Process step 1–2). Each gap traces
to a missing or empty input for this run.

## Why these gaps exist
This run skipped several stages on purpose (James, solo test):
- `00_setup/output/inventory.md` — not run
- `03_converge/output/direction.md` — not run; `08_vision-horizon` picked a bet straight from
  `02_explore/output/options.md` instead
- `05_pressure-test/output/` — empty, no pressure test run
- `07_engineering-refinement/output/` — empty, no scope/owners defined
- `_shared/house-view.md` — still `STATUS: EMPTY`, no tested point of view to apply
- `_shared/decision-log.md` — template only, no entries logged for this run

## Slot-by-slot

| Section | Block | Schema wants | What's sourceable | Gap |
|---|---|---|---|---|
| Hero | C4 stats | 4 stats | 4, from `_shared/product-context.md` (invite/join 40% vs 80%, corporate email 48% vs 70-75%, single-to-multi 12% vs 15-25%, single-user churn 52% vs 19%) | None — fillable |
| Verdict | C5 | one sentence | vision-horizon.md "The one sentence" | None — fillable |
| Journey | C7, 5 steps | 5 | 3 (Now/Next/Later) | Schema allows 3 cells when only 3 exist — not a real gap |
| What changed | C8, 3 rival cards | 3 | 2 (Perk, Engine — `product-context.md`) | 1 short, no third rival evidenced anywhere |
| What we own | C9, 5 items + 1 | 5+1 | 3 (Now/Next/Later capabilities gained) | 2 short |
| Where we stall | C10 flywheel + C11 | flywheel + leaks | none — `direction.md` missing, `05_pressure-test` empty | Full gap, no source material at all |
| What we build | C11 + C12 | Now/Next/Later, a trade | full — Now/Next/Later chain + "What we're betting against" (accent_band candidate) | None — fillable |
| Where this lands | C14 table + C12, owners | scope + owners | none — `07_engineering-refinement` empty | Full gap, no source material at all |
| Read with care | C15, 5 items | 5 | 5, assembled from vision-horizon.md "Open questions" (3) + its own process-note caveats (house-view empty; `03_converge` skipped) | None once assembled — fillable |
| Sources | C16, 12 items | 12 | ~4 internal docs (`product-context.md`, `vision-horizon.md`, `options.md`; `decision-log.md` has no entries) | Far short, no external dated sources gathered this run |

## Decisions (James, 2026-09-21)
- **What changed (rivals):** run with 2 cards, not 3. Off-schema layout, real content over padding.
- **What we own (asset grid):** shrink to 3 cells. Only what's sourced from this run's bet.
- **Where we stall / Where this lands:** keep both as explicit "not run this cycle" placeholders —
  signal the scope gap rather than cut silently or invent content.
- **Sources:** list the ~4 real internal sources honestly. No padding to 12.
