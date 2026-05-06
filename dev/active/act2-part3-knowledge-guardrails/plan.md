# Act 2 Part III: Knowledge & Guard Rails (Ch 7-9)

## Goal

Reader adds Skill and Hook components. After Part III, they have 4 components working together — the first "real system" that loads expertise and catches mistakes automatically.

## Chapters

- **Ch 7** (Skill, Content System): Voice skill that makes AI write like you. Deep build on Content. Extend to Study (learning method skill), Job Hunting (career profile skill), PM (methodology skill). Include skill versioning maintenance.
- **Ch 8** (Hook, Job Hunting): Automated checks on cover letters — wrong company name, fabricated experience, word count. Deep build on Job Hunting. Extend to Study (answer verification), Content (voice check, fact check), PM (data consistency). Include hook tuning maintenance.
- **Ch 9** (Integration, Job Hunting): No new component. Combine Prompt + State + Skill + Hook into a complete Job Hunt Engine. Integration chapter — shows how 4 components reinforce each other. Design principles: only add what prevents a named failure.

## Dependencies

- Part II (Ch 4-6) must be complete
- Eval notebook 03 (skill loading) — build alongside Ch 7
- Eval notebook 04 (hook detection) — build alongside Ch 8
- Content System production evidence for Ch 7 (voice skill)
- Work System production evidence for Ch 8 (advisor-only control pattern)

## Key Decisions

- Ch 7 is where the content system throughline gets its deep build. Voice skill from production system is the template.
- Ch 8 should use the hook eval data (notebook 04) to show catch rates.
- Ch 9 is the first chapter where the reader sees compound effects — components working together are more than the sum of parts.

## Quality Gate

- All 3 chapters score ≥ 20/30
- Eval notebooks 03 and 04 run with results
- Skill versioning taught in Ch 7, hook tuning in Ch 8
- Ch 9 integration passes the "remove one component — what breaks?" test
