#!/usr/bin/env bash
# Entry drift: which descriptions have fallen behind their upstream?
#
# link-check.sh asks "is it alive?". style-check.sh asks "is the line well-formed?".
# Neither asks "is the line still TRUE?" — and that is how a list rots while every
# gate stays green. A repository that has taken 40 commits since we last touched its
# line has very likely acquired results, versions, or caveats our line does not know.
#
# Caught in the wild on 2026-08-02: an entry sat in the list quoting benchmark
# numbers from a preview checkpoint while upstream had grown by 4,000 words,
# diagnosed why the official weights halved throughput, and shipped the patch.
#
# This is a review queue, not a gate. It never fails a build — it tells a human
# which entries to re-read. Bash + grep + awk + gh only.
#
# Usage:
#   bash .github/scripts/entry-drift.sh [README.md] [hot-threshold]

set -uo pipefail

# Parallel worker, dispatched by xargs below. Must stay first.
if [ "${1:-}" = "--probe" ]; then
  repo="$2"; since="$3"
  n=$(gh api "repos/${repo}/commits?since=${since}T00:00:00Z&per_page=100" \
        --jq 'length' 2>/dev/null) || n="?"
  [ -n "$n" ] || n="?"
  printf '%s\t%s\t%s\n' "$n" "$repo" "$since"
  exit 0
fi

README="${1:-README.md}"
HOT="${2:-20}"          # upstream commits since our line changed: re-read now
WARM=$((HOT / 2))       # worth a look
MIN_AGE_DAYS="${3:-14}" # lines younger than this were just written by hand; not drift

# A busy repository racks up commits fast, so raw commit count alone flags entries we
# verified days ago — a checker that cries wolf gets ignored. Require the line to have
# had time to fall behind before we call it drift.
cutoff=$(date -v-"${MIN_AGE_DAYS}"d +%F 2>/dev/null || date -d "${MIN_AGE_DAYS} days ago" +%F 2>/dev/null)
[ -n "$cutoff" ] || { echo "entry-drift: could not compute a date cutoff"; exit 1; }

command -v gh >/dev/null || { echo "entry-drift: gh CLI not found"; exit 1; }
git rev-parse --git-dir >/dev/null 2>&1 || { echo "entry-drift: not a git repo"; exit 1; }

# `git blame --date=short` gives us, per line: the date OUR text last changed.
# That date is the honest baseline for "how stale is this description" — far better
# than the file mtime, and it survives reordering because blame follows the line.
pairs=$(git blame --date=short -- "$README" \
  | sed -E 's/^[^(]*\([^)]*[[:space:]]([0-9]{4}-[0-9]{2}-[0-9]{2})[[:space:]]+[0-9]+\)[[:space:]]?/\1\t/' \
  | awk -F'\t' -v cutoff="$cutoff" '
      $1 !~ /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/ { next }
      $2 !~ /^- \[[^]]+\]\(https:\/\/github\.com\// { next }
      $1 >= cutoff { next }   # ISO dates compare correctly as strings
      {
      line = $2
      match(line, /github\.com\/[^)#]+/)
      repo = substr(line, RSTART + 11, RLENGTH - 11)
      split(repo, p, "/")
      print p[1] "/" p[2], $1
    }')

total=$(printf '%s\n' "$pairs" | grep -c . )
[ "$total" -gt 0 ] || { echo "entry-drift: no entries parsed from $README"; exit 1; }

echo "probing $total entries (lines older than $cutoff) for upstream activity since our line last changed…"
results=$(printf '%s\n' "$pairs" | tr ' ' '\n' | xargs -P 8 -n 2 "$0" --probe | sort -rn)

hot=$(printf '%s\n' "$results" | awk -F'\t' -v t="$HOT"  '$1 != "?" && $1+0 >= t')
warm=$(printf '%s\n' "$results" | awk -F'\t' -v t="$HOT" -v w="$WARM" '$1 != "?" && $1+0 >= w && $1+0 < t')
errs=$(printf '%s\n' "$results" | awk -F'\t' '$1 == "?"')

# A 100-commit reading is a ceiling, not a count — say so rather than implying precision.
fmt() { awk -F'\t' '{ n = ($1 == "100") ? "100+" : $1; printf "  %-5s %-58s line written %s\n", n, $2, $3 }'; }

echo
echo "── re-read now (>= $HOT commits since our line) ──"
[ -n "$hot" ] && printf '%s\n' "$hot" | fmt || echo "  none"
echo
echo "── worth a look (>= $WARM) ──"
[ -n "$warm" ] && printf '%s\n' "$warm" | fmt || echo "  none"

if [ -n "$errs" ]; then
  echo
  echo "── could not probe (rate limit, rename, or network) ──"
  printf '%s\n' "$errs" | fmt
fi

echo
echo "checked $total entries: $(printf '%s\n' "$hot" | grep -c .) to re-read, $(printf '%s\n' "$warm" | grep -c .) to look at."
echo "This is a review queue. Re-read the flagged repositories and update the line if it is no longer the best thing to say."
