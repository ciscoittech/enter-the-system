# Enter the System

**Building AI Systems That Actually Work**

A book teaching knowledge workers how to think in systems and build AI systems — not just write prompts. The reader learns to decompose work into components (instructions, memory, control, flow) and wire them together so AI produces reliable results every time.

## Who This Is For

People who already use AI for everyday tasks but hit the wall: prompts work once then break, context gets re-explained every session, output can't be trusted without manual checking. They're smart and motivated — they just need the framework.

## Book Structure

**2 Acts, 13 Chapters, 4 Throughline Systems**

| Act | Chapters | What Happens |
|-----|----------|-------------|
| **Act 1: The System** | Ch 1-3 | Universal systems thinking. Tool-agnostic. The reader runs 5 study sessions in any AI tool, feels each concept work and fail manually. |
| **Act 2: The Build** | Ch 4-13 | Real systems in Claude Code (Cowork). Each chapter introduces one component and builds it into 4 throughline systems. |

### The 4 Throughline Systems

Each starts as a basic prompt and grows across the book into a full 6-component system:

- **Study System** — from "quiz me" to adaptive learning
- **Job Hunting System** — from one-shot cover letters to a tracked campaign
- **Project Management System** — from to-do lists to audience-routed status reports
- **Content System** — from generic drafts to a voice-matched production pipeline

### The Framework

**4 Universal Concepts** (tool-agnostic): Instruction, Memory, Control, Flow

**6 Implementation Components** (Cowork): Prompt, State, Skill, Hook, Connection, Pipeline

**3 Design Patterns**: Loop, Gate, Router

## Current Status

| Area | Status |
|------|--------|
| Outline (v3) | Done — 13 chapters mapped |
| Act 1 drafts (Ch 1-3) | Done — ~10,800 words |
| Act 1 review | Done — all pass (28, 30, 28 out of 30) |
| Act 2 drafts (Ch 4-13) | Not started |
| Agentic production system | Done — 5 skills, 7 commands, 4 hooks |

## Quick Links

### The Book
- [Full Outline (v3)](book/outline-v3.md)
- [Progress Tracker](book/book-state.md)

### Chapter Drafts
- [Chapter 1 — You're Already Building Systems](book/chapters/ch01-draft.md)
- [Chapter 2 — Going Deeper](book/chapters/ch02-draft.md)
- [Chapter 3 — Design Patterns](book/chapters/ch03-draft.md)

### Planning & Review
- [Act 1 Detailed Outlines (Ch 1-3)](book/chapters/act1-detailed-outlines.md)
- [Act 1 Review & Scores](book/chapters/act1-review.md)
- [Ch 1 Writing Blueprint](book/chapters/ch01-outline.md)

### Production System
- [CLAUDE.md — Project Instructions](CLAUDE.md)
- [Writer Skill](/.claude/skills/book-writer/SKILL.md)
- [Editor Skill](/.claude/skills/book-editor/SKILL.md)
- [Scoring Rubric](/.claude/skills/book-writer/references/scoring.md)
- [Voice Rules](/.claude/skills/book-writer/references/voice.md)

### Reference
- [Appendix A — System Component Reference](book/appendices/a-prompt-library.md)
- [Appendix C — Glossary](book/appendices/c-glossary.md)
- [Prompt Templates](prompts/templates/)

## Repo Structure

```
book/
  outline-v3.md          # Canonical outline
  book-state.md           # Master progress tracker
  chapters/
    ch01-draft.md          # ~3,200 words — DONE
    ch02-draft.md          # ~3,500 words — DONE
    ch03-draft.md          # ~4,100 words — DONE
    act1-detailed-outlines.md
    act1-review.md
  appendices/              # A-E stubs

.claude/
  skills/                  # 5 agent skills (writer, editor, curator, researcher, architect)
  commands/                # 7 slash commands for production pipeline
  hooks/                   # 4 automation hooks

prompts/                   # Prompt library + templates
```

## Production Pipeline

```
DETAILED OUTLINE → DRAFT → REVIEW (score >= 20/30) → PUBLISH
```

Chapters are scored on 6 dimensions (1-5 each): Clarity, Systems Thinking, Voice, Build Quality, Progression, Quality Gate.
