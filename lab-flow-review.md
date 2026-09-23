# B4B Discovery Lab: flow review

Date: 2026-09-22. Author: James Scholz. Status: **draft for discussion.** Nothing in the lab has
been changed.

**Bottom line.** A lab design costs more than the same design one-shot in Claude — that much is
observed. What is *not* known is which part of the lab causes it: the ~32k words of mandated
reading, the 20–50 turns, or the stop-and-ask skill gates. Three fixes are free and go in this
week regardless (§4). One half-day measurement compares lab vs no lab on cost *and* fidelity (§5).
Three options follow from it (§6), one decision rule picks between them (§7), and each has a
one-command starting point for a PM (§8). No folders, no tiers, no orchestrator.

Reference case: `post-booking-consent-ask` (built 2026-09-21). One screen, three states, 478 lines.
It is the **smallest** prototype the lab has produced, so it flatters every overhead argument made
below. Treat ratios drawn from it as an upper bound, not a typical case.

---

## 1. The flow as it runs

```
Vision workspace                         Lab repo (one Claude Code session)
────────────────────                     ──────────────────────────────────────────────
101-prototype-handoff                    session start
  writes prototype-brief.md          →     CLAUDE.md → @AGENTS.md → lab AGENTS.md
                                           AGENTS.md: read CONTEXT.md, design.md,
                                           project-context, seed-data, ADRs, Next.js docs
                                         /new-prototype
                                           writes .scratch/<slug>/spec.md  ← brief rewritten
                                           scaffold, copy shell from prototype 1, write code
                                         /share or /review  (governance)
```

One long interactive session, 20–50 turns.

## 2. What a session is told to load

Word counts are measured from the files. **No cost is derived from them here** — see §3.

| Mandated by | File | Words |
|---|---|---|
| CLAUDE.md chain | repo + lab AGENTS.md | 1,900 |
| AGENTS.md | CONTEXT.md (glossary) | 8,175 |
| AGENTS.md, "read before any UI" | docs/foundations/design.md | 5,587 |
| AGENTS.md | project-context.md, seed-data.md | 1,442 |
| /new-prototype | new-prototype.md, graduation.md, artifacts.md, skills.md | 3,200 |
| new-prototype.md | ADR-0001, 0026, 0045, 0046 | 2,450 |
| design.md precedence rule | globals.css tokens | 2,627 |
| spec template | personas.ts, prototypes-section.tsx, brief templates | 6,411 |
| **Mandated before any code** | | **~32,000 words** |
| Auto-triggering skill | ux-designer (SKILL + references) | 15,012 |
| Auto-triggering skill | ux-copywriter (SKILL + references) | 18,029 |
| Fallback if hub not running | registry entries | 10,880 |

The consent-ask screen used roughly 6 glossary terms and 8 design rules out of that.

## 3. What we actually know, and what we assumed

**Known.** The word counts above. The lab has no context routing: AGENTS.md mandates whole-file
reads regardless of task. 40–50% of CONTEXT.md and docs/agents is decision history — dates, ticket
numbers, "supersedes the old split" — valuable to the humans who decided, dead weight to an agent
building a screen. Governance (branch rules, squash, git identity, graduation detection) is
duplicated into every session despite `/share` and `/review` existing to hold it.

**Observed.** A design produced in the lab costs materially more than the same design one-shot in
Claude. This is the one hard cost signal we have, and everything below has to respect it.

**Not known: which part of the lab causes it.** The observation is an aggregate. It conflates at
least three variables, and they point at different fixes:

| Candidate driver | Free to fix? |
|---|---|
| Auto-invoking skills with stop-and-ask gates (`ux-designer`, `ux-copywriter`, 33k words, mandatory "present strategy before code") — adds turns *and* context | yes |
| Spec written three times: vision brief → `spec.md` → code. 146 lines of spec for a 281-line page | yes |
| Governance in the hot path; a denied write from the owner hook costs a turn plus a re-read | yes |
| 32k words of mandated reading, re-sent every turn | no — structural |
| Copying prototype 1's shell (6.5k words) instead of a template | no — structural |

Attacking the wrong one is how this becomes a month of restructuring for no saving.

**One confound to resolve, not a conclusion.** An earlier draft modelled cost as `context × turns`
and produced figures in the millions of tokens. That overstates it, because re-sent context can be
cached. But caching is not the free pass I first claimed it was. As documented: cache reads bill at
0.1x, **writes at 1.25x**, minimum 1024 tokens, default TTL **5 minutes**, refreshed on each hit.
A lab session is human-paced — screenshots get read, people go to meetings. Every gap over five
minutes expires the prefix and the next turn re-writes all 32k words at a *premium*. A thirty-turn
session across an afternoon may pay for that prefix many times.

So: caching plausibly softens the context cost by an unknown amount that depends entirely on how
fast the human replies. Nobody has measured the hit rate. It does not explain away the observation
above, and no decision in this document should rest on it until §5 reports a number.

## 4. Do now — no validation needed

Each is small, reversible, and justified by duplication rather than by any number.

| # | Change | Why it is safe |
|---|---|---|
| 1 | Turn off auto-invoke on `ux-designer` and `ux-copywriter`; make them explicit `/`-invoked. Delete the drifted `.agents/skills/` duplicates. | They fight the lab's own target (mid-fi shell, everything else faked) and force extra turns. Still available when a PM wants them. |
| 2 | Move governance out of AGENTS.md. It lives in `/share` and `/review` only. Delete the stale "PR lane is blocked" note. | Pure duplication. The skills already hold it. |
| 3 | `spec.md` becomes frontmatter plus a link to the vision brief. Stop restating actors, screens, components and the fake/real line — the brief has them. | Removes a whole authoring round trip. The brief is already the contract. |

Owner: ______   By: ______

## 5. Measure once — lab vs no lab (V1)

Two briefs, three builds each, same fields recorded. Half a day plus a designer for an hour.

**Briefs.** `post-booking-consent-ask` (small) and `bookings-map-view` (medium). Both have a vision
brief already. Small alone is not evidence: overhead always looks worst against the smallest job.

**Builds per brief.**

| Build | What | Context given |
|---|---|---|
| a. Lab as-is | `/new-prototype` from the vision brief, after the §4 fixes | everything AGENTS.md mandates |
| b. One-shot | single Claude prompt, self-contained HTML | the vision brief only |
| c. One-shot + kit-brief | same, plus a hand-written `kit-brief.md` (see §6) | brief + ≤1,500 words |

**Record per build.**

- Billed dollars, split into `input`, `cache_creation_input_tokens`, `cache_read_input_tokens`.
  The API returns all three per call; Claude Code's `/cost` shows the session total.
- Turns. Note which were spent on skill gates or spec authoring rather than code.
- Wall time and gaps between turns (decides whether the 5-minute cache survived).
- **Fidelity score**, by a designer, blind to which build is which: 1-5 on design-system match
  (tokens, components, spacing), plus a yes/no on "would you show this to a stakeholder as B4B."

Without the fidelity score this is a cost table, not a comparison. Cheap and wrong is not a win.

**How to read the cost split on build (a):**

- *Cache creation dominates* → the 32k read is re-paid at a premium. Context is the driver.
- *Cache reads dominate, dollar figure small* → turns are the driver, not context.
- *Cost tracks turn count* → skills and the spec round trip are the whole story; §4 closes it.

## 6. Three options

All three assume §4 is done. They differ in how much of the lab remains in the build path.

| | A. Trim and keep | B. Kit-brief lab | C. Split by durability |
|---|---|---|---|
| **What** | §4 fixes only. Lab stays the default for every prototype. | AGENTS.md becomes a 20-line route table. `kit-brief.md` (≤1,500 words: tokens, components with axes, shell path, status ladder, ~30 glossary terms) is the only mandated read. Minimal `app/_template/` shell replaces copying prototype 1. | Lab only for surfaces that must be hosted, navigable, or reused across runs. Everything else is one-shot with `kit-brief.md` as its context. |
| **Build cost** | none | 2-3 days | 1 day (the kit-brief) plus a written rule for which path a brief takes |
| **Bet** | turns were the problem, not context | context compresses without losing fidelity | most prototypes never needed the lab's durability |
| **Risk** | cost stays high; nothing learned | vocabulary drift if the brief misses rules; someone must own regeneration | two toolchains; hub stops being the index of everything |

**Deliberately not options:** stage folders, S/M/L tiers, a `/prototype` orchestrator, slicing
`design.md` by topic. They bound context per turn, not turn count, and each is a project. Recorded
here so nobody re-proposes them without a V1 result that points at context as the driver.

## 7. Decide

One rule, read off V1. The kit-brief is hand-written for V1 build (c); if B or C wins, it is
promoted, not rebuilt.

| V1 result | Pick |
|---|---|
| Lab (a) fidelity is not materially above one-shot (b) on either brief | **C**, and ask whether the lab is worth running at all |
| (c) matches (a) on fidelity at ≤50% of the cost on the medium brief | **B**. Slot the kit-brief into the lab. Retest once after the swap. |
| (c) matches (a) on the small brief only | **C**. Small surfaces go one-shot; medium and up use the lab. |
| (a) wins on fidelity and cost split shows turns dominate | **A**. Measure again after a month of §4 in place. |
| (a) wins on fidelity and cache creation dominates | **B**. If the kit-brief retest fails, the docs are load-bearing and the cost is the price of fidelity. Then C by default. |

**Vocabulary guard for B and C:** every term in the generated code and spec must appear in
CONTEXT.md. If the kit-brief build invents words, it fails regardless of cost. This is the one
thing the glossary protects that a session bill will never show.

## 8. Starting point for a PM

Whatever option wins, the entry is one command and the agent tells you what happens next.

- **Today (A):** open Claude Code in `Tools/b4b-discovery-lab/`, run `/new-prototype`, point it at
  the vision brief. After §4, it stops asking for what the brief already says.
- **B:** same command. It reads the brief and `kit-brief.md`, builds, and asks you to check the
  running route. Two sessions: build, then verify and land.
- **C:** one question before anything: *does this need to be hosted, navigable, or reused?* No →
  paste the brief and `kit-brief.md` into Claude and ask for the HTML. Yes → the lab, as in B.

The skill's first line, in every case, is the agent stating which path it is on and why. A PM
should never have to know which file comes next.

## 9. Blind spots worth keeping

- **Fidelity was never the problem.** Every rule, skill and doc optimises output correctness. None
  optimise cost of production, and nothing measured it, so it was invisible until the bill.
- **The docs are excellent for humans and hostile to agents.** Same content, wrong shape.
- **The proposal must not become the disease.** The earlier draft answered "too much ceremony" with
  seven stage folders, three tiers, an orchestrator and six tests. The reviewer's draft then swung to one option and no PM entry point. Operating principle 3: *never
  propose ceremony unless asked; if a stage can be collapsed, say so.* That applies to this document.
- **CONTEXT.md may be paying for something this review cannot see.** A glossary prevents vocabulary
  divergence across prototypes — a cost that surfaces as rework months later, not in this session's
  bill. The vocabulary guard in §7 is the only check against optimising it away.

## 10. Open questions

- If B or C wins, who owns `kit-brief.md` regeneration, and how is drift against CONTEXT.md caught?
- Where does `101-prototype-handoff` end and the lab's brief begin? They overlap today; one should
  shrink, and change 3 in §4 assumes it is the lab's.
