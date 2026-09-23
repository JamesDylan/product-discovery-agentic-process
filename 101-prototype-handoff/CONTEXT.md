# 101-prototype-handoff — convert the B4B vision into briefs the lab can build

One job: produce the instructions that let the B4B Discovery Lab stand up a look-and-feel UI of the
synthesised vision, without anyone re-deriving the vision from scratch.

**Optional and discrete.** Run it for the surfaces that need more than one run's territory. Single-
run surfaces belong in that run's `10_prototype-handoff` — same method, narrower claim, and the
owner is the pair rather than whoever owns the synthesis.

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
- Reference (every run): `../_shared/operating-principles.md`
- Reference (every run): `../_shared/house-view.md`
- Reference: `../_shared/prototype-brief.template.md` — the output shape and the lab's contract
- Working: `../99-vision-synthesis/output/b4b-12-month-vision.md` — the through-line and sequencing
- Working: each run's `CLAUDE.md` — sphere of influence, which decides who owns each surface
- Working: each run's `10_prototype-handoff/output/` if it ran — **read it before proposing
  anything.** A surface already briefed at run level is not re-briefed here.

**Lab reference — read before writing, in the lab repo, not here.** Default location
`~/hobbes/poc-b4b-discovery-lab`; the lab itself is the `Tools/b4b-discovery-lab/` subfolder.
- `Tools/b4b-discovery-lab/.claude/skills/new-prototype/SKILL.md` — the invocation
- `Tools/b4b-discovery-lab/docs/agents/new-prototype.md` — the frontmatter spec
- `Tools/b4b-discovery-lab/docs/foundations/design.md` — read before any UI
- `Tools/b4b-discovery-lab/CONTEXT.md` — the glossary. All vocabulary comes from here.
- `Tools/b4b-discovery-lab/.scratch/company-management/HANDOFF.md` — the best model to copy

## Process
1. **Decompose into questions.** One prototype surface per falsifiable question, not one prototype
   for the whole vision. Three narrow surfaces beat one omnibus every time. If a horizon yields no
   question a UI could answer, it does not get a surface.
2. **Justify why each surface is here and not in a run.** The test: does the question need two
   runs' territory to be askable? If not, it belongs to a run. Pushing run-level work up to this
   stage concentrates ownership in one person, which is the opposite of what the programme is for.
3. **Name and check each slug.** Kebab-case. Refuse collisions with live surfaces and with the
   reserved roots `login`, `artifacts`, `reference`, `api`, `_shared`, and the hub. Check against
   the lab's hub registry, not from memory.
4. **Map the vision's actors onto the lab's existing cast.** The lab has a fixed persona set, fixed
   system roles and a fixed clock (`SEED_NOW_ISO`). Vision-language segments must be translated, or
   the surface silently invents a second domain model.
5. **Write the screen inventory.** Named routes under `app/<slug>/`. The rule the lab inherits from
   the Serko FE template is absolute: *a screen not listed here is out of scope.*
6. **Choose components before writing any.** Precedence: an existing `components/ui/*` primitive →
   a `components/custom/*` composition → semantic tokens → a one-off, flagged. Never raw hex.
   Name the specific components and their variants per screen. That naming is what buys the look
   and feel — it is the highest-leverage part of this brief.
7. **Declare the fake/real line.** Explicitly, per screen. The lab forbids shipping a prototype
   without it. Default: everything faked except navigation, state transitions and the one
   interaction the question turns on.
8. **Decide bundles and divergence.** `shell` · `demo-switcher` (an import, never a copy) · named
   flow slices · `all`. Declare any domain divergence, and respect the non-forkable floor: entity
   ids, the shared cast and the seed clock are never redefined. A cross-run surface is the most
   likely place to need a real divergence — declare it rather than letting it happen.
9. **Translate the vocabulary.** Every term in the brief must exist in the lab's `CONTEXT.md`
   glossary. Coinages from the vision get mapped or dropped.

## Ownership
`owner:` is **the PM who ran this process** for the run the surface sits closest to, written exactly
as their `git config user.name`. A human name, never a handle or an email. Get it wrong and the
lab's write-guard hook silently denies every subsequent edit to that surface. Confirm the exact
string with them rather than guessing it. A cross-run surface still gets **one** owner — shared
ownership is not a thing the lab supports, and the second name goes in `collaborators:`.

## Blind spots to call out
- **One giant prototype.** The most likely failure of this stage. A single surface expressing the
  whole vision answers nothing.
- **A question that can't be wrong.** "What does the future of company management feel like?" is
  not a question — no answer to it would change anything. Write the no as well as the yes.
- **Hoarding surfaces here** that belong to a run. See step 2.
- **Specifying a build.** Services, persistence, auth, real data: all out of scope. The lab's
  `platform-gap-marker` pattern exists precisely so screens can be built over an absent backend.
- **Inventing components.** A brief describing bespoke UI produces a prototype that looks nothing
  like B4B, which defeats the point of using the lab at all.
- **Em dashes in screen copy.** The lab forbids them in rendered strings. Use hyphens.

## Outputs
- `prototype-briefs/<slug>.md` → `output/` — one per surface, using
  `../_shared/prototype-brief.template.md`. Lab-ready: paste the frontmatter into
  `.scratch/<slug>/spec.md` and run `/new-prototype`.
- `HANDOFF.md` → `output/` — the ranked reading order, the settled decisions that must not be
  reopened, and the single next action naming the first surface to build.

## Human check
Give one brief to someone who has not read the vision and ask them what question the prototype
answers. If they answer with a feature description instead of a question, rewrite it. Then ask the
named owner whether they would defend that question in a review — if not, it's the wrong question
or the wrong owner.
