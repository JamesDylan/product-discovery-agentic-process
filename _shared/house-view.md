# House view — James's theory of best

## Why this exists

The structure is worth nothing on its own. What makes a folder pipeline produce good work is that someone who has done the job long enough to know where it breaks built the folders around the break point. That knowledge is not in the brief and not on the internet. It is a position formed by doing the work, and it has to be written down to be usable by anyone but its owner.

## Fill these

**What good looks like**
- Good experiences are ones that are primarily targeted towards the travel arranger. Ie people booking for others. They should also be simple, as the majority of our customers are not travel experts. They use a bcom branded tool because its simple and familiar. 
- A strong B4B product direction is one that directly differentiates B4B from a leisure booking tool, while also allowing the Bcom booking experience to shine. Booking.com have spent years optimizing the booking flow, and Serko have spent years building a good company experience. B4B is the convergence of the two.
- Something is 'decision-ready' when we are confident it solves a real customer need (problem worth solving), and we have correctly identified the best way to solve that problem (solution worth pursuing). It has quant and qual data to support it, a clear line between solution and impact, and shows feasibility, desirability and viability. A clear first slice that delivers value early with a clear vision of where to go next if the initial mvp shows promise.

**What you kill on sight**
- Approvals. Approvals are complex, difficult and degrate the experience. We dont want to add a blocker to people booking. Rather we want controls before the decision is made to ensure the user is only booking what they know would get approved anyway. 
- Ides that dont solve a clear and measurable customer pain point
- I keep seeing ideas from PMs that sound good, but dont solve a real problem or dont have data to support them. Ideas are great, but we need to ensure only the ones that have an impact get built.

**Your standing trade-offs**
- We prefer small, frequent slices rather than big-bang features. If we can deliver value early, even if its not complete, we prefer that. 
- Break this rule when there are large risks involved - ie finance/payments, security, PII etc. 

**What outsiders get wrong**
- Our customers dont exclusively use B4B. Most use several booking tools at once
- Our customers are not travel experts. They are just office managers/sales people/managers that make bookings because they own the credit card. They are not travel managers as a full-time job.
- The admin spends a lot of time comparing offerings between B4B and other platforms. They also share these with the traveller for feedback. But they generally know what works, how much they can spend etc even if its not clearly documented in a policy or rule

**Evidence**
- We run a/b tests to gather evidence. We also trust customer feedback and insights from our DSA team
- People sometimes get misled by the fact that our orgs typcially only have one 'member' in our system, but that person books for multiple other people. So it seems like our companies are small, but in reality they are not. Most common is 10-21 travellers. With our largest customers sitting around 10k travellers. 

**Where the job breaks**
- Things often go wrong at the seam between B4B and Bcom. ie price mismatch, multiple different APIs giving slightly different info, users accounts becoming misaligned etc
- If I could only be in the room for one part of this pipeline it would be agreeing on the problem-worth-solving. Ensuring we are solving the right problem is half the battle.

**Current 2027 direction thinking**
* Know the user - intent based onboarding and personalisation
* Improve `join existing company` & `invite`flows
* `Company Hierarchy` including accelerated onboarding through HR integrations
* Policy Guardrails - budgets, shortlists, insights

## How this gets used

Every stage loads this file. Claude applies it as a constraint — challenging work that violates it,
and flagging when the house view itself looks like it's producing a blind spot rather than clarity.
