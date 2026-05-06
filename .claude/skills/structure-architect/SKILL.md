---
name: structure-architect
description: Manages chapter dependencies, progressive complexity, and book structure for "From Prompts to Pipelines." Ensures chapters build on each other without forward references. Consulted before starting new chapters and every 4 chapters for progression review.
---

# Structure Architect Skill

## Purpose

Ensure the book builds progressively — each chapter introduces exactly what the reader needs, exactly when they need it. No forward references. No assumed knowledge. No difficulty spikes.

## When to Consult

1. **Before starting a new chapter** — Verify prerequisites are met
2. **Every 4 chapters drafted** — Progression review
3. **When cross-referencing** — Is the referenced chapter already drafted?

## Book Structure (v3)

**2 Acts, 13 Chapters, 4 Throughline Systems**

### Act 1: The System (Ch 1-3) — Universal, Tool-Agnostic

| Ch | Title | What the Reader Gains |
|----|-------|----------------------|
| 1 | You're Already Building Systems | 4 concepts named, Sessions 1-2 run, first failure felt |
| 2 | Going Deeper | Each concept explored via Sessions 3-5, manual overhead exposed |
| 3 | Design Patterns | Loop/Gate/Router, napkin sketch, 6-step design process |

**After Act 1**: Vocabulary (4 concepts, 3 patterns), experience (5 sessions), a blueprint (napkin sketch), motivation (manual doesn't scale).

### Act 2: The Build (Ch 4-13) — CLI-Demonstrated, Interface-Agnostic

#### Part II: First Builds (Ch 4-6)

| Ch | Component | Primary System | Reader Can Now... |
|----|-----------|---------------|-------------------|
| 4 | **Prompt** | Study | Write a structured prompt in the CLI, get a result |
| 5 | **State** | Job Hunting | Build a system that remembers across sessions |
| 6 | _(deepening)_ | Meal Planner | Apply Prompt + State in a new domain |

#### Part III: Knowledge & Guard Rails (Ch 7-9)

| Ch | Component | Primary System | Reader Can Now... |
|----|-----------|---------------|-------------------|
| 7 | **Skill** | Content | Give AI loaded expertise that persists across tasks |
| 8 | **Hook** | Job Hunting | Build automated checks that catch mistakes |
| 9 | _(integration)_ | Job Hunting | Combine 4 components into a real working system |

#### Part IV: Connections & Pipelines (Ch 10-11)

| Ch | Component | Primary System | Reader Can Now... |
|----|-----------|---------------|-------------------|
| 10 | **Connection** | Study | Pull live external data into their system |
| 11 | **Pipeline** | Content | Build multi-stage workflows with quality gates |

#### Part V: Mastery (Ch 12-13)

| Ch | Focus | Reader Can Now... |
|----|-------|-------------------|
| 12 | Debugging & Maintenance | Diagnose failures by component, fix without adding complexity |
| 13 | Personal AI Operating System | Wire multiple systems together with shared state and skills |

## Component Introduction Schedule

| Ch | Component | Running Total |
|----|-----------|---------------|
| 4 | Prompt | `[Prompt]` |
| 5 | State | `[Prompt] + [State]` |
| 7 | Skill | `[Prompt] + [State] + [Skill]` |
| 8 | Hook | `[Prompt] + [State] + [Skill] + [Hook]` |
| 10 | Connection | `+ [Connection]` |
| 11 | Pipeline | All 6 |

Ch 6, 9 do NOT introduce new components — they deepen or integrate.

## Dependency Graph

```
Ch 1 (concepts)
  └── Ch 2 (concepts deep + Sessions 3-5)
       └── Ch 3 (patterns + design)
            └── Ch 4 (Prompt — first CLI build, Study)
                 └── Ch 5 (State — Job Hunting)
                      └── Ch 6 (deepening — Meal Planner)
                           └── Ch 7 (Skill — Content)
                                └── Ch 8 (Hook — Job Hunting)
                                     └── Ch 9 (integration — Job Hunting)
                                          └── Ch 10 (Connection — Study)
                                               └── Ch 11 (Pipeline — Content)
                                                    └── Ch 12 (debugging)
                                                         └── Ch 13 (composition)
```

## Hard Dependencies

| Chapter | Requires | Why |
|---------|----------|-----|
| 4 | Ch 1-3 | First build — needs all Act 1 concepts + patterns |
| 5 | Ch 4 | State needs prompt skills established |
| 7 | Ch 5-6 | Skill needs state context (loads alongside state) |
| 8 | Ch 7 | Hook validates against skills |
| 10 | Ch 8-9 | Connection needs all 4 prior components |
| 11 | Ch 10 | Pipeline stages use connections |
| 13 | Ch 11-12 | Composition needs all components + debugging |

## Cross-Reference Rules

**Allowed:**
- Reference any prior chapter's system: "The Study System from Ch 4 — we're adding state to it"
- Reference prior components with brief reminder
- Brief forward teasers: "In Ch 8, you'll add automated checks" (motivation, not teaching)

**Forbidden:**
- Never reference a higher chapter's CONTENT (what it teaches)
- Never introduce a component before its chapter
- Never use a component in an example before the reader has built it

## Progression Review Checklist (Every 4 Chapters)

1. Does each chapter add exactly one layer (component OR integration)?
2. Are the 4 throughline systems growing consistently?
3. Does maintenance get taught alongside its component (not deferred to Ch 12)?
4. Would a reader who stopped here have a working system?
5. Are forward references teasers only (no teaching)?
6. Is CLI approach consistent — commands shown, files visible?

## References

| File | Contents |
|------|----------|
| `references/progression.md` | Skill-building map (to be updated for v3) |
| `references/dependencies.md` | Chapter prerequisite graph (to be updated for v3) |
