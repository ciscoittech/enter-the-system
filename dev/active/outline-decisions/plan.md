# Outline Decisions — Pre-Act 2

## Goal

Resolve strategic decisions that affect how Act 2 is written before any chapters are drafted.

## Decisions Made

### 1. CLI-Demonstrated, Interface-Agnostic (DECIDED)

Act 2 shows all examples in the CLI (Claude Code or equivalent) because:
- The reader SEES the system parts (state files, skills, hooks) as real files
- CLI is transparent — GUIs hide the system the reader is trying to learn
- Same patterns work in Claude Code, Codex, Kimi CLI, any future tool
- All 3 production systems backing the book were built in CLI

**How this affects chapters:**
- Ch 4 (first build chapter): Introduce the terminal, explain why CLI matters for learning, show Cowork GUI as an alternative for readers who prefer it
- Ch 5-11: All examples in CLI. State files, skill files, hook scripts are real files the reader creates
- Appendix: "Same workflows in Cowork GUI / VS Code / Cursor" with screenshots

**One sentence for the reader:** "This book shows you the terminal because you need to see your system's parts. If you prefer a graphical interface, everything works there too."

### 2. Warp Terminal Recommended (DECIDED)

Warp is now open-source and supports Claude Code, Codex, Kimi, Gemini CLI, and others. It's the portability layer — learn once, use any agent.

**How this affects chapters:**
- Ch 4: "Install Warp (free, open-source) or use any terminal you have"
- Not required — just recommended. The book works in any terminal.

### 3. System Maintenance / Drift Prevention (NEEDS OUTLINE WORK)

Currently buried in Ch 12 ("When Systems Break"). Needs more weight:
- Skills going stale (voice drift over 20+ posts)
- State files bloating (127 rows is fine, 10,000 isn't)
- Hooks that stop matching reality
- The feedback loop between state and skills (Ch 7 content system does this — use it as the example)

**Options:**
- A: Keep in Ch 12 but expand significantly (maintenance section → half the chapter)
- B: Add a "Maintaining Your System" interlude after Ch 9 (before Connections/Pipelines)
- C: Weave maintenance into each component chapter (Ch 5 covers state hygiene, Ch 7 covers skill versioning, Ch 8 covers hook tuning)

**Recommendation:** Option C — weave it in. Each component chapter teaches how to build AND maintain that component. Ch 12 becomes the debugging chapter (fixing what breaks), not the maintenance chapter (preventing drift). This is more natural — you learn maintenance when you learn the component, not 5 chapters later.

## Dependencies

- These decisions must be reflected in `outline-v3.md` before Act 2 detailed outlines
- The book-writer skill needs updating to reference CLI-first approach
- Ch 4 detailed outline needs the terminal introduction section

## Key Files to Update

- `book/outline-v3.md` — add CLI/Warp notes, add maintenance to component chapters
- `CLAUDE.md` — add CLI-demonstrated rule
- `.claude/skills/book-writer/SKILL.md` — update for Act 2 chapter templates
