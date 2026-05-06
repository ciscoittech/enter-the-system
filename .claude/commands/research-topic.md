# /research-topic Command

**Purpose**: Research a specific Cowork capability from official and community sources.
**Skill**: cowork-researcher
**Usage**: `/research-topic "global instructions"` or `/research-topic "file organization"`

## What It Does

1. Load the `cowork-researcher` skill
2. Search Anthropic official docs via WebSearch
3. Search community sources for tested examples
4. Cross-reference and verify claims
5. Write synthesized notes to `research/synthesized/{topic}.md`
6. Update `book/book-state.md` to mark research as done for related chapter

## Output

A research file at `research/synthesized/{topic}.md` with:
- Plain-language explanation (book audience level)
- How it works (step-by-step)
- Best practices (tested)
- Limitations (honest)
- Raw prompts found (for prompt-curator to test)
- Open questions (if any)

All claims marked as [OFFICIAL], [COMMUNITY], or [UNVERIFIED].

## Rules

- Always check official Anthropic docs first
- Date every source
- Don't fabricate capabilities — if unsure, mark [UNVERIFIED]
- Write at the audience's level (non-technical)
