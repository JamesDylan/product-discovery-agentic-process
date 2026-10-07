#!/usr/bin/env bash
# Syncs the generic "process" parts of this private workspace into a separate public repo.
#
# Safety model: this script only ever COPIES from an explicit allow-list below into $PUBLIC_DIR.
# Nothing outside that list — no run folders, no _shared business-context files, no private repo
# git history — is ever touched. $PUBLIC_DIR is a wholly separate git repository with its own
# history; this script never runs git commands against the private repo's remotes.
#
# Usage:
#   _public-sync/sync.sh [/path/to/public/repo]
# Defaults to ../discovery-pipeline (sibling of this workspace) if no path is given.
#
# After it runs: cd into the public repo, `git diff` / `git status` to review, then commit + push
# yourself. This script never commits or pushes anything.

set -euo pipefail
cd "$(dirname "$0")/.."   # workspace root

PUBLIC_DIR="${1:-../discovery-pipeline}"
OVERRIDES="_public-sync/public-overrides"

mkdir -p "$PUBLIC_DIR"

# --- 1. Mechanically-copied, transformed paths (the reusable method) ------------------------
# Add a new path here only if you're sure it contains no business-specific content — check with
# `grep -rniE 'serko|b4b|james|<real run names>' <path>` first.
MECHANICAL_PATHS=(
  "CLAUDE.md"
  "CONTEXT.md"
  "README.md"
  "RUNBOOK.md"
  "_template"
  "_eval"
  "_shared/operating-principles.md"
  "eval"
  "99-vision-synthesis/CLAUDE.md"
  "99-vision-synthesis/CONTEXT.md"
  "100-report/CLAUDE.md"
  "100-report/CONTEXT.md"
  "101-prototype-handoff/CLAUDE.md"
  "101-prototype-handoff/CONTEXT.md"
)

transform() {
  # Order matters: multi-word / specific patterns before the generic single-word catch-alls.
  perl -pe '
    s{~/hobbes/poc-b4b-discovery-lab}{<path-to-your-prototyping-tool-repo>}g;
    s{Tools/b4b-discovery-lab}{<your-prototyping-tool>}g;
    s{B4B Discovery Lab}{your prototyping tool}g;
    s{the Serko FE template}{your own frontend template}g;
    s{_shared/b4b-context\.md}{_shared/product-context.md}g;
    s{\bb4b-context\.md\b}{product-context.md}g;
    s{B4B 12-Month Vision}{Vision Pipeline}g;
    s{Existing B4B components}{Existing product components}g;
    s{B4B patterns}{Existing product patterns}g;
    s{Orchestrate a B4B run}{Orchestrate a product-discovery run}g;
    s{Serko\.ai}{the sibling AI product}g;
    s{Serko AI narrative}{competitive AI narrative}g;
    s{\bSerko\b}{the company}g;
    s{\bJames\b}{the workspace owner}g;
    s{01-company-acquisition}{01-<run-slug>}g;
    s{02-company-guardrails}{02-<run-slug>}g;
    s{/Users/jamesscholz/hobbes/Product Discovery Agentic Process}{(your current directory — never hardcode an absolute path)}g;
    s{\bB4B\b}{the product}g;
  '
}

echo "== Copying + transforming mechanical paths into $PUBLIC_DIR =="
for p in "${MECHANICAL_PATHS[@]}"; do
  if [ -d "$p" ]; then
    while IFS= read -r -d '' f; do
      rel="${f#./}"
      # Never ship generated eval reports or OS cruft even if someone adds them later.
      case "$rel" in
        _eval/report/*|_eval/cases/*|*.DS_Store) continue ;;
      esac
      dest="$PUBLIC_DIR/$rel"
      mkdir -p "$(dirname "$dest")"
      if file --mime "$f" | grep -q 'charset=binary'; then
        cp "$f" "$dest"
      else
        transform < "$f" > "$dest"
      fi
    done < <(find "./$p" -type f -print0)
  elif [ -f "$p" ]; then
    dest="$PUBLIC_DIR/$p"
    mkdir -p "$(dirname "$dest")"
    transform < "$p" > "$dest"
    [ -x "$p" ] && chmod +x "$dest"   # keep ./eval executable
  fi
done

# public-overrides/ now holds only the blank _shared/ files the public repo ships in place of the
# real ones. Method files are generic at source (Step 2 of engine-split-plan.md), so they are
# copied mechanically above and the transform should change nothing in them.

echo "== Overwriting with hand-maintained public-only files =="
while IFS= read -r -d '' f; do
  rel="${f#"$OVERRIDES"/}"
  dest="$PUBLIC_DIR/$rel"
  mkdir -p "$(dirname "$dest")"
  cp "$f" "$dest"
done < <(find "$OVERRIDES" -type f -print0)

echo
echo "Done. Review before committing:"
echo "  cd $PUBLIC_DIR && git status && git diff"
