# Self-Learning Skill for OpenClaw

Make any OpenClaw agent self-improving. No code changes required.

## What It Does

- **Memory Nudge** — Auto-reviews conversations, saves user preferences and corrections
- **Skill Auto-Creation** — Detects novel problem-solving, saves reusable procedures
- **Lesson Extraction** — Captures mistakes, promotes recurring patterns to hard rules
- **Memory Size Guard** — Prevents silent context truncation from oversized files
- **Stale Cleanup** — Removes outdated entries automatically

## Quick Install

```bash
git clone https://github.com/azai-technologies/self-learning.git
cd self-learning
bash setup.sh
```

Or specify your workspace:
```bash
bash setup.sh /path/to/your/workspace
```

This installs:
- `skills/self-learning/SKILL.md` — the skill definition
- `scripts/memory-guard.sh` — auto-trims files over 8KB
- `scripts/lesson-promoter.sh` — finds patterns to promote to rules
- `scripts/daily-memory.sh` — creates daily memory log files
- `scripts/stale-cleanup.sh` — checks memory health + duplicates
- Adds self-learning section to your `HEARTBEAT.md`

## What's Included

```
self-learning/
├── setup.sh                    # One-command installer
├── SKILL.md                    # Skill definition for OpenClaw
├── scripts/
│   ├── memory-guard.sh         # Auto-trim oversized memory files
│   ├── lesson-promoter.sh      # Find recurring lesson patterns
│   ├── daily-memory.sh         # Create daily memory log
│   └── stale-cleanup.sh        # Memory health check + dedup
├── templates/
│   └── heartbeat-addition.md   # Heartbeat section to append
├── LICENSE
└── README.md
```

## How It Compares to Hermes Agent

| Feature | Hermes | This Skill |
|---------|--------|-----------|
| Memory nudge | Every 10 turns | Every heartbeat + 3h cron |
| Skill creation | Every 15 tool calls | Heartbeat + cron |
| Memory size guard | 2,200 char limit | 8,000 byte + auto-trim |
| Lesson extraction | ❌ None | ✅ Auto-promote |
| Stale cleanup | ❌ None | ✅ Cron cleans |
| External deps | Honcho (optional) | None |

## Blog Post

[Read the full technical breakdown →](https://azai.pro/blog/self-learning-openclaw.html)

## License

MIT — Use it however you want.

## Built by

[AZAI Technologies](https://azai.pro) — AI tools that actually work.
