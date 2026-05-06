---
name: prompt-curator
description: Find, test, rate, and document community Cowork prompts by use case. Use when collecting prompts for a chapter or building the prompt library. Loaded by /curate-prompts command.
---

# Prompt Curator Skill

## Purpose

Find the best Cowork prompts from community sources, test them, rate them, and document them in a format readers can copy-paste.

## Curation Workflow

1. **Search** — Check all sources in `references/sources.md` for the target use case
2. **Collect** — Pull raw prompts into `prompts/community/{source}/`
3. **Filter** — Remove prompts that are vague, untestable, or require technical knowledge
4. **Test** — Run each through the testing protocol (`references/testing.md`)
5. **Rate** — Score difficulty (1-5) and effectiveness (1-5) per `references/rating.md`
6. **Document** — Write tested prompts to `prompts/tested/{use-case}/` in standard format

## Standard Prompt Document Format

```markdown
# [Descriptive Name]

**Use case**: [One sentence — what work this gets done]
**Difficulty**: [1-5] | **Effectiveness**: [1-5]
**Source**: [Where this came from — community site, original, adapted]
**Tested**: [Yes/No, date]

## The Prompt

[Copy-paste ready — the reader types exactly this]

## What to Expect

[What Claude produces, how long it takes, what the output looks like]

## What Can Go Wrong

[Specific failure modes and how to fix them]

## Variations

[How to modify for different situations — e.g., different file types, larger datasets]

## 4-Part Formula Breakdown

- **Context**: [which part of the prompt is context]
- **Input**: [which part describes the input]
- **Output**: [which part specifies the deliverable]
- **Exceptions**: [which part handles edge cases]
```

## Selection Criteria

**Include if:**
- Non-technical user can copy-paste and get results
- Produces a tangible deliverable (file, report, organized folder)
- Follows or can be adapted to the 4-part formula
- Tested and the output is verifiable

**Exclude if:**
- Requires command-line knowledge
- Uses technical jargon the reader won't understand
- Vague outcome ("help me be more productive")
- Only works with specific proprietary tools
- Prompt is longer than ~200 words (readers won't use it)

## References

| File | Contents |
|------|----------|
| `references/sources.md` | Community prompt sources with URLs |
| `references/testing.md` | Prompt testing protocol |
| `references/rating.md` | Difficulty and effectiveness rating scales |
