# Self-Learning Skill for OpenClaw

Make any OpenClaw agent self-improving. No code changes required.

## What It Does

- **Memory Nudge** — Auto-reviews conversations, saves user preferences and corrections
- **Skill Auto-Creation** — Detects novel problem-solving, saves reusable procedures
- **Lesson Extraction** — Captures mistakes, promotes recurring patterns to hard rules
- **Memory Size Guard** — Prevents silent context truncation from oversized files
- **Stale Cleanup** — Removes outdated entries automatically

## Install

1. Copy `SKILL.md` to your OpenClaw `skills/self-learning/` directory
2. Add the heartbeat section to your `HEARTBEAT.md`
3. Create the background cron (see SKILL.md for details)

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
