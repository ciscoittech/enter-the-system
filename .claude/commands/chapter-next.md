# /chapter-next Command

**Purpose**: Determine the highest-priority next action for book production.
**Usage**: `/chapter-next`

## What It Does

1. Read `book/book-state.md` for current chapter statuses
2. Read `structure-architect` dependencies to determine what's unblocked
3. Recommend the single highest-priority action:
   - If a chapter needs research: `/research-topic [topic]`
   - If a chapter needs prompts: `/curate-prompts [use-case]`
   - If a chapter is ready to draft: `/draft [chapter]`
   - If a chapter needs review: `/review [chapter]`
   - If progression review is due (every 4 chapters): flag it

## Priority Rules

1. Chapters in Part I before Part II (foundations first)
2. Within a Part, follow the dependency graph
3. Chapters with research + prompts already done get priority over those that need research
4. If a chapter is drafted but not reviewed, review before drafting more

## Output

A single recommendation:
```
NEXT: /draft 04-file-organization
REASON: Research done, 3 prompts curated, prerequisites (Ch 03) drafted.
```
