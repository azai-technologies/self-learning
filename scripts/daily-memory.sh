#!/usr/bin/env bash
# Daily Memory Writer — creates/appends to memory/YYYY-MM-DD.md
set -euo pipefail

WORKSPACE="${OPENCLAW_WORKSPACE:-$HOME/.openclaw/workspace}"
MEMORY_DIR="$WORKSPACE/memory"
TODAY=$(date +%Y-%m-%d)
DAILY_FILE="$MEMORY_DIR/$TODAY.md"

mkdir -p "$MEMORY_DIR"

if [ ! -f "$DAILY_FILE" ]; then
  echo "# $TODAY" > "$DAILY_FILE"
  echo "" >> "$DAILY_FILE"
  echo "Created daily memory file: $DAILY_FILE"
else
  echo "Daily file already exists: $DAILY_FILE"
fi
