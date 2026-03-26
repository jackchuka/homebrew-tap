#!/bin/bash
set -euo pipefail

# Auto-update all casks by checking their GitHub repos for newer releases.

for cask_file in Casks/*.rb; do
  [ -f "$cask_file" ] || continue

  cask=$(basename "$cask_file" .rb)
  current_version=$(grep -m1 'version "' "$cask_file" | sed 's/.*version "\(.*\)"/\1/')
  homepage=$(grep -m1 'homepage "' "$cask_file" | sed 's/.*homepage "\(.*\)"/\1/')
  repo=$(echo "$homepage" | sed 's|https://github.com/||')

  if [ -z "$repo" ]; then
    echo "[$cask] skipping: no GitHub homepage"
    continue
  fi

  latest_version=$(gh release view --repo "$repo" --json tagName -q '.tagName' 2>/dev/null | sed 's/^v//')

  if [ -z "$latest_version" ]; then
    echo "[$cask] skipping: no releases found for $repo"
    continue
  fi

  if [ "$current_version" = "$latest_version" ]; then
    echo "[$cask] up to date ($current_version)"
    continue
  fi

  echo "[$cask] updating $current_version -> $latest_version"
  ./update-cask.sh "$repo" "$latest_version"
done
