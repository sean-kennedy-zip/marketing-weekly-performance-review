#!/bin/bash
REPO="$HOME/marketing-weekly-performance-review"
FILE=$(find "$HOME/Library/Application Support/Claude" -name "marketing-weekly-review-*.html" -newer "$REPO/.git/index" 2>/dev/null | head -1)

if [ -z "$FILE" ]; then
  echo "No new review file found."
  exit 1
fi

FILENAME=$(basename "$FILE")
cp "$FILE" "$REPO/"
cd "$REPO"
git add "$FILENAME"
git commit -m "Add $FILENAME"
git push origin main
echo "✓ Pushed: https://sean-kennedy-zip.github.io/marketing-weekly-performance-review/$FILENAME"
