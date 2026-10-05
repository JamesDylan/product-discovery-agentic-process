# Run: Company Acquisition

Pipeline workspace.

## Identity
- **Problem space:** How companies form, grow and maintain their structure in B4B without relying on a manually maintained, attested admin.
- **Sphere of influence:** Acquiring the whole company, not just its first user. Everything from first contact to a first booking, and on to a company that grows and stays structured without an admin. Includes setting up the company, adding team members, joining, invites, helping colleagues find each other, merging duplicate companies, company hierarchy, and getting the right people into the right roles. Not only the booking flow: how B4B introduces users to the value they came for, so they hire B4B for their job to be done. (Widened 2026-09-30 — see `01_frame/output/frame.md`.)
- **Pair:** Product — James · Design — Chris
- **Owner of the 12-month view:** James, for now `[interim — reassign after playback]`

## Questions in scope
1. How do companies form and grow when there's no attested admin?
2. How do companies grow their members and structure without someone manually maintaining it?
3. How can we improve the invite & join company acceptance rate from ~40% to ~80%?

## Note on Q3
Treat 40%→80% as a symptom, not the problem. `01_frame` must establish whether this is a flow,
motivation or trust problem before anything is designed against it.

## Run-specific notes by stage

**`02_explore` — where to look for analogues.** This is a "joining an organisation" problem, not a
travel problem. Look at Slack / Notion / Figma workspace joining, Xero organisation invites,
LinkedIn company pages, delegated authority in banking, Google Workspace domain claiming.
Force at least one option where there is no admin role at all, and one where the user sets up nothing.

**`05_pressure-test` — the mess that matters here.** Overlapping email domains, contractors,
multiple legal entities, mergers, users belonging to several companies, bad actors joining a company
they shouldn't, one-person companies and 4,000-person companies, and migration of companies that
already exist.

## Route
Read `CONTEXT.md` for the pipeline and the stage table. Then open the stage folder you are working
and read its `CONTEXT.md`. Load `../_shared/operating-principles.md` and `../_shared/house-view.md`
always; load nothing else unless the stage contract's Inputs list names it.
