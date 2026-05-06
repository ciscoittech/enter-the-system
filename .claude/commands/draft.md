# /draft Command

**Purpose**: Draft a chapter section following the book-writer skill pipeline.
**Skill**: book-writer
**Usage**: `/draft 04-file-organization`

## What It Does

1. Load the `book-writer` skill for voice, structure, and scoring rules
2. Check `structure-architect` dependencies — are prerequisites drafted?
3. Read research from `research/synthesized/{topic}.md` (if exists)
4. Read tested prompts from `prompts/tested/{use-case}/` (if curated)
5. Draft the chapter following the template:
   - Hook (the problem)
   - The System (the workflow)
   - Walk-Through (step-by-step)
   - What You Tell Claude (prompt templates)
   - You Got It Right When... (quality gate)
   - Prompt Pack (all prompts collected)
6. Self-score against the 6-dimension rubric
7. Write to `book/chapters/XX-name/draft.md`
8. Extract prompts to `book/chapters/XX-name/prompts/`
9. Update `book/book-state.md`

## Pre-Draft Checklist

Before drafting, verify:
- [ ] Research exists for this topic (if not, run `/research-topic` first)
- [ ] Prompts curated for this use case (if not, run `/curate-prompts` first)
- [ ] Prerequisites are drafted (check dependency graph)
- [ ] No forward references will be needed

## Rules

- Follow the chapter template exactly — no skipping sections
- Every prompt must follow the 4-part formula (Context, Input, Output, Exceptions)
- Translate all jargon per `anti-jargon.md`
- Target 1,800-3,000 words
- Self-score must be >= 18/30 before saving (otherwise iterate)
- If research or prompts are missing, note gaps in book-state.md and draft what you can

## Output

- `book/chapters/XX-name/draft.md` — The chapter draft
- `book/chapters/XX-name/prompts/*.md` — Individual prompt files
- Updated `book/book-state.md` — Draft status + self-score
