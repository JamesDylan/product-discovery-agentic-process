# Vision Horizon — Marketing Email Acceptance

**Owner:** James (solo test)
**Sphere of influence:** End-to-end

## Process note — deviation from contract

This stage normally reads `03_converge/output/direction.md`. That file doesn't exist — `03_converge`was skipped in this test run. James chose explicitly to proceed on `02_explore/output/options.md` directly rather than run `03_converge` first, and picked **Option 1 — trigger the second ask off demonstrated engagement** as the bet to build this horizon on. That pick is doing `03_converge`'s job (own the trade-off, name what's rejected) without that stage's own scrutiny — treat the "What we're betting against" section below as a thinner version of a real `direction.md`, not a replacement for one. `house-view.md` is also still `STATUS: EMPTY`, so this runs on generic reasoning, not James's tested point of view — expected for this test.

## The bet

**Trust is earned through product proof, not requested cold.** B4B currently treats every
permission-gated ask — starting with marketing-email consent — as a one-time gate cleared (or not) at signup, before the user has any reason to trust the product. The belief underneath Option 1:
**an ask made right after a user has just experienced value converts on its own merits, without
needing better copy or a bigger incentive** — because the "no" at signup was never really about
marketing email, it was about asking a stranger for something before they had a reason to say yes.

This is a belief about *timing relative to proof*, not about this specific feature. It generalises
past marketing consent the moment it's tested.

## Now / Next / Later

**Now (0–3mo) — the Accelerator output.**
Ship the second consent moment for marketing email specifically: a defined engagement trigger
(post-first-booking confirmation, or N active sessions) fires a contextual ask, separate from and
in addition to the unchanged signup-time ask. This is the direct test of the load-bearing belief —
narrow, one channel, one trigger.

**Next (3–9mo) — depends on Now validating the belief.**
If re-asking-at-proof beats asking-cold (Now's result), the mechanism generalises to every other place B4B has the same shape of problem — and `b4b-context.md` already names bigger ones than marketing consent: invite/join acceptance (~40% vs ~80% target), single-to-multi-user conversion (12% vs 15–25% healthy range), corporate email adoption (48% vs 70–75% target). Build the trigger logic as a reusable layer — event-triggered ask, not a marketing-email-specific hack — and point it at the largest of those gaps next. This is the step that turns a one-off feature into infrastructure; without Now's validation there's no evidence the pattern travels beyond the case it was proven on.

**Later (9–12mo+) — depends on Next existing as infrastructure.**
Once multiple asks run on the same triggered-by-proof layer, B4B can stop hand-placing individual triggers (post-booking, Nth session, …) and instead sequence *which* ask fires *when* per user or org, based on their own engagement pattern — an adaptive layer that decides ask order and timing, rather than a fixed list of moments someone wired up by hand. This only exists once there's more than one ask running on shared infrastructure to sequence between; it's not buildable directly from Now.

## Capabilities gained

- **Now:** B4B can convert an initial "no" into a "yes" by re-approaching at a proven-value moment, instead of treating the signup-time answer as final.
- **Next:** B4B has a reusable, event-triggered ask layer not hard-wired to marketing email — any
  permission- or action-gated ask (invite acceptance, email verification, plan/seat expansion) can hook into the same "fire on proof, not on form-step" trigger.
- **Later:** B4B can sequence and time asks per user/org automatically, based on that user's own
  engagement signal — not a developer-authored list of fixed triggers.

## What we're betting against

- **Option 2 (redesign the signup ask itself)** — the frame's own explicit deprioritisation. This
  vision bets timing matters more than wording. If Now's data says otherwise, this whole horizon collapses back to "improve the ask no one wants at signup," and Option 2 was the right call.
- **Option 4 (value-exchange reframing)** as the *primary* lever — the Now/Next mechanism here is generic re-timing, not a bespoke feature-for-consent trade. (Option 4 isn't excluded long-term — it could sharpen individual asks once the timing layer exists — but it is not the bet.)
- **Option 5 (route around consent via in-app channels)** as a substitute for growing the
  consented base. This vision keeps investing in marketing consent as a real, ownable base rather than sidestepping the opt-in problem with a different channel.
- **The premise that consent is a one-time gate.** Betting that "ask once, live with the answer" is the wrong default for B4B generally, not just for this one flow.

## Where AI sits in this

**Incidental, not the mechanism — said plainly rather than forced.** Now and Next are rule-based: fixed triggers (booking event, session count) firing a fixed ask. Later's "sequence per user" could eventually use a prediction/ranking model to decide ask order, which is the one point where this could connect to Serko.ai infrastructure — but that's speculative and not load-bearing to the bet.
If Later gets built, it's as likely to ship as hand-tuned heuristics as as a model. This vision does
not need an AI story to be true.

## Open questions that would change the view

- **Does Now's core assumption hold at all?** (`frame.md` load-bearing assumption 1, explicitly
  untested, flagged for `05_pressure-test` — which hasn't run in this test.) If re-asking at proof doesn't beat asking cold, Next and Later have no foundation.
- **Is marketing consent a real lever on churn/reactivation, or a symptom** of the same funnel gaps alread documented (invite acceptance, activation)? (`frame.md` load-bearing assumption 2, also unresolved.) If it's a symptom, Next's generalisation to bigger gaps is the actual point and marketing consent was never more than the cheapest place to test the mechanism.
- **Does this reproduce with `03_converge` and `05_pressure-test` actually run?** This horizon was built by picking a bet directly from unranked options, not from a stage that pressure-tested it. A real `direction.md` might surface a trade-off that changes which option thi vision should sit on top of.

## The one sentence

**B4B should stop treating every ask of a user — consent, invitation, expansion — as a form step cleared once at signup, and start firing it off proof the user has already gotten value, building toward a system that knows when to ask each user for the next thing instead of asking everyone the same way at the same fixed moment.**

A colleague working on B4B but not this problem could reasonably disagree: they could argue the front-door ask itself is the fixable thing (Option 2), or that re-asking a cold user again just
moves the "no" downstream without addressing why the answer is no in the first place.
