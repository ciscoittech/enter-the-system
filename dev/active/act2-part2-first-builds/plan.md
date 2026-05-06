# Act 2 Part II: First Builds (Ch 4-6)

## Goal

The reader's first time building in the CLI. Three chapters introducing Prompt and State components through the Study, Job Hunting, and Meal Planner systems. After Part II, the reader has two working systems with memory.

## Approach

- **Ch 4** (Prompt, Study System): Introduce Warp/terminal, first structured prompt in CLI, reader builds Study Buddy v1. Deep build on Study System. Extend to other 3 systems with v1 prompts.
- **Ch 5** (State, Job Hunting): Add state files. Deep build on Job Hunting — applications tracker, resume versions, response patterns. Extend state to Study, PM, Content. Include state hygiene maintenance section.
- **Ch 6** (Deepening, Meal Planner): No new component. Reader builds a third system (Meal Planner) using Prompt + State to prove the concepts transfer. State design matters — tracking "planned vs actually cooked" reveals real preferences.

## Dependencies

- Act 1 (Ch 1-3) ✅ DONE
- Outline decisions (CLI approach, Warp, maintenance) — apply to outline-v3.md first
- Eval notebook 01 (prompt structure) ✅ DONE — reference in Ch 4
- Eval notebook 02 (state impact) — build alongside Ch 5

## Key Decisions

- Ch 4 is the terminal introduction chapter. Must be welcoming, not intimidating.
- Show Warp installation, but everything works in any terminal.
- Each chapter's "deep build" is 70% of the chapter. Extensions are 30%.
- Maintenance section in Ch 5 (state hygiene) is the first maintenance teaching moment.

## Phase Breakdown

1. Update outline-v3.md with CLI/Warp notes + maintenance sections
2. Write Ch 4-6 detailed outlines (section-by-section blueprints)
3. Draft Ch 4
4. Build eval notebook 02 (state impact) alongside Ch 5
5. Draft Ch 5
6. Draft Ch 6
7. Build Mermaid diagrams for Ch 4-6
8. Review all 3 chapters
9. Enrich with production evidence

## Quality Gate

- All 3 chapters score ≥ 20/30
- Reader has 2 working systems (Study + Job Hunting) + 1 practice system (Meal Planner)
- State hygiene taught in Ch 5
- CLI approach consistent — terminal commands shown, files visible
- Eval notebook 02 run with results
