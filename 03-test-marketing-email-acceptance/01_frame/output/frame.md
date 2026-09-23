# Frame — Marketing Email Acceptance

## Problem statement

Users default to declining marketing-email consent at signup — before they're sold on B4B — and we
never re-ask once they've proven engagement by actually using the product. That keeps the
marketable base smaller than it needs to be for reactivation and churn-prevention campaigns, which
already have a good ROI on the users they can reach.

## Whose problem

- **Feels it:** Marketing team (owns campaigns, purely email today; Tuesday Howard, Product
  Marketing). Not blocked — they run campaigns on whoever has opted in — but reach, and therefore
  effectiveness, is capped by the small opted-in base.
- **Must act for it to change:** Product/Engineering. Consent capture and any re-ask moment live in
  product surfaces, not in anything marketing can change themselves.
- **Not the traveller's problem.** No user wakes up wanting to receive marketing email. This is a
  business-outcome problem wearing a product-flow shape.

## Outcomes

- **Business outcome:** Grow the marketable-consented base so reactivation/churn-prevention
  campaigns reach more of the users they'd help.
- **Customer outcome:** Genuinely weak or negative on its own — more users opted into more email is
  not something users are asking for. The only honest customer-side outcome is indirect: a user who
  later gets a useful reactivation nudge instead of silently churning.
- **Tension:** This is a business-need-led problem. Any solution has to earn its way past "why does
  the company want this" — timing the ask around genuine product moments (not company convenience)
  is what keeps it from reading as growth-hacking.

## Evidence

**For — this is real:**
- ~19% opt-in at the registration page; ~25% among companies that go on to activate. [source: James,
  raw number, no file reference — not yet in `b4b-context.md`]
- The activation/opt-in correlation (18% → 25%) is directionally consistent with the "ask before
  they're sold" hypothesis: people who prove out the product are more willing to hear from it.
- Marketing already has positive ROI on the consented base today — this isn't a hypothetical
  channel, it's a proven one running under capacity.

**Against — what a skeptic would say:**
- No benchmark or ceiling exists. "Higher than 19%" is not a target, it's a direction. A skeptic
  can reasonably ask how much upside is actually on the table.
- The 18%→25% correlation is not causal. Motivated users may simply be more likely to both activate
  *and* opt in, for reasons that have nothing to do with when you ask — self-selection, not timing.
- `b4b-context.md` already documents larger, better-evidenced gaps in the same funnel: invite/join
  acceptance (40% vs 80% target) and activation itself (~18%). If marketing consent moves and those
  don't, it's not obvious churn or reactivation improves at all.

## Load-bearing assumptions

1. **[LOAD-BEARING]** Re-asking for marketing consent later, once a user is activated/engaged,
   converts meaningfully better than the signup-time ask. This is inferred from a correlation, not
   tested directly. If false, the whole "add a second moment" direction collapses back to "improve
   the ask no one wants at signup."  → **`05_pressure-test` must test this.**
2. **[LOAD-BEARING]** Growing the marketable base is a real lever on churn/reactivation outcomes,
   not a proxy for the same thing activation and invite-acceptance already measure. If it's a pure
   symptom, this problem is not worth solving independently of those two.  → **`05_pressure-test`
   must test this.**
3. A user who declines at signup and is asked again later will not perceive the second ask as
   spammy or trust-eroding, provided the trigger is a genuine product moment rather than a
   scheduled nag. Not tested.
4. GDPR consent rules (explicit opt-in, no pre-ticked boxes, per `b4b-context.md`) set a ceiling on
   achievable opt-in rate that no UX change can move past. Direction, not magnitude, known.

## The cut

**The one thing that, if solved, makes the rest easier or irrelevant:** a second, well-timed consent
moment triggered by demonstrated engagement (e.g. after first booking, or after N sessions) —
not a better-worded ask at signup. If assumption 1 holds, this single mechanism largely answers
question 3 outright and does more for question 2 (targetable base) than any amount of signup-flow
polish, because it moves the ask past the moment people default to "no."

**Explicitly out of scope for this run:**
- Redesigning campaign content, frequency, or targeting logic — that's marketing's job, not this
  problem's.
- Non-email consent channels (SMS, push) — marketing runs email only today.
- Establishing a real benchmark/ceiling for opt-in rate — no data exists; treat as a known gap, not
  something to solve here.
- Proving assumptions 1 and 2 — that's `05_pressure-test`'s job, not `01_frame`'s.

## Out-of-scope note for `_shared/b4b-context.md`

The 19%/25% marketing-consent figures aren't currently recorded in `b4b-context.md`. Worth adding
so the next stage — or a different run — doesn't have to re-derive them from a chat transcript.
