---
title: Post-booking consent ask
owner: James Scholz
collaborators:
date: 2026-09-21
question: Does a marketing-email consent ask feel worth answering when it fires right after a booking confirms, instead of cold at signup?
bundles: shell
divergence: none
status: ready-for-agent
---

Source: `08_vision-horizon/output/vision-horizon.md` · horizon Now · run `03-test-marketing-email-acceptance`
Fidelity: **mid-fi coded UI shell.** Look and feel, real navigation, everything else faked.

## Problem statement

B4B treats every permission ask, starting with marketing-email consent, as a one-time gate cleared
or not at signup, before the user has any reason to trust the product. The Now horizon's bet: an
ask made right after a user has just experienced value converts on its own merits, without better
copy or a bigger incentive. This surface puts one version of that ask in front of a person: a
contextual marketing-email opt-in on the post-booking confirmation screen, additive to the
unchanged signup-time ask.

## What this surface is trying to learn

Does a marketing-email consent ask feel worth answering when it fires right after a booking
confirms, instead of cold at signup?

- **Yes** looks like: the reader lands on the confirmation screen, sees "Want to know about new
  features and specials?" placed against the booking they just made, and clicks accept. The ask
  card swaps to a success acknowledgement — "You're set. We'll let you know about new features and
  special offers." — with an "Updates on" badge.
- **No** looks like: the reader reads the same ask and clicks decline. The ask card swaps to a
  neutral acknowledgement — "Got it. We won't send you those updates." — with a neutral "Not now"
  badge. No guilt copy, no re-prompt, no second chance on this screen.

If a reviewer cannot point at which button produces which of these two outcomes, the screen has not
answered the question.

## Actors

| Vision actor | Lab persona / role | Notes |
|---|---|---|
| Business traveller (self-books) | **Nadia** — Reid & Co, System role **Traveller**, user-type **self-booker**, `viewerMemberId: mem-oliver-brennan`, context `after-invites` (band `team`) | Real coordinate in `domain/personas.ts`'s `companyPersonaConfigs`. Traveller is not cast at Reid & Co's `signed-up` context (self-booking band casts only the account owner), so `after-invites` is the earliest context that casts her. Owner confirmed: a specific, named example over a generic/placeholder one, so the screen reads as a real product moment. |

Persona switcher: **not taken.** The ask is about the individual who just booked, not about role —
an Administrator or Arranger booking for themselves would see the identical screen. Taking
`demo-switcher` here would stand a second source of truth beside a distinction this surface does
not make.

## Screen inventory

**A screen not listed here is out of scope.**

| # | Route | Purpose | Key state shown |
|---|---|---|---|
| 1 | `app/post-booking-consent-ask/page.tsx` | The post-booking confirmation screen carrying the contextual marketing-consent ask | Not-yet-asked by default; swaps to accepted or declined on click |

## Components per screen

Precedence: `components/ui/*` primitive → `components/custom/*` composition → semantic token →
one-off, flagged. **Never raw hex.** Check each against the component registry's agent brief
(`/?section=components`) before writing.

| Screen | Components | Variants / axes |
|---|---|---|
| 1 | `Card` (confirmation header block), `Icon` + `CheckCircleIcon`, `Icon` + `MailIcon`, `Card` `CardContent` with `dl`/`dt`/`dd` fact rows (route, dates, fare), `Separator`, `Card` (the ask block), `Icon` + `BellIcon`, `Button`, `Button`, `Badge` | Header card: `Card` `variant="default"` `size="md"`. Ask card: `Card` `variant="outline"` `size="sm"`. Accept button: `Button` `variant="default"`. Decline button: `Button` `variant="outline"`. Accepted-state badge: `Badge` `variant="success"` `appearance="subtle"`. Declined-state badge: `Badge` `variant="secondary"` `appearance="subtle"`. Footer nav: `Button` `variant="outline"`. |

Status colours use the one ladder in `lib/status-families.ts`: `info → success → pending →
warning → destructive`. Only `success` is used on this screen (the accepted acknowledgement).
Declining is a neutral outcome, never `destructive` — nothing failed and nothing is broken.

## States to build

Only the states that affect the question. Named explicitly.

- Empty / first run: not built — the screen always renders against the one confirmed booking.
- Loading: not built — the booking is a static fixture, nothing is fetched.
- Error: not built.
- Not-yet-asked / accepted / declined: all three built. This is the whole surface.
- Role-absent: not applicable — the screen casts one persona, one role.

## Data

| Screen | Backed by | New mock needed? |
|---|---|---|
| 1 | `domain/types.ts` `Booking` shape; `lib/data/flights.ts` id `f133` (Air France AF761, London Heathrow → Paris) for realistic route/fare facts; `domain/personas.ts` Nadia / `mem-oliver-brennan` for traveller identity | Yes — a synthetic `confirmed` booking for `mem-oliver-brennan` using flight `f133`, dated just after `SEED_NOW_ISO`. The existing seeded record referencing `f133` (`b-reid-6`) is `awaiting-approval`, not `confirmed`, so it cannot be reused as-is; seed data is never edited to make it fit. Owner confirmed a specific example is wanted, so this fixture stays. Note: the booking's own route/fare facts stay specific; the *ask copy* itself is deliberately generic (see below) and doesn't reference the route — confirmed with the owner rather than assumed. |

Clock is fixed at `SEED_NOW_ISO`. Entity ids, the shared cast and the clock are never redefined.
No lorem ipsum — realistic names, amounts and dates, including edge content.

## Faked vs real

**Real** (the interaction being tested):
- The accept / decline click and the resulting state swap.
- In-page navigation (footer "back to bookings" link).

**Faked** (rendered, inert):
- The booking itself — a static fixture, not a live checkout session.
- Any implication the accept/decline choice is saved anywhere, revisitable later, or connected to
  an actual email system.

**Not built at all:**
- Persistence, auth, backend call, a settings/profile screen to revisit the choice.
- The signup-time consent ask — unchanged and explicitly out of scope (see Out of scope).
- Settings, admin views, i18n, performance, edge cases unrelated to the question.

This surface has no absent-backend gap to mark: it is a net-new interaction, not a stand-in for a
capability the current product already has. The `platform-gap-marker` pattern does not apply here.

## Design source

None — built from `docs/foundations/design.md` plus the sibling-surface exemplar
`app/booking-flow/_components/checkout/confirmation-view.tsx` (the lab's existing post-booking
confirmation screen: success icon and heading, a bordered fact section, a `Separator`, an
outline-button footer row). Do not import from it — copy the pattern only (ADR-0026).

## Hub entry

| Field | Value |
|---|---|
| `productArea` | `booking-management` |
| `title` | Post-booking consent ask |
| `summary` | A contextual marketing-email opt-in fired at booking confirmation, instead of cold at signup. |
| `focus[]` | Marketing consent, Booking confirmation, Trust-then-ask |
| `shell` | Minimal (`BaseDocument` + stub page — no nav chrome; single-screen surface) |
| `status` | `in-progress` |
| `ctaLabel` | Open prototype |

## Out of scope

- The signup-time consent checkbox. It stays exactly as it is today — this surface adds a second
  moment, it does not touch the first (Option 2, redesigning the signup ask, is explicitly bet
  against in `08_vision-horizon/output/vision-horizon.md`).
- The N-active-sessions alternate trigger. No sourced key moment exists for it anywhere upstream of
  this stage, so it gets no screen (per this stage's own rule: no question, no surface).
- Any settings or profile screen to change the choice after this screen. Not sourced, not built.
- Persisting, sending, or otherwise acting on the accept/decline choice.
- Any other persona, role, or company. This screen casts Nadia at Reid & Co only.
- Route- or fare-specific ask copy. The consent ask is deliberately generic ("new features and
  specials"), not tied to the traveller's specific route — confirmed with the owner.

## Open questions for the owner

None outstanding — persona specificity, `productArea`, the slug and the owner name were all
confirmed directly before this brief was written, per this stage's "Ask, don't invent" step.

---

### How to run this

```bash
cd Tools/b4b-discovery-lab
pnpm install && pnpm dev
```
Then in Claude Code, cwd `Tools/b4b-discovery-lab`, on a branch (main is protected):
```
/new-prototype post-booking-consent-ask
```
The skill scaffolds `app/post-booking-consent-ask/` and writes
`.scratch/post-booking-consent-ask/spec.md`. Paste this brief's frontmatter and body into that spec.
**The `.scratch/` folder name must match the surface slug** or the ownership hook will deny writes.

Order is load-bearing: **spec → scaffold → bundles → hub entry last.** Never import across
prototypes — copy from anywhere, import from nowhere.
