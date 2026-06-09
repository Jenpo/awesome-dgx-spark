#!/usr/bin/env bash
# Link-rot + staleness check for the entry list.
# Verifies every entry repo is reachable; flags archived and >12-month-stale repos.
# Runs locally (macOS/Linux) and in CI. Uses only `gh` (no jq/curl dependency).
# Exits nonzero only when a dead link exists — archived/stale are review hints.
set -uo pipefail

README="${1:-README.md}"
today=$(date -u +%F)

# 12-month cutoff as YYYY-MM-DD (ISO dates sort lexically == chronologically).
if date -u -d '12 months ago' +%F >/dev/null 2>&1; then
  cutoff=$(date -u -d '12 months ago' +%F)   # GNU date (CI)
else
  cutoff=$(date -u -v-12m +%F)               # BSD date (macOS)
fi

# Extract entry repos (owner/repo) from list-item GitHub links.
repos=$(grep -oE '^- \[[^]]+\]\(https://github.com/[^)]+\)' "$README" \
  | grep -oE 'github\.com/[^/)#]+/[^/)#]+' | sed 's#github\.com/##' | sort -u)
total=$(printf '%s\n' "$repos" | grep -c .)

dead=""; n_dead=0
arch=""; n_arch=0
stale=""; n_stale=0

for r in $repos; do
  if ! out=$(gh api "repos/$r" --jq '(.archived|tostring)+" "+(.pushed_at|.[0:10])' 2>/dev/null); then
    dead="${dead}- \`${r}\`"$'\n'; n_dead=$((n_dead + 1)); continue
  fi
  a=${out%% *}; p=${out##* }
  [ "$a" = "true" ] && { arch="${arch}- \`${r}\` (pushed ${p})"$'\n'; n_arch=$((n_arch + 1)); }
  [[ "$p" < "$cutoff" ]] && { stale="${stale}- \`${r}\` (pushed ${p})"$'\n'; n_stale=$((n_stale + 1)); }
done

{
  echo "## Link-rot report — ${today}"
  echo
  echo "- Checked: ${total} entry links"
  echo "- Dead: ${n_dead}"
  echo "- Archived: ${n_arch}"
  echo "- Stale (>12 months): ${n_stale}"
  [ "$n_dead"  -gt 0 ] && { echo; echo "### ❌ Dead links (fix or remove)"; printf '%s' "$dead"; }
  [ "$n_arch"  -gt 0 ] && { echo; echo "### 📦 Archived (review — a frozen model repo is often fine)"; printf '%s' "$arch"; }
  [ "$n_stale" -gt 0 ] && { echo; echo "### 🕸 Stale >12 months (review)"; printf '%s' "$stale"; }
} | tee report.md

[ "$n_dead" -eq 0 ]
