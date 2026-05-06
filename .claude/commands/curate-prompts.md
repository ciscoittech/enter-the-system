# /curate-prompts Command

**Purpose**: Find, test, rate, and document community prompts for a specific use case.
**Skill**: prompt-curator
**Usage**: `/curate-prompts "file organization"` or `/curate-prompts "expense tracking"`

## What It Does

1. Load the `prompt-curator` skill
2. Search community sources (see `prompt-curator/references/sources.md`)
3. Collect raw prompts into `prompts/community/{source}/`
4. Filter for audience fit (non-technical, copy-paste ready)
5. Test each against the testing protocol
6. Rate difficulty (1-5) and effectiveness (1-5)
7. Write tested prompts to `prompts/tested/{use-case}/`
8. Update `book/book-state.md` to mark prompts as curated for related chapter

## Selection Criteria

**Include**: Non-technical, produces tangible deliverable, follows 4-part formula, tested
**Exclude**: Requires CLI, uses jargon, vague outcome, over 200 words

## Output

- `prompts/tested/{use-case}/*.md` — Tested prompt files with ratings
- `prompts/community/{source}/` — Raw source prompts (for reference)
- Updated `book/book-state.md`

## Target

Aim for 3-5 tested prompts per use case. Quality over quantity.
