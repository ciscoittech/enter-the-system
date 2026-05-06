# Act 2 Part II: First Builds (Ch 4-5)

## Goal

The reader's first time building in the CLI. Two chapters introducing Prompt (CLAUDE.md) and State components through the Study and Job Hunting systems. After Part II, the reader has two working systems with persistent context and session memory.

## Chapters

- **Ch 4** (Prompt, Study System): DONE. Introduces CLAUDE.md, root + system-specific context scoping, 4-part formula, terminal setup, Warp. Reader creates 5 CLAUDE.md files (1 root + 4 systems).
- **Ch 5** (State, Job Hunting): Add state files. Deep build on Job Hunting — applications tracker, resume versions, response patterns. Extend state to Study, PM, Content. Include state hygiene maintenance. Reader updates CLAUDE.md to reference state files.

## Key Decisions

- Ch 4 uses CLAUDE.md (not standalone prompt files) as the first component
- Root CLAUDE.md has shared rules; system CLAUDE.md has specific context
- Ch 5 introduces dynamic state alongside static CLAUDE.md — reader sees both memory types
- No Meal Planner, no deepening chapter — 4 throughline systems only

## Quality Gate

- Both chapters score >= 20/30
- Reader has 4 CLAUDE.md files + state files for Job Hunting system
- State hygiene taught in Ch 5
- CLI approach consistent
