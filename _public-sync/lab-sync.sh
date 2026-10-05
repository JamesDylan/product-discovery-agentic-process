#!/usr/bin/env bash
# Syncs this whole workspace — real B4B content included, nothing scrubbed — into the internal
# serko-sandbox/poc-b4b-discovery-lab repo at Tools/b4b-vision-workspace, and opens a PR to squash-merge.
#
# NOT the same as sync.sh: that one builds the de-branded public copy. Never use sync.sh for the lab repo.
#
# Safety model: works in a throwaway git worktree off origin/main, so whatever branch or uncommitted
# work you have in your main lab checkout is never touched. Copies only — never deletes anything in
# the lab repo. If you delete a file locally, remove it from the lab repo by hand.
#
# Colleague check: your local copy overwrites the lab copy of any file that differs. So before
# committing, it looks for commits to the folder by anyone else since your last sync, lists the files
# you'd overwrite that someone else last touched, and stops until you confirm. You are matched by git
# author NAME, not email — GitHub squash-merges use a different email from your local git config.
#
# Usage:
#   _public-sync/lab-sync.sh ["commit message"]
# Env overrides: LAB_REPO (default ~/hobbes/poc-b4b-discovery-lab)
#                LAB_ME   (default: git user.name in the lab repo)

set -euo pipefail
cd "$(dirname "$0")/.."   # workspace root
WORKSPACE="$(pwd)"

LAB_REPO="${LAB_REPO:-$HOME/hobbes/poc-b4b-discovery-lab}"
TARGET="Tools/b4b-vision-workspace"
BRANCH="vision-sync-$(date +%Y-%m-%d-%H%M)"
WORKTREE="$(mktemp -d)/vision-sync"
MESSAGE="${1:-Update B4B vision workspace}"
ME="${LAB_ME:-$(git -C "$LAB_REPO" config user.name)}"
PUSHED=0

cleanup() {
  cd "$WORKSPACE"
  git -C "$LAB_REPO" worktree remove --force "$WORKTREE" 2>/dev/null || true
  # A branch that never reached GitHub is just clutter — drop it.
  [ "$PUSHED" = 1 ] || git -C "$LAB_REPO" branch -q -D "$BRANCH" 2>/dev/null || true
}
trap cleanup EXIT

echo "== Fetching latest main =="
git -C "$LAB_REPO" fetch -q origin main
git -C "$LAB_REPO" worktree add -q -b "$BRANCH" "$WORKTREE" origin/main

echo "== Copying workspace into $TARGET =="
rsync -a \
  --exclude '.git' --exclude '.DS_Store' \
  --exclude '.obsidian/workspace.json' --exclude '.obsidian/workspace-mobile.json' \
  "$WORKSPACE/" "$WORKTREE/$TARGET/"

cd "$WORKTREE"
# -f because the workspace's own .gitignore hides the company run folders.
git add -A -f "$TARGET"

if git diff --cached --quiet; then
  echo "Nothing changed — lab repo already matches. No branch pushed."
  exit 0
fi

echo "== Checking for colleagues' changes since your last sync =="
LAST_MINE="$(git log origin/main -1 --format=%H --author="$ME" -- "$TARGET")"
RANGE="${LAST_MINE:+$LAST_MINE..}origin/main"
OTHERS="$(git log "$RANGE" --format='%an%x09%h %ad %an: %s' --date=short -- "$TARGET" \
  | awk -F'\t' -v me="$ME" '$1 != me { print "  " $2 }')"

if [ -n "$OTHERS" ]; then
  echo "Someone else has changed $TARGET since your last sync:"
  echo "$OTHERS"
  echo
  AT_RISK=""
  while IFS= read -r f; do
    last="$(git log origin/main -1 --format=%an -- "$f")"
    if [ "$last" != "$ME" ]; then AT_RISK+="  ${f#"$TARGET"/}   (last changed by $last)"$'\n'; fi
  done < <(git diff --cached --name-only --diff-filter=M -- "$TARGET")
  if [ -n "$AT_RISK" ]; then
    echo "Your copy would OVERWRITE their version of:"
    printf '%s' "$AT_RISK"
  else
    echo "None of their files would be overwritten by yours (they only touched files you don't change)."
  fi
  echo
  echo "To keep their edits: answer n, copy their changes into your local workspace, then re-run."
  read -r -p "Continue anyway? [y/N] " ans
  case "$ans" in
    y|Y) ;;
    *) echo "Stopped. Nothing committed or pushed."; exit 1 ;;
  esac
else
  echo "No one else has touched it. Carrying on."
fi

echo "== Changes =="
git diff --cached --stat | tail -40

git commit -q -m "$MESSAGE"
git push -q -u origin "$BRANCH"
PUSHED=1
gh pr create --base main --head "$BRANCH" --title "$MESSAGE" \
  --body "Full sync of \`$TARGET\` from the local workspace. Copy only — no files removed."

echo
echo "Done. Squash-merge the PR above in GitHub, then delete the branch there."
