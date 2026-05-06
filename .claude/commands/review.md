# /review Command

**Purpose**: Review a chapter draft for voice, quality, jargon, and accessibility.
**Skill**: book-editor
**Usage**: `/review 04-file-organization`

## What It Does

1. Load the `book-editor` skill
2. Read the draft from `book/chapters/XX-name/draft.md`
3. Run the full review checklist:
   - Voice scan (AI tells, tone, rhythm)
   - Jargon scan (untranslated technical terms)
   - Accessibility check (non-technical reader can follow)
   - System completeness (template followed, workflow repeatable)
   - Progression check (no forward references, correct difficulty)
4. Score against the 6-dimension rubric
5. Output a review with specific revision notes

## Output Format

Review is output directly (not written to a file) with:
- Score card (6 dimensions, total)
- PASS/FAIL verdict (>= 20/30, no dimension < 3)
- Specific revision notes with locations
- List of AI tells found
- List of untranslated jargon

## After Review

If PASS:
- Update `book/book-state.md` to mark as reviewed with score

If FAIL:
- Revision notes tell the writer exactly what to fix
- Re-run `/review` after revisions
