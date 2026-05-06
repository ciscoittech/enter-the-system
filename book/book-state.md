# Book State — From Prompts to Pipelines

Last updated: 2026-05-06

---

## Structure: 2 Acts, 13 Chapters, 4 Throughline Systems

**Outline**: `book/outline-v3.md` (canonical)

**4 Throughline Systems**: Study, Job Hunting, Project Management, Content
Each system starts as a basic prompt and grows across Act 2 into a full 6-component system.

**4 Universal Concepts**: Instruction, Memory, Control, Flow (tool-agnostic, taught in Act 1)
**6 Cowork Components**: Prompt, State, Skill, Hook, Connection, Pipeline (built in Act 2)
**3 Design Patterns**: Loop, Gate, Router (taught in Ch 3, applied throughout)

---

## Chapter Status

Legend: `D` = Draft, `S` = Score, `Rv` = Reviewed, `P` = Published

### Act 1: The System (Universal, tool-agnostic)

| # | Chapter | D | S | Rv | P | Notes |
|---|---------|---|---|----|---|-------|
| 1 | You're Already Building Systems | DONE | 28/30 | DONE | [ ] | ~3,200 words. `ch01-draft.md` |
| 2 | Going Deeper | DONE | 30/30 | DONE | [ ] | ~3,500 words. `ch02-draft.md` |
| 3 | Design Patterns | DONE | 29/30 | DONE | [ ] | ~4,300 words. `ch03-draft.md` |

### Act 2, Part II: First Builds (Instruction + Memory)

| # | Chapter | Component | Primary System | Claude Code Feature | D | S |
|---|---------|-----------|---------------|-------------------|---|---|
| 4 | Structured Prompts | Prompt | Study | CLAUDE.md (project instructions) | DONE | -/30 |
| 5 | State Files | State | Job Hunting | State files (read/write per session) | DONE | 28/30 |

### Act 2, Part III: Knowledge & Guard Rails (Instruction adv. + Control)

| # | Chapter | Component | Primary System | Claude Code Feature | D | S |
|---|---------|-----------|---------------|-------------------|---|---|
| 6 | Skills | Skill | Content | .claude/skills/ + SKILL.md | DONE | -/30 |
| 7 | Hooks | Hook | Job Hunting | .claude/settings.json + hooks/ | DONE | -/30 |

### Act 2, Part IV: Connections & Pipelines (Flow)

| # | Chapter | Component | Primary System | Claude Code Feature | D | S |
|---|---------|-----------|---------------|-------------------|---|---|
| 8 | Connections | Connection | Study | MCP servers in settings.json | [ ] | -/30 |
| 9 | Pipelines | Pipeline | Content | Subagents + orchestration | [ ] | -/30 |

### Act 2, Part V: Mastery

| # | Chapter | Primary System | Claude Code Feature | D | S |
|---|---------|---------------|-------------------|---|---|
| 10 | When Systems Break — Debugging | All 4 | Memory files (.claude/memory/) | [ ] | -/30 |
| 11 | Composing Systems — Personal AI OS | All 4 | Full .claude/ architecture | [ ] | -/30 |
| 12 | Designing New Systems | Reader's choice | — (applies all patterns) | [ ] | -/30 |
| 13 | What's Next | — | — (forward-looking) | [ ] | -/30 |

---

## Component Introduction Schedule

| Chapter | Component | Primary System | All Systems At |
|---------|-----------|---------------|----------------|
| Ch 4 | Prompt (CLAUDE.md) | Study | Prompt |
| Ch 5 | State | Job Hunting | Prompt + State |
| Ch 6 | Skill | Content | Prompt + State + Skill |
| Ch 7 | Hook | Job Hunting | Prompt + State + Skill + Hook |
| Ch 8 | Connection | Study | + Connection |
| Ch 9 | Pipeline | Content | All 6 |
| Ch 10-13 | — (mastery) | All | All 6 |

---

## System Growth Across Chapters

| Chapter | Study | Job Hunting | Project Mgmt | Content |
|---------|-------|-------------|--------------|---------|
| 1-3 | "before" prompt | "before" prompt | "before" prompt | "before" prompt |
| 4 | **v1: prompt (deep)** | v1: prompt | v1: prompt | v1: prompt |
| 5 | v2: + state | **v2: + state (deep)** | v2: + state | v2: + state |
| 6 | v3: + skill | v3: + skill | v3: + skill | **v3: + skill (deep)** |
| 7 | v4: + hook | **v4: + hook (deep)** | v4: + hook | v4: + hook |
| 8 | **v5: + connection (deep)** | v5: + connection | v5: + connection | v5: + connection |
| 9 | v6: + pipeline | v6: + pipeline | v6: + pipeline | **v6: + pipeline (deep)** |
| 10-11 | debugged + composed | debugged + composed | debugged + composed | debugged + composed |

**(deep)** = primary build with full walkthrough. Others get shorter "extend it" treatment.

---

## Files

| File | Purpose | Status |
|------|---------|--------|
| `outline-v3.md` | Canonical outline | DONE |
| `ch01-draft.md` | Ch 1 first draft | DONE — reviewed, enriched |
| `ch02-draft.md` | Ch 2 first draft | DONE — reviewed, enriched |
| `ch03-draft.md` | Ch 3 first draft | DONE — reviewed, enriched |
| `ch04-draft.md` | Ch 4 first draft | DONE — CLAUDE.md approach |
| `ch04-outline.md` | Ch 4 writing blueprint | DONE (needs update for CLAUDE.md rewrite) |
| `ch05-draft.md` | Ch 5 first draft | DONE — 28/30, @import wiring, state hygiene |
| `act1-detailed-outlines.md` | Ch 1-3 blueprints | DONE |
| `act1-review.md` | v1 review | DONE |
| `act1-review-v2.md` | v2 review (post-research) | DONE |

---

## Current Priority

**Now: Fix outline alignment + continue Act 2**
- ⏳ Tighten outline-v3.md Ch 4 section (match CLAUDE.md draft)
- ⏳ Write Ch 5 detailed outline + draft
- ⏳ Build eval notebook 02 (state impact) alongside Ch 5

**Next: Part III**
- Ch 6 (Skills) + eval notebook 03
- Ch 7 (Hooks) + eval notebook 04

**Later**
- Ch 8-9 (MCP research required before Ch 8)
- Ch 10-13 (mastery chapters)

---

## Session Log

| Date | What was done | Chapters touched |
|------|---------------|------------------|
| 2026-05-06 | Project scaffolded. v1 outline, skills, commands, hooks. | All (scaffold) |
| 2026-05-06 | v3 outline, Act 1 detailed outlines, Ch 1-3 drafted. | Ch 1, 2, 3 |
| 2026-05-06 | Act 1 reviewed (28, 30, 28), fixes applied, research enriched (28, 30, 29). | Ch 1, 2, 3 |
| 2026-05-06 | Research section: methodology, 3 production systems, eval notebook 01 (11/20 → 20/20). | Research |
| 2026-05-06 | 9 Mermaid diagrams rendered. GitHub repo public. Beta reader README. | Diagrams |
| 2026-05-06 | Infrastructure overhaul: 14/14 tasks. All skills, hooks, commands updated to v3. | Infrastructure |
| 2026-05-06 | Dev-docs for all remaining work. Outline decisions applied. | Planning |
| 2026-05-06 | Ch 4 drafted with CLAUDE.md as foundation. Root + system-specific context scoping. | Ch 4 |
| 2026-05-06 | Appendices rewritten A-E. v1 artifacts cleaned up. | Appendices |
| 2026-05-06 | Fixed book-state divergence — removed Meal Planner and Integration chapters, aligned with v3 outline (4 systems only, no filler chapters). | Structure |
| 2026-05-06 | Ch 5 drafted. ~2,550 words. @import mechanism as key wiring. 3-session Job Hunting deep build. Break-it tests for wiring removal, duplicates, edit behavior. Self-score 28/30. | Ch 5 |
| 2026-05-06 | Ch 6 drafted. ~3,640 words. Content System deep build. Skill directory format, show-don't-describe principle, auto-trigger honesty (~50%), /skill-name as reliable path. | Ch 6 |
| 2026-05-06 | Ch 7 drafted. ~4,030 words. Job Hunting deep build. stdin JSON + jq, exit code 2 blocks, PII redactor sidebar, 2 hook scripts with line-by-line walkthrough. | Ch 7 |
