# 03_converge — Direction (Reduce Churn: post-booking micro-conversions)

**Second pass, 2026-09-23.** Converges on the seven-option `02_explore` v2 set. The first pass
chose Disruption Radar. James rejected the option set, not the logic. That file is replaced.

Solo run. James Scholz owns the call. No design partner. This file is the analytical work a pair
would do together. The human check is the trade-off sentence, read back to James.

`_shared/house-view.md` is still empty. This call runs on generic product judgement plus
James's stated objections. It encodes no house opinion beyond that.

---

## The call

**Direction: B — Trip Pipeline, seeded from booking history.**

B4B shows the arranger the trips that are coming but not yet booked. It watches price and
availability for them. It sends a signal when something changes that the arranger can act on.
The signal lands in Bookings and Trips.

The chosen form has one change from `02`'s version. The pipeline does not start empty. B4B
proposes likely trips from repeat patterns in booking history (the monthly route, the quarterly
offsite, the same 4 people to the same city). The arranger confirms, edits or adds. This answers
B's own weak point: "Nobody fills in a form for the product's benefit."

**What the arranger gets:** a better price, and no blame when a price rises while they wait.
This names the arranger's personal gain that `01_frame` left open.

---

## 1. Scoring against the brief's criteria

Criteria: customer value, simplicity, business outcome, speed to value, known constraints.
1 (weak) to 5 (strong). **Equal weights, set before scoring.**

One rule set before scoring, from the first pass's mistake. **Business outcome includes trigger
frequency:** how often the option creates a reason to return inside 30 days, per arranger, with
no disruption needed. The first pass scored Disruption Radar 4 here. James's rejection showed
that was wrong.

| Option | Customer value | Simplicity | Business outcome | Speed to value | Known constraints | Total |
|---|---|---|---|---|---|---|
| A. Traveller Roster | 3 | 2 | 2 | 3 | 2 | 12 |
| **B. Trip Pipeline** | **4** | **3** | **4** | **3** | **4** | **18** |
| C. Rate Lock | 4 | 1 | 4 | 1 | 1 | 11 |
| D. Team Unlock (surfacing bet) | 3 | 4 | 2 | 3 | 2 | 14 |
| E. Booker Rewards | 2 | 2 | 2 | 1 | 1 | 8 |
| F. Disruption Radar | 3 | 4 | 1 | 4 | 4 | 16 |
| G. Autopilot and Digest | 4 | 3 | 1 | 3 | 3 | 14 |

The highest scorer is chosen. The margin is small: B 18, F 16, D and G 14. The scores do not
carry this call. The eliminations below carry it.

**How D was scored — not as a new idea, not as a proven feature:**
- Simplicity 4: invite and self-book already ship. Only the surfacing layer is new.
- Speed to value 3, not 5: the queue's one arranger-specific trigger is a policy exception.
  James said "we *will* have policy controls." So policy controls are not confirmed as shipped.
  The exception queue waits on them.
- Business outcome 2: the mechanism already exists, and the churn gap exists anyway. That is
  weak evidence against D, not neutral. No usage data says the gap is surfacing, not value.
- Known constraints 2: the Anna Bondarenko experiment boundary is not checked. The policy
  controls dependency sits outside this run.

**Why F scores 16 and is still out:** F is simple and fast. The brief's criteria reward that.
But F's frequency is the exact thing James rejected. A score this high for a rejected option is
a warning that simplicity and speed can outvote the one criterion that matters here.

---

## 2. Eliminations

Each reason must survive a rebuttal. The rebuttal is stated with it.

**A. Traveller Roster — out.**
- Reason: its trigger is a backlog, not a stream. The first visit fixes the missing loyalty
  numbers. Then the gaps are gone. Passports last about 10 years. For a roster of 20 people,
  that is about 2 expiries a year. After the first clean-up, A has a frequency problem like F's.
- Second reason: its sessions do not lead to bookings. Fixing a profile in an org that has
  stopped travelling creates a session and no revenue. This is the frame's "correlation, not
  cause" trap.
- Rebuttal: "It is the only option that works when the org books nothing." Answer: an org that
  books nothing is churning for a reason this surface cannot fix. A session there does not save
  the account.
- Not the kill reason: GDPR and passport data for non-users. That is real, but it is a cost, not
  the reason. A would be out without it.

**C. Rate Lock — out for this run. Sequenced after B.**
- Reason: someone must own price risk: the supplier, Serko, or Booking.com. That decision sits
  with commercial and finance, outside this run's sphere of influence (Bookings and Trips). A
  direction the owner cannot act on fails the "ownable" test in `vision-principles.md`.
- Second reason: C needs B first. You cannot lock a rate for a trip B4B does not know about.
- Rebuttal: "The return visit is part of the product, not a nudge." True, and it is the best
  mechanism in the set. That is why it is the 12-month step, not dropped.

**D. Team Unlock (surfacing bet) — out as the direction. Its open fact goes to `05`.**
- Reason 1: the mechanism already ships, and churn persists. The burden of proof is on
  "surfacing is the gap". No evidence meets it.
- Reason 2: the only trigger that needs the arranger is a policy exception. Policy controls are
  "will have", not shipped. Without them, D's queue has self-book notices and profile changes —
  things to read, not things to act on.
- Reason 3: D's adoption message works against the run's leading indicator. "Invite the rest to
  take booking work off your plate" means fewer arranger sessions, by design.
- Reason 4: the boundary with Anna Bondarenko's experiment is not checked. `02` said `03` must
  check it before choosing D. This stage cannot check it from its inputs.
- Rebuttal: "It is the cheapest option." Cheap to ship does not matter if shipping does not move
  the metric. The cheap test for D is a data query, not a build. It is in the reversal
  conditions below.

**E. Booker Rewards — out.**
- Reason 1: progress only moves when the arranger books. It has the trip-frequency problem that
  killed F. `02` names this risk itself.
- Reason 2: it puts even more value on one person. See the single-arranger question below. If
  the arranger leaves, the status leaves with them.
- Reason 3: many customer policies ban personal rewards for company spend. Moving the reward to
  the org removes the personal pull that was the point.
- Rebuttal: "Hotel booker programmes prove the booker is worth rewarding." They reward the
  booker for *booking volume*. That is a booking-frequency lever, not a session-frequency lever.
- Not the kill reason: "it feels like a gimmick" or "Booking.com must sign off." Both are true.
  E is out without them.

**F. Disruption Radar — out as the direction.**
- Reason: James's objection, and it holds. "Disruption isn't high enough to cover users logging
  back in." A lever that fires for a small slice of arrangers per month cannot close the gap.
- Rebuttal: "When it fires, the reason is strong." Yes. It can be one of the signals on B's
  surface later. It is not part of this call.

**G. Autopilot and Digest — out as a bet. Allowed only as a delivery channel.**
- Reason 1: its bet is that fewer, calmer sessions protect against churn. No loaded evidence
  supports that. The one number the run has (51% → 71% after 30 days without a session) points
  the other way.
- Reason 2: auto-executing in-policy changes needs the same policy controls D waits on.
- Rebuttal: "Regrettable churners may leave because the product feels like work." Possible, and
  untested. If `05` finds it, that is a reason to re-open the frame, not to switch option here.
- A weekly digest can carry B's signals. That is a delivery choice for `04`. It is not a second
  bet stapled on.

---

## 3. The trade-off

**We are choosing Trip Pipeline, which means we accept worse reach: an arranger whose org has
no trip coming up gets no reason to return, and this run does nothing for the account that goes
dark when its one arranger leaves.**

**This is right *if* arrangers in multi-user orgs know about enough trips at least 2 weeks
before they book — or booking history can predict them — and a price or availability signal on
one of those trips is enough to bring the arranger back.**

**We reverse this if** `05_pressure-test` shows any one of these:
- Fewer than about half of target-cohort arrangers have a known or predictable future trip in a
  typical 30-day window. (Threshold proposed here. `05` sets the final number.)
- Booking history does not predict repeat trips well enough to seed the pipeline, *and*
  arrangers do not add or confirm maybe trips. Then B is a form nobody fills in.
- Price and availability for the cohort's typical trips are too flat to give an honest signal.
  A signal that says "nothing changed" is noise, and adds a fourth churn clock for nothing.
- Orgs where travellers are invited and self-book churn materially less than single-arranger
  orgs. **Then D becomes the direction**, and the single-arranger model is the real lever.

---

## 4. The 12-month horizon

- **Opens options.** B is the base C needs. Rate Lock in 12 months is only possible if B4B
  knows the trip before it is booked. B also opens group and event booking: the offsite with 6
  names is a pipeline item first.
- **Step on a path, not a local optimum** — on one condition. If the pipeline stays manual and
  empty, it is a local optimum: a form. The history seeding is what makes it a path.
- **Does not close D or F.** Policy exceptions and disruptions can become signals on the same
  surface later, when policy controls ship and D's data question is answered.
- **If only this ships, does the vision still hold?** Yes. The one-sentence version: *"B4B helps
  the arranger get ahead of travel, not only clean up after it."* That is falsifiable. Arrangers
  may not plan ahead, and `05` can show it. It is connected to today: the bridge is booking
  history B4B already holds.
- **Boundaries to hold.** No spend reporting and no org-level forecasting. That is insights and
  analytics, which overlaps Serko.ai and the Platform (out of scope). B does not touch invite or
  relationship data, so it stays off Anna Bondarenko's and Zac Ma's experiment ground.
- **Churn clocks.** Three unreconciled churn clocks already run. B's signals must go through
  one message schedule, not add a fourth. That is a constraint for `04`, stated here so it is
  not lost.

---

## 5. The single-arranger question (raised by `02`, unresolved there)

**Is the single-arranger model itself a churn risk?** Probably yes. All value sits with one
person. When that person leaves the company or stops caring, the account goes dark, whatever
the product does. No loaded evidence sizes this. Arranger turnover is not in `01_frame`'s
numbers.

**Does it change how D and E are weighed?**
- **E: yes, it strengthens the kill.** E puts more value on the one person. It raises this risk.
- **D: it is the strongest argument for D, but it does not flip the call.** D is the only option
  that spreads value across the org. But the invite mechanism already exists. If it protected
  accounts, the gap would show it less. The test is cheap: compare churn for orgs with invited
  self-booking travellers against single-arranger orgs. That comparison is the last reversal
  condition above.
- **B: a partial answer.** The pipeline is org data, not the arranger's memory. A new arranger
  inherits the list of coming trips. `04` should keep it that way — visible to the org, not
  locked to one login.

**One more flag for `05`.** This question also challenges the leading indicator. The run tracks
*arranger* sessions. Churn (no bookings in 365 days) is measured per account. If travellers book
for themselves, the account can be healthy while the arranger's sessions drop. `05` should check
which unit the 51% → 71% number uses.

---

## 6. Blind spots

- **False consensus.** No partner to disagree with. The main risk is agreeing with the owner:
  pre-booking was one of James's own angles. Check: B was not chosen because James raised it.
  C and E also came from James's angles and are out. G, which argues against the run's own
  metric, was scored on the same terms.
- **Anchoring.** The most-discussed option in the v2 file is D: it has the correction note and
  the longest assumption list. It is not chosen. The first-pass anchor, F, is out. But B was the
  first new option in pass 2, and `02` flagged that B has F's shape: it still needs a trip, just
  a future one. That is true. It is the cost named in the trade-off sentence, not hidden.
- **Scoring to justify.** Equal weights and the frequency rule were set before scoring. The small
  margin (B 18, F 16) is shown, not smoothed. F's high score for a rejected option is left in as
  evidence that the criteria can mislead.
- **Dodging the hard option.** C (commercial risk) and A (legal risk) are the hard ones. Neither
  is out because engineering or legal "won't like it." C is out on ownership and sequence, and
  is the 12-month step. A is out on frequency. Build cost is `07`'s call, not this stage's.

---

## Open for `05_pressure-test`

- How many cohort arrangers have a known or predictable future trip per 30-day window.
- Whether booking history predicts repeat trips well enough to seed the pipeline.
- Whether price and availability move enough on the cohort's typical trips to give an honest signal.
- Churn for orgs with invited self-booking travellers vs single-arranger orgs (D's reversal test).
- Whether the 30-day session number is per user or per account.
