# Engine / instance split: findings and plan

Date: 2026-10-07. Author: James Scholz. Status: **agreed direction. Steps 1–3 done locally (2026-10-08); `v0.1` awaits James's force-push. Step 4 next.**

**Bottom line.** There are three copies of the folder-as-agent pipeline, and they have already drifted.
The root cause is that company-specific content is written into the method files, so every sync has to
patch it. The fix is to separate the **engine** (the method, public) from the **instance** (Serko
content and runs, private), and to reverse the flow so the public repo becomes the upstream that Serko
pulls from. Runs never leave the instance. Evals split into two tiers: synthetic fixtures in the engine,
frozen real runs in the instance.

---

## 1. Current state

```
Product Discovery Agentic Process  (private, source of truth)
   ├─ _public-sync/sync.sh     → regex de-brand + hand-kept overrides → discovery-pipeline (public)
   └─ _public-sync/lab-sync.sh → full rsync, add-only, opens PR       → Serko lab repo
```

| Copy | Location | Account | Fed by |
|---|---|---|---|
| Private working folder | `~/hobbes/Serko/Product Discovery Agentic Process` | JamesDylan (personal remote; Serko content) | — |
| Public generic | `~/hobbes/personal/discovery-pipeline` | JamesDylan | `sync.sh` |
| Serko lab | `serko-products/internal-tool-b4b-discovery-lab` → `Tools/b4b-vision-workspace` | James-Scholz_Serko | `lab-sync.sh` |

## 2. Findings

### Drift has already happened

- Public `CLAUDE.md` doesn't have the `new` / `work` / `status` commands added on 2026-10-06.
- Public still includes `.claude/skills/run-pipeline`, which was removed from the private folder.
- Public has no `99-`, `100-` or `101-` folders, but its `CLAUDE.md` still points to them. Its own walk
  test fails.
- Public `RUNBOOK.md` doesn't match `public-overrides/RUNBOOK.md`.

### Root causes

1. **Company content is written into the method.** 37 references to B4B, Serko or `b4b-context` across
   `_template/`, the terminal-folder contracts, `CLAUDE.md`, `CONTEXT.md` and `_eval/`. Every regex
   rule in `sync.sh` exists to patch this.
2. **The files that change most are kept twice.** `CLAUDE.md`, `README.md`, `RUNBOOK.md`, `CONTEXT.md`
   and `10_prototype-handoff` live in `public-overrides/` and are edited by hand, so drift is certain.
3. **The lab sync only adds files.** Deletions never reach the lab, and colleague edits made in the lab
   never come back. That is why `lab-sync.sh` needs its colleague-overwrite check.
4. **There is no direction of truth for the method.** It changes in the private folder and gets pushed
   outward, so the public repo can never get ahead of it.

### Other problems

- The private repo's remote is on the personal account and holds Serko-branded method files.
- `lab-sync.sh` still names the old repo, `serko-sandbox/poc-b4b-discovery-lab`.
- Two GitHub identities are managed by hand, with no per-folder configuration.

## 3. Target model

The line falls between **method and content**, not between Serko and generic.

| | Engine: `discovery-pipeline` (public) | Instance: Serko lab folder (private) |
|---|---|---|
| Holds | Kernel (`CLAUDE.md` commands, `operating-principles.md`), `_template/`, terminal-folder templates, `_eval/` harness, synthetic fixtures, `README`, `RUNBOOK` | `_shared/` content, every run folder, Serko eval cases, Serko-specific settings |
| Account | JamesDylan | jamesscholz_serko |
| Edited by | James (method changes only) | James and lab colleagues, through normal PRs |
| Release | Git tag (`v0.1`, …) | Pulls a tag with `pull-engine.sh vX`. Copy only, no transforms. |

### Rules

1. **Stage contracts never name the company.** Anything org-specific becomes a `_shared/` input that
   the contract reads: `product-context.md`, and a new `prototype-target.md` for the prototyping-tool
   handoff. Once this holds, the de-brand transform does nothing.
2. **Engine files are read-only in the instance.** `engine.manifest` lists the engine-owned paths and
   their hashes, and `./eval` fails if an instance edits one. Method fixes go upstream, then get pulled.
3. **Runs never leave the instance.** No sync carries run content into the engine.
4. **Layout stays flat.** Stages rely on relative paths (`../../_shared/`), so the engine is copied
   into the instance root by manifest, not nested as a subtree.

### Evals: two tiers

| Tier | Lives in | Contains | Tests |
|---|---|---|---|
| Fixtures | Engine | Synthetic problems (today's `_eval/fixtures/`), at least 2–3 deliberately unlike B4B | Whether the method works at all, outside one domain |
| Cases | Instance `_eval/cases/` | Real past runs, frozen | Whether the method still produces good work on real problems (regression) |

- `evaluate.py` reads cases from a list of directories, not the hardcoded `EVAL_DIR / "fixtures"`.
- A `freeze <run>` command snapshots a run's seed outputs (`00`–`03`) and records the human-accepted
  output as the reference to grade against.
- A case only moves to public if it's anonymised by hand and copied into the engine fixtures. It is
  never synced automatically.
- Risk: graders tuned only on B4B cases drift toward B4B. The synthetic fixtures are the
  counterweight.

### Credentials (decided 2026-10-07)

- **Accounts:** personal = `JamesDylan`; work = `James-Scholz_Serko` (note the spelling).
- **SSH host aliases** in `~/.ssh/config`, each with its own key, `IdentitiesOnly yes`,
  `AddKeysToAgent yes`, `UseKeychain yes`:
  - `github.com-personal` → `~/.ssh/id_ed25519_personal` (pre-existing alias, kept)
  - `github.com-work` → `~/.ssh/id_ed25519_serko` (new key, uploaded to the Serko account and
    SSO-authorized for `serko-products`)
  - `~/.ssh/id_ed25519` is registered on JamesDylan, not Serko. Don't use it for work.
- **Remotes are chosen by owner, not folder:** `JamesDylan/*` → `git@github.com-personal:...`;
  `serko-*/*` → `git@github.com-work:...`.
- **Folder-scoped identity:** `~/hobbes/personal/` and `~/hobbes/Serko/` (capital S), split by GitHub
  account only, not by public/private. `includeIf "gitdir/i:..."` (case-insensitive) in
  `~/.gitconfig` points to `~/.gitconfig-personal` and `~/.gitconfig-serko`, which set the email.
- **`gh` CLI** holds both accounts over HTTPS. HTTPS pushes use whichever account is active, which is
  why SSH remotes replace HTTPS ones. Keep `gh` for PRs only (`gh auth switch` if needed).

## 4. Plan

| Step | Work | Done when |
|---|---|---|
| 1. Credentials and folders | Set up SSH aliases, `includeIf`, and the two clone folders | `git push` works from both without switching anything by hand |
| 2. Remove company names from the method | Rename `b4b-context.md` to `product-context.md`; replace B4B/Serko in `_template/`, terminal contracts, `CLAUDE.md` and `CONTEXT.md` with references to `_shared/`; parametrise `10_prototype-handoff` through `prototype-target.md`; make `CLAUDE.md` routing generic (`NN-<slug>`); make the `evaluate.py` case path configurable | Running `sync.sh` then `diff` against public shows only `_shared/` and run differences; `./eval` passes |
| 3. Make public the upstream | Add `engine.manifest`, `pull-engine.sh` and the manifest check in eval; bring public up to date (`99`/`100`/`101` templates, commands); tag `v0.1` | Public walk test passes from a fresh clone |
| 4. Serko instance in place | Work directly in a clone of the lab repo; pull `v0.1`; delete `_public-sync/`; archive the personal-account private repo; fix the stale repo name | One local folder per repo, no sync scripts |
| 5. Eval cases | Add `freeze <run>`; freeze 1–2 finished runs (e.g. `01-company-acquisition`) as instance cases; add 2 non-B4B synthetic fixtures to the engine | `./eval behaviour` runs fixtures plus cases |
| 6. Multiple pipelines | `pipelines/vision/`, `pipelines/delivery/` (idea → PRD → openspec), `new <pipeline> <slug>` | Separate conversation |

### Step 1: closed 2026-10-08

- [x] SSH aliases `github.com-personal` / `github.com-work` with `IdentitiesOnly`; Serko key SSO-authorized
      for `serko-products` (first attempt hadn't taken; fixed 2026-10-08)
- [x] `includeIf` folder identity: `Serko/` → `james.scholz@serko.com`, `personal/` → JamesDylan noreply
- [x] Every remote rewritten to SSH by owner, including nested repos. Exceptions: `Serko/poc-b4b-discovery-lab`
      (Step 4) and `chess-trainer/chess-openings` (third-party, read-only)
- [x] Plaintext `gho_` token removed from the `eos-clients` remote; token revoked
- [x] Lab repo cloned to `~/hobbes/Serko/internal-tool-b4b-discovery-lab`; push test passed from it and
      from `personal/discovery-pipeline`
- [x] `obp` deleted

Carried forward:
- [ ] Finish deleting `Serko/Amsterdam`: the local folder still exists (GitHub repo and Vercel project per
      the 2026-10-08 decision).
- [ ] Move `Serko/cycle-action-centre` to `personal/` (decided 2026-10-08; James doing it).
- [ ] **Before tagging `v0.1` (Step 3):** rewrite `discovery-pipeline` history to replace the
      `James.Scholz+Serko@serko.com` / `james.scholz@serko.com` author emails (decided yes, 2026-10-08).

### Step 2: done 2026-10-08 (merged to `main`)

- [x] `b4b-context.md` renamed to `product-context.md`; every reference updated, including run folders.
      Its AI-narrative heading is now "Competitive / positioning context", which `08` reads.
- [x] `_template/`, `CLAUDE.md`, `CONTEXT.md`, `README.md`, `RUNBOOK.md` and the `99`/`100`/`101` contracts name
      no company. Routing is `NN-<slug>`. `99` reads every run's `08` output by glob; output renamed
      `12-month-vision.md`; the Booking.com readout is now an optional "partner readout".
- [x] New `_shared/prototype-target.md` holds every lab-specific fact; `10` and `101` read it. Lab path
      updated to the new clone. A blank version ships to public; blank = brief a human designer.
- [x] Run contracts that were unedited copies of `_template` were updated to match. The 7 that already had
      run-specific edits were left alone (same 7 `drift.template` warnings as before).
- [x] `evaluate.py`: cases come from `case_roots` in `checks.json` (default `_eval/fixtures`, `_eval/cases`);
      each root is a case or a folder of cases; `--case` filters. Fixtures and rubrics de-branded.
- [x] `public-overrides/` now holds only the blank `_shared/` files. The root docs and terminal contracts sync
      mechanically. `sync.sh` keeps `./eval` executable.
- [x] **Done-when:** after `sync.sh`, every engine file in public is byte-identical to private (the
      transform is a no-op). Private `./eval`: 2 fails, both below.

Carried into Step 3:
- [ ] `02-company-guardrails/CLAUDE.md` has an unfilled identity (2 `./eval` fails, pre-existing). Fill it or
      delete the run.
- [x] Public `./eval` passes (0 fails, was 15) — done 2026-10-08 on branch `step3-shared-engine`.
      `report-design-system.md` and `report-content-schema.md` are now engine files (de-branded; example
      figures replaced; synced mechanically). `accelerator-brief.md` and `timeline.md` ship as blanks.
      `prototype-brief.template.md` stays instance-only: it is the lab's `/new-prototype` contract, and
      only `prototype-target.md` points at it, so the engine needs no brief template.
- [x] Stale `run-pipeline` skill removed from public.

### Step 3: done locally 2026-10-08 (private branch `step3-manifest`; public `main` + tag `v0.1` not pushed)

- [x] `_eval/manifest.py` (build / check / install) and `pull-engine.sh <tag> [--force]`. Owned files are
      hashed in `engine.manifest`; `_shared/` starters are seeded only if missing; files the engine drops are
      deleted on pull; the pull refuses if an instance edited an engine file. Tested: self-update of
      `pull-engine.sh`, deletion propagation, `--force`, fresh empty instance.
- [x] `./eval` fails `engine.edited` when an instance changes an engine file (only if `engine.manifest` exists,
      so the private folder is unaffected until Step 4).
- [x] Public history rewritten: both commits now authored `3697962+JamesDylan@users.noreply.github.com`.
      Pre-rewrite state kept on local branch `backup/pre-rewrite`.
- [x] Public synced, manifest built, committed and tagged `v0.1`. **Done-when:** fresh clone of `v0.1` →
      `./eval` 0 fails.
- [ ] James: force-push public `main` and push tag `v0.1`; merge `step3-manifest` in private.
- Note: GitHub can keep old commit SHAs reachable for a while after a force-push. Low risk here (only an
      email), but don't rely on the rewrite for anything sensitive.

Path notes for later steps: `sync.sh` defaults to `../discovery-pipeline`, a sibling path. The private
folder is now in `Serko/` and public is in `personal/`, so **pass the path explicitly** until Step 4
deletes the script. `lab-sync.sh` still points at `~/hobbes/poc-b4b-discovery-lab`; leave it.

**H6 runs alongside step 3, not after step 6:** a PM or designer runs `work` on a real problem without
James in the room. "Repeatable and shareable" is unproven until that happens.

## 5. Open decisions

- **Where the Serko instance lives.** Recommended: stay at `Tools/b4b-vision-workspace` inside the lab
  repo for now, because colleagues are already there. Revisit if the lab repo's own conventions start
  to get in the way.
- **What happens to this private folder after step 4.** Recommended: archive the GitHub repo, keep the
  local folder read-only until the lab clone is confirmed complete, then delete it.
