#!/usr/bin/env bash
# Self-Learning Setup for OpenClaw
# Usage: bash setup.sh [workspace_path]
set -euo pipefail

WORKSPACE="${1:-$HOME/.openclaw/workspace}"
echo "🧠 Self-Learning Setup for OpenClaw"
echo "Workspace: $WORKSPACE"
echo ""

mkdir -p "$WORKSPACE/skills/self-learning"
mkdir -p "$WORKSPACE/memory"
mkdir -p "$WORKSPACE/lessons"
mkdir -p "$WORKSPACE/decisions"
mkdir -p "$WORKSPACE/tasks/active"
mkdir -p "$WORKSPACE/tasks/done"
mkdir -p "$WORKSPACE/scripts"

cp SKILL.md "$WORKSPACE/skills/self-learning/SKILL.md"
echo "✅ Skill installed to skills/self-learning/"

cp scripts/*.sh "$WORKSPACE/scripts/"
chmod +x "$WORKSPACE/scripts/memory-guard.sh"
chmod +x "$WORKSPACE/scripts/lesson-promoter.sh"
chmod +x "$WORKSPACE/scripts/daily-memory.sh"
chmod +x "$WORKSPACE/scripts/stale-cleanup.sh"
echo "✅ Scripts installed to scripts/"

if [ -f "$WORKSPACE/HEARTBEAT.md" ]; then
  if ! grep -q "Self-Learning Loop" "$WORKSPACE/HEARTBEAT.md"; then
    cat templates/heartbeat-addition.md >> "$WORKSPACE/HEARTBEAT.md"
    echo "✅ Self-learning section added to HEARTBEAT.md"
  else
    echo "⏭️  HEARTBEAT.md already has self-learning section"
  fi
else
  cp templates/heartbeat-addition.md "$WORKSPACE/HEARTBEAT.md"
  echo "✅ HEARTBEAT.md created with self-learning section"
fi

bash scripts/daily-memory.sh

echo ""
bash scripts/memory-guard.sh

echo ""
echo "🎉 Self-learning installed!"
echo ""
echo "Next: Tell your OpenClaw agent to create the background cron:"
echo '  "Create a cron called Self-Learning Loop that runs every 3 hours.'
echo '   It should check memory file sizes, promote daily notes to MEMORY.md,'
echo '   detect recurring lesson patterns, and remove stale entries."'
