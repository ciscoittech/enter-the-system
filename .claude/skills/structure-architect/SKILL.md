---
name: structure-architect
description: Manages chapter dependencies, progressive complexity, and book structure. Ensures chapters build on each other without forward references. Consulted before starting new chapters and every 4 chapters for progression review.
---

# Structure Architect Skill

## Purpose

Ensure the book builds progressively — each chapter introduces exactly what the reader needs, exactly when they need it. No forward references. No assumed knowledge. No difficulty spikes.

## When to Consult

1. **Before starting a new chapter** — Verify prerequisites are met
2. **Every 4 chapters drafted** — Progression review (are we building correctly?)
3. **When adding a new prompt** — Does the difficulty match the chapter position?
4. **When cross-referencing** — Is the referenced chapter already drafted?

## Progression Model

See `references/progression.md` for the full skill-building map.

### Part I: Foundations (Ch 0-3)
**Reader knows after this part**: What Cowork is, how to start a session, the 4-part prompt formula.
**Skills introduced**: Opening Cowork, granting folder access, writing a basic prompt, reading output.
**Max prompt difficulty**: 1-2

### Part II: Single-Task Workflows (Ch 4-8)
**Reader knows after this part**: How to use Cowork for 5 common work tasks.
**Skills introduced**: Describing organizational schemes, specifying output formats, verifying results, handling failures.
**Max prompt difficulty**: 1-3

### Part III: Domain Applications (Ch 9-11)
**Reader knows after this part**: How to apply Cowork to specific professional domains.
**Skills introduced**: Voice calibration, recurring tasks, constraint-based prompting.
**Max prompt difficulty**: 2-4

### Part IV: Advanced Systems (Ch 12-15)
**Reader knows after this part**: How to build a personal productivity system with Cowork.
**Skills introduced**: Global Instructions, multi-step workflows, system design.
**Max prompt difficulty**: 3-5

## Prerequisite Rules

See `references/dependencies.md` for the full dependency graph.

**Hard rules**:
- Chapter 3 (Prompt Formula) must be drafted before any chapter in Part II
- Chapter 2 (First Session) must be drafted before Chapter 3
- Chapter 12 (Global Instructions) must be drafted before Chapter 13 (Multi-Step)
- Chapter 14 (Building Your System) requires all of Part II to be drafted

## Progression Review (Every 4 Chapters)

Check:
1. Are difficulty ratings increasing gradually?
2. Are new concepts introduced one per chapter (not two)?
3. Does each chapter build on the previous one naturally?
4. Would a reader who stopped here have gotten value?
5. Are we front-loading the most useful workflows?

## References

| File | Contents |
|------|----------|
| `references/progression.md` | Skill-building map: what the reader learns at each stage |
| `references/dependencies.md` | Chapter prerequisite graph |
