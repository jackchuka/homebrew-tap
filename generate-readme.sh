#!/bin/bash

# Create temp file for packages content
temp_packages=$(mktemp)

for formula in Formula/*.rb; do
  [ -f "$formula" ] || continue

  # Extract package name (filename without .rb)
  package=$(basename "$formula" .rb)

  # Extract homepage URL from the formula
  homepage=$(grep "homepage" "$formula" | sed "s/.*homepage '\(.*\)'/\1/")

  # Extract description
  desc=$(grep "desc" "$formula" | sed "s/.*desc '\(.*\)'/\1/")

  # Build package entry with installation command
  cat >> "$temp_packages" << EOF
### [$package]($homepage)

$desc

\`\`\`bash
brew install jackchuka/tap/$package
\`\`\`

EOF
done

# Replace content between markers in README
awk '
  /<!-- PACKAGES_START -->/ { print; system("cat '"$temp_packages"'"); skip=1; next }
  /<!-- PACKAGES_END -->/ { skip=0 }
  !skip
' README.md > README.md.tmp && mv README.md.tmp README.md

# Clean up
rm "$temp_packages"
