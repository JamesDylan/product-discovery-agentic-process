# Decision Log

Append-only. One entry per material call. Trade-offs are mandatory.

## Template

### [YYYY-MM-DD] {decision}
- **Run / step:**
- **Call made:**
- **Why:**
- **What we traded away:**
- **What would make us reverse this:**
- **Decided by:**

---

### [2026-09-23] Reduce Churn: post-booking lever is Disruption Radar
- **Run / step:** `04-reduce-churn` / `03_converge`
- **Call made:** Chose Option 1, Disruption Radar (surface real-time trip changes in Bookings and
  Trips, requiring an arranger session to clear them), over Traveller Signal Loop, Autopilot and
  Digest, Trip Health Score, and Change-Request Approvals.
- **Why:** Highest score on customer value, simplicity, speed to value, and known constraints
  against the brief's five criteria. Only option with a direct sourced quote behind it (Churn
  Departures: "give me a reason to come back between bookings"). Reuses a problem the arranger
  already solves elsewhere instead of asking travellers (Option 2) or Serko automation (Option 3)
  to change behaviour first.
- **What we traded away:** Guaranteed coverage. It depends on a real disruption happening to a
  given trip inside 30 days — undisrupted trips get no trigger from this lever. Change-Request
  Approvals (Option 5) would have guaranteed a session but at the cost of a net-new approvals
  engine, the most build-heavy option in the set.
- **What would make us reverse this:** `05_pressure-test` shows disruption frequency for
  multi-user-org arrangers is too low to close the 30-day gap for more than a small slice, or the
  itinerary-change data assumed to already exist is not actually captured. Fallback order:
  Traveller Signal Loop, then Change-Request Approvals.
- **Decided by:** Claude (solo run analytical convergence), human check pending — James Scholz to
  confirm the trade-off sentence.

---

### [2026-09-23] Reduce Churn (second pass): post-booking lever is Trip Pipeline
- **Run / step:** `04-reduce-churn` / `03_converge` (re-run on the v2 seven-option set).
  Replaces the Disruption Radar entry above. James rejected that option set at the human check.
  Disruption frequency is too low to bring arrangers back.
- **Call made:** Chose Option B, Trip Pipeline, seeded from booking history. It shows trips that
  are coming but not booked, and signals price or availability changes in Bookings and Trips.
  Rejected: A Traveller Roster, C Rate Lock, D Team Unlock (surfacing bet), E Booker Rewards,
  F Disruption Radar, G Autopilot and Digest.
- **Why:** Highest score (18 of 25; F 16, D and G 14), with trigger frequency counted in
  business outcome. It is the only option whose reason to return recurs without a disruption.
  Its sessions sit next to a booking, not in an org that stopped travelling. It names the
  arranger's gain: a better price, and no blame for a price rise. It is the base Rate Lock (C)
  needs in 12 months. D is out: the invite/self-book mechanism already ships and churn persists,
  its exception queue waits on policy controls not confirmed as shipped, and its adoption
  message cuts arranger sessions.
- **What we traded away:** Reach. An arranger with no trip coming up gets no reason to return.
  This run does nothing for the account that goes dark when its one arranger leaves.
- **What would make us reverse this:** `05` shows fewer than about half of cohort arrangers
  have a known or predictable trip per 30-day window, or history cannot seed the pipeline and
  arrangers will not fill it, or prices are too flat to signal honestly. If orgs with invited
  self-booking travellers churn materially less than single-arranger orgs, switch to D.
- **Decided by:** Claude (solo run analytical convergence, opus re-run). Human check pending —
  James Scholz to confirm the trade-off sentence.

---

### [2026-09-30] Company Acquisition: second booker first, through the arranger
- **Run / step:** `01-company-acquisition` / `03_converge`
- **Call made:** Primary outcome is companies with 2+ active bookers on B4B. Slice 1 runs in parallel:
  C through the arranger ("Invite this person to book for themselves next time?"), and Bcom prompts
  work-email users to join (arranger approves) or to share their business bookings. The domain signal
  (B, S) runs in the background from day 1. A is second if A11 holds. K, H and F are medium term.
  "Companies united and claimed" is the 12-month arc for `08`, not the outcome. Killed: D (for now), E,
  G, I, L. Parked for `08`: J, N, O, P, Q, R.
- **Why:** C scored highest (28 of 30) with second booker weighted ×2, and it has the strongest evidence
  (18,541 profiles already book). "United and claimed" was re-scored and could not separate the options
  (top 6 within 3 points), and it has no evidence or baseline. The arranger approves because admins want
  control over who books. Bcom prompts Jane, not the arranger, so no employee's booking is shown without
  her consent.
- **What we traded away:** The company stays split and unclaimed through the first slice. Conversion is
  slower because each new booker waits on an arranger. Sharers book on Bcom and B4B is not paid for
  them. Growth depends on the arranger until H + F ship.
- **What would make us reverse this:** Arranger yes-rate below 20% after 6 weeks. Profile → booker in the
  test group not above 14.2% after 8 weeks. Share → switch below 10% after 90 days.
- **Decided by:** James Scholz (with Chris), Claude facilitating. Human check pending: read the trade-off
  sentence to someone outside the room.

---

### [2026-10-02] Company Acquisition: slice 1a widened to 1–24 trips; HRIS is a complement
- **Run / step:** `01-company-acquisition` / `08_vision-horizon` (carried back into `05` and `03`)
- **Call made:** Slice 1a invites travellers with 1–24 trips a year, not only 4–24. The 1–3 band joins
  as members, not bookers. Second bookers still come from the 4–24 band, and profile → booker is measured
  on that band only. HRIS is not a target: HRIS serves larger companies, consent-based formation serves
  every other company, and the domain map helps HRIS find existing accounts. Bcom business booker details
  are a named dependency of Next. Owners: James for Bcom booker details and the invite channel. David for
  revenue from sharers.
- **Why:** Adding members is useful even when they do not book: it fills out the company that Next unites.
  It needs no extra build. 70.3% of companies have nobody with more than 3 trips, so the 4–24 band alone
  leaves most companies with no 1a prompt.
- **What we traded away:** Focus. The 1–3 band is 76.3% of travellers, so most prompts go to people who
  will not become bookers. More prompts per arranger raises the prompt-fatigue risk (`08` open question 1).
- **What would make us reverse this:** Arranger yes-rate falls below 20% at 6 weeks, or falls after the 1–3
  band is added. Members from the 1–3 band do not help Next find or unite fragments.
- **Decided by:** James Scholz, Claude facilitating.

---
