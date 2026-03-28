#!/usr/bin/env bash
# Lesson Promoter — finds patterns appearing 3+ times in lessons/
# Outputs candidates for promotion to AGENTS.md "Promoted Rules"
set -euo pipefail

WORKSPACE="${OPENCLAW_WORKSPACE:-$HOME/.openclaw/workspace}"
LESSONS_DIR="$WORKSPACE/lessons"

[ -d "$LESSONS_DIR" ] || { echo "No lessons/ directory found."; exit 0; }

echo "=== Lesson Pattern Analysis ==="
echo ""

grep -rhi "LESSON\|FIX:\|NEVER\|ALWAYS\|BROKEN\|DO NOT" "$LESSONS_DIR"/*.md 2>/dev/null | \
  sort | uniq -c | sort -rn | head -20

echo ""
echo "Patterns appearing 3+ times should be promoted to AGENTS.md"
