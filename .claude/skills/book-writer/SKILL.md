---
name: book-writer
description: Voice rules, chapter structure, CLI-demonstrated approach, and scoring rubric for "From Prompts to Pipelines." Use when drafting chapters. Loaded by /draft command.
---

# Book Writer Skill

## 1. Identity

You are writing *From Prompts to Pipelines: Building AI Systems That Actually Work.*

The reader doesn't just learn to use AI — they learn to THINK in systems and BUILD systems that make AI work reliably. Act 1 is tool-agnostic. Act 2 is CLI-demonstrated, interface-agnostic.

**Core stance**: "The difference between AI that sometimes helps and AI that reliably works is systems thinking. Prompts are one component. This book teaches all six."

**What this book is NOT**: A guide to one tool. A prompt collection. "50 things you can do with AI."

**What this book IS**: A systems-thinking workbook with 4 throughline systems (Study, Job Hunting, Project Management, Content) that each grow from a basic prompt to a full 6-component system across the book.

## 2. The Framework

**4 Universal Concepts** (tool-agnostic, taught in Act 1):
- **Instruction** — What you tell the AI to do
- **Memory** — Anything that persists between sessions
- **Control** — Checks and constraints that catch mistakes
- **Flow** — Multi-step sequences where stages feed each other

**6 Implementation Components** (built in Act 2):

| Component | What It Is | Introduced |
|-----------|-----------|------------|
| **Prompt** | Structured request (4-part formula) | Ch 4 (Study System) |
| **State** | File that tracks what happened across sessions | Ch 5 (Job Hunting) |
| **Skill** | Reusable knowledge doc loaded on demand | Ch 7 (Content System) |
| **Hook** | Automated check before/after actions | Ch 8 (Job Hunting) |
| **Connection** | External data — MCP, API, web search | Ch 10 (Study System) |
| **Pipeline** | Multi-stage workflow with quality gates | Ch 11 (Content System) |

**3 Design Patterns** (taught in Ch 3): Loop, Gate, Router

**4 Throughline Systems** (each grows across the book):
- **Study** — primary build in Ch 4 (Prompt), Ch 5 states extend it, Ch 10 (Connection)
- **Job Hunting** — primary build in Ch 5 (State), Ch 8 (Hook), Ch 9 (integration)
- **Project Management** — extended in each chapter alongside primary system
- **Content** — primary build in Ch 7 (Skill), Ch 11 (Pipeline)

## 3. Chapter Templates

### Act 1 Chapters (Ch 1-3): Universal, Tool-Agnostic

**Structure:**
```
Hook (scenario the reader recognizes) →
Concept explanation with non-AI examples →
Reader exercise (in any AI tool — ChatGPT, Claude, Gemini, etc.) →
Feel the limitation (manual overhead, no memory, etc.) →
Assessment: How to Know It's Clicking
```

**Rules:**
- No specific tool required — say "any AI tool" or "open a new chat"
- The Study System is the throughline — Sessions 1-5 accumulate across Ch 1-2
- Ch 3 adds design patterns (Loop, Gate, Router) and the napkin sketch exercise
- Reference production evidence where it strengthens claims (eval data, system metrics)

### Act 2 Chapters (Ch 4-13): CLI-Demonstrated, Interface-Agnostic

**Approach**: Show all examples in the CLI (Claude Code, or equivalent). The reader sees state files, skill files, and hook scripts as real files they create.

```
The Problem — what breaks WITHOUT this component (2-3 paragraphs)
See the System — current system + the gap this chapter fills
The New Component — what it is, what failure it prevents (name it)
Build It — deep build on PRIMARY system (step-by-step, all files shown)
  ↳ "Components Used" checklist at top: [Prompt] + [State] + [Skill]
  ↳ Show terminal commands and file contents
  ↳ Show what AI does at each step
Extend It — shorter walkthrough extending to other 3 systems
Maintain It — how to keep this component healthy over time
  ↳ State hygiene (Ch 5), skill versioning (Ch 7), hook tuning (Ch 8)
System Diagram — Mermaid source + rendered image
Break It on Purpose — feed bad input, verify the component catches it
Quality Gate — 3-5 concrete, verifiable checks
```

**CLI rules:**
- Show terminal commands: `claude "your prompt here"` or file creation
- Show file contents inline (state files, skill docs, hook scripts)
- Say "If you prefer a graphical interface, these same files work in Cowork or VS Code"
- Recommend Warp Terminal (free, open-source) but don't require it
- Keep examples portable — same patterns work in Codex, Kimi CLI, etc.

**Maintenance section** (NEW — every component chapter):
- Ch 5 (State): State hygiene — when to archive, how to keep active state lean
- Ch 7 (Skill): Skill versioning — note what changed, roll back if worse
- Ch 8 (Hook): Hook tuning — thresholds, false positives, calibration
- Ch 10 (Connection): Connection health — check sources still work
- Ch 11 (Pipeline): Pipeline bottlenecks — find and fix the slowest stage

### Mastery Chapters (Ch 12-13): Debugging + Composition

```
Framework/process →
Apply across all 4 systems →
Reader does it themselves →
Quality gate
```

Ch 12 focuses on DEBUGGING (what broke and how to fix it).
Ch 13 focuses on COMPOSITION (wiring systems together).

Maintenance was already taught per-component — Ch 12 references those sections.

## 4. Voice Rules

**Tone**: Casual but competent. Like a smart coworker over coffee.

**Sentence structure**: Short and varied. Max 4 sentences per paragraph. Single-sentence paragraphs for emphasis.

**Vocabulary**:
- "Tell the AI" (Act 1) or "Tell Claude" (Act 2) — not "prompt the model"
- "The folder where your files live" not "the working directory"
- "What you want back" not "the desired output specification"
- "If something goes wrong" not "error handling"

**Perspective**: Second person ("you"). Present tense for instructions.

**Specificity**: Use exact examples. "$340 in forgotten subscriptions" not "unnecessary costs."

**Production evidence**: When a chapter makes a claim, reference the research data if it exists. "We tested this — baseline 11/20, structured prompt 20/20. Every run." Keep it short, factual, not promotional.

See `references/voice.md` for AI tells to eliminate and voice markers to inject.
See `references/anti-jargon.md` for the complete translation table.

## 5. Authoring Rules

**Name the failure.** When introducing a component, write one sentence naming the failure it prevents. Not "state helps remember" — "without state, the system re-categorizes the same expenses every month."

**Break it on purpose.** Every Act 2 chapter includes a step where the reader feeds bad input that the component should catch. Without this, the reader has no proof the system works.

**Show the throughline growth.** Each Act 2 chapter does a deep build on ONE system, then shows how to extend the same component to the other systems. The deep build is 70% of the chapter. The extensions are 30%.

**Reference the research.** When the eval notebooks or production systems have data backing a claim, cite it briefly. Point to the research section for full details.

## 6. Quality Gates

Score each draft against the 6-dimension rubric (see `references/scoring.md`):

| Dimension | Minimum |
|-----------|---------|
| Clarity | 3 (auto-flag rewrite if < 3) |
| Systems Thinking | 3 |
| Voice | 3 |
| Build Quality | 3 |
| Progression | 3 |
| Quality Gate | 3 |
| **Total** | **20/30** |

## 7. References

| File | Contents |
|------|----------|
| `references/voice.md` | AI tells to eliminate, voice markers to inject |
| `references/scoring.md` | 6-dimension rubric with examples |
| `references/structure.md` | Section lengths and templates |
| `references/anti-jargon.md` | Jargon-to-plain-language translation table |
| `references/diagrams.md` | Progressive system diagram examples |
