# 05_pressure-test — Reduce Churn: Trip Pipeline

Solo run. Interrogated: James Scholz (Product), 2026-09-23. Answers were relayed by the
orchestrator as James's exact words. Text in quotation marks is James. Everything else is this
stage's analysis.

`_shared/house-view.md` is still empty. This stage ran on generic judgement.

---

## Headline

**`03_converge` set a reversal condition before scoring: "Orgs where travellers are invited and
self-book churn materially less than single-arranger orgs. Then D becomes the direction."**
James's answer to that test:

> "Yes. Orgs with invited travellers churn less. Going from 1 user to 2 users is one of the best
> predictors of improved retention"

The condition `03` wrote is met, as `03` stated it. Trip Pipeline (B) is now contested by Team
Unlock (D). This stage does not make that call. James must make it at the human check, before
`06_playback`. See "What changed".

Two caveats keep this from being an automatic switch:
- The evidence is correlation. Orgs that grow to 2 users may be healthier to begin with. That is
  the same "correlation, not cause" trap this stage applies to the 30-day session signal.
- D's other kill reasons in `03` still stand. The invite mechanism already ships and churn
  persists. D's message ("invite the rest") works against arranger sessions. The boundary with
  Anna Bondarenko's live experiment (converting self-bookers into arranger recruiters) is not
  checked. "Encourage 1 → 2 users" sits very close to that experiment's ground.

---

## 1. Load-bearing assumptions

| # | Assumption | Evidence now | Verdict |
|---|---|---|---|
| 1 | A 30-day session gap predicts 365-day churn for the cohort | Unit confirmed: "Per organisation (account - but we call them organisations)". The curve is "across the entire base". The multi-user cut is inferred, not measured: "Multi user orgs churn at appx ~42% vs ~62% for single-user orgs. So we can assume the same applies to the 30 day window." | Partial. The multi-user 30-day curve is an assumption. |
| 1b | No session *causes* churn (vs. no travel causing both) | James: "days-since-last-session is a much better predictor of churn than days-since-last-booking … 51% -> 54% … 51% -> 71%. As per DSA analysis" | Not separated. The answer shows prediction, not cause. The A/B test is the only cause test. |
| 2 | Bookings and Trips is the right surface | Not asked directly. Indirect: arrangers "have higher booking frequency, so are more likely to log in multiple times." | None. Declared. |
| 3 | Enough cohort orgs have a predictable trip in a 30-day window | "358,512 companies made a business booking, and 149,185 of them — 41.61% — booked again within 30 days of a previous booking at least once." Repeat across windows drops fast: "72k … 1 month … 29k with 2 months, 15k with 3 months... only 1000 had 12 months". | Below `03`'s proposed ~50%, and 41.61% is "at least once in 12 months", not "in a typical window". In a typical window it is lower. James retargets: "these are probably our most important and high value customers, so are the ones worth targeting". |
| 4 | Booking history predicts repeat trips | Data is available: SOL-era history is "queryable per traveller/route". Prediction is unproven: "we haven't done any kind of ML or logical prediction, ever." | None. The back-test is the test. |
| 5 | Prices move enough for an honest signal | None yet. Prototype route: "running a search periodically". | None. Hand to Engineering. |
| 6 | Regrettable churners are mainly multi-user arrangers | Marzena: "Yes, confirmed" | Closed. `01`'s flag #4 is resolved. |

**Number discrepancy to resolve before Friday.** James gives multi-user vs single-user churn as
"~42% vs ~62%". `product-context.md` gives "52% annual churn vs 19% at 10+ users". These may be
different cuts (multi-user vs 10+ users; different periods). Both cannot go on the same slide
without a note on which definition each uses.

---

## 2. Measuring churn on this run's timeline (run-specific note)

- **Churn itself cannot be measured in this run.** It is "no bookings in 365 days", per
  organisation.
- **Primary leading indicator (James's call):** "Share of cohort with a 30-day session gap".
  It uses the same unit (organisation) as the churn definition. The per-user vs per-account risk
  from `03` is closed.
- **Sub-metrics to track under it** (this stage's proposal, not yet agreed by James):
  - back-test hit rate: share of seeded trips that actually happened in the next month
  - share of cohort orgs with at least 1 seeded trip
  - confirm / edit / dismiss rate on seeded trips
  - signals fired per org per 30 days
  - sessions started from a signal
  - bookings made from a pipeline item
- **Can we predict the benefit before committing?** Partly.
  - The back-test predicts whether seeding works. James: "Yes, but decide the threshold after
    seeing results".
  - The A/B test measures whether it changes behaviour. James: "Yes. we will run a 50/50 a/b
    test". This also separates real lift from the ~50% "sure things" who return anyway.
  - Nothing predicts the churn effect before the A/B test reads. That link rests on the
    51% → 71% correlation.
- **Risk:** no kill threshold is set for the back-test, and no final number replaces `03`'s
  ~50% reversal threshold. A threshold set after the results can be fitted to them. See the
  risk table.

---

## 3. Pre-mortem — 12 months on, it shipped and failed

1. **It helped orgs that were coming back anyway.** The orgs with predictable patterns are the
   41.61% that already return within 30 days. Drifting orgs see an empty pipeline. **Visible
   today:** yes. James's own numbers show predictability and return behaviour are the same
   group. The 50/50 A/B test is the guard.
2. **Prediction did not work.** B4B has never built prediction. Seeded trips were wrong, and
   arrangers ignored them. Then B became the form nobody fills in (`03`'s second reversal
   condition). **Visible today:** yes. Lilly's objection, which James says is right.
3. **Signals felt like pressure, or joined the noise.** Loss-framed "book now" messages ran
   alongside three unreconciled churn clocks. Arrangers muted them. **Visible today:** yes.
   James accepted the message-schedule risk.

---

## 4. Motivation test — in James's words

**Confirm a seeded trip (day 1):**
> "Honestly, we don't have a real answer yet"

This step has no answer. It is the first step of the key journey. Declared as a known risk.

**When a price rises / the signal:**
> "We can flip it around and say something like:- Prices generally increase 3 weeks before your
> date- Or: Supply is dropping. Book now to save price increases. Frame it around a saving. But
> in all honesty, people experience pain more than they experience benefits. So saying you might
> lose $1,000 if you don't book now will be more effective than saying 'book now and save
> $1,000.'"

This contradicts `04`, which says the signal is "framed as a gain, not a warning". James prefers
loss framing because it works better. The two must be reconciled before Friday.

**Who blames the arranger, and what removes the blame:**
> "Arrangers have to report on travel spend (some do anyway - the larger organisations). I dont
> think many need to report on price rises or loss due to decision delay. But they certainly will
> want to show if they've saved money by being proactive."

This breaks half of the direction's named personal gain. "No blame when a price rises while they
wait" has no blamer. The gain that holds is **proof of savings from acting early**. That gain
needs a record of savings. `03` and `04` put spend reporting out of scope because it overlaps
insights and analytics, Serko.ai and the Platform. So the real personal gain sits next to a
boundary this run said it would not cross.

---

## 5. Mess test

| Case | Finding | Sort |
|---|---|---|
| Bad actor joins the company | Pipeline visibility is now "Arrangers and admins only". This replaces `04`'s "org-visible". A new arranger still inherits the list. | Fix now |
| 4,000-person org | "Cap seeded trips shown" | Fix now |
| Migration of existing companies | SOL-era history is "queryable per traveller/route" | Closed |
| One-person companies | Out of scope (`01`). Thin history means an empty pipeline. They will still see the empty state. | Accept: not the target segment |
| Arranger in several companies | Trips may be seeded into the wrong org. Not asked. | Declare |
| Contractors and ex-employees in history | Trips proposed for people who have left. Not asked. | Declare |
| Multiple entities, mergers | A pattern splits across companies, or duplicates after a merge. Not asked. | Declare |
| Traveller self-books a pipeline trip | Double booking, or a stale confirmed trip. Not asked. | Declare |

---

## 6. Technical assumption check

- **Price watching:** "No, but we can prototype this easily by just running a search
  periodically. For the sake of proving the value, we can do that before we need to come up with
  a more robust option." No engineer has confirmed this. The 3–6 month Booking.com API lead time
  still applies to the robust version.
- **Booking history:** "Yes, queryable per traveller/route". Closed.
- **Message schedule:** James selected "Accept the risk and ship anyway". He gave no further
  reason when asked. This is recorded as accepted without a stated reason.

---

## 7. The sceptic

- **Who and what:** "Lilly on the value of prediction as a lever, and if we can actually do it."
- **Are they right:** "Yes, they have a real point." "Firstly, we haven't done any kind of ML or
  logical prediction, ever. So the ability to do that is unproven. And secondly, we don't have any
  data points to say that this will actually work."

The owner agrees with the sceptic on both counts. The Friday answer to Lilly is the back-test
plus the A/B test, not a claim that prediction works.

---

## 8. Trust and policy

- **Financial:** a signal can push early spend, and then the price drops. James: "Accept it as a
  cost of the feature".
- **Privacy (GDPR):** this predicts named travellers' trips, and a price alert may count as
  marketing that needs opt-in. James: "Not yet checked. But not needed by friday. This is just a
  test." Stage note: that holds for Friday. It does not hold for a live 50/50 A/B test on real
  European users. The check must happen before the A/B test starts.
- **Duty of care / security:** reduced by limiting visibility to arrangers and admins.
- **Booking.com:** automated periodic searches for the prototype may touch Booking.com terms.
  Not asked. Hand to Engineering.

---

## Risks classified

**Fix now**
- `03`'s D reversal condition is met. James decides at the human check: stay on B, switch to D,
  or combine them.
- Replace "no blame" with "proof of savings from acting early" as the arranger's gain, and state
  how it avoids building spend reporting.
- Reconcile signal framing: `04` says gain. James prefers loss ("you might lose $1,000").
- Pipeline visibility: "Arrangers and admins only".
- "Cap seeded trips shown" for large orgs.
- Resolve the ~42% vs ~62% and 52% vs 19% churn figures before they go on the same slide.

**Declare as known risk (Friday)**
- No answer to why an arranger confirms a seeded trip: "Honestly, we don't have a real answer
  yet".
- Prediction is unproven: "we haven't done any kind of ML or logical prediction, ever."
- The session-to-churn link is correlation. The A/B test is the only cause test.
- The multi-user 30-day curve is assumed, not measured: "we can assume the same applies".
- Reach is narrow. 41.61% of companies return within 30 days at least once. Only about 1,000
  do so every month. The target is the consistent high-value group.
- No kill threshold for the back-test: "decide the threshold after seeing results". No final
  number replaces `03`'s ~50%.
- GDPR and opt-in are not checked. This must be done before the live A/B test.
- Mess cases not asked: arrangers in several companies, contractors and leavers,
  multiple entities and mergers, self-booked duplicates.

**Hand to Engineering**
- See the questions below.

**Accept and say why**
- Message schedule risk: "Accept the risk and ship anyway". No reason was given. It is recorded
  as such.
- A price drop after a "book now" signal: "Accept it as a cost of the feature".
- GDPR not checked for Friday: "not needed by friday. This is just a test."
- One-person companies see an empty pipeline. They are out of the run's scope.

---

## Technical questions for Engineering

1. Can a periodic search on Booking.com for unbooked trips run within Booking.com rate limits and
   terms, for a prototype cohort?
2. What would the robust price-watching version need? Does it need a Booking.com API change, with
   its 3–6 month lead time?
3. What is the source for flight price watching?
4. Is a simple repeat-pattern rule (same route, same traveller, monthly or quarterly) enough for
   the back-test, given that no prediction has been built before?
5. Can "share of cohort with a 30-day session gap" be measured per organisation from today's
   session events?
6. Can the 50/50 A/B test be assigned per organisation, with a clean holdout?

---

## Human check

**The one thing that changed:** the direction is no longer settled. `03`'s own pre-committed
reversal condition for D is met: "Orgs with invited travellers churn less. Going from 1 user to 2
users is one of the best predictors of improved retention". The sceptic also has a real point,
and James agrees: "we haven't done any kind of ML or logical prediction, ever."

**Second change:** the arranger's personal gain moves from "no blame" to "show if they've saved
money by being proactive". That gain sits next to the spend-reporting boundary.

**Still open for James before `06_playback`:** B, D, or B plus D. `03` said "Then D becomes the
direction". Overriding that needs a stated reason, or the reversal condition was never real.
