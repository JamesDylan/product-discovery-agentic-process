# 08_vision-horizon — Vision horizon (Reduce Churn: post-booking micro-conversions)

**2026-09-24.** Solo run. Built on `03_converge/output/direction.md` alone. `07_engineering-refinement` did not run on this run (no engineering partners engaged), so there is no solution scope behind Now. Content below is James Scholz's answers. Quoted text is his exact words.

**Owner:** James Scholz — owns the whole vision end to end, confirmed explicitly, including any
piece that touches Serko.

---

## The one sentence

> "B4B helps travel arrangers better plan and book future trips, guiding them to save money and
> improve forecasting."

"Forecasting" means arranger- and traveller-level trip forecasting: an individual's own upcoming
trips. It does **not** mean org-level spend forecasting.

## The bet

**Booking history contains a predictable signal about future trips. Arranger self-declaration is
the instrument that validates that prediction — not the delivered feature.**

> "We want to test if we can predict, and asking arrangers to self-declare will help us match our
> prediction with the arrangers version of the future without surfacing it to them directly."

**Falsifier:** regrettable churn is 5.7% today. If it does not fall to **4.5% within 12 months**,
the bet is wrong.

## Now · Next · Later

| Horizon | What | Depends on the previous because |
|---|---|---|
| **Now (0–3mo)** | (a) A rule-based recurrence step over booking history — simple cadence and frequency detection, not a trained ML model. (b) Separately, arrangers self-declare a known upcoming trip. Compare the two to check whether the prediction matches reality. The prediction is **not** shown to arrangers in this window. This is a measurement and validation step, not a user-facing feature. | — (the bridge from today is booking history B4B already holds) |
| **Next (3–9mo)** | Act on the validated prediction with **proactive nudges** to the arranger about their declared or predicted future trip. **Not** Rate Lock, **not** price-matching. | Nudging only makes sense once Now proves the prediction is accurate against real arranger declarations. |
| **Later (9–12mo+)** | A **proactive company-wide trip calendar**: the same mechanism (declared and predicted trips, plus nudges) extended across everyone who books for a company. Still arranger- and traveller-level. | Extending an unproven single-arranger mechanism company-wide before it is trusted would amplify noise. Next has to prove the nudges work for one arranger first. |

**Why no price-risk mechanism in Next:**

> "If we price-match, we own the risk. If we don't price match there is no risk. Other than
> misleading people if we tell them the price might go up but it doesn't."

The only risk in Next is reputational: misleading an arranger with a false price-direction claim
in a nudge.

**Sprint-scope check:** if only Now ever ships and Next and Later are never funded, the vision is
still real. Now itself tests a real belief about arrangers and churn. It is not a feature dressed up.

## Capability gained

> "In 12 months B4B can act on a company's known-but-unbooked travel, not just its already-booked
> travel."

## Serko AI narrative

- **AI is incidental.** The mechanism is rule-based, statistical recurrence detection. It is not
  an AI mechanism, and it is not routed through Serko.ai.
- **Assistant surfaces** (e.g. Perk booking inside Claude and ChatGPT): not relevant on this
  12-month timeline.

## What we are betting against

The view that **"arrangers are just-in-time bookers, and planning-ahead tools go unused."** This
vision bets that arrangers do want, and will use, planning-ahead visibility — not only care in the
moment of booking.

## Boundaries held

- No org-level spend forecasting. No spend reporting. (Held from `03_converge`.)
- No price-matching or price-risk ownership.

## Open questions that would change the view

**Kill conditions — either one alone kills the vision, not only delays it:**
- The share of arrangers who actually have a predictable future trip is too low.
- Booking history does not actually predict repeat trips.

**Would narrow or delay, not kill** (carried from `03_converge`):
- Whether price and availability move enough on the cohort's typical trips to give an honest signal.
- Churn for orgs with invited self-booking travellers vs single-arranger orgs.
- Whether the 30-day session number is per user or per account.

## Human check — pending

Say the one sentence to **Lilly** (works on B4B, not on this run). Ask her to disagree with it.
Not yet done at time of writing.

---

## Stage notes (Claude, not James)

- `_shared/house-view.md` is empty. This view is tested against no house opinion.
- No `07` solution scope exists. Now has no engineering sizing behind it.
