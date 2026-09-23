# 10_prototype-handoff — convert this run's position into a brief the lab can build

One job: produce the instructions that let the B4B Discovery Lab stand up a look-and-feel UI of
this run's vision, without anyone re-deriving the vision from scratch.

**Optional stage.** Run it when the position needs to be seen to be argued with — which is most of
the time, but not all of it. Skip it when the run's output is a sequencing or policy claim that no
screen would make more arguable.

**Scope discipline:** the ask is a UI shell that uses the right components to give a solid look and
feel — the lab's "mid-fi coded" default. Not a working Eos prototype. Not a build. If the brief
starts specifying services, persistence or auth, it has drifted.

## Why this stage exists
A vision doc and a prototype brief are different genres. The vision states directions and bets; the
lab demands a falsifiable one-sentence question, a slug, a named screen inventory, a mapped persona
cast and a declared fake/real line. The lab's own playbook is blunt: *"If you can't write the
question, you don't know what to prototype."* Nothing upstream in this pipeline produces that
question. This stage does.

## Inputs
- Reference (every run): `../../_shared/operating-principles.md`
- Reference (every run): `../../_shared/house-view.md`
- Reference: `../../_shared/prototype-brief.template.md` — the output shape and the lab's contract
- Working: `../08_vision-horizon/output/vision-horizon.md` — the bet, and the Now/Next/Later chain
- Working: `../CLAUDE.md` — sphere of influence, which bounds what surfaces this run may propose
- Working: `../04_make-tangible/output/` — anything already made tangible feeds the screen inventory
- Working: `../05_pressure-test/output/` — the edge cases that decide which states get built

**Lab reference — read before writing, in the lab repo, not here.** Default location
`~/hobbes/poc-b4b-discovery-lab`; the lab itself is the `Tools/b4b-discovery-lab/` subfolder.
- `Tools/b4b-discovery-lab/.claude/skills/new-prototype/SKILL.md` — the invocation
- `Tools/b4b-discovery-lab/docs/agents/new-prototype.md` — the frontmatter spec
- `Tools/b4b-discovery-lab/docs/foundations/design.md` — read before any UI
- `Tools/b4b-discovery-lab/CONTEXT.md` — the glossary. All vocabulary comes from here.
- `Tools/b4b-discovery-lab/.scratch/company-management/HANDOFF.md` — the best model to copy

## Process
1. **Decompose into questions.** One prototype surface per falsifiable question, not one prototype
   for the whole run. Two or three narrow surfaces beat one omnibus every time. If a horizon yields
   no question a UI could answer, it does not get a surface.
2. **Name and check each slug.** Kebab-case. Refuse collisions with live surfaces and with the
   reserved roots `login`, `artifacts`, `reference`, `api`, `_shared`, and the hub. Check against
   the lab's hub registry, not from memory.
3. **Map the run's actors onto the lab's existing cast.** The lab has a fixed persona set, fixed
   system roles and a fixed clock (`SEED_NOW_ISO`). Vision-language segments must be translated, or
   the surface silently invents a second domain model.
4. **Write the screen inventory.** Named routes under `app/<slug>/`. The rule the lab inherits from
   the Serko FE template is absolute: *a screen not listed here is out of scope.*
5. **Choose components before writing any.** Precedence: an existing `components/ui/*` primitive →
   a `components/custom/*` composition → semantic tokens → a one-off, flagged. Never raw hex.
   Name the specific components and their variants per screen. That naming is what buys the look
   and feel — it is the highest-leverage part of this brief.
6. **Declare the fake/real line.** Explicitly, per screen. The lab forbids shipping a prototype
   without it. Default: everything faked except navigation, state transitions and the one
   interaction the question turns on.
7. **Decide bundles and divergence.** `shell` · `demo-switcher` (an import, never a copy) · named
   flow slices · `all`. Declare any domain divergence, and respect the non-forkable floor: entity
   ids, the shared cast and the seed clock are never redefined.
8. **Translate the vocabulary.** Every term in the brief must exist in the lab's `CONTEXT.md`
   glossary. Coinages from the vision get mapped or dropped.

## Ownership
`owner:` is **the PM who ran this process** — the name in `../CLAUDE.md` under *Owner of the
12-month view* — written exactly as their `git config user.name`. A human name, never a handle or
an email. Get it wrong and the lab's write-guard hook silently denies every subsequent edit to that
surface. Confirm the exact string with them rather than guessing it.

## Blind spots to call out
- **One giant prototype.** The most likely failure of this stage. A single surface expressing the
  whole run answers nothing.
- **A question that can't be wrong.** "What does the future of company management feel like?" is
  not a question — no answer to it would change anything. Write the no as well as the yes.
- **Specifying a build.** Services, persistence, auth, real data: all out of scope. The lab's
  `platform-gap-marker` pattern exists precisely so screens can be built over an absent backend.
- **Inventing components.** A brief describing bespoke UI produces a prototype that looks nothing
  like B4B, which defeats the point of using the lab at all.
- **Surfaces outside the sphere of influence.** If a surface needs another run's territory to make
  sense, it belongs in `101-prototype-handoff` after synthesis, not here.
- **Em dashes in screen copy.** The lab forbids them in rendered strings. Use hyphens.

## Outputs
- `prototype-briefs/<slug>.md` → `output/` — one per surface, using
  `../../_shared/prototype-brief.template.md`. Lab-ready: paste the frontmatter into
  `.scratch/<slug>/spec.md` and run `/new-prototype`.
- `HANDOFF.md` → `output/` — the ranked reading order, the settled decisions that must not be
  reopened, and the single next action naming the first surface to build.

## Human check
Give one brief to someone who has not read the vision and ask them what question the prototype
answers. If they answer with a feature description instead of a question, rewrite it. Then ask the
named owner whether they would defend that question in a review — if not, it's the wrong question
or the wrong owner.
