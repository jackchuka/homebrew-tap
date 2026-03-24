#!/bin/bash
set -euo pipefail

# Usage: ./update-cask.sh <owner/repo> <version>
# Example: ./update-cask.sh jackchuka/timestack 0.1.0

REPO="${1:?Usage: $0 <owner/repo> <version>}"
VERSION="${2:?Usage: $0 <owner/repo> <version>}"
CASK="${REPO#*/}"
CASK_FILE="Casks/${CASK}.rb"

if [ ! -f "$CASK_FILE" ]; then
  echo "Error: $CASK_FILE not found"
  exit 1
fi

echo "Updating $CASK_FILE to v${VERSION}..."

ARM_URL="https://github.com/${REPO}/releases/download/v${VERSION}/${CASK}_${VERSION}_aarch64.dmg"
INTEL_URL="https://github.com/${REPO}/releases/download/v${VERSION}/${CASK}_${VERSION}_x64.dmg"

echo "  Downloading arm64 DMG..."
SHA_ARM=$(curl -fsSL "$ARM_URL" | shasum -a 256 | cut -d' ' -f1)
echo "  SHA256 (arm64): $SHA_ARM"

echo "  Downloading x64 DMG..."
SHA_INTEL=$(curl -fsSL "$INTEL_URL" | shasum -a 256 | cut -d' ' -f1)
echo "  SHA256 (x64):   $SHA_INTEL"

tmp=$(mktemp)
awk -v "ver=${VERSION}" -v "sha_arm=${SHA_ARM}" -v "sha_intel=${SHA_INTEL}" '
  BEGIN { n=0 }
  /^  version / { sub(/"[^"]*"/, "\"" ver "\"") }
  /sha256/ { n++; if (n==1) sub(/"[^"]*"/, "\"" sha_arm "\""); else sub(/"[^"]*"/, "\"" sha_intel "\"") }
  { print }
' "$CASK_FILE" > "$tmp"
mv "$tmp" "$CASK_FILE"

echo ""
cat "$CASK_FILE"
echo ""
echo "Done. To publish:"
echo "  git add -A && git commit -m 'cask: update $CASK to $VERSION' && git push"
