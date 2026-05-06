# Book State — From Prompts to Pipelines

Last updated: 2026-05-06

---

## Structure: 2 Acts, 5 Parts, 13 Chapters

**Outline**: `book/outline-v3.md` (canonical)

**4 Throughline Systems**: Study, Job Hunting, Project Management, Content
Each system starts as a basic prompt in Act 1 and grows across Act 2 into a full 6-component system.

**4 Universal Concepts**: Instruction, Memory, Control, Flow (tool-agnostic, taught in Act 1)
**6 Cowork Components**: Prompt, State, Skill, Hook, Connection, Pipeline (built in Act 2)
**3 Design Patterns**: Loop, Gate, Router (taught in Ch 3, applied throughout)

---

## Chapter Status

Legend: `D` = Draft, `S` = Score, `Rv` = Reviewed, `P` = Published

### Act 1: The System (Universal, tool-agnostic)

| # | Chapter | D | S | Rv | P | Notes |
|---|---------|---|---|----|---|-------|
| 1 | You're Already Building Systems (You're Just Building Them Badly) | DONE | -/30 | [ ] | [ ] | ~3,200 words. `ch01-draft.md` |
| 2 | Going Deeper — What Each Concept Actually Means | DONE | -/30 | [ ] | [ ] | ~3,500 words. `ch02-draft.md` |
| 3 | Design Patterns — Three Shapes Every System Takes | DONE | -/30 | [ ] | [ ] | ~4,100 words. `ch03-draft.md` |

### Act 2, Part II: First Builds — Instruction + Memory

| # | Chapter | Component | Primary System | D | S | Rv | P |
|---|---------|-----------|---------------|---|---|----|---|
| 4 | Structured Prompts — Your Systems Start Here | Prompt | Study | DONE | -/30 | [ ] | [ ] |
| 5 | State Files — Teaching Your Systems to Remember | State | Job Hunting | [ ] | -/30 | [ ] | [ ] |
| 6 | A Second System — Meal Planning That Adapts | _(deepening)_ | Meal Planner | [ ] | -/30 | [ ] | [ ] |

### Act 2, Part III: Knowledge and Guard Rails

| # | Chapter | Component | Primary System | D | S | Rv | P |
|---|---------|-----------|---------------|---|---|----|---|
| 7 | Skills — Giving Claude Expertise On Demand | Skill | Content | [ ] | -/30 | [ ] | [ ] |
| 8 | Hooks — Automated Guard Rails | Hook | Job Hunting | [ ] | -/30 | [ ] | [ ] |
| 9 | A Third System — The Job Hunt Engine | _(integration)_ | Job Hunting | [ ] | -/30 | [ ] | [ ] |

### Act 2, Part IV: Connections and Full Pipelines

| # | Chapter | Component | Primary System | D | S | Rv | P |
|---|---------|-----------|---------------|---|---|----|---|
| 10 | Connections — Pulling Live Data Into Your System | Connection | Study | [ ] | -/30 | [ ] | [ ] |
| 11 | Pipelines — Multi-Stage Workflows | Pipeline | Content | [ ] | -/30 | [ ] | [ ] |

### Act 2, Part V: Mastery

| # | Chapter | D | S | Rv | P |
|---|---------|---|---|----|---|
| 12 | When Systems Break — Debugging and Maintenance | [ ] | -/30 | [ ] | [ ] |
| 13 | Scaling Up — Building Your Personal AI Operating System | [ ] | -/30 | [ ] | [ ] |

---

## Component Introduction Schedule

| Chapter | Component | Primary System | All Systems At |
|---------|-----------|---------------|----------------|
| Ch 4 | Prompt | Study | Prompt |
| Ch 5 | State | Job Hunting | Prompt + State |
| Ch 6 | — (deepening) | Meal Planner | Prompt + State |
| Ch 7 | Skill | Content | Prompt + State + Skill |
| Ch 8 | Hook | Job Hunting | Prompt + State + Skill + Hook |
| Ch 9 | — (integration) | Job Hunting | Prompt + State + Skill + Hook |
| Ch 10 | Connection | Study | + Connection |
| Ch 11 | Pipeline | Content | All 6 |
| Ch 12–13 | — (mastery) | All | All 6 |

---

## System Growth Across Chapters

| Chapter | Study | Job Hunting | Project Mgmt | Content |
|---------|-------|-------------|--------------|---------|
| Ch 1–3 | "before" prompt | "before" prompt | "before" prompt | "before" prompt |
| Ch 4 | **v1: prompt (deep)** | v1: prompt | v1: prompt | v1: prompt |
| Ch 5 | v2: + state | **v2: + state (deep)** | v2: + state | v2: + state |
| Ch 7 | v3: + skill | v3: + skill | v3: + skill | **v3: + skill (deep)** |
| Ch 8 | v4: + hook | **v4: + hook (deep)** | v4: + hook | v4: + hook |
| Ch 10 | **v5: + connection (deep)** | v5: + connection | v5: + connection | v5: + connection |
| Ch 11 | v6: + pipeline | v6: + pipeline | v6: + pipeline | **v6: + pipeline (deep)** |

**(deep)** = primary build for that chapter with full walkthrough.

---

## Files

| File | Purpose | Status |
|------|---------|--------|
| `outline-v3.md` | Canonical outline | DONE |
| `act1-detailed-outlines.md` | Detailed outlines for Ch 1, 2, 3 | DONE |
| `ch01-outline.md` | Ch 1 writing blueprint | DONE |
| `ch01-draft.md` | Ch 1 first draft (~3,200 words) | DONE — needs review |
| `outline.md` | v1 outline (obsolete) | TO DELETE |
| `outline-v2.md` | v2 outline (superseded by v3) | TO DELETE |

---

## Current Priority

**Now: Act 1 Drafting**
- ✅ Ch 1 draft complete
- ⏳ Ch 2 draft — detailed outline exists in `act1-detailed-outlines.md`
- ⏳ Ch 3 draft — detailed outline exists in `act1-detailed-outlines.md`
- ⏳ Review Ch 1 draft (score against rubric)

**Next: Act 2 Detailed Outlines**
- Ch 4–6 detailed outlines (Part II: First Builds)
- Ch 7–9 detailed outlines (Part III: Knowledge & Guard Rails)

**Later**
- Ch 10–11 detailed outlines (Part IV: Connections & Pipelines)
- Ch 12–13 detailed outlines (Part V: Mastery)
- MCP/connection research for Ch 10
- Systems-thinking source material for Ch 3, 12 (Meadows, Goldratt)

---

## Blockers

- **MCP/connection research (Ch 10)**: Need step-by-step guide for non-technical users — which MCP servers, APIs, CLI tools work in Cowork.
- **Systems-thinking source material (Ch 3, 12)**: Donella Meadows, Goldratt concepts to translate for the audience.

---

## Session Log

| Date | What was done | Chapters touched |
|------|---------------|------------------|
| 2026-05-06 | Project scaffolded. Folder structure, CLAUDE.md, .claude/ system, v1 outline, all skills/commands/hooks created. | All (scaffold) |
| 2026-05-06 | book-writer skill updated for systems-thinking framework. book-state.md updated to v1 15-chapter structure. | None (skill infra) |
| 2026-05-06 | v2 outline written. Major restructure: 2 Acts, throughline systems, universal concepts. | Structure |
| 2026-05-06 | v3 outline written (compressed to 13 chapters). 4 throughline systems. Act 1 detailed outlines for Ch 1-3. Ch 1 writing blueprint. Ch 1 first draft completed (~3,200 words). | Ch 1, 2, 3 |
| 2026-05-06 | Adopted v3 as canonical. Removed 16 empty v1 chapter folders. Updated book-state.md and CLAUDE.md to match v3. Removed obsolete outlines. | All (restructure) |
| 2026-05-06 | Ch 2 first draft completed (~3,500 words). Sessions 3-5 of the Study System. Covers Instruction (structured prompts), Memory (manual progress notes), Control (fact-checking), Flow (staged pipeline). | Ch 2 |
| 2026-05-06 | Ch 3 first draft completed (~4,100 words). Loop, Gate, Router patterns. Combining patterns. Napkin test. Six-step design process. Worked Study System napkin sketch. Four exercises. | Ch 3 |
| 2026-05-06 | Ch 4 first draft completed (~2,600 words). First CLI chapter. Terminal intro, 4-part formula, Study System deep build with real files, 3 system extensions (Job Hunting, PM, Content), quality gate. | Ch 4 |
