---
# --- The lab's contract. These seven fields are what /new-prototype actually consumes. ---
title: <Surface name>
owner: <The PM who ran this process. Human name, exactly as their `git config user.name` — not a handle, not an email. This gates every write to the surface.>
collaborators:
date: <YYYY-MM-DD, real clock, never SEED_NOW_ISO>
question: <ONE sentence. Falsifiable. "What does an approval step feel like at the team band?">
bundles: <shell | demo-switcher | named flow slices | all — the minimum the question needs>
divergence: <none | derivation | schema-extension | seed-overlay>
status: ready-for-agent
---

Source: `<the vision doc this came from>` · horizon <Now|Next|Later> · run `<NN-slug>`
Fidelity: **mid-fi coded UI shell.** Look and feel, real navigation, everything else faked.

## Problem statement

<2–4 sentences. The bet from the vision, reduced to the thing this surface puts in front of a
person. Not the whole vision. The slice this surface makes arguable.>

## What this surface is trying to learn

<Restate the `question:` and then say what a yes and a no would each look like on screen. If you
cannot describe the no, the question is not falsifiable — go back.>

## Actors

| Vision actor | Lab persona / role | Notes |
|---|---|---|
| <segment from the vision> | <existing lab cast member / system role> | <what changes, if anything> |

Persona switcher: <taken / not taken, and why. `demo-switcher` is an import, never a copy.>

## Screen inventory

**A screen not listed here is out of scope.**

| # | Route | Purpose | Key state shown |
|---|---|---|---|
| 1 | `app/<slug>/page.tsx` | | |
| 2 | `app/<slug>/<route>/page.tsx` | | |

## Components per screen

Precedence: `components/ui/*` primitive → `components/custom/*` composition → semantic token →
one-off, flagged. **Never raw hex.** Check each against the component registry's agent brief
(`/?section=components`) before writing.

| Screen | Components                                                                                         | Variants / axes |
| ------ | -------------------------------------------------------------------------------------------------- | --------------- |
| 1      | e.g. `sidebar`, `card variant=outline size=md`, `table`, `badge variant=success appearance=subtle` |                 |
| 2      |                                                                                                    |                 |

Status colours use the one ladder in `lib/status-families.ts`: `info → success → pending →
warning → destructive`. `--warning` is orange; `--pending` is the yellow.

## States to build

Only the states that affect the question. Name them explicitly.

- Empty / first run: <or "not built">
- Loading: <or "not built">
- Error: <or "not built">
- Zero / one / many: <"which of these matter"> 
- Role-absent: <"hide what cannot exist; disable only what exists but isnt ready">

## Data

| Screen | Backed by | New mock needed? |
|---|---|---|
| | `domain/<entity>` or `lib/data/<catalog>` | |

Clock is fixed at `SEED_NOW_ISO`. Entity ids, the shared cast and the clock are never redefined.
No lorem ipsum — realistic names, amounts and dates, including edge content.

## Faked vs real

**Real** (the interaction being tested):
-

**Faked** (rendered, inert):
-

**Not built at all:**
- Settings, admin views, i18n, performance, edge cases unrelated to the question.

Where a screen has no service behind it, build the screen and record the gap with the
`platform-gap-marker` pattern.

## Design source

<Figma file key + specific node ids, or "none — built from `docs/foundations/design.md` plus
sibling-surface exemplars". Do not re-read a whole Figma board.>

## Hub entry

| Field | Value |
|---|---|
| `productArea` | `registration-onboarding` \| `booking-experience` \| `team-management` \| `booking-management` |
| `title` | |
| `summary` | |
| `focus[]` | |
| `shell` | |
| `status` | `in-progress` |
| `ctaLabel` | |

## Out of scope

-

## Open questions for the owner

-

---

### How to run this

```bash
cd Tools/b4b-discovery-lab
pnpm install && pnpm dev
```
Then in Claude Code, cwd `Tools/b4b-discovery-lab`, on a branch (main is protected):
```
/new-prototype <slug>
```
The skill scaffolds `app/<slug>/` and writes `.scratch/<slug>/spec.md`. Paste this brief's
frontmatter and body into that spec. **The `.scratch/` folder name must match the surface slug**
or the ownership hook will deny writes.

Order is load-bearing: **spec → scaffold → bundles → hub entry last.** Never import across
prototypes — copy from anywhere, import from nowhere.
