
## 🧠 Self-Learning Loop (EVERY heartbeat)

### 1. Memory Review (auto-capture from recent conversation)
- Scan the last 10-20 messages in this session
- Did the user reveal preferences, corrections, personal details, or new patterns?
- Did I learn something about the environment, tools, or workflow?
- If YES → write to `memory/YYYY-MM-DD.md` AND update `MEMORY.md` if durable
- If NO → skip silently
- **SOUL.md, USER.md, MEMORY.md must stay under 8000 bytes.** Run `scripts/memory-guard.sh` if unsure.

### 2. Skill Auto-Creation Check
- Did I solve a non-trivial problem this session (5+ tool calls, trial-and-error, user correction)?
- Does a skill already exist for this pattern?
- If novel + reusable → create a skill in `skills/`
- If existing skill was wrong/incomplete → update it
- **Skip for:** simple one-offs, routine tasks, already documented

### 3. Lesson Extraction
- Did something break? Did I make a mistake? Did the user correct me?
- If YES → append to `lessons/` with date + pattern + fix
- Search `lessons/` FIRST before doing something tricky
- If same lesson appears 3+ times → promote to AGENTS.md "Promoted Rules"
- Run `scripts/lesson-promoter.sh` to find candidates

### 4. Memory Size Guard
- Run: `scripts/memory-guard.sh`
- If ANY file > 8000 bytes → it auto-trims
- Priority: remove duplicates > remove stale info > shorten verbose entries
