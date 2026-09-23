# B4B Context

> **STATUS: EMPTY — fill before Day 1.** Every step downstream degrades without this.
> Keep it factual. Mark anything uncertain as `[assumption]`.

## Product
- What B4B is, in two sentences: B4B is a free online travel booking tool for business travellers. It is run under an exclusive Booking.com partnership. It is free to use with no contracts and is targeted mainly at companies with 1-250 travellers. 
- Core jobs it does today: Hotel booking (core), flights (native, growing), cars, taxis, adjacent supply (rail EU-only, attractions). Company registration, team invites, join-existing-company, basic invoicing.
- What it explicitly does not do: Right now, it is not an expense tool and it does not have complicated onboarding or company setup. It is designed to be as self-serve as possible without any travel management company or setup for enterprise customers. No payment rails, no policy engine, no approval workflows, no SSO, no public API, no HRIS/ERP integrations, and rail is only in Europe. Though these things are all up for grabs. 

## Customers & segments
- Primary segments: Travel arrangers in smaller companies with 1-250 travellers. Founders that pay and book travel for their teams, or self-bookers booking for business reasons Admin (policy/billing/setup) · Travel Arranger (books for others — 15% of users, 82% of booking volume, 10x value multiplier) · Business Traveller (self-books) 
- Who administers, who books, who pays: The user does all. They can use a company card, or choose "pay at property" but generally the payment is made as part of the booking process
- Where adoption is strong / weak: Weak in the US, strong in Europe. Strongest in Germany. And strongest with people that book for others in companies with 2-20 travellers. Weakest for single-user orgs (52% annual churn vs 19% at 10+ users), corporate email adoption (48% vs 70–75% target), single-to-multi-user conversion (12% vs 15–25% healthy range), team/admin features general

## Current state numbers
- Invite & join company acceptance rate: ~40% (target ~80%)
- Company formation / growth metrics: Appx 5.5k newly activated companies per week <!--m:act.newly_activated_companies.weekly-->
- Feature adoption gaps: Low invite rate - most companies are still single-user despite 80% of bookings made for others; low corporate email adoption, low first-booking (activation) rate at appx 18%. A lot of our new users that register and never activate will bounce straight back to Booking.com, and a reasonable percentage of them go on to make business bookings on the Booking.com leisure site. 
- Other baselines: Annual churn is high: 33%. With appx 5.7% regrettable churn (high value customers), gross bookings per week: ~60k, stay search conversion rate is appx 23.2%, bookings/month is largely impacted by org size: 1 user avg 2.7 bookings/month vs 156 bookings/month for 100+ user orgs.

## Commercial
- Revenue model and what drives it: Free to customer. Serko earns supplier margin on Bcom-sourced bookings. No subscription, no booking fee.
- What Booking.com cares about: ABRN (partnership commitment ), active companies, proven incrementality (already resolved, no longer contested), churn (currently the one metric moving the wrong way into H2).
- Competitive pressure: Perk and Engine both moved into the "money layer" (cards, cashback, native expense) and control layer (policy/approval/SSO) in 2026. Engine's card rebate (up to 10%) is arguably cheaper than B4B's "free." Perk shipped agentic booking via MCP (Claude/ChatGPT, live 19 Aug) before Serko.ai reaches enterprise GA (Sept 2026). B4B's free-platform argument and Bcom-funnel advantage are real and durable; the product-depth argument currently isn't.

## Constraints
**Technical (real, not assumed):**

- Eos Native Migration (SOL→Eos) is mid-flight — org/travellers/authZ/accounts services just delivered, integration ongoing
- Bcom API changes carry 3–6 month dependency lead times by policy
- Platform team is a shared dependency, on separate cycles from B4B
- ~30% of AI/engineering capacity consumed by AI + Aikido vulnerability custodianship on Flights + Trip Mgmt

**Org / resourcing:**

- 8 PMs, co-led James + Lilly, no hierarchy between the two halves
- No dedicated Design System resource — flagged as a recurring bottleneck
- Decision velocity stalls without named owners (root-caused, tracked)
- No product leader in India
- Team morale "slightly negative" — PMs reportedly reluctant to own roadmaps/outcomes

**Regulatory / trust:**

- PCI scope work in flight (tokenisation, SOL fork for B4B)
- GST (India), VAT (via GTR partner) compliance in progress, not fully shipped
- Traxo (off-platform visibility) being removed with no replacement — a trust/duty-of-care regression right as B4B tries to move upmarket
- Our main market is Europe. So GDPR is important.

## Existing assets
- Research: DSA decks (churn analysis, "Metrics That Matter"), Amsterdam offsite data, Chicago session (Chase Voss), Bcom Travel Trends Tracker Wave 6 (external benchmark, support quality gap flagged but unverified internally).
- Productboard entries: Multiple. Depends what we want. (Productboard MCP available)
- Analytics dashboards: Multiple available
- Prior designs / design system: Yes
- SMEs and who owns what: 
	- Matt Weaver — Head of Data
	- Marzena (DSA) — churn analysis, targeting model
	- Lilly — Head of Product B4B (James's manager)
	- David Holyoke — CPO, owns Serko.ai
	- Craig McGuff95c — Eng Director B4B
	- Melissa — Head of Design
	- James Scholz - Lead Product Manager for B4B

## The Serko AI narrative
- What is being said externally about Serko AI: Serko.ai is a separate branded product (David Holyoke, skip-level to James), beta since May 2026, enterprise GA targeted September 2026. Public messaging (Serko blog, BTN) positions it as Serko's AI advantage/2030 pathway.
- Where B4B does / does not sit in that story: Explicitly NOT the front door. Internal boundary rule (`b4b-context.md`): B4B initiatives should expose Serko.ai capability, not build competing AI. Result — B4B has no customer-facing agentic surface today; Serko.ai isn't yet wired to be one either. Long-term the Platform will surface shared functionality. This work is also here to ensure we dont build in parallel when we could share.
- The gap this project exists to close: Perk already lets users book/expense/create events from inside Claude/ChatGPT (live). If the assistant becomes the booking surface, B4B's supply advantage becomes a wholesale channel, not a product — that's the teardown's own framing, and it's not yet answered anywhere in the roadmap. This is a live strategic exposure, not a hypothetical one.
