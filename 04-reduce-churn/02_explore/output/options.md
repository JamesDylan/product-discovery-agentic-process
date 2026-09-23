# 02_explore — Options (Reduce Churn: post-booking micro-conversions)

**Second pass, 2026-09-23.** The first pass had 5 options. `03_converge` chose Disruption Radar.
James rejected the option *set* at the human check, not the convergence logic:

> "Disruption isn't high enough to cover users logging back in. We should find out what arrangers
> actually want, when not actively booking, and put that there. What are their JTBD or pain
> points? i.e. do they care about pre-booking or locking in early rates for potential future
> trips? Can we leverage the fact that they book for lots of people that are not in the product?
> And surface other info in there or encourage them to invite their team members to unlock more
> revisit reasons etc?"

This file replaces the first pass. No ranking here. Seven options, each a different underlying
bet. Two are kept from the first pass, in narrower form. Three were dropped or folded in — see
the end of the file.

Every option still serves the same problem: close the 30-day no-session gap for arrangers in
multi-user orgs, in the Bookings and Trips space, without invoicing or expenses. Each option also
names what the arranger personally gets. `01_frame` left that open.

---

## What arrangers need when they are not booking (JTBD hypotheses)

James's first angle is a research question, not an option. The loaded evidence names only one
job directly: "Give me a reason to come back between bookings" (Churn Departures). It does not
say what that reason is. So the jobs below are **hypotheses**. Each one is the basis for at least
one option. None is validated yet.

| # | Job to be done (JTBD), arranger between bookings | Option that bets on it |
|---|---|---|
| J1 | Keep the details of the people I book for correct, so booking is fast and nothing fails at the airport | A. Traveller Roster |
| J2 | Get ahead of trips I know are coming, and get a good price before it rises | B. Trip Pipeline, C. Rate Lock |
| J3 | Handle requests from my travellers in one place, not in Slack, email and the hallway | D. Team Unlock |
| J4 | Get recognition or reward for a role that is often invisible | E. Booker Rewards |
| J5 | Know my people are OK when a trip goes wrong | F. Disruption Radar (kept) |
| J6 | Spend less time on travel admin in total | G. Autopilot and Digest (kept) |
| — | Answer "what did we spend" for my manager or finance | Not an option. Insights and analytics overlap with Serko.ai and the Platform is out of scope (`01_frame`). |

**Cheapest way to test these:** the Travel Arranger Survey (n=407) already exists. It may contain
between-bookings pain points that nobody has cut for this question. That is a `05` task, not this
stage's. Flagged so the jobs are not treated as facts.

---

## Option A — Traveller Roster ("the people I book for")

*James's angle 3 (people not in the product). Axes: system-inferred; individual; make the task
easier.*

**The bet:** the arranger's most valuable asset is not the trips. It is the list of people they
book for. Most of those people are not B4B users. Make the arranger the owner of a live record
for each one, and the record creates its own reasons to return.

**How it works:**
- B4B builds a roster from past bookings: every traveller the arranger has booked for.
- Each traveller gets a profile card: passport and expiry, loyalty numbers, seat and room
  preferences, dietary needs, emergency contact.
- The system flags gaps and decay. "3 travellers have no loyalty number." "Priya's passport
  expires before her March trip."
- **Key moment:** a Monday email says "2 traveller profiles need attention." The arranger opens
  Bookings and Trips, fixes one passport date in 20 seconds, and leaves.

**What it assumes:**
- Profile data decays often enough (expiry, new starters, leavers) to create a monthly reason.
- Arrangers already keep this data somewhere painful (Excel, email). 55% track spend in Excel,
  so a similar habit for traveller data is plausible, not proven.
- Serko can store passport and personal data for non-users within privacy rules (GDPR for the
  European-weighted base). This is a real legal and security question.

**Why someone smart would choose it:** it is the only option that works even if the org books
nothing this month. The revisit reason comes from people, not trips. It uses the asymmetry James
named directly: one arranger, many travellers, none of them in the product. It also makes the
next booking faster, which ties sessions to bookings. **What the arranger gets:** no more "what's
your passport number again" emails, and no failed check-ins that land back on them.
**Analogue outside travel:** CRM contact records that flag stale data (HubSpot, Salesforce);
password managers that warn "this card expires soon."

---

## Option B — Trip Pipeline

*James's angle 2 (pre-booking, planning ahead). Axes: user-declared; progressive; product.*

**The bet:** arrangers know about many trips weeks before they can book them. The conference in
March. The quarterly offsite. The new starter who flies in on the 14th. Give them a place to put
those *future* trips, and B4B watches them.

**How it works:**
- The arranger adds a "maybe trip": destination, rough dates, who is going. No booking yet.
- B4B watches prices and availability for that trip. It sends a signal when something changes:
  "Hotels near the venue are 60% booked." "Price for these dates rose 12% this week."
- It suggests a "book by" date based on the price curve for that route and season.
- **Key moment:** 5 weeks before the Berlin offsite, the arranger gets "Prices for your Berlin
  trip dropped 8% today." They open the pipeline, see the trip, and book 6 people in one go.

**What it assumes:**
- Arrangers know about enough trips in advance, and will type them in. User-declared data is
  the weak point. Nobody fills in a form for the product's benefit.
- Booking.com and flight inventory give enough price history to make the signals honest.
- A planning session is a real session: it counts against the 30-day gap even with no booking.

**Why someone smart would choose it:** it moves the arranger's visit *before* the booking, where
the arranger still has choices. Every other option reacts to something that already happened.
This one creates sessions in the dead time between bookings — the exact gap the 51%→71% number
describes. **What the arranger gets:** a better price, and a reputation for planning ahead.
**Analogue outside travel:** Google Flights and Kayak price tracking; Hopper's "wait or book"
prediction; a sales pipeline in any CRM.

---

## Option C — Rate Lock

*James's angle 2 (locking in early rates). Axes: incentive, not product; upfront; policy.*

**The bet:** watching a price is not enough. What arrangers want is *certainty*. Let them lock a
rate for a trip that is likely but not confirmed. The lock itself is the reason to come back:
it has a deadline and names still to fill.

**How it works:**
- The arranger locks a rate for a future trip. Options: a price freeze for a small fee, a
  free-cancellation rate held with no names, or a hotel room block for a group.
- The lock has an expiry. Names and final details are added later.
- Reminders run on the lock's own clock: "Your Berlin rate lock expires in 5 days. 2 of 6
  names added."
- **Key moment:** the arranger locks 6 rooms at today's rate for an event 3 months out. Over
  the next 6 weeks they return 4 times to add names, confirm headcount, and release 1 room.

**What it assumes:**
- Someone takes the price risk. Either the supplier (free-cancellation rates, group blocks), or
  Serko and Booking.com (a paid price freeze). That needs commercial, finance and supplier
  teams. It is not a product-only build.
- Customer finance teams accept a fee or a hold for a trip that may not happen.
- Enough arrangers book groups or events for this to matter to the target cohort.

**Why someone smart would choose it:** it is the only option where the *return visit is part of
the product*, not a nudge. A lock with empty name slots is unfinished work the arranger chose to
start. It also creates booking volume early and holds it on B4B. **What the arranger gets:**
protection against being blamed for a price that rose while they waited for approval.
**Analogue outside travel:** Hopper Price Freeze; airline fare holds; concert and event
pre-sales; mortgage rate locks.

**Why this is split from B:** B is a data and notifications product. C needs a commercial deal
and a risk owner. Different teams, different sequence.

---

## Option D — Team Unlock

*James's angle 4 (invite team members) and angle 3. Axes: network (org graph); progressive.*

**Correction from the human check (2026-09-23):** the invite-and-manage mechanism described
below is not a new build. James: "Team Unlock already exists. Arrangers invite and manage their
travellers, who can also log in and book for themselves." That is a materially stronger existing
capability than this option first assumed (it assumed travellers had no booking rights). James
also corrected the approvals framing: "We don't have approvals and probably never will. But we
will have policy controls, which removes the need for approval." So the traveller-request-queue
half of this option, described as folding in the first pass's Change-Request Approvals, is not a
future approvals engine — any gate on a traveller's action is a policy check, not a human
approval step. The bet below is rewritten to be about the gap on top of what already ships, not
about building invites or an approvals workflow from scratch.

**The bet:** the invite-and-self-book mechanism already exists, and existing arrangers can
already invite the people they book for. If it were closing the churn gap on its own, this run
would not exist. So the bet is not "build Team Unlock" — it is that the *reasons it creates to
return* are not currently surfaced to the arranger as reasons to return. Make every traveller
action inside the existing invite relationship show up in Bookings and Trips as something the
arranger opens and clears, and make policy exceptions (not approvals) the thing that specifically
needs the arranger's judgment.

**How it works:**
- No new invite mechanism. Use the existing invite/manage relationship as-is.
- Add a queue in Bookings and Trips: traveller self-book actions, profile changes, and — the one
  case that still needs the arranger — a traveller action that falls outside policy (an
  out-of-policy fare, a non-compliant hotel) and is held for the arranger's decision. In-policy
  traveller self-bookings pass straight through; nothing to approve.
- The arranger sees what inviting more travellers already unlocks, to drive adoption of a feature
  that may already exist but be underused: "3 of your 10 travellers can book for themselves.
  Invite the rest to take booking work off your plate."
- **Key moment:** a travel-booking traveller books outside policy. It lands in the arranger's
  queue as a named exception, not a blanket approval step. The arranger clears it in 3 taps.

**What it assumes — rewritten to no longer assume a mechanism build:**
- The existing invite/self-book feature is under-adopted, or under-surfaced as a reason to
  return, rather than already solving this. Neither is confirmed — this needs checking with
  whoever owns that feature's usage data before `03` scores it.
- Policy-exception volume is frequent enough, per arranger, to create a real 30-day trigger — not
  yet measured.
- Arrangers still want the exception queue even though the underlying invite feature already
  exists; if adoption is already high and churn is unaffected, this option may not be new value
  at all, only better surfacing of something that already failed to move the metric.

**Why someone smart would choose it:** it is the cheapest option in the set to test, because the
core mechanism (invite, self-book) is sunk cost, already built. If the gap really is discovery
and surfacing rather than a missing feature, this is the fastest possible win. **What the
arranger gets:** one queue for the exceptions that need them, instead of chasing traveller
bookings or explaining policy after the fact.
**Analogue outside travel:** Slack and Notion, where each invited colleague makes the tool more
useful; expense tools where the manager only sees out-of-policy spend, not every line.

**Open question for `03` and `05`, not resolved here:** how much of the "D" bet is actually new
value versus re-surfacing a feature that already exists and, on its own, has not moved the churn
number this run exists to fix. `03` should not score this as if it were a net-new build — it
should score it as a surfacing/adoption bet, which changes its speed-to-value and business-outcome
case in both directions (cheaper to ship, but weaker evidence that shipping it changes anything).

**Boundary to check:** Anna Bondarenko's live experiment converts self-bookers into arranger
recruiters. This option runs the other way: an existing arranger's travellers already self-book.
The two may still touch the same underlying invite/relationship data. `03` must check this before
choosing D. `01_frame` says this run must not build on that experiment's ground.

---

## Option E — Booker Rewards

*James's angle 3 (they book for lots of people). Axes: incentive, not product; progressive;
individual. The option the pair is most likely to dislike — see the argument for it below.*

**The bet:** the arranger does the work and the traveller gets the loyalty points. Turn the
arranger's volume *for others* into status and reward *for the arranger*. The status is the
reason to return.

**How it works:**
- Every booking the arranger makes for anyone counts towards the arranger's own level.
- Levels unlock things for the arranger and the org. Examples: free upgrades for travellers,
  priority support, better flexible rates, early access to features.
- The Bookings and Trips page shows progress: "4 bookings to Level 2 this quarter."
- **Key moment:** an arranger sees they reached Level 2. Their CEO's next hotel stay includes a
  free room upgrade, credited to the arranger's level. They tell the CEO.

**What it assumes:**
- Customer policies allow it. Many companies ban personal rewards for company spend. Rewards
  may need to go to the org, not the person — which weakens the personal pull.
- Booking.com Genius or a similar programme can extend to a business booker. That is a
  commercial question for Booking.com.
- Progress on a level is worth checking between bookings. Risk: it only moves when they book,
  so it may not close the 30-day gap on its own.

**Why someone smart would choose it:** it is the most direct answer to the open tension in
`01_frame`: what does the arranger personally get? Every other option gives the arranger less
work. This one gives them something they do not have today — recognition. **What the arranger
gets:** visible status, and perks they can hand to the people they book for.
**Analogue outside travel and inside it:** hotel planner and booker programmes (Marriott Bonvoy
Events, IHG Business Rewards, Hilton Honors event planner points) already reward the person who
books for others. Booking.com Genius rewards the traveller. B4B has the first half of this
pattern next door.

**Arguing for the option the pair likes least.** This is likely it: it feels like a gimmick, and
it needs Booking.com commercial sign-off. The case for it: the hotel industry already decided
the booker is worth rewarding. They are the customer who chooses the supplier. B4B has the
volume data and a sister loyalty programme. Not using that may be a gap, not caution.

---

## Option F — Disruption Radar (kept from first pass, narrower)

*Axes: system-inferred; individual; make the task easier.*

**The bet:** a real change to a live trip is a reason to come back. Flight time changes,
cancellations, strikes, policy breaches after booking. Show them in Bookings and Trips so
fixing them means a session.

**How it works:** a feed watches booked trips for material changes. Each change becomes a card
the arranger opens and clears. An email or push alert points to it.

**What it assumes — and James's objection:** disruptions happen often enough to reach most
arrangers inside 30 days. James says they do not: "Disruption isn't high enough to cover users
logging back in." So this option is kept as one input, not as the whole answer. It can feed
other options (for example, a disruption also creates a traveller request in D).

**Why someone smart would still choose it:** when it fires, the reason to return is strong and
honest. **What the arranger gets:** they learn about problems before the traveller calls them.
**Analogue:** TripIt Pro alerts, landing in the org's own tool.

---

## Option G — Autopilot and Digest (kept from first pass)

*Axes: remove the need; system-inferred. This is the "user does nothing at all" option.*

**The bet:** the arranger's complaint may be too many small visits, not too few. Handle small
post-booking events automatically, inside policy. Send one short digest instead of many nudges.

**How it works:** standard in-policy changes execute without the arranger. A weekly or monthly
digest lists what happened and what is coming up, with one link into Bookings and Trips.
**Key moment:** the arranger reads a 5-line email on Monday. They click once, check next
week's trips, and close the tab.

**What it assumes:** fewer, calmer sessions protect against churn as well as more sessions. It
works against this run's own leading indicator, which is why it stays in the set.

**Why someone smart would choose it:** regrettable churners are high-value customers. They may
leave because the product feels like work, not because they forget it exists. **What the
arranger gets:** time back. **Analogue:** Nest monthly reports; Expensify auto-categorisation.

**Combination note:** the digest is also a delivery channel for A, B, C and D. `03` should
decide if G is a standalone bet or the envelope for another option.

---

## Interrogation

**Which option came first, and what did it stop us seeing?** In the first pass, Disruption
Radar came first. It made every option a *reaction to a trip*. Four of the five first-pass
options needed a trip to exist before they could fire. James's objection is really about that:
reasons tied to trips are only as frequent as trips. In this pass, the first new option was
Trip Pipeline. Its risk is the same shape: it still needs a trip, just a future one. Options A,
D and E exist because they do not need a trip at all — their reasons come from people and
status.

**What does this look like if the user has to do nothing at all?** Option G. Also, A can be
system-inferred from booking history with no setup.

**What would a competitor with no legacy do?** A new travel tool (Navan, TravelPerk model)
makes every traveller a user from day one. The arranger becomes a light admin, not the person
who does everything. Push Option D to its limit and you get this. It raises a hard question for
the whole run: is the arranger model itself a churn risk, because all value sits with one
person who can leave or stop caring? That question is not an option here. It is flagged for `03`.

**What is obvious in hindsight?** The arranger books for people who are not in the product.
B4B treats those people as text fields on a booking. Options A, D and E all start from treating
them as real entities.

**Which option are we avoiding because it is inconvenient?**
- **C (Rate Lock):** needs someone to own price risk. Commercial and finance work, not product.
- **E (Booker Rewards):** needs Booking.com commercial sign-off. May break customer spend
  policies.
- **A (Traveller Roster):** stores passport data for people who never signed up. Legal and
  security cost.
All three are kept in, per this stage's contract.

---

## Changes from the first pass

| First-pass option | Status | Reason |
|---|---|---|
| Disruption Radar | **Kept, narrower** (F) | Strong but too infrequent, per James. Now one input, not the whole answer. |
| Autopilot and Digest | **Kept** (G) | Still the only "do nothing" option. Also a channel for other options. |
| Traveller Signal Loop | **Superseded by D** | The invite/self-book relationship it needed already exists in the product — see D's correction note. |
| Change-Request Approvals | **Dropped, not folded** | James: no approvals engine exists or is planned; policy controls already remove the need for one. D's exception queue handles out-of-policy actions via existing policy checks, not a new approval workflow. |
| Trip Health Score | **Dropped** | Its score only moves when trips happen (same frequency gap). Its savings figures sit in insights and analytics, which is out of scope. |

## Human check (for the pair)

Point at the option that makes you uncomfortable. Candidates: C (someone owns price risk), E
(looks like a gimmick, needs Booking.com), or A (passport data for non-users). If none of them
does, the set is still too narrow.
