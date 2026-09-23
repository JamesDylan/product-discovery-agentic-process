# 01_frame — Reduce Churn (post-booking micro-conversions)

Solo run. Interrogated: James Scholz (Product), 2026-09-23.

**How to read the quotes.** Text in quotation marks is James's exact words. Text marked
*(relayed)* is his answer as the orchestrator passed it on, not a direct quote. Text marked
**[source]** comes from the Churn Departures synthesis (James, updated 2026-09-17). Text
marked **[open]** is a challenge James has not answered yet.

---

## Problem statement

> Arrangers in multi-user orgs drift towards regrettable churn once they go 30 days without a
> session. Today the post-booking space gives them no small, useful reason to come back between
> bookings that does not depend on fixing invoicing and expenses first.

This sentence was assembled from James's answers. He has not yet read it aloud as a whole.
**Human check still due:** it is wrong if the 30-day gap does not predict churn for this cohort,
or if Bookings and Trips cannot create sessions.

## Root cause, and the two-track split

- **Root cause (Q1):** "Missing features - invoicing and expenses are our biggest pain points for
  customers. and as we target larger companies this will become worse."
- **The split (Q10, the sceptic's objection):** "Too big to build. We need to target other levers
  and work on churn in two tracks. This one, and a separate invoice/expense initiative."
- **What this means:** invoicing and expenses are the confirmed root cause. They are **not** what
  this run delivers. This run looks for other post-booking levers that close the 30-day session
  gap.
- **[source]** Supports the root cause: 23% of arrangers say invoicing and paperwork is their
  biggest single time cost. This is the #1 churn reason customers give in their own words. 55%
  still track spend in Excel. Customer quote: "We are leaving the platform because invoice
  requests are too slow."

## Whose problem

- **Who feels it (Q3):** the arranger, directly, in their own workflow. *(relayed)*
- **Who must act (Q4):** the arranger. What's in it for them: less manual invoicing and expense
  work. *(relayed)*
- **Manual work today (Q5):** "all of the above" — chasing and collecting receipts, reconciling
  costs to invoices, and exporting or re-entering data for finance.
- **Target population (Q2):** the arranger cohort in higher-value, multi-user orgs where an
  arranger relationship exists. *(relayed)*

**[open] Tension in the answers.** What is in it for the arranger (Q4) is less invoicing work.
That benefit sits on the track this run has split off. So for *this* run, the arranger's
personal gain from the nudges and micro-actions is not yet named. `02_explore` must name it, or
the levers become nudges that serve Serko and not the arranger.

## Outcomes

- **Customer outcome (Q6):** one clean export to finance. The arranger does not need to touch
  reconciliation at all. *(relayed)*
  - Note: this outcome belongs to the invoice/expense track. This run's customer outcome is
    still to be written. See the open tension above.
- **Business outcome (Q7, Q11):** churn rate itself, directly. Specifically **5.7% regrettable
  churn, on the DSA-owned definition.** *(relayed)*
- **Churn definition (Q12):** "formal dsa churn definition is no bookings in 365 days."
  - 365 days with no booking is the **lagging** metric. DSA owns it.
  - 30 days with no session is the **leading indicator** this run tracks and tries to prevent.
    It is the earliest signal of churn, not the definition of churn. *(relayed)*
- **Where they are in tension (Q8):** James reframed this rather than picking a side: "DSA
  analysis shows churn gets much worse after 30 days without a session. This is a stronger
  signal than days since last booking."
  - Read as *(relayed)*: the real lever is frequent **sessions**, not bookings and not
    invoicing. A session can come from a useful nudge or a small action, not only from pain. So
    bringing the arranger back does not have to mean annoying them back.

## Evidence for

- **James's strongest evidence (Q9):** "The 30-day no-session signal." This is the evidence base
  the run is built on.
- **[source]** Churn risk climbs from a 51% baseline to 71% in the 30 days after a user's last
  **session**. Measured from the last **booking**, it barely moves: 51% to 54%.
- **[source]** Risk reaches 90% after 120 days with no session, whether or not they booked.
- **[source]** Regrettable churn is only about 5–6% of churners. But that same group accounts
  for 32% of lost booking volume.
- **[source]** Churn Departures job: "Give me a reason to come back between bookings." Its
  words: session recency is the best churn predictor, "and we have almost nothing built for it
  today."

## Evidence against (what a sceptic would say)

James's sceptic answer (Q10) was about invoicing and expenses, not about this run. **No sceptic
objection to the 30-day session signal has been named yet.** The points below come from the
synthesis or from this stage's challenge. James has not answered them.

- **[open] Correlation, not cause.** Sessions may drop *because* the company stopped travelling.
  If so, a nudge brings back a session but not a booking. The 51%→71% number does not separate
  the two.
- **[open] Population mismatch.** The 30-day number is not cut for arrangers in multi-user orgs.
  It may be driven by single-user accounts, which this run excludes.
- **[source]** The target cohort is small. Multi-user, corporate-email accounts churn at 10% and
  make up about 7% of churners. The movable volume is high value but low count.
- **[source]** About 50% of accounts book again by day 30 with no campaign ("sure things").
  Some of any post-booking lift may be customers who were coming back anyway.
- **[source]** Three churn clocks run today and are not reconciled: a session model, a booking
  model, and a 30/75/100-day email schedule. New nudges add a fourth. "One customer could get
  conflicting messages right now."
- **[source]** The #1 churn reason customers name is invoicing. This run deliberately works on a
  lever that is not #1.
- **Where the numbers come from:** DSA "B4B Metrics That Matter" + Marzena's churn analysis
  (Jun 2026), DSA "B4B Churn Analysis" deck (2 Sep 2026), Travel Arranger Survey (n=407,
  European-weighted SMB sample), Booking.com Travel Trends Tracker Wave 6 (n=918, US/UK). The
  raw DSA decks were not opened in this run — see `00_setup` inventory.

## Assumptions

James marked these two as **load-bearing**. `05_pressure-test` must test both.

1. **"30-day session gap predicts 365-day churn"** — LOAD-BEARING.
   - 05 must show this holds for arrangers in multi-user orgs, not only for all users.
   - 05 must separate "no session caused churn" from "no travel caused both".
2. **"Bookings and Trips page is the right surface"** — LOAD-BEARING.
   - 05 must show arrangers visit it, or can be brought to it, often enough to change behaviour.

Accepted, not marked load-bearing (lower risk; listed, not re-tested as hard):

3. "Sessions can be triggered without invoicing/expenses" — useful, non-invoicing reasons to
   bring an arranger back exist and can be built in this run.
4. "Arrangers in multi-user orgs are the right target" — the 5.7% regrettable churn sits in this
   population.

**[open] Flag on #4.** The synthesis links regrettable churn to "loyal, high-value customers".
It does not confirm they are arrangers in multi-user orgs. If that link fails, the target
population changes. Worth one question to Marzena before `05`.

## The cut

- **The one thing (Q14):** "both 1 and 2".
  1. Post-booking notifications and nudges that pull arrangers back within the 30-day window —
     trip changes, reminders, approvals.
  2. Trip-management micro-actions on Bookings and Trips — rebooking, managing traveller
     changes, checking status — that give arrangers small, useful reasons to return.
- **Framed as:** close the 30-day session gap through proactive nudges plus in-page
  micro-actions, without needing invoicing and expenses fixed first. *(relayed)*
- **Watch:** "approvals" is in the nudge list. B4B has no approval workflow today
  (`b4b-context.md`). `02_explore` should treat approvals as a new build, not an existing hook.

## Explicit out of scope

James selected all three:

- **Invoicing and expenses.** Confirmed root cause, split off as its own separate initiative.
  Not this run's deliverable.
- **Live experiments:** Zac Ma's Personalised Landing Experience for New Joiners and Anna
  Bondarenko's Converting Self-Bookers into Arranger Recruiters. This run sits above them and
  must not build on their ground.
- **Insights and analytics overlap with Serko.ai and the Platform.** A constraint to respect —
  do not build in parallel. Not a direction to explore.

Also out of scope, from Q2:

- **Single-user org churn** (52% a year). A different problem. No arranger exists there.

## Blind-spot check

- **Admin persona because reachable:** passed. The target is the arranger, chosen for value
  (regrettable churn, 32% of lost volume), not for reach.
- **Low number treated as a UX problem:** partly open. The run's lever is engagement, while the
  root cause is a missing capability. The two-track split makes this a deliberate choice, not a
  miss. `05` must check that nudges without the capability still change behaviour.
- **Too broad or too narrow:** holds. One cohort, one leading indicator, one surface, two lever
  types. Narrow enough for three days, and still a direction rather than one feature.
