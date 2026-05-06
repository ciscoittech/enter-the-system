# Chapter Dependency Graph — From Prompts to Pipelines (v3)

## 13 Chapters, 4 Systems, No Filler

```
Act 1 (tool-agnostic):
  Ch 1 (4 concepts + Sessions 1-2)
    └── Ch 2 (concepts deep + Sessions 3-5)
         └── Ch 3 (3 patterns + napkin sketch)

Act 2, Part II (Instruction + Memory):
  Ch 3 ──► Ch 4 (Prompt — Study deep build, CLAUDE.md introduced)
             └── Ch 5 (State — Job Hunting deep build)

Act 2, Part III (Knowledge + Control):
  Ch 5 ──► Ch 6 (Skill — Content deep build, .claude/skills/)
             └── Ch 7 (Hook — Job Hunting deep build, settings.json + hooks/)

Act 2, Part IV (Flow):
  Ch 7 ──► Ch 8 (Connection — Study deep build, MCP servers)
             └── Ch 9 (Pipeline — Content deep build, subagents)

Act 2, Part V (Mastery):
  Ch 9 ──► Ch 10 (Debugging — all 4 systems)
             └── Ch 11 (Composition — personal AI OS)
                  └── Ch 12 (Design new system — reader's choice)
                       └── Ch 13 (What's next — forward-looking)
```

## Hard Dependencies

| Chapter | Requires | Why |
|---------|----------|-----|
| 4 | Ch 1-3 | First CLI build — needs all Act 1 concepts |
| 5 | Ch 4 | State needs CLAUDE.md foundation established |
| 6 | Ch 5 | Skill loads alongside state |
| 7 | Ch 6 | Hook validates against skills |
| 8 | Ch 7 | Connection needs all 4 prior components |
| 9 | Ch 8 | Pipeline stages use connections |
| 11 | Ch 9-10 | Composition needs all 6 components + debugging |

## Drafting Order

Strict sequential:
1. Ch 1 → 2 → 3 (Act 1) ✅ DONE
2. Ch 4 → 5 (Part II) — Ch 4 ✅ DONE
3. Ch 6 → 7 (Part III)
4. Ch 8 → 9 (Part IV) — **MCP research required before Ch 8**
5. Ch 10 → 11 → 12 → 13 (Part V)

## Cross-Reference Rules

**Allowed:**
- Reference any prior chapter's system
- Brief forward teasers for motivation

**Forbidden:**
- Reference a higher chapter's content
- Introduce a component before its chapter
- Use a component in examples before the reader has built it
