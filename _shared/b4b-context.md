# B4B Context

> Keep it factual. Mark anything uncertain as `[assumption]`.

## Product
- What B4B is, in two sentences: B4B is a free online travel booking tool for business travellers. It is run under an exclusive Booking.com partnership. It is free to use with no contracts and is targeted mainly at companies with 1-250 travellers. 
- Core jobs it does today: Hotel booking (core), flights (partly native, growing — the flow punches out to Bcom midway), cars, taxis, adjacent supply (rail EU-only, attractions). Company budgets and controls, team management, join-existing-company, basic invoice requests to hotels
- The one job it does badly: **invoicing and documentation.** Often the top request in CSAT surveys. #1 time sink for travel arrangers: 23.1% (arranger survey, June 2026, n=407), where it is also called the primary churn driver for arrangers. G2 reviews repeat it (VAT invoicing; 3.8/5 vs Perk 4.6). Main pain: getting complete, VAT-compliant invoices from hotels.
- What it explicitly does not do: Right now, it is not an expense tool and it does not have complicated onboarding or company setup. It is designed to be as self-serve as possible without any travel management company or setup for enterprise customers. No payment rails, no policy engine, no approval workflows, no SSO, no public API, no HRIS/ERP integrations, and rail is only in Europe. Though these things are all up for grabs. 

## Customers & segments
- Primary segments: Travel arrangers in smaller companies with 1-250 travellers. Founders that pay and book travel for their teams, or self-bookers booking for business reasons · Admin (policy/billing/setup) · Travel Arranger (books for others — 15% of users, 82% of booking volume, 10x value multiplier) · Business Traveller (self-books) 
- Personas: Amir (founder), Martina (office manager), Anna (dedicated arranger), Bob (self-booker). ICP sweet spot is 50–250 employees (aspirational); Best Customers are ~⅔ in 2–20 users. Files: `01-company-acquisition/00_setup/sources/evidence/persona-*.md`, `icp-overview.md`.
- Who administers, who books, who pays: The user does all. They can use a company card, or choose "pay at property" but generally the payment is made as part of the booking process
- Where adoption is strong / weak: Weak in the US, strong in Europe. Strongest in Germany. And strongest with people that book for others in companies with 2-20 travellers. Weakest for single-user orgs (52% annual churn vs 19% at 10+ users), corporate email adoption (48% vs 70–75% target), single-to-multi-user conversion (12% vs 15–25% healthy range), team/admin features general

## Current state numbers
- Invite acceptance rate: 40% of sent invites end with the invited person joining (owner: Jacqui; 30-day window). Target ~80%. JEC join requests have no acceptance number.
- Company formation / growth metrics: Appx 5.5k newly activated companies per week <!--m:act.newly_activated_companies.weekly-->
- Feature adoption gaps: 
	- Low invite rate - most companies are still single-user despite 80% of bookings made for others
	- Low corporate email adoption - appx 50%
	- Low first-booking (activation) rate: 21.1% within 28 days (cohort, QBR 2026-09-21; target 18.7%). Jan–Aug 2026 by origin: organic 16.4%, promoted 25.0%. Travel arrangers 30% vs self-bookers 11% (by signup intent answer).
	- A lot of our new users that register and never activate will bounce straight back to Booking.com, and a reasonable percentage of them go on to make business bookings on the Booking.com leisure site. But some will leave both B4B and Bcom.
- Other baselines: 
	- Annual churn is high: 33%. With appx 5.7% regrettable churn (high value customers)
	- gross bookings per week: ~60k
	- stay search conversion rate is appx 23.2%
	- booking frequency (bookings/month/company) is largely impacted by org size: 1 user avg 2.7 bookings/month vs 156 bookings/month for 100+ user orgs.

## Commercial
- Revenue model and what drives it: Free to customer. Serko earns supplier margin on Bcom-sourced bookings. No subscription, no booking fee. Revenue is shared with Bcom; Serko keeps a higher share when it owns the acquisition. Serko launched its own B4B acquisition channel in 2026 (Serko pricing model, captured 2026-09-29).
- What Booking.com cares about: ABRN (partnership commitment ), active companies, proven incrementality (already resolved, no longer contested), churn (currently the one metric moving the wrong way into H2).
- Competitive pressure: Perk and Engine both moved into the "money layer" (cards, cashback, native expense) and control layer (policy/approval/SSO) in 2026. Engine's card rebate (up to 10%) is arguably cheaper than B4B's "free." Perk shipped agentic booking via MCP (Claude/ChatGPT, live 19 Aug) before Serko.ai reaches enterprise GA (Sept 2026). B4B's free-platform argument and Bcom-funnel advantage are real and durable; the product-depth argument currently isn't.
- Price: B4B matches Bcom (99% parity). Expedia and direct hotel booking do beat B4B on price (James, 2026-09-29).

## Constraints
**Technical (real, not assumed):**

- Eos Native Migration (SOL→Eos) is mid-flight — org/travellers/authZ/accounts services just delivered, integration ongoing
- Bcom API changes carry 3–6 month dependency lead times by policy
- Platform team is a shared dependency, on separate cycles from B4B
- ~30% of AI/engineering capacity consumed by AI + Aikido vulnerability custodianship on Flights + Trip Mgmt

**Org / resourcing:**

- 8 PMs, co-led James + Lilly, no hierarchy between the two halves
- Design System is called 'Zeus'. It only partly covers the components we need + use
- Decision velocity stalls without named owners (root-caused, tracked)
- No product leader in India, and aligning or taking a dependency with India (Platform team) can be very time consuming and difficult
- Team morale "slightly negative" — PMs reportedly reluctant to own roadmaps/outcomes

**Regulatory / trust:**

- PCI scope work in flight (tokenisation, SOL fork for B4B)
- Tax numbers: GST, VAT (via GTR partner) compliance in progress, not fully shipped
- Traxo (off-platform visibility) being removed with no replacement — a trust/duty-of-care regression right as B4B tries to move upmarket
- Our main market is Europe. So GDPR is important.

## Existing assets
- Company Acquisition sources (join, invite, activation, acquisition): `01-company-acquisition/00_setup/sources/INDEX.md`
- Research: DSA decks (churn analysis, "Metrics That Matter"), Amsterdam offsite data, Chicago session (Chase Voss), Bcom Travel Trends Tracker Wave 6 (external benchmark, support quality gap flagged but unverified internally).
- Productboard entries: Multiple. Depends what we want. (Productboard MCP available)
- Analytics dashboards: Multiple available
- Prior designs / design system: Yes
- SMEs and who owns what: 
	- Matt Weaver — Head of Data
	- Marzena (DSA) — churn analysis, targeting model
	- Lilly — Head of Product B4B (James's manager)
	- David Holyoke — CPO, owns Serko.ai
	- Craig McGuff — Eng Director B4B
	- Melissa — Head of Design
	- James Scholz - Lead Product Manager for B4B
	- Anna — activation and acquisition; leads onboarding personalisation
	- Jacqui de Bray — owns the invite acceptance number; invited-user flow

## What we have tried — joining, invites, activation, onboarding (last 12 months)
Source: James, 2026-09-28 setup session. Per-day figures are bookings per day unless stated.

**Pattern 1 — removing what travel arrangers rely on to book for someone costs bookings.**
- Removed the Goals (intent) step from signup: registrations +9.9%, bookings −25/day. More users registered but did not activate, because Goals feed the onboarding personalisation (worth +12/day).
- Hid "Create a profile" in invites: −23.6/day. Likely reason: admins create a profile so they can book for that person straight away `[assumption]`.
- **Open risk:** the new invite flow no longer creates profiles immediately.

**Pattern 2 — adding generic elements to the path to a first booking hurts; removing steps or adding personalised, context-aware ones helps.**
- Losses: sign-in button on the marketing site (−15/day); earlier embedded signup form (negative); app promo banner (−27.9/day, weak evidence).
- Wins: removed the search page after signup (+25/day); redirected logged-in users from the marketing site to the app (+14.5/day); autofilled country at registration (+3% registrations); onboarding checklist that adapts to stated intent, self-booker vs travel arranger (+12.05/day, 8.1–16.1; bookers odds ratio 60.8).
- **Checklist coverage:** the intent-based checklist serves travel arrangers only. Self-bookers, joiners and invitees get no onboarding guidance yet. Experiences for them are in work next quarter (James, 2026-09-29).

**Pattern 3 — incentives only work on users who have already booked.**
- Offers to registered users who never booked: ~0.28 return on spend. They targeted people who had already chosen not to book.
- Same offer to users with 1–4 bookings: +6.3/day.

**Join Existing Company (JEC) tests — mostly inconclusive.**
- Volumes are low. ABsmartly does not measure company retention, where the value should show.
- Only the first test had a clear result: +4.5/day.
- DSA analysis DSA-208 is due **30 Sep 2026** (during the workshop).
- Several dashboard tests were stopped before they had enough data. They taught us nothing.

## The Serko AI narrative
- What is being said externally about Serko AI: Serko.ai is a separate branded product (David Holyoke, skip-level to James), beta since May 2026, enterprise GA targeted September 2026 `[assumption]` — the Serko portfolio says open beta in September 2026, not GA. Unresolved. Public messaging (Serko blog, BTN) positions it as Serko's AI advantage/2030 pathway.
- Where B4B does / does not sit in that story: Explicitly NOT the front door. Internal boundary rule (`b4b-context.md`): B4B initiatives that leverage AI should expose Serko.ai capability, not build competing AI. Result — B4B has no customer-facing agentic surface today; Serko.ai isn't yet wired to be one either. Long-term the Platform will surface shared functionality. This work is also here to ensure we dont build in parallel when we could share.
- The gap that neither Serko.ai or B4B has: Perk already lets users book/expense/create events from inside Claude/ChatGPT (live). If the assistant becomes the booking surface, B4B's supply advantage becomes a wholesale channel, not a product — that's the teardown's own framing, and it's not yet answered anywhere in the roadmap. This is a live strategic exposure, not a hypothetical one.
