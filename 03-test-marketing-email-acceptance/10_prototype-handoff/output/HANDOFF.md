# Handoff — Marketing Email Acceptance prototype brief

Entry point for whoever builds this next. One surface, one brief. Read this first, then the brief.

## Start here, in this order

1. `prototype-briefs/post-booking-consent-ask.md` — the build spec, `ready-for-agent`. One screen,
   three states, the falsifiable question, the real components, the fake/real line. **This is the
   instruction set.**
2. `../../08_vision-horizon/output/vision-horizon.md` — the bet this brief tests, and why Next and
   Later stay infra rather than screens.
3. `../../02_explore/output/options.md` — Option 1, the source of the original "fare-drop alerts"
   framing this brief deliberately genericised (see below).

## Settled — do not reopen

- **One surface, one screen.** The Now horizon has exactly one sourced, screen-able moment: the
  post-booking confirmation ask. The Nth-active-sessions alternate trigger has no cited UI moment
  anywhere upstream, so it does not get a surface or a screen. Next and Later are infrastructure,
  not screens, and were never in scope for this stage.
- **No signup-flow screen.** The signup-time ask stays unchanged and unbuilt here — building even a
  static, unmodified reproduction of it would dilute the one question this surface asks and risks
  reading as touching Option 2, which this vision bets against.
- **Ask copy is generic, not route-specific.** `02_explore/output/options.md`'s Option 1 sourced the
  illustrative copy "Want fare-drop alerts for routes like this one?" — the owner explicitly
  rejected that framing when reviewed and asked for something generic instead: "notified when we
  have new features or specials." The brief now reads "Want to know about new features and
  specials?" This was an owner call, not a default — don't revert it.
- **Persona: Nadia, Reid & Co, Traveller, self-booker, context `after-invites`.** Confirmed against
  `domain/personas.ts`'s real `companyPersonaConfigs` — not invented. The owner was asked directly
  whether to cast a specific persona/booking or stay generic, and chose specific. `demo-switcher`
  is not taken; the ask does not vary by role.
- **`productArea: booking-management`**, confirmed directly with the owner over the alternative
  (`booking-experience`) — chosen because this is "life after a booking exists," not a step inside
  the booking flow itself.
- **Two-button accept/decline, not a `Switch`.** A switch implies a persistent, revisitable setting
  this surface does not model or promise. Two buttons match the one-time, answerable-now framing.
- **Divergence: none.** `domain/` has no marketing-consent field on `Member` (grepped, confirmed
  absent) and this surface never persists the choice, so there is nothing to model or overlay.
- **No `platform-gap-marker`.** This is a net-new interaction, not a stand-in for a capability the
  current product already has, so the gap-marker pattern does not apply.
- **Booking fixture is new, not reused.** `mem-oliver-brennan`'s existing seeded bookings are
  cancelled, completed, or awaiting-approval — none is a freshly-confirmed record. The brief
  specifies a new static fixture modelled on real catalog data (flight `f133`, Air France AF761,
  London Heathrow → Paris) rather than editing seed data to fit. The booking's own route/fare facts
  stay specific even though the ask copy itself is generic — those are two separate decisions.
- **`owner: James Scholz`.** Checked directly against `poc-b4b-discovery-lab`'s own local
  `git config user.name`, which differs from this memory-system repo's local override (`James`).
  Confirmed with the owner before writing it in. Get this wrong and the lab's write-guard hook
  silently denies every future write to the surface.
- **Slug: `post-booking-consent-ask`.** Checked against the lab's reserved roots and existing
  `app/` folders — no collision. Confirmed with the owner.

## Process note for future runs

This is the first run through `10_prototype-handoff` since its contract gained an explicit
"Ask, don't invent" step (added this session, in `_template/10_prototype-handoff/CONTEXT.md`). The
first pass at this brief was drafted by an agent that picked the persona, the fixture, and the ask
copy itself, without asking. The owner corrected the copy and then named the deeper problem: the
stage should ask for these things every time, not just when it happens to be caught. The five items
above under "Settled" were all things the earlier draft invented and the fixed process then asked
about directly. Future runs of this stage should produce a shorter list here — because the asking
happens before the draft, not after.

## Still open

None. Every judgment-call slot the stage's "Ask, don't invent" checklist names — copy, persona,
data fixture, `productArea`, `owner:`, slug — was confirmed with the owner before this brief was
written.

## Next action

Run `/new-prototype post-booking-consent-ask` from `Tools/b4b-discovery-lab` on a new branch
(never `main`), pasting `prototype-briefs/post-booking-consent-ask.md`'s frontmatter and body into
the spec it scaffolds. There is only one surface here, so there is no sequencing decision to make —
this is it.
