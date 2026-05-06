# Chapter Dependency Graph — Systems Thinking Edition

## Component Dependencies

Each component builds on the previous. You can't add a hook until the reader has state and skills.

```
Ch 00 (Introduction)
  └── Ch 01 (What Makes a System)
       └── Ch 02 (First System — adds PROMPT)
            └── Ch 03 (Why Systems Beat Prompts — feedback concept)
                 └── Ch 04 (State — adds STATE)
                      └── Ch 05 (State in Action)
                           └── Ch 06 (Knowledge Problem — bridges to skills)
                                └── Ch 07 (Skills — adds SKILL)
                                     └── Ch 08 (Hooks — adds HOOK)
                                          └── Ch 09 (Combining Components)
                                               └── Ch 10 (Connections — adds CONNECTION)
                                                    └── Ch 11 (Pipelines — adds PIPELINE)
                                                         └── Ch 12 (Design Patterns)
                                                              └── Ch 13 (Personal OS)
                                                                   └── Ch 14 (What's Next)
```

## Hard Dependencies

| Chapter | Requires | Component Gate |
|---------|----------|---------------|
| 02 | 01 | Introduces PROMPT |
| 04 | 02, 03 | Introduces STATE (needs prompt + feedback concept) |
| 07 | 04 | Introduces SKILL (needs state for context) |
| 08 | 07 | Introduces HOOK (needs skill to validate against) |
| 10 | 08, 09 | Introduces CONNECTION (needs all prior components) |
| 11 | 10 | Introduces PIPELINE (needs connections for real data) |
| 13 | 11, 12 | COMPOSITION (needs all 6 components + design patterns) |

## Project Dependencies

| Project | Chapter | Builds On Project |
|---------|---------|-------------------|
| 1. File Organizer | Ch 02 | (none — first project) |
| 2. Meeting Notes | Ch 04 | Project 1 (same prompt skills, adds state) |
| 3. Expense Tracker | Ch 05 | Project 2 (same state pattern, different domain) |
| 4. Voice Writer | Ch 07 | Project 2/3 (adds skill to existing state pattern) |
| 5. Budget Guardian | Ch 08 | Project 3 (adds hook to expense tracker) |
| 5.5. Doc Review | Ch 09 | Projects 4+5 (combines skill + hook in new domain) |
| 6. Research Engine | Ch 10 | Project 5.5 (adds external connection) |
| 7. Weekly Report | Ch 11 | Project 6 (adds pipeline to research-capable system) |
| 8. Personal OS | Ch 13 | ALL (composes multiple systems) |

## Recommended Drafting Order

Strict sequential — each chapter depends on the previous:
1. Ch 00 → 01 → 02 → 03 (Part I: conceptual foundation + first prompt)
2. Ch 04 → 05 (Part II: state)
3. Ch 06 → 07 → 08 → 09 (Part III: skills + hooks + integration)
4. Ch 10 → 11 → 12 (Part IV: connections + pipelines + design)
5. Ch 13 → 14 (Part V: composition + future)

## Cross-Reference Rules

### Allowed
- Reference any prior chapter's project: "Remember the expense tracker from Chapter 5? We're adding a guard rail to it."
- Reference prior components: "You already know how state files work. Skills are the same idea for knowledge instead of memory."

### Forbidden
- Never reference a higher-numbered chapter
- Never say "we'll cover this later"
- Never introduce a component before its chapter (don't mention hooks until Ch 8)
