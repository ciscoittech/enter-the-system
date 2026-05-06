# From Prompts to Pipelines

**Building AI Systems That Actually Work**

A book teaching knowledge workers how to think in systems and build AI systems — not just write prompts. You learn to decompose work into components (instructions, memory, control, flow) and wire them together so AI produces reliable results every time.

---

## Beta Readers — Start Here

Act 1 is ready for review. Three chapters, ~11,000 words. Read them in order — each builds on the last.

### Read the Chapters

1. **[Chapter 1 — You're Already Building Systems (You're Just Building Them Badly)](book/chapters/ch01-draft.md)** (~3,000 words)
   The opener. You run a study quiz in any AI tool, get good results — then open a new chat and watch it forget everything. Four concepts introduced: Instruction, Memory, Control, Flow.

2. **[Chapter 2 — Going Deeper: What Each Concept Actually Means](book/chapters/ch02-draft.md)** (~3,700 words)
   You push the Study System through 3 more sessions, each manually patching a concept. Structured prompts, pasted progress notes, fact-checking, staged pipelines. Each one helps. Each one breaks under manual overhead.

3. **[Chapter 3 — Design Patterns: Three Shapes Every System Takes](book/chapters/ch03-draft.md)** (~4,300 words)
   Loop, Gate, Router — three patterns that describe every system. You design the Study System on paper with a napkin sketch. Act 1 ends here — you have vocabulary, experience, and a blueprint.

### See the Diagrams

Each chapter has visual diagrams showing how the system grows:

| Chapter 1 | Chapter 2 | Chapter 3 |
|-----------|-----------|-----------|
| ![Four Concepts](book/diagrams/png/ch01-four-concepts.png) | ![Manual Overhead](book/diagrams/png/ch02-manual-overhead.png) | ![Napkin Sketch](book/diagrams/png/ch03-napkin-sketch.png) |
| *After Session 2: only Instruction is present* | *By Session 5: you're doing 80% of the work* | *The full Study System with all 3 patterns* |

[All 9 diagrams →](book/diagrams/)

### See the Evidence

The book's claims are backed by real data:

- **[Prompt Eval: Basic vs Structured](research/evals/notebooks/01-prompt-structure.ipynb)** — We ran the same quiz task with a vague prompt and a structured prompt. Scored on 4 dimensions. Result: **11/20 vs 20/20, every run.** ([methodology](research/METHODOLOGY.md))

- **[Study System](research/systems/study-system/)** — The author's real 127-item curriculum tracker with quiz scoring, gap detection, and adaptive sessions. Not a demo. ([sample prompts](research/systems/study-system/sample-prompts.md))

- **[Work System](research/systems/work-system/)** — 15 specialized agents, 15 domain skills, 80,000+ reference documents. Production advisor system. ([sample prompts](research/systems/work-system/sample-prompts.md))

- **[Content System](research/systems/content-system/)** — 7-stage pipeline, 26 posts tracked, 6-dimension scoring with 24/30 minimum gate. 15 drafts rejected back to rework. ([sample prompts](research/systems/content-system/sample-prompts.md))

### What We're Looking For

- **Clarity**: Can you follow every sentence? Where did you get lost?
- **Does it land?**: After reading all 3 chapters, can you explain to someone why a prompt isn't a system?
- **The exercises**: Did you actually run Sessions 1-2 (Ch 1) and Sessions 3-5 (Ch 2)? If not, what stopped you?
- **The patterns**: After Ch 3, could you sketch a system for one of your own tasks?
- **What's missing**: Anything you expected that wasn't there?

Leave feedback as [GitHub Issues](../../issues) or in-line comments on the files.

---

## Full Outline

**2 Acts, 13 Chapters, 4 Throughline Systems**

| Act | Chapters | What Happens |
|-----|----------|-------------|
| **Act 1: The System** | Ch 1-3 | Universal systems thinking. Tool-agnostic. 5 study sessions in any AI tool. |
| **Act 2: The Build** | Ch 4-13 | Real systems in Claude Code. Each chapter adds one component to 4 throughline systems. |

**4 Throughline Systems** (each grows from a basic prompt to a full 6-component system):
- **Study** — from "quiz me" to adaptive learning with gap tracking
- **Job Hunting** — from one-shot cover letters to a tracked campaign with validation
- **Project Management** — from to-do lists to audience-routed status reports
- **Content** — from generic drafts to a voice-matched production pipeline

**The Framework**:
- 4 Universal Concepts: Instruction, Memory, Control, Flow
- 6 Implementation Components: Prompt, State, Skill, Hook, Connection, Pipeline
- 3 Design Patterns: Loop, Gate, Router

[Full outline with all 13 chapters →](book/outline-v3.md)

---

## Current Status

| Area | Status |
|------|--------|
| Act 1 drafts (Ch 1-3) | **Done** — ~11,000 words, scored 28-30/30 per chapter |
| Act 1 review | **Done** — [v1 review](book/chapters/act1-review.md), [v2 review](book/chapters/act1-review-v2.md) |
| Research & evidence | **Done** — 3 production systems documented, 1 eval notebook run |
| Act 2 detailed outlines | Next up |
| Act 2 drafts (Ch 4-13) | Not started |

---

## All Links

### Chapters
| # | Title | Words | Score |
|---|-------|-------|-------|
| 1 | [You're Already Building Systems](book/chapters/ch01-draft.md) | ~3,000 | 28/30 |
| 2 | [Going Deeper](book/chapters/ch02-draft.md) | ~3,700 | 30/30 |
| 3 | [Design Patterns](book/chapters/ch03-draft.md) | ~4,300 | 29/30 |

### Diagrams
- [All diagrams with previews](book/diagrams/) — 9 diagrams across 3 chapters
- [Mermaid source files](book/diagrams/src/) — editable, version-controlled

### Research & Evidence
- [Evaluation Methodology](research/METHODOLOGY.md)
- [Prompt Eval: Structured vs Basic](research/evals/notebooks/01-prompt-structure.ipynb) — baseline 11/20, treatment 20/20
- [Study System Evidence](research/systems/study-system/) — 127 items, quiz scoring, gap tracking
- [Work System Evidence](research/systems/work-system/) — 15 agents, 80K+ docs
- [Content System Evidence](research/systems/content-system/) — 7-stage pipeline, 26 posts

### Planning
- [Full Outline (v3)](book/outline-v3.md)
- [Progress Tracker](book/book-state.md)
- [Act 1 Detailed Outlines](book/chapters/act1-detailed-outlines.md)
- [Act 1 Review v1](book/chapters/act1-review.md) | [v2 (post-research)](book/chapters/act1-review-v2.md)

### How the Book Is Made
- [CLAUDE.md — Project Instructions](CLAUDE.md)
- [Scoring Rubric](/.claude/skills/book-writer/references/scoring.md)
- [Voice Rules](/.claude/skills/book-writer/references/voice.md)

---

## Production Pipeline

```
DETAILED OUTLINE → DRAFT → REVIEW (score >= 20/30) → RESEARCH ENRICHMENT → PUBLISH
```

Every chapter is scored on 6 dimensions (1-5 each): Clarity, Systems Thinking, Voice, Build Quality, Progression, Quality Gate. Minimum 20/30 to publish. Every claim maps to evidence in the research section.
