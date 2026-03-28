#!/usr/bin/env bash
# Memory Size Guard — prevents silent context truncation
# Run via cron or heartbeat. Trims files over 8000 bytes.
set -euo pipefail

WORKSPACE="${OPENCLAW_WORKSPACE:-$HOME/.openclaw/workspace}"
MAX_BYTES=8000

for file in SOUL.md USER.md MEMORY.md; do
  filepath="$WORKSPACE/$file"
  [ -f "$filepath" ] || continue
  size=$(wc -c < "$filepath")
  if [ "$size" -gt "$MAX_BYTES" ]; then
    echo "⚠️  $file is ${size} bytes (limit: ${MAX_BYTES}). Needs trimming."
    head -c "$MAX_BYTES" "$filepath" > "${filepath}.trimmed"
    mv "${filepath}.trimmed" "$filepath"
    echo "✅ $file trimmed to ${MAX_BYTES} bytes"
  else
    echo "✅ $file: ${size}/${MAX_BYTES} bytes — OK"
  fi
done
