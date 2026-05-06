# Infrastructure Updates

## Goal

Bring all skills, hooks, commands, and reference files up to v3 structure so the production pipeline works correctly for Act 2.

## What Changed

The book was restructured from v1 (15 chapters, 8 standalone projects) to v3 (13 chapters, 4 throughline systems, CLI-demonstrated). Multiple infrastructure files still referenced v1.

## What's Been Fixed (This Session)

- [x] book-writer SKILL.md — updated to v3 (throughlines, CLI approach, maintenance sections, Act 2 template)
- [x] structure-architect SKILL.md — updated to v3 (dependency graph, progression model, component schedule)
- [x] on-stop.sh — fixed file glob (`ch*-draft.md` not `draft.md`)
- [x] skill-suggester.sh — added /dev-docs and diagram triggers
- [x] CLAUDE.md — added CLI rule, maintenance rule, dev-docs rule, Act 2 pipeline
- [x] /dev-docs command — created
- [x] /dev-docs-update command — created

## What Still Needs Updating

- [ ] structure-architect/references/progression.md — still v1 (lists File Organizer, Meeting Notes, etc.)
- [ ] structure-architect/references/dependencies.md — still v1 (15-chapter graph)
- [ ] book-writer/references/diagrams.md — still v1 (references Ch 2 File Organizer, etc.). Consider replacing with pointer to book/diagrams/ Mermaid system.
- [ ] book-writer/references/structure.md — may need Act 2 section lengths updated
- [ ] book-editor SKILL.md — check if references v1 (word count range, checklist items)
- [ ] cowork-researcher SKILL.md — check if still relevant or needs renaming (it's not just "Cowork" anymore — CLI-agnostic)
