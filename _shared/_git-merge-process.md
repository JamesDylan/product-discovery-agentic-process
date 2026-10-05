From this workspace folder, the whole sync is now one command:

```
_public-sync/lab-sync.sh
```

You can also give it your own commit message, which becomes the PR title:

```
_public-sync/lab-sync.sh "Update B4B vision workspace: Company Acquisition options"
```

**What it does:**

1. Gets the latest `main` from GitHub.
2. Makes a temporary worktree on a new branch named with the date and time, like `vision-sync-2026-09-30-1415`.
3. Copies in the full workspace, the same way as #20 and #21.
4. Stages and commits the changes and prints a summary of what changed.
5. Pushes the branch and opens the PR, then prints the link.
6. Removes the temporary worktree, even if something fails partway through.

**Safety details:**

- **No changes, no PR.** If nothing has changed, it says so and exits without pushing a branch or opening a PR.
- **Your main checkout is left alone.** It doesn't touch whatever branch or uncommitted work is in `~/hobbes/poc-b4b-discovery-lab`.
- **It never deletes files in the lab repo.** If you delete something locally, you still need to remove it there by hand.
- **It's separate from `sync.sh`.** A note at the top of the script says not to use that one for the lab repo.

After merging, delete the branch from the PR page on GitHub, as you did before.

Every time you sync, you do the same thing: make a branch off an up-to-date `main`, copy the workspace in, commit, push, and open a PR you squash-merge. A throwaway worktree means you never have to touch whatever branch your main checkout is on.

Run these one at a time in Terminal.

**1. Get the latest `main` from GitHub**

```
git -C ~/hobbes/poc-b4b-discovery-lab fetch origin main
```

**2. Create a temporary worktree on a new branch.** Change the branch name each time, for example by adding the date.

```
git -C ~/hobbes/poc-b4b-discovery-lab worktree add -b vision-sync-2026-09-30 ~/hobbes/vision-sync origin/main
```

**3. Copy your workspace in.** This copies everything except git metadata and Mac/Obsidian clutter, and it never deletes anything already in the repo.

```
rsync -a --exclude '.git' --exclude '.DS_Store' --exclude '.obsidian/workspace.json' --exclude '.obsidian/workspace-mobile.json' "$HOME/hobbes/Product Discovery Agentic Process/" ~/hobbes/vision-sync/Tools/b4b-vision-workspace/
```

**4. Move into the worktree**

```
cd ~/hobbes/vision-sync
```

**5. Stage the changes.** You need `-f` because the workspace's own `.gitignore` hides the company run folders, and without it new files in those folders would be left out.

```
git add -A -f Tools/b4b-vision-workspace
```

**6. Check what's changing.** If this shows nothing, there's nothing to sync, and you can skip to step 10.

```
git diff --cached --stat
```

**7. Commit**

```
git commit -m "Update B4B vision workspace"
```

**8. Push the branch**

```
git push -u origin HEAD
```

**9. Open the PR.** `--fill` uses your commit message as the title and body.

```
gh pr create --base main --fill
```

It prints the PR link. Squash-merge it in GitHub as usual.

**10. Go back and remove the temporary worktree**

```
cd ~/hobbes

git -C ~/hobbes/poc-b4b-discovery-lab worktree remove ~/hobbes/vision-sync
```

**A few things to know:**

- **Deletions don't sync.** If you delete a file locally, it stays in the repo until you remove it there by hand. That's the price of never deleting real content by accident. Adding `--delete` to the `rsync` would mirror deletions, but first check which files it would remove.
- **Don't use _public-sync/sync.sh for this repo.** It builds the de-branded public version.
- **If step 2 says the branch already exists,** use a new branch name, or delete the old one with `git -C ~/hobbes/poc-b4b-discovery-lab branch -D <name>`.