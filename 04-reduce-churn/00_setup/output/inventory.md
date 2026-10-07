# Setup inventory — Reduce Churn (post-booking micro-conversions)

Run scope: levers to reduce arranger churn in the Bookings and Trips page, booking details, and
the post-booking experience. This file checks access, not content. Full detail stays in the
tools listed below — read it there when a later stage needs it.

Method note: this pass used live connectors (Confluence/Jira, Slack, Miro, this account's
Claude artifacts) to test real access directly, instead of asking James item by item. Three
items below are still open questions only James can answer — see the bottom section.

## Research

| Asset                                                                                                                            | Access                                                                                     | Age                   | Note                                                                                                                                                                                                                                                                                                                                        |
| -------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Confluence/Jira (Atlassian)                                                                                                      | **Confirmed** — live search worked                                                         | Mixed, mostly current | Found "Increased churn in June and July 2026" (Sep 2026), "Churn Analysis 2026", "Churn - 2026 change of definition", "Churn Insights", "Churned, MNA and RNA Corporates" (Eos migration), "B4B Product Metrics/Benchmarking Metrics". `Churn Analysis 2026` links out to a Databricks notebook — that's a separate access path, untested.  |
| "Churn Departures" (Claude artifact, James, updated 2026-09-17)                                                                  | **Confirmed** — read directly                                                              | 6 days old            | Already synthesises DSA "Metrics That Matter" + Marzena's churn model (Jun 2026), DSA "Churn Analysis" deck (2 Sep 2026), the arranger survey (n=407), Bcom Travel Trends Tracker Wave 6, and Booking Visibility DSA-193 into churn signals and named "jobs to be done." This is the single richest thing that already exists for this run. |
| DSA/Bcom raw decks (Google Slides) — "Churn insights from DSA" (24 Jun 2026) and Bcom Steerco "Deck on churn" (9 Sep 2026)       | **Not verified** — Google Drive connector in this session is OAuth-only, not authenticated | Current               | Links exist and were found via Slack, so likely fine for James directly. The Churn Departures artifact already draws from both.                                                                                                                                                                                                             |
| Travel arranger survey visualisation (James, netlify, password-protected, 400+ responses) — `travel-arranger-survey.netlify.app` | **Not independently tested** (password form)                                               | Shared 16 Jun 2026    | Password found in Slack ("B4BProduct"). Should open fine for James directly.                                                                                                                                                                                                                                                                |
| "Chicago session (Chase Voss)" — named in product-context.md                                                                         | **Unresolved**                                                                             | —                     | Only match found is a "GBTA Chicago 2026" Confluence page — conference logistics, not churn notes. Chase Voss is a real, active Bcom counterpart (Steerco/escalation threads), but no distinct "Chicago churn session" write-up was found. Flag as a possible mismatch — see open questions.                                                |
| Bcom Travel Trends Tracker Wave 6                                                                                                | Already used inside Churn Departures                                                       | —                     | product-context.md itself flags it "unverified internally" — that caveat still stands.                                                                                                                                                                                                                                                          |

## Productboard

- Connector is present but **not authenticated** this session (auth-only tool, no data-read tool
  until OAuth completes). Entries referenced in product-context.md ("Multiple. Depends what we want.")
  could not be inventoried.
- Degrading, not blocking: Jira already surfaces some adjacent roadmap detail directly
  (e.g. TAL-478, the post-join "who is your admin" widget, tied to the Personalised Landing
  Experience for New Joiners experiment — see SMEs below).

## Analytics

- Snowflake connector **failed to connect** this session ("does not exist or not authorized").
  This is the team's own primary data-warehouse path — their Confluence notes reference
  `SNOWFLAKE.ACCOUNT_USAGE.TABLES` directly and describe an in-flight "Agentic Analytics" /
  "Snowflake Semantic Views" effort, meaning even the core team's dashboard/self-serve access is
  still being built out, not a solved problem today.
- Confluence carries point-in-time analysis (churn definitions, cohort breakdowns) — good for
  citing a number, not for pulling a fresh cut.
- Blocking only for **new, ad-hoc queries**. Degrading for everything already written down,
  which is most of what a 00_setup / 01_frame pass needs.

## Prior designs / design system

- Figma connector present but **not authenticated** this session (OAuth not completed).
- Miro: **confirmed access** — 123 boards match "B4B", including "B4B Discovery LAB — AI
  Prototype Building Workshop", "B4B Product Metrics", and several "Initiative TSD and Inception"
  boards (Join Existing Company, Team Management, Guest Travellers, Authentication Friction).
  None is titled specifically for post-booking churn — worth a targeted look once framing starts.
- Degrading: component-level design system (Figma) unreachable this session; Miro partly
  substitutes for early-stage workshop material.

## SMEs (cross-checked against product-context.md)

- **Matt Weaver** — Head of Data. Confirmed active: shared the 9 Sep 2026 churn deck in a small
  group DM with Lilly, Craig McGuff, David Holyoke, Kathryn Hoolihan, Liz Fraser, Francis Somera.
- **Marzena (DSA)** — named as the author of the churn-response model (sure things /
  persuadables / lost causes) inside the Churn Departures artifact. Not seen posting directly in
  the threads surfaced — her work is central, but she wasn't personally visible in Slack.
- **Lilly Mannerswood** — Head of Product B4B. Confirmed driving churn Steerco updates
  (16 Jun and 11 Sep 2026).
- **David Holyoke** — CPO. Present in the churn-deck group DM.
- **Craig McGuff** — Eng Director B4B. Present in the same DM; active on Eos migration churn-cohort
  sizing.
- **Melissa Helyer-Akhara** — Head of Design. Owns #team-design-b4b; not seen discussing churn
  directly in what surfaced.

New names surfaced, not in product-context.md's SME list, directly relevant to this run's sphere:
- **Anna Bondarenko** — running a live experiment ("Converting Self-Bookers into Arranger
  Recruiters", launched 3 Sep 2026) that touches this run's overlap question (Q3 in scope).
- **Zac Ma** — running a live experiment ("Personalised Landing Experience for New Joiners",
  started 18 Sep 2026) directly in this run's sphere — the post-join dashboard.
- **Chase Voss** (chase.voss@booking.com) — active Bcom counterpart across Steerco/escalation
  threads; possibly the "Chicago session" contact from product-context.md — unconfirmed.
- **"Matt G" (Bcom)** — gave an in-person churn-reduction talk to the Auckland team (~12 Jun
  2026). Distinct from Matt Weaver (Serko). product-context.md's SME list may be conflating the two.

## Customer-facing colleagues

- #ext-b4b-support (Bcom Singapore) — live, active, joinable.
- #ask-b4b-reports-hub / #dsa-b4b-reports-hub / #ext-b4b-reports-hub — DSA-facing channels, live.
- No individually named support/CS colleague surfaced beyond the above and Chase Voss — needs a
  direct answer from James.

## Gaps by severity

**Blocking**
- None stop the run outright. Confluence, Slack and the Churn Departures artifact already cover
  most of what 00_setup exists to protect.
- The closest thing to blocking: fresh, ad-hoc analytics queries (Snowflake unreachable this
  session). Relevant if 05_pressure-test needs a number nobody has already pulled.

**Degrading**
- Productboard not authenticated — weakens the overlap/roadmap question (Q3 in scope).
- Figma not authenticated — weakens design-system access for 04_make-tangible (not urgent yet).
- Raw DSA/Bcom source decks not independently opened — synthesis exists, primary sourcing
  unchecked.
- Two churn-rate definitions in live use (52% single-user vs. 19.2% company-level) — the Churn
  Departures artifact itself says not to use both until DSA confirms which is which.
- "Chicago session (Chase Voss)" reference doesn't clearly resolve to a findable artifact.

**Ignore**
- Unrelated historical Jira noise (old CVEs, unrelated flight/rail tickets) picked up by search —
  not relevant to this run.

## Three questions that most often save a day

Answered here with what the evidence points to — James still needs to confirm or correct each one.

1. **What do you already know that lets you skip a research step entirely?**
   Candidate: the Churn Departures artifact (6 days old) reads like a finished synthesis of both
   DSA decks, the arranger survey, and Wave 6. 02_explore may be able to start from it directly
   rather than re-pulling the source decks. Confirm with James.

2. **What are you assuming that was last checked over a year ago?**
   Candidate: the "Chicago session (Chase Voss)" reference and the Bcom Travel Trends Tracker
   Wave 6 ("unverified internally," per product-context.md) are both flagged, one way or another, as
   unconfirmed. The only Chicago match found (GBTA Chicago 2026) is conference logistics for an
   event over a year prior to today's date. Confirm what "Chicago session" actually refers to.

3. **Whose 20 minutes would save you a day?**
   Candidates surfaced by evidence: Marzena (owns the churn-response model this run would lean
   on) and Zac Ma (running the adjacent post-join-dashboard experiment right now). Confirm with
   James which one (or both) to book first.
