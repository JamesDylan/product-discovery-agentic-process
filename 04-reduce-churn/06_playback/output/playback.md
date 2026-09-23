# 06_playback — Reduce Churn: Trip Pipeline + Team Unlock (prep, Fri 25 Sep)

Solo run. Owner: James Scholz. This is preparation for a session that has **not** happened yet.
There is no "decision made" section. After the session, a human appends the decision to
`_shared/decision-log.md`.

Sources, cited in each answer:
- **[F]** `01_frame/output/frame.md`
- **[D]** `03_converge/output/direction.md`
- **[A]** `04_make-tangible/output/artefact-notes.md`
- **[P]** `05_pressure-test/output/pressure-test.md`
- **[L1]** decision log, first `04-reduce-churn` entry (Disruption Radar, rejected)
- **[L2]** decision log, second `04-reduce-churn` entry (Trip Pipeline, live)
- **[J]** James, direct answer during this playback prep (25 Sep prep session)

`_shared/house-view.md` is still empty. Every stage of this run ran on generic judgement. [D] [P]

---

## Where this landed after prep

`03` set a reversal condition before scoring: if orgs with invited self-booking travellers churn
materially less, Team Unlock (D) becomes the direction. [D] James confirmed in `05` that the
condition is met: "Yes. Orgs with invited travellers churn less. Going from 1 user to 2 users is
one of the best predictors of improved retention." [P]

**Resolved: this run recommends both, combined — Trip Pipeline (B) and Team Unlock (D) — not a
straight either/or.** [J] D proceeds because its reversal condition is met. B proceeds alongside
it because it needs its own validation first: "We can do some quick testing and validation to
prove out the biggest risks (ability to predict upcoming travel + impact based on number of
companies)." [J] B is not overriding the reversal condition — it is running in parallel, on its
own proof track, while D moves on the evidence that already triggered it.

**B's mechanism has also changed since `04` was built.** James did the back-test math himself:
roughly 23% of B4B companies book at least once every 30 days, so very few arrangers will ever
have a genuinely predictable upcoming trip in a given 30-day window. [J] Trip Pipeline is
therefore reframed from *predicting the arranger's next trip* to **surfacing booking-timing and
policy suggestions derived from the org's own historic booking patterns** — e.g. "You always book
the day before travel. Booking 3 weeks out would be cheaper." [J] This is a lower-risk starting
mechanism: it does not require prediction to work, only pattern detection over data B4B already
has. `04_make-tangible/output/artefact-notes.md` has been updated to match. [A]

James owns the Anna Bondarenko experiment boundary question directly, as part of taking D
forward: "Yes — D is the fallback, I'll own that boundary." [J] D's other open kill reasons from
`03` still stand and are not resolved by this playback: the invite/self-book mechanism already
ships and churn persists on its own; its adoption message risks cutting arranger sessions. [D]

---

## The decision requested of leadership

**Approve a combined direction — Team Unlock (D) now, and a reframed Trip Pipeline (B) as a
parallel, lower-cost validation track — so a plan-ready scope exists by 9 October. Approve it on
4 conditions:**
1. A back-test on booking history runs first for B. It tests whether historic booking patterns
   (timing, route regularity) can be reliably detected — not whether a specific upcoming trip can
   be predicted. [P] [J]
2. The churn effect for both B and D is proven only by a 50/50 A/B test, assigned per
   organisation. [P]
3. The GDPR and opt-in check is done before any A/B test starts on real European users. [P]
4. James owns closing the boundary question with Anna Bondarenko's experiment before D ships. [J]

Answer wanted: **yes, no, or yes with a changed condition.** Not "thoughts".

**If no decision is made:** Engineering exploration cannot start on a direction. The brief expects
a plan-ready scope by 9 October. [accelerator brief]

**If leadership says no to the combined direction:** proceed on D alone — its reversal condition
is independently met and does not depend on B. Park the reframed B (historic-pattern nudges) as a
lower-cost follow-on once D is shipped and the Anna Bondarenko boundary is closed. *(This fallback
follows from the material but was not itself put to James as a direct question in this prep pass
— confirm it holds before Friday.)*

---

## Suggested running order (about 45 minutes)

1. **The recommendation and the ask** (3 min). Combined B+D, the 4 conditions, the yes/no ask.
2. **The trade-off, stated early** (3 min). Reach, stated as in answer 4. Then why this isn't a
   straight either/or — B's own validation track, D's reversal condition already met.
3. **The experience** (8 min). The three frames, now pattern-nudge framed and loss-framed. Let
   them carry the argument. [A]
4. **The problem and the evidence** (5 min). One sentence, then the 51% → 71% number and its
   limits, then the ~42% vs ~62% multi-user churn split. [J]
5. **Alternatives and why the rest died** (5 min). Two converge passes. Say why the first one
   failed, and why D moved from "killed" to "combined" between `03` and this playback.
6. **Risks, classified** (8 min). Lead with measurement. Then prediction (now reframed as pattern
   detection), then motivation.
7. **Engineering questions** (5 min). The 7 questions below, including the reframed back-test ask.
8. **12 months** (3 min). Led by D's horizon, B as near-term proof point.
9. **Ask again and write the decision down** (5 min). Into the log, before leaving the room.

---

## 1. What problem did we ultimately decide we are solving?

> Arrangers in multi-user orgs drift towards regrettable churn once they go 30 days without a
> session. Today the post-booking space gives them no small, useful reason to come back between
> bookings that does not depend on fixing invoicing and expenses first. [F]

- Invoicing and expenses are the confirmed root cause. They are split into a separate track. [F]
- Human check still due: James has not read this sentence aloud as a whole. [F]

## 2. What informed our thinking? (evidence, not activity)

- Churn risk climbs from 51% to 71% in the 30 days after a user's last **session**. From the last
  **booking** it moves only from 51% to 54%. Source: DSA analysis. [F] [P]
- Risk reaches 90% after 120 days with no session. [F]
- Regrettable churn is about 5–6% of churners, but 32% of lost booking volume. [F]
- Churn Departures job, in customer words: "Give me a reason to come back between bookings." [F]
- Regrettable churners are mainly multi-user arrangers. Marzena: "Yes, confirmed". [P]
- 358,512 companies made a business booking. 149,185 (41.61%) booked again within 30 days at
  least once. Only about 1,000 did so in every one of 12 months. [P]
- Only roughly 23% of B4B companies book at least once every 30 days — the reason B's mechanism
  moved from trip-prediction to pattern-based nudges (see above). [J]
- SOL-era booking history is "queryable per traveller/route". [P]
- Multi-user orgs churn at about 42% vs about 62% for single-user orgs (James). **This is the
  headline figure for the room.** [J]

**Limits on this evidence — say them before being asked:**
- It is correlation. No evidence separates "no session caused churn" from "no travel caused
  both". The A/B test is the only cause test. [P]
- The 30-day curve is measured "across the entire base". The multi-user cut is assumed: "we can
  assume the same applies to the 30 day window." [P]
- The raw DSA decks were not opened in this run. [F]
- The 41.61% figure is "at least once in 12 months", not a typical 30-day window — do not present
  it as a monthly reach number. [P]

## 3. What alternatives did we seriously consider, and why was each killed?

**First converge pass — rejected at human check.**
- Chose Disruption Radar over Traveller Signal Loop, Autopilot and Digest, Trip Health Score and
  Change-Request Approvals. [L1]
- James rejected the option set: disruption frequency is too low to bring arrangers back. [L2]
- Lesson carried into pass 2: business outcome now counts trigger frequency. Pass 1 scored
  Disruption Radar 4 there, which was wrong. [D]

**Second pass on the v2 set — scores (out of 25):** B 18, F 16, D 14, G 14, A 12, C 11, E 8.
The margin is small. The eliminations carry the call, not the scores. [D] **D's score reflected a
"killed" verdict at the time of scoring — that call changed once `05` confirmed D's reversal
condition. D is now combined with B, not eliminated.** [P] [J]

| Option | Why it was killed (or, for D, why it's now combined) | Source |
|---|---|---|
| A. Traveller Roster | Trigger is a backlog, not a stream. After the first clean-up it has F's frequency problem. Its sessions do not lead to bookings. | [D] |
| C. Rate Lock | Price-risk ownership sits with commercial and finance, outside this run. It needs B first. Sequenced as the 12-month step, not dropped. | [D] |
| D. Team Unlock | Scored lowest of the two finalists at converge time, but its reversal condition — orgs with invited travellers churn materially less — was confirmed in `05`. **Now combined with B as the primary direction.** Open kill reasons still stand and are not waived: invite/self-book already ships and churn persists on its own; adoption message risks cutting arranger sessions; the Anna Bondarenko boundary is James's to close before ship. | [D] [P] [J] |
| E. Booker Rewards | Only moves when the arranger books (F's frequency problem). Puts more value on one person. Many policies ban personal rewards for company spend. | [D] |
| F. Disruption Radar | "Disruption isn't high enough to cover users logging back in." May return later as one signal on B's surface. | [D] |
| G. Autopilot and Digest | Its bet (fewer, calmer sessions) has no evidence and points against 51% → 71%. Needs policy controls. Kept only as a possible delivery channel. | [D] |

## 4. What direction are we recommending, and why?

**Direction: combined B + D.**
- **B — Trip Pipeline, reframed as historic-pattern booking suggestions.** B4B surfaces
  booking-timing and policy suggestions from the org's own historic booking data — not a
  predicted upcoming trip, but an observed pattern (e.g. "you always book the day before travel;
  3 weeks out would be cheaper"). [D] [J]
- **D — Team Unlock.** Move orgs from one arranger to invited, self-booking travellers, per the
  reversal condition confirmed in `05`. [D] [P]

**Why both, together:**
- D proceeds because the evidence that was set in advance to trigger it has now triggered it. [D] [P]
- B proceeds alongside it, on its own validation track, because it is the option whose reason to
  return recurs without a disruption and without requiring an org to add users. [L2] Its sessions
  sit next to a booking, not only inside an org-growth mechanism. [L2]
- Reframing B around historic patterns (not prediction) removes its main pressure-test weakness —
  it no longer depends on most orgs having a clean, predictable next trip. [J]
- It is the base that Rate Lock (C) needs in 12 months, alongside D's org-growth engine. [D]

**The trade-off, stated plainly:**
> We are recommending two directions at once rather than picking one, which costs focus and
> Engineering bandwidth up front. In exchange we do not bet the whole recommendation on a single
> mechanism: D is the direction the evidence already points to; B is a cheaper, pattern-based
> validation track that can be tested in parallel and folded in or dropped based on its own
> back-test, without waiting on D to prove itself first. [D] [L2] [J]

**What changed since `04` that the room must hear:**
- B's original personal-gain framing ("a better price, and no blame for a price rise") did not
  survive `05`. James: "I dont think many need to report on price rises." [P] The replacement gain
  ("proof of savings from acting early") also could not be shown honestly without a spend-
  reporting build this run is out of scope for. [P] **Resolved:** no dollar-specific savings claim.
  The message is generic and loss-framed — "prices tend to rise if you book less than 3 weeks
  out" — not a computed personal number. [J]

## 5. Show the proposed experience — the three frames

Form: an annotated wireframe storyboard across day 1, week 2, week 6 and day 200. Not a clickable
prototype, because Figma access was not authenticated. [A]

1. **Frame 1 — First view of booking-pattern suggestions, arrangers and admins only.** Two or
   three suggestions derived from the org's own booking history, each with a one-line reason
   ("you usually book this route monthly," "you typically book the day before travel"), capped to
   a manageable number for large orgs. An empty-state variant sits beside it. Carries: *the
   cold-start problem is solved without needing to predict a specific trip, and the pattern is
   legible enough to trust.* [A] [J]
2. **Frame 2 — The signal, inside Bookings and Trips, arrangers and admins only.** A generic,
   loss-framed nudge tied to a specific booking pattern (no dollar-specific claim), visually
   distinct from the account's other notices. Carries: *a concrete, personal reason to come back
   — restated as a pattern-based nudge rather than a trip prediction.* [A] [J]
3. **Frame 3 — Day 200, messy.** Many suggestions and signals at once, mixed sources, mixed
   stages (unconfirmed, confirmed, signalled, booked, dismissed). Carries: a sustained loop at
   real scale, not a first-run novelty. [A]

**Deliberately grey:** the pattern-detection logic itself, the price-watching mechanism, and the
message schedule across the existing churn clocks. [A]

**Updated to match `05`, before Friday:** visibility restricted to arrangers and admins (not
org-wide), a cap on suggestions shown for large orgs, loss framing on the signal, and the
historic-pattern mechanism replacing trip prediction. `artefact-notes.md` reflects all four. [A] [J]

## 6. What assumptions or risks remain? (classified)

**The mess that matters here: measuring churn on this timeline.** [P]
- Churn ("no bookings in 365 days", per organisation) cannot be measured in this run.
- Leading indicator (James's call): share of cohort with a 30-day session gap. Same unit as churn.
- Sub-metrics proposed by `05`, still not formally agreed in the decision log: back-test hit rate
  (now reframed — see below); share of orgs with at least 1 actionable suggestion; confirm/edit/
  dismiss rate; signals per org per 30 days; sessions started from a signal; bookings made
  following a suggestion.
- Nothing predicts the churn effect before the A/B test reads. The link rests on 51% → 71%.
- **Back-test reframed.** `03`'s original threshold ("about half of arrangers have a predictable
  trip per 30 days") is obsolete: only ~23% of B4B companies book monthly, so very few will ever
  have a clean predictable next trip. [J] The back-test now asks a different question — can
  historic booking patterns (timing regularity, route regularity) be reliably detected at all,
  for a usable share of the cohort — not whether a specific upcoming trip can be predicted. No
  kill threshold is set for this reframed test yet; set one before running it, not after seeing
  results, so it isn't fitted to the data. [J] [P]

**Fix before Friday — status** [P] [J]
- B vs D call: **resolved — combined, not either/or.**
- "No blame" → "proof of savings" → **resolved — generic loss-framed message, no dollar claim.**
- Gain vs loss framing: **resolved — loss framing.**
- Visibility "Arrangers and admins only"; cap on suggestions shown: **resolved — artefact updated.**
- 42%/62% vs 52%/19% figures: **resolved — 42%/62% (multi- vs single-user) is the headline figure.**
- Mechanism (predict vs pattern-detect): **resolved — reframed to historic-pattern detection.**

**Declare as known risk** [P]
- No confirmed kill threshold yet for the reframed back-test — must be set before it runs.
- Prediction is unproven and now de-scoped in favour of pattern detection, but pattern detection
  itself is also unproven at this stage: "we haven't done any kind of ML or logical prediction,
  ever." Lilly's objection — softened by the reframe, not eliminated. James agrees she has a real
  point. [P]
- It may help orgs that were coming back anyway. Predictable-pattern orgs and returning orgs may
  be the same group. The A/B test is the guard.
- Reach is narrow on B alone: about 1,000 companies return every month with high regularity.
  D widens reach by growing users per org rather than depending on booking regularity.
- Session-to-churn is correlation. The multi-user 30-day curve is assumed.
- GDPR and opt-in not checked. Must be done before the live A/B test.
- Mess cases not asked: arrangers in several companies, contractors and leavers, multiple
  entities and mergers, self-booked duplicates of a suggested pattern.
- D's open kill reasons (invite/self-book already ships and churn persists; adoption message
  risk) are not waived by combining with B — they still need answering before D ships. [D]

**Accepted, with reason stated** [P]
- Message-schedule risk (a fourth churn clock): "Accept the risk and ship anyway". **No reason
  given.** Leadership may ask for one.
- Price drops after a "book now" signal: "Accept it as a cost of the feature".
- One-person companies see nothing from B. Out of scope for B; D is the org-growth path that
  eventually brings them in.

## 7. What now needs working through with Engineering?

From `05` [P] and the mechanism reframe [J], with the constraint from `03` [D]:
1. Can historic booking-pattern detection (route regularity, timing regularity) be built
   reliably from existing booking data, without a prediction model? *(Replaces the original
   "periodic search for unbooked trips" framing.)*
2. What would robust price watching need for the pattern-nudge signal? Does it need a
   Booking.com API change, with its 3–6 month lead time?
3. What is the source for flight price watching?
4. Is a simple repeat-pattern rule (same route, same traveller, monthly or quarterly; or same
   days-before-departure booking habit) enough for the reframed back-test?
5. Can "share of cohort with a 30-day session gap" be measured per organisation from today's
   session events?
6. Can the 50/50 A/B test be assigned per organisation, with a clean holdout, for both B and D?
7. How do B's and D's signals go through one message schedule with the 3 existing churn clocks,
   instead of adding a fourth? [D] [A]

No engineer has confirmed the pattern-detection prototype route. [P] [J]

## 8. What does this domain look like in 12 months? (draft — `08` builds it properly)

Sketched from `03`'s horizon section, re-centred on D per James's steer. [D] [J]
- **One sentence:** "B4B spreads travel ownership across the org, and helps every arranger get
  ahead of travel rather than only clean up after it." Falsifiable: orgs may not want to widen who
  books, or arrangers may not act on pattern-based suggestions.
- **Team Unlock (D) is the primary horizon.** Value spreads across the org as more people book —
  more sessions, less concentration of churn risk in one arranger. This is the load-bearing
  12-month story.
- **Trip Pipeline (B), reframed as pattern-based suggestions, is the near-term proof point** that
  sits underneath it — the first surface that gives any single arranger, invited or not, a reason
  to return between bookings.
- **Rate Lock (C)** becomes possible once B's pattern data matures into real trip visibility. It
  still needs commercial and finance to own price risk.
- **Group and event booking:** the offsite with 6 names becomes a natural Team Unlock case first,
  with B's pattern surface as a supporting signal.
- **One surface, more signals:** disruptions (F) and policy exceptions (D's own adoption
  mechanism) become signals on the same surface, once policy controls ship.
- **Boundaries held:** no spend reporting, no org-level forecasting. That stays with insights and
  analytics, Serko.ai and the Platform.
- **Condition:** if D's invite mechanism keeps shipping without moving churn (as `03` notes it
  already has), the horizon depends on the adoption-message and Anna Bondarenko boundary work
  actually landing — not on the mechanism existing.
- **Not covered:** the account that goes dark when its one arranger leaves and never invites
  anyone. The invoicing and expense track sits beside this, not inside it. [F] [D]

---

## Interrogate before the session

**The question we hope they don't ask — prepare it first:**
> "You're recommending two directions instead of one. Isn't that just avoiding the hard call?"
- Answer: no — D proceeds because its own reversal condition, set in advance, was met. B proceeds
  on a separate, cheaper validation track that doesn't block D and can be cut on its own evidence.
  This is a sequencing decision, not a refusal to decide. [J]
- Second question, from Lilly: "You have never built prediction, or now pattern detection either.
  Why should we believe it works?" The honest answer is the back-test plus the A/B test, not a
  claim. [P]

**Where we might present activity as evidence:**
- Seven options, two converge passes and a scoring table are activity. They do not show that
  arrangers will come back. The scores are close (18 vs 16); the eliminations — and now D's
  reversal — carry the call, not the scores. [D]
- The storyboard shows the experience works **if** pattern detection works. It does not test
  pattern detection. [A]
- 51% → 71% is prediction, not cause, and not cut for the cohort. [P]
- 41.61% sounds like reach. It is "at least once in 12 months", not a typical month. [P]
- "Accept the risk" on the message schedule, with no reason, is a gap, not a decision. [P]

**If they decide in 3 minutes, what did the other 40 add?**
- Getting the combined B+D direction and its sequencing on the table, so the decision survives
  Engineering.
- Agreeing the conditions: reframed back-test kill threshold, A/B test design for both tracks,
  GDPR before launch, and James owning the Anna Bondarenko boundary.
- Handing Engineering the 7 questions, so exploration starts on 26 Sep, not after another meeting.
- Getting leadership's view on the spend-reporting boundary and the message-schedule risk that
  has no stated reason yet.
- If none of these happen, the other 40 minutes were a showcase. The brief says this is a
  decision point.

---

Also still due from `01`: read the problem statement aloud as a whole and confirm it. [F]
