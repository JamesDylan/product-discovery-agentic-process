# Options — Marketing Email Acceptance

No ranking. Five materially different bets on how to grow the marketable-consented base.

## 1. Trigger the second ask off demonstrated engagement (the frame's cut)

**Bet:** timing beats wording — a user who has proven the product out (first booking, Nth session)
is far more willing to opt in than one being asked cold at signup.
**How it works:** signup keeps today's ask as-is. A second, separate consent moment fires off a
defined engagement trigger (e.g. post-first-booking confirmation, or after N active sessions),
with copy tied to that specific moment rather than generic marketing language.
**Key moment:** on the post-booking confirmation screen — "Want fare-drop alerts for routes like
this one?" — a specific, contextual ask, not a repeat of the signup checkbox.
**Assumes:** re-asking later converts meaningfully better than asking once at signup (frame's
load-bearing assumption 1, untested). Assumes a second ask doesn't read as spammy if it's tied to a real moment.
**Why someone smart picks it:** it's the direct answer to "ask before they're sold" — cheapest way
to test the core hypothesis with one new touchpoint, no new channel or infra.

## 2. Redesign the signup-time ask itself

**Bet:** the problem isn't *when* you ask, it's *how* — framing, default state, and specificity of
the value exchange at signup are doing more damage than timing.
**How it works:** rework the signup consent moment directly — clearer value prop, more specific
than "marketing emails" (e.g. named benefit categories), better placement relative to the primary signup action.
**Key moment:** the signup form's consent checkbox becomes a short, specific choice screen instead of a single generic checkbox buried in a form.
**Assumes:** the 19%→25% gap is driven more by ask quality than by timing/trust — i.e. assumption 1 in `frame.md` is wrong or incomplete.
**Why someone smart picks it:** it's the fastest to ship (one surface, no new trigger logic), and
it's the option the frame's own "cut" explicitly deprioritized — worth keeping live so that bet
isn't taken on faith.

## 3. Use the org graph, not the individual

**Bet:** individual users decline because there's no social proof or authority signal; a company
admin or booker acting as a consent steward converts better than asking each traveller cold.
**How it works:** surface an admin-facing nudge ("invite your travellers to get fare alerts and
policy updates") that triggers a company-branded, admin-endorsed consent request to org members, rather than a generic company-wide email ask.
**Key moment:** an admin dashboard prompt after the admin's own opt-in, offering to extend the same ask to their travellers with one click.
**Assumes:** B4B admins are willing to vouch for marketing outreach to people they manage, and that users trust an admin-endorsed ask more than a cold one from Serko.
**Why someone smart picks it:** B4B is inherently networked — bookers and admins already have
standing with travellers that Serko doesn't; this is the one option that uses that structure instead
of treating every user as an anonymous individual.

## 4. Make consent a value exchange, not an ask

**Bet:** users decline because there's no personal payoff — "get marketing email" has no answer to
"what's in it for me," so reframe it as an explicit trade.
**How it works:** tie opt-in to a concrete, immediate benefit the user actually wants — e.g. "opt in
to get notified the moment fares drop on your saved routes" — where the benefit *is* the email,
not a bribe for unrelated marketing.
**Key moment:** a route-watching or saved-search feature where the only way to receive the alert is via the marketing-consent channel, making the trade concrete and self-evident.
**Assumes:** there's a benefit worth building that's genuinely valuable enough to move the needle,
and that packaging marketing consent as a feature (rather than a courtesy ask) doesn't read as
manipulative.
**Why someone smart picks it:** it removes the "why would I want this" objection entirely by
answering it up front, instead of relying on better timing or better copy to sell the same ask.

## 5. Don't grow marketing consent — route around it

**Bet:** growing the marketing-consent base is solving the wrong layer. The actual business need
(reach at-risk users for churn/reactivation) doesn't require classic marketing-email consent at all
if delivered through a channel that qualifies as transactional or in-app, not promotional.
**How it works:** build reactivation/churn-prevention messaging into an in-app notification or
inbox surface that every user already has access to (no separate opt-in gate), and reserve
marketing-email consent purely for genuinely promotional content.
**Key moment:** a user who hasn't booked in 60 days sees an in-app nudge on next login — no email, no consent gate, same business outcome.
**Assumes:** frame's load-bearing assumption 2 is false as stated — growing the marketable base is *not* the only lever on churn/reactivation outcomes; a non-email channel can substitute for it.
Assumes legal/compliance accepts the transactional-vs-marketing distinction for this use case.
**Why someone smart picks it:** it's the option most likely to be politically inconvenient (it
sidesteps marketing's channel and puts the burden back on product/engineering to build new
surface), but it's also the only one that tests whether the whole premise — "we need more people opted into marketing email" — is the right problem at all.

---

## Interrogate

- **Which option came first, and what does it stop you seeing?** Option 1 — it's `frame.md`'s own "cut." Its existence is why option 2 (fix the ask itself) got explicitly deprioritized before any option was evaluated, and it's easy to skip straight past option 5's harder question: whether marketing-email consent is even the right lever, versus a symptom of the same funnel gaps `b4b-context.md` already documents (invite-acceptance, activation).
- **What does this look like if the user does nothing at all?** Option 5 — the user takes no
  consent action and still gets reached, because the mechanism no longer runs through opt-in email.
- **The politically/technically inconvenient one:** option 5, explicitly. It moves scope onto
  product/engineering to build new surface, and it implicitly argues marketing's core channel is
  the wrong tool for this business outcome — worth keeping in the set for exactly that reason.

## Carried-forward gaps (not resolved here, flagging for traceability)
- `00_setup/output/inventory.md` was skipped for this run — "mine what exists" (process step 2) is not backed by a real asset/access inventory, just what's in `frame.md` and this session.
- `house-view.md` is still empty — these options are argued on generic B4B reasoning, not James's tested point of view. Options 2 and 4 in particular are the kind of thing a filled house view might kill on sight or strongly prefer; worth a second pass once it's written.

## Human check
Point at the option that makes you uncomfortable. If there isn't one, this set is too narrow.
