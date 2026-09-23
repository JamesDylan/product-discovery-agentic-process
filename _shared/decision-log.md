# Decision Log

Append-only. One entry per material call. Trade-offs are mandatory.

## Template

### [YYYY-MM-DD] <Decision>
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
