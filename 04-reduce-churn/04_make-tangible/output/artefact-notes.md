# 04_make-tangible — Artefact notes (Reduce Churn: Trip Pipeline)

Builds on `03_converge`'s direction B: Trip Pipeline, seeded from booking history. The bet:
arrangers get a personal reason to come back — a better price, no blame for waiting — because
B4B tells them about a trip before they book it, not after.

Solo run. These are the scoping calls a design partner would normally make with James. No human check has happened yet — this file is what gets handed over with no narration.

---

## 1. Scope

**Key journey (the one path that proves the direction):**

Arranger opens Bookings and Trips → sees the Trip Pipeline, already seeded from booking history (the monthly route, the quarterly offsite) → confirms one proposed trip, editing a detail that's slightly wrong → time passes → a price signal fires on that confirmed trip → the arranger sees it inside Bookings and Trips, framed as a gain, not a warning → they act (book, or dismiss with a reason) → the trip moves from pipeline to booked.

This is the shortest path that tests both halves of the bet at once: that history-seeding gives
the arranger something worth reacting to (not a blank form), and that a signal on a pipeline item
is worth a return visit.

**Moments that carry the bet — resolved properly, not grey:**

1. **First view of the seeded pipeline.** Does the proposed trip look recognisable, and is the
   reason it was proposed visible ("why we think this")? This is where "booking history predicts
   repeat trips" either holds up or doesn't.
2. **Confirm / edit / dismiss.** Lower effort than filling in a blank field. This is where "nobody
   fills in a form for the product's benefit" either gets answered or doesn't.
3. **The signal, landing in Bookings and Trips.** Honest framing, personal-gain language ("fare is up since you confirmed this — book now" / explicit no-blame framing), and visually distinct
   from the account's other notices (self-book, policy, disruption) so it doesn't read as a fourth
   undifferentiated alert stream.
4. **The loop closing.** Trip moves to booked, pipeline updates. Proves this is a mechanism, not a
   one-off nudge.

**States that matter:**

- **Empty / sparse pipeline** — an org whose booking history doesn't predict anything cleanly.
  This is a live risk named in `03_converge`'s reversal conditions, not an edge case to skip.
  Must be shown honestly: what the arranger sees, and whether there's a manual "add a trip" path that doesn't feel like a consolation prize.
- **Seeded, unconfirmed** — sitting there a while. Does it decay, get re-proposed, or nag?
- **Confirmed, waiting** — the common day-to-day state. Must not read as stale or dead.
- **Signal fired** — the actionable moment (moment 3 above).
- **Edited / corrected** — arranger says "no, wrong city." Proves the system takes correction
  rather than repeating a bad guess.
- **Expired, no action** — the trip's window passes with nothing done. What happens — silent
  drop, or something else?
- **Day 200, messy** — several trips at once, mixed sources (history-seeded and manually added), different stages (unconfirmed, confirmed, signalled, booked, dismissed). The real, cluttered view, not the tidy one-trip demo.

**Deliberately grey:**

- The prediction logic behind "propose likely trips from repeat patterns" — shown only as an
  outcome (the trip, plus a short reason), not as a working model.
- The price/availability watching mechanism — a black box that produces a trigger. The resolved part is what the arranger sees when it fires, not how it's monitored.
- How this signal reconciles with the account's other churn-clock messages (self-book notices, policy exceptions, disruption alerts) into one schedule. `03_converge` flags this as a real constraint but it's a cross-cutting message-strategy problem, not something this artefact resolves.
- Policy controls, auto-execution, group/event booking — out of scope for this direction (D, G,
  and the 12-month step, respectively).
- Exact microcopy — directional, not final.

---

## 2. Chosen form

**An annotated screen-flow storyboard: rough wireframe fidelity, sequenced across time** (day 1, week 2, week 6, day 200), covering the key journey and the state list above — roughly 8–10
frames. Not a high-fidelity interactive prototype.

Why: the bet here is about a sequence and a set of states holding up over time (seed → confirm → wait → signal → act → repeat), not about interaction micro-detail on one screen. A polished
single-screen mockup would hide the part that actually needs proving — that the system's
reasoning is visible and that the loop closes.

Constraint on the decision, not a preference: Figma access wasn't authenticated this session (see `00_setup/output/inventory.md`), so there's no confirmed design-system component set to build a true clickable prototype against. Miro has no board specific to post-booking churn either. A wireframe storyboard doesn't depend on either.

**Recommendation for what to build next, if this artefact is approved:** once Figma access is
confirmed, upgrade Frames 1–3 below into a small clickable flow (3 screens, each with 2–3 states) using the actual B4B component library, so the human check ("hand it to someone outside the pair with no narration") has something to click through rather than only look at. Keep the day-1/day-200 spread and the empty state in that build — they are not optional extras.

---

## 3. The three frames

If a leader sees only these three, the argument still lands:

1. **Frame 1 — First view of booking-pattern suggestions, arrangers and admins only.** Two or
   three suggestions derived from the org's own booking history — not a predicted upcoming trip,
   but a pattern observation ("you usually book this route monthly," "you typically book the day
   before travel"), each with a one-line reason, capped to a manageable number for large orgs,
   plus a callout showing the empty-state variant alongside it. Carries: *the cold-start problem
   is solved without needing to predict a specific trip, and the pattern is legible enough to
   trust.* *(Reframed after `05_pressure-test`: only ~23% of B4B companies book at least monthly,
   so a specific-trip prediction is unreliable for most orgs — a historic-pattern nudge is the
   more defensible starting mechanism.)*
2. **Frame 2 — The signal, inside Bookings and Trips, arrangers and admins only.** A generic,
   loss-framed nudge tied to a specific booking pattern — e.g. "you typically book the day before
   travel; prices tend to rise if you book less than 3 weeks out" — with no dollar-specific
   savings claim (no spend-reporting build backs this), visually distinct from the account's other
   notices. Carries: *there is now a concrete, personal reason to come back — the core bet,
   restated as a pattern-based nudge rather than a trip prediction.*
3. **Frame 3 — Day 200, messy.** Multiple trips at once, mixed sources, mixed stages
   (unconfirmed, confirmed, signalled, booked, dismissed). Carries: *this is a sustained loop at
   real-world scale, not a novelty first-run moment.*

Together: cold start is solved (F1) → a real personal trigger exists (F2) → it holds up as an
ongoing habit, not a gimmick (F3).

---

## 4. Self-check against the stage's Interrogate questions

- **Do the three frames carry the argument alone?** Yes — see above. What they don't carry on
  their own: the empty-state risk (a live reversal condition) and the edited/corrected state.
  Both are in the full storyboard, not just the three frames, because the three are a leadership
  summary, not the whole artefact.
- **What's least resolved, and is that because it's unimportant or hard?** The prediction logic
  and the signal-trigger threshold. Hard, not unimportant — deliberately grey because this
  artefact tests whether the *experience* carries the bet if the algorithm works, not whether the
  algorithm works. That's a `05_pressure-test` and engineering question, not a `04` one.
- **Where does this rely on someone doing something they have no reason to do?** Confirming a seeded trip asks the arranger to trust an unproven guess with no immediate reward. Mitigated by making the "why we think this" reasoning visible and keeping edit friction low (inline edit/dismiss, not a separate form) — but this is a real risk the artefact surfaces, not one it removes.
- **Day 1 vs day 200:** Day 1, an org with thin booking history sees a near-empty pipeline — shown honestly as its own state, not skipped. Day 200 is Frame 3: messy, multi-stage, real.

## 5. Self-check against the stage's blind-spot list

- **Happy path only.** Addressed: empty state, expired/no-action state, and edited/corrected state
  are all in the state list, not just confirm-then-signal.
- **Fidelity substituting for resolution.** The two places a nicer screen could quietly hide the
  hard question are the "why we think this" reasoning line (Frame 1) and the message-schedule
  reconciliation (grey box, flagged, not hidden). Both are named in words even at wireframe
  fidelity, rather than implied by a clean layout.
- **Building backwards from what's easy to prototype.** The signal moment (Frame 2) is the
  hardest part to build for real and the easiest to skip in a mockup. It's resolved at the same
  fidelity as the pipeline list, not left as a placeholder.

## 6. Carried constraints from `03_converge`

- The pipeline is org-visible data, not locked to one arranger's login — a new arranger should
  inherit the list of coming trips. Reflected in the storyboard as an account-level view, not a
  personal "my trips" list.
- No spend reporting, no org-level forecasting in this surface — that's insights/analytics,
  out of scope.
- The signal must not become a fourth, uncoordinated churn-clock message — flagged here for whoever designs the message schedule; not resolved by this artefact.
