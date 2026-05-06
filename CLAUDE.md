# CLAUDE.md — From Prompts to Pipelines

**Full Title**: *From Prompts to Pipelines: A Systems-Based Approach to Prompt Engineering and Agentic Workflows*

A book teaching non-AI-savvy people how to **think in systems** and **build AI systems** — not just use prompts. The reader doesn't learn "how to use Cowork." They learn how to decompose any work into components (inputs, outputs, state, feedback loops, guard rails) and wire those components together so AI does the work reliably, every time.

**Audience**: Knowledge workers who know spreadsheets, reports, and deadlines — not tokens or prompt engineering. They want results. This book gives them the mental model AND the hands-on builds to get there.

**Core Principle**: The book has 4 throughline systems (Study, Job Hunting, Project Management, Content) that each start as a basic prompt and grow across the entire book into full 6-component systems. The reader builds alongside real use cases they recognize.

**What makes this different**: Every other AI book teaches prompts. This book teaches *systems*. Act 1 is universal and tool-agnostic — 4 concepts that work in any AI tool. Act 2 builds real systems in Cowork. Components accumulate across chapters — by the end, all four systems have all six components working together.

---

## The Framework

**4 Universal Concepts** (tool-agnostic, taught in Act 1):

| Concept | What It Means | The Failure It Prevents |
|---------|--------------|------------------------|
| **Instruction** | What you tell the AI to do | "It didn't do what I wanted" |
| **Memory** | Anything that persists between sessions | "I have to re-explain everything every time" |
| **Control** | Checks and constraints that catch mistakes | "It gave me confident garbage" |
| **Flow** | Multi-step sequences where stages feed each other | "It tried to do everything at once" |

**6 Cowork Components** (built in Act 2):

| Universal Concept | Cowork Component | What It Is |
|-------------------|-----------------|------------|
| Instruction | **Prompt** | Structured request (Ch 4) |
| Instruction | **Skill** | Reusable knowledge doc (Ch 7) |
| Memory | **State** | File that tracks what happened (Ch 5) |
| Control | **Hook** | Automated check before/after actions (Ch 8) |
| Flow | **Connection** | External data sources — MCP, API, web search (Ch 10) |
| Flow | **Pipeline** | Multi-stage workflow with quality gates (Ch 11) |

**3 Design Patterns**: Loop, Gate, Router (taught in Ch 3, applied throughout)

**4 Throughline Systems**: Study, Job Hunting, Project Management, Content — each grows from a basic prompt to a full 6-component system across the book.

---

## Directory Structure

```
frontier-engineering-cowork/
│
├── CLAUDE.md                  ← You are here
│
├── .claude/                   # Agentic system for book production
│   ├── settings.json          # Permissions + hooks
│   ├── README.md              # Quick reference
│   ├── commands/              # 7 slash commands for production
│   ├── skills/                # 5 agent skills (writer, editor, curator, researcher, architect)
│   ├── hooks/                 # 4 automation hooks
│   └── research/              # Compiled Cowork research
│
├── book/                      # The book itself
│   ├── book-state.md          # Master progress tracker
│   ├── outline-v3.md          # Canonical outline (13 chapters, 2 Acts)
│   ├── chapters/              # Drafts, outlines, and detailed chapter plans
│   │   ├── ch01-draft.md      #   Ch 1 first draft (~3,200 words) — DONE
│   │   ├── ch01-outline.md    #   Ch 1 writing blueprint
│   │   └── act1-detailed-outlines.md  # Detailed outlines for Ch 1-3
│   ├── appendices/            # A-E (component ref, project files, troubleshooting, glossary, resources)
│   └── published/             # Final versions (PROTECTED — do not edit directly)
│
├── prompts/                   # Prompt library
│   ├── tested/                # Verified prompts by use case
│   ├── community/             # Raw prompts from community sources
│   └── templates/             # The 4-part formula templates
│
├── projects/                  # Build-along project files (to be restructured for v3)
│
└── research/                  # Source material
    ├── raw/                   # Scraped docs (PROTECTED — do not edit directly)
    └── synthesized/           # Processed research notes
```

---

## The Agentic Team

| Agent | Skill | Purpose |
|-------|-------|---------|
| Writer | `book-writer` | Drafts chapters in accessible, systems-thinking voice |
| Editor | `book-editor` | Reviews for voice, AI tells, jargon, accessibility |
| Prompt Curator | `prompt-curator` | Finds, tests, rates, and documents community prompts |
| Researcher | `cowork-researcher` | Scrapes Anthropic docs and community sources |
| Structure Architect | `structure-architect` | Ensures progressive component introduction and chapter dependencies |

---

## Production Pipeline

### Act 1 Pipeline (used for Ch 1-3 — COMPLETE)
```
DETAILED OUTLINE → DRAFT → REVIEW (score ≥ 20/30) → ENRICH (add research evidence) → DIAGRAMS
```

### Act 2 Pipeline (Ch 4-13)
```
1. RESEARCH      → /research-topic → CLI specifics, component behavior, production system evidence
2. OUTLINE       → Section-by-section blueprint with CLI examples planned
3. DRAFT         → /draft → book/chapters/chXX-draft.md (CLI-demonstrated, 4 throughline systems)
4. EVAL NOTEBOOK → Build corresponding eval in research/evals/notebooks/
5. DIAGRAMS      → Mermaid source in book/diagrams/src/ → render.sh
6. REVIEW        → /review → score ≥ 20/30 or rework
7. ENRICH        → Add production evidence from research/systems/
8. UPDATE STATE  → book/book-state.md + dev-docs
```

---

## Voice Rules

Write for someone who has never opened a terminal — but don't talk down to them. They're smart. They just haven't seen this before.

**Do this:**
- Replace every technical term with what it does
- "Global Instructions" → "persistent notes Claude remembers every session"
- "Hook" → "an automated check that runs before Claude touches a file"
- "MCP server" → "a connection that lets Claude pull live data from another tool"
- Use specific examples, not abstract explanations
- Casual but competent — not dumbed down, just translated
- Teach the WHY (systems thinking) alongside the HOW (building)

**Never this:**
- "leverage", "utilize", "delve", "ecosystem", "robust", "seamless", "game-changing"
- "Let's dive in", "Key takeaways", "In conclusion"
- Numbered lists as the primary teaching structure
- Hedging ("It's important to note that...")
- Relentless positivity or both-sides-ing
- Teaching prompts without teaching the SYSTEM they belong to

**Act 1 chapter template (universal, tool-agnostic):**
```
Hook (scenario the reader recognizes) → Concept explanation with examples →
Reader exercise (in any AI tool) → Feel the limitation →
Assessment: How to Know It's Clicking
```

**Act 2 chapter template (Cowork builds):**
```
What breaks without this component → Deep build on primary system →
System diagram → Extend to other 3 systems (shorter) →
Quality gate (break it on purpose, verify it catches the failure)
```

**Mastery chapter template (Ch 12-13):**
```
Framework/process → Apply across all 4 systems →
Reader does it themselves → Quality gate
```

---

## Rules

1. **Systems, not prompts.** Every chapter teaches a systems-thinking concept. Prompts are ONE component, not the whole story.
2. **4 throughline systems grow across the book.** Study, Job Hunting, Project Management, Content — each starts as a prompt and ends as a full 6-component system. Each Act 2 chapter does a deep build on ONE system, then extends to the others.
3. **Act 1 is tool-agnostic.** Ch 1-3 teach universal concepts using any AI tool. No Cowork until Act 2.
4. **Build, don't explain.** Every chapter includes hands-on work. Act 1 = exercises in any AI tool. Act 2 = real system builds in Cowork.
5. **No jargon without translation.** Every technical term gets an immediate plain-language equivalent.
6. **Show the system diagram.** Every Act 2 chapter ends with a visual showing all components. The reader can SEE their systems growing.
7. **Protected directories.** `book/published/` and `research/raw/` are read-only. Hooks enforce this.
8. **State tracking.** Update `book/book-state.md` after every writing session.
9. **Quality gates.** Chapter scores >= 20/30 on the 6-dimension rubric before moving to `published/`.
10. **Canonical outline is `outline-v3.md`.** All chapter structure, system assignments, and component schedules follow v3.
11. **Act 2 is CLI-demonstrated, interface-agnostic.** All examples show terminal/CLI. State files, skills, hooks are real files. Warp Terminal recommended (free, open-source) but not required. Say "If you prefer a graphical interface, these same files work in Cowork or VS Code." Patterns work in Claude Code, Codex, Kimi CLI, etc.
12. **Maintenance is taught per-component, not deferred.** Each component chapter (Ch 5, 7, 8, 10, 11) includes a "Maintain It" section. Ch 12 is debugging (fixing what breaks), not maintenance (preventing drift).
13. **Dev-docs track all work.** Implementation plans live in `dev/active/`. Use `/dev-docs` to create, `/dev-docs-update` to track between sessions.

---

## Commands

| Command | Purpose |
|---------|---------|
| `/chapter-next` | What chapter to work on next |
| `/draft` | Draft a chapter section |
| `/review` | Review a draft for voice/quality |
| `/prompt-test` | Test a Cowork prompt and document results |
| `/research-topic` | Research a specific Cowork capability |
| `/book-status` | Overall book progress report |
| `/curate-prompts` | Find and catalog community prompts for a use case |

---

## Scoring Rubric (6 Dimensions, 1-5 each)

| Dimension | What It Measures |
|-----------|-----------------|
| Clarity | Can a non-technical reader follow every sentence? |
| System Thinking | Does the chapter teach a systems concept, not just a task? |
| Voice | Conversational, not textbook? Free of AI tells? |
| Build Quality | Does the project produce a working system the reader can verify? |
| Progression | Adds exactly one new component? Builds on prior chapters? |
| Quality Gate | Is "you got it right when..." concrete and verifiable? |

**Minimum**: 20/30 to publish. Clarity < 3 auto-flags for rewrite.

---

## Current Status (2026-05-06)

### What's Done

| Area | Status | Notes |
|------|--------|-------|
| **v3 Outline** | DONE | 13 chapters, 2 Acts, 4 throughline systems. `book/outline-v3.md` |
| **Act 1 detailed outlines** | DONE | Ch 1, 2, 3 section-by-section blueprints. `book/chapters/act1-detailed-outlines.md` |
| **Ch 1 first draft** | DONE | ~3,200 words. `book/chapters/ch01-draft.md` — needs review |
| **Agentic system** | DONE | 5 skills, 7 commands, 4 hooks, settings.json |
| **Research files** | DONE | `cowork-features.md`, `community-prompts.md`, `best-practices.md` |
| **Prompt templates** | DONE | 4 formula templates |
| **Appendices** | DONE | A-E scaffolded |

### What's Next

| Task | Priority | Details |
|------|----------|---------|
| **Draft Ch 2** | P0 | Detailed outline exists. "The Four Concepts — X-Ray Vision for AI Workflows." Reader pushes Study System through Sessions 3-5, feeling each concept break. |
| **Draft Ch 3** | P0 | Detailed outline exists. "Design Patterns — Three Shapes." Loop, Gate, Router. Reader designs Study System on paper. |
| **Review Ch 1** | P1 | Score against rubric. First draft is solid but unreviewed. |
| **Act 2 detailed outlines** | P1 | Ch 4-13 need section-by-section blueprints before drafting. |
| **Update `book-writer` skill** | P2 | Needs v3 chapter templates (Act 1 universal, Act 2 builds, Mastery). Current skill references v1 structure. |
| **Research: MCP/connections** | P3 | Ch 10 needs step-by-step for non-technical users. |
| **Research: systems-thinking sources** | P3 | Meadows, Goldratt concepts to translate for audience (Ch 3, 12). |
