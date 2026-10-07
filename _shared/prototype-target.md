# Prototype target

Which prototyping tool `10_prototype-handoff` and `101-prototype-handoff` write briefs for, and the
conventions their contracts apply "per the target". One home for every tool-specific fact.

## Tool
- **Name:** B4B Discovery Lab
- **Repo:** `serko-products/internal-tool-b4b-discovery-lab`. Local clone, default:
  `~/hobbes/Serko/internal-tool-b4b-discovery-lab`. The lab itself is the `Tools/b4b-discovery-lab/`
  subfolder; every path below is relative to it.
- **Fidelity default:** "mid-fi coded". Not a working Eos prototype.

## Reference docs — read before writing
- `Tools/b4b-discovery-lab/.claude/skills/new-prototype/SKILL.md` — the invocation
- `Tools/b4b-discovery-lab/docs/agents/new-prototype.md` — the frontmatter spec
- `Tools/b4b-discovery-lab/docs/foundations/design.md` — read before any UI
- `Tools/b4b-discovery-lab/CONTEXT.md` — the glossary. All vocabulary comes from here.
- `Tools/b4b-discovery-lab/.scratch/company-management/HANDOFF.md` — the best model to copy

## Brief format
`_shared/prototype-brief.template.md` — matches the lab's `new-prototype` contract.
**Invocation:** paste the frontmatter into `.scratch/<slug>/spec.md` and run `/new-prototype`.

## Conventions
- **Reserved roots:** `login`, `artifacts`, `reference`, `api`, `_shared`, and the hub. Check slugs
  against the lab's hub registry.
- **Hub taxonomy tag:** `productArea`.
- **Cast:** a fixed persona set, fixed system roles and a fixed clock (`SEED_NOW_ISO`).
- **Routes:** `app/<slug>/`. Inherited from the Serko FE template: a screen not listed is out of scope.
- **Component precedence:** `components/ui/*` primitive → `components/custom/*` composition →
  semantic tokens → a one-off, flagged. Never raw hex.
- **Bundles:** `shell` · `demo-switcher` (an import, never a copy) · named flow slices · `all`.
- **Non-forkable floor:** entity ids, the shared cast and the seed clock are never redefined.
- **Absent backend:** use the lab's `platform-gap-marker` pattern.
- **Fake/real line:** the lab forbids shipping a prototype without it.

## Ownership
`owner:` frontmatter field, written exactly as the owner's `git config user.name` — a human name,
never a handle or an email. The lab's write-guard hook denies edits to the surface if it's wrong.
One owner per surface — shared ownership isn't supported. Other names go in `collaborators:`.

## House style
- No em dashes in rendered screen copy. Use hyphens.
