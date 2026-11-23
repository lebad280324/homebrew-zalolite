#!/bin/sh
# Points Casks/zalolite.rb at the latest Zalolite release, using the release's SHA256SUMS.txt.
# Usage: scripts/update-cask.sh [version]   (needs gh; GH_TOKEN in CI)
set -eu

REPO=lebad280324/zalolite
CASK=Casks/zalolite.rb

version=${1:-$(gh release view --repo "$REPO" --json tagName -q .tagName)}
version=${version#v}
current=$(sed -n 's/^  version "\(.*\)"$/\1/p' "$CASK")

if [ "$version" = "$current" ]; then
  echo "Cask already at $version"
  exit 0
fi

sums=$(gh release download "v$version" --repo "$REPO" -p SHA256SUMS.txt -O -)
sum_for() {
  printf '%s\n' "$sums" | awk -v f="$1" '$2 == f { print $1 }'
}
modern=$(sum_for "Zalolite-$version-macos-universal.dmg")
legacy=$(sum_for "Zalolite-$version-macos13-universal.dmg")

if [ ${#modern} -ne 64 ] || [ ${#legacy} -ne 64 ]; then
  echo "v$version is missing a DMG checksum; cask left at $current" >&2
  exit 1
fi

# The macOS 13 block comes first in the cask, so the first sha256 line is the legacy DMG.
awk -v v="$version" -v legacy="$legacy" -v modern="$modern" '
  /^  version "/ { print "  version \"" v "\""; next }
  /^    sha256 "/ { n++; print "    sha256 \"" (n == 1 ? legacy : modern) "\""; next }
  { print }
' "$CASK" > "$CASK.tmp"
mv "$CASK.tmp" "$CASK"
echo "Cask updated $current -> $version"
