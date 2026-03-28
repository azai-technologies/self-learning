#!/usr/bin/env bash
# Stale Memory Cleanup — checks MEMORY.md health, finds duplicates
set -euo pipefail

WORKSPACE="${OPENCLAW_WORKSPACE:-$HOME/.openclaw/workspace}"
MEMORY_FILE="$WORKSPACE/MEMORY.md"

[ -f "$MEMORY_FILE" ] || { echo "No MEMORY.md found."; exit 0; }

SIZE=$(wc -c < "$MEMORY_FILE")
LINES=$(wc -l < "$MEMORY_FILE")

echo "=== MEMORY.md Health Check ==="
echo "Size: ${SIZE} bytes (limit: 8000)"
echo "Lines: ${LINES}"
echo ""

if [ "$SIZE" -gt 8000 ]; then
  echo "⚠️  OVER LIMIT — needs trimming!"
  echo "Run: scripts/memory-guard.sh"
else
  PCT=$((SIZE * 100 / 8000))
  echo "✅ ${PCT}% capacity used"
fi

echo ""
echo "=== Duplicate Check ==="
sort "$MEMORY_FILE" | uniq -d | head -10
