# .claude/ — Book Production System

## Commands

| Command | Purpose |
|---------|---------|
| `/chapter-next` | What chapter to work on next |
| `/draft` | Draft a chapter (loads book-writer skill) |
| `/review` | Score + review a draft (loads book-editor skill) |
| `/prompt-test` | Test and document a Cowork prompt |
| `/research-topic` | Research a Cowork capability (loads cowork-researcher skill) |
| `/book-status` | Overall book progress report |
| `/curate-prompts` | Collect community prompts (loads prompt-curator skill) |

## Skills

| Skill | Agent Role | Purpose |
|-------|-----------|---------|
| `book-writer` | Writer | Voice, chapter template, scoring rubric |
| `book-editor` | Editor | Voice review, jargon check, accessibility |
| `prompt-curator` | Prompt Curator | Find/test/rate community prompts |
| `cowork-researcher` | Researcher | Anthropic docs + community research |
| `structure-architect` | Architect | Chapter dependencies, progressive complexity |

## Hooks

| Hook | Event | Action |
|------|-------|--------|
| `protect-files.sh` | PreToolUse (Edit/Write) | Blocks writes to `published/` and `research/raw/` |
| `jargon-check.sh` | PreToolUse (Edit/Write) | Warns on AI jargon without translation |
| `skill-suggester.sh` | UserPromptSubmit | Suggests relevant commands |
| `on-stop.sh` | Stop | Reminds to update book-state.md |

## Production Pipeline

```
Research → Curate Prompts → Draft → Review (score ≥ 20/30) → Prompt Pack → Update State
```
