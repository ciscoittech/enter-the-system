# Progressive System Diagrams

Every Type A and Type C chapter ends with a system diagram. The reader sees their system grow chapter by chapter — by Ch 11 they recognize all six components in one picture.

Use plain text. No images, no Mermaid, no fancy syntax. Brackets for components, arrows for flow, indented arrows for feedback loops.

---

## Ch 2 — First Prompt (Project 1: File Organizer)

Components: `[Prompt]`

```
[Your files] → [Prompt] → [Claude] → [Organized files]
```

**What's missing**: No memory. Run it again next week and Claude starts from zero. Point this out at the end of the chapter — it's the gap Ch 4 fills.

---

## Ch 4 — Adding State (Project 2: Meeting Notes)

Components: `[Prompt] + [State]`

```
[Meeting notes]
      ↓
[Prompt + State read] → [Claude] → [Summary + State written]
      ↑                                       |
      └───────────────────────────────────────┘
              (state file: meetings-state.md)
```

**What changed from Ch 2**: A feedback loop. The state file is read at the start and written at the end. Run it twice — second run picks up where the first left off.

---

## Ch 5 — State in Action (Project 3: Expense Tracker)

Components: `[Prompt] + [State]` (no new component — deepens Ch 4)

```
[Bank statements]
      ↓
[Prompt + Prior state read] → [Claude] → [Report + Updated state]
      ↑                                          |
      └──────────────────────────────────────────┘
              (state file: expense-state.md)
```

**What changed**: Same components, more sophisticated state. Categories defined once, applied automatically next month. The system gets MORE useful over time.

---

## Ch 7 — Adding Skills (Project 4: Voice Writer)

Components: `[Prompt] + [State] + [Skill]`

```
[Email request]
      ↓
[Prompt + Voice skill loaded + State read] → [Claude] → [Draft + State written]
      ↑                  ↑                                       |
      |                  |                                       |
      |          (skill: my-voice.md)                            |
      └──────────────────────────────────────────────────────────┘
              (state: email-state.md)
```

**What changed from Ch 5**: A skill loads at the start. Same prompt, but Claude now has expertise on demand — voice rules, examples, words to use and avoid.

---

## Ch 8 — Adding Hooks (Project 5: Budget Guardian)

Components: `[Prompt] + [State] + [Skill] + [Hook]`

```
[Bank statements]
      ↓
[Prompt + Budget skill + State] → [Claude] → [Hook: budget check] → [Report + Alerts + State]
      ↑                                              |                          |
      |                                              ↓ fails                    |
      |                                       [Block + flag for review]         |
      └──────────────────────────────────────────────────────────────────────────┘
              (state: expense-state.md, skill: budget-rules.md)
```

**What changed from Ch 7**: A guard rail. Before output is saved, the hook checks against budget rules. If something's over, the system flags it instead of shipping silently.

---

## Ch 9 — Integration (Project 5.5: Document Review)

Components: `[Prompt] + [State] + [Skill] + [Hook]` (no new component — capstone)

```
[Source documents]
      ↓
[Prompt + Review skill + State] → [Claude] → [Hook: source-trace check] → [Synthesis + State]
      ↑                                              |                              |
      |                                              ↓ fails                        |
      |                                       [Reject + list unsourced claims]      |
      └──────────────────────────────────────────────────────────────────────────────┘
              (skill: review-criteria.md, state: documents-state.md)
```

**What changed**: All four components working together. Skill defines the review standard, state tracks what's been processed, hook enforces source attribution. No component is new — they're combined.

---

## Ch 10 — Adding Connections (Project 6: Research Engine)

Components: `[Prompt] + [State] + [Skill] + [Hook] + [Connection]`

```
[Research question]                     [External source]
      ↓                                  (web search / MCP / API)
[Prompt + Research skill + State] ←──────────┘
      ↓                                          ↓
   [Claude pulls live data] → [Hook: source-URL check] → [Brief + State]
      ↑                                  |                       |
      |                                  ↓ fails                 |
      |                          [Reject claims missing URL]     |
      └──────────────────────────────────────────────────────────┘
              (skill: research-method.md, state: research-state.md)
```

**What changed from Ch 9**: A new input source. Claude no longer relies only on local files — it reaches outside through web search, MCP servers, APIs, or CLI tools.

---

## Ch 11 — Pipelines (Project 7: Weekly Report)

Components: All six — `[Prompt] + [State] + [Skill] + [Hook] + [Connection] + [Pipeline]`

```
                                  ┌────────── shared state ──────────┐
                                  ↓                                   ↑
[Triggers/data]                                                       |
      ↓                                                               |
┌─[Stage 1: GATHER]───────────────────────────────────────────────────┤
│   [Connection: pull live data] + [State: read prior context]        │
└─→ output: gathered-data.md                                          |
      ↓                                                               |
┌─[Stage 2: DRAFT]────────────────────────────────────────────────────┤
│   [Prompt + Report-writing skill + Gathered data]                   │
└─→ output: draft.md                                                  |
      ↓                                                               |
┌─[Quality gate]──────────────────────────────────────────────────────┤
│   [Hook: completeness + accuracy + format checks]                   │
│        ↓ pass            ↓ fail                                     │
│        ↓        [loop back to DRAFT with notes]                     |
└─→      ↓                                                            |
      ↓                                                               |
┌─[Stage 3: FORMAT]───────────────────────────────────────────────────┤
│   [Prompt + Format skill + Draft]                                   │
└─→ output: weekly-report.md  +  state updated at every stage ────────┘
```

**What changed**: Stages. Each stage has its own entry criteria, exit criteria, and failure mode. The quality gate between Draft and Format can loop back. State is updated at every stage so the pipeline can resume if interrupted.

---

## Ch 13 — Personal Operating System (Project 8: Capstone)

Multiple systems composed. No new component — this is integration at the top level.

```
                          ┌──── shared skills ────┐
                          │  my-voice.md          │
                          │  my-formatting.md     │
                          │  my-categories.md     │
                          └────────┬──────────────┘
                                   │ loaded by any system
   ┌───────────────────────────────┼───────────────────────────────┐
   ↓                               ↓                               ↓
[Expense System]            [Email System]              [Weekly Report Pipeline]
   │                               │                               │
   ↓                               ↓                               ↓
   └───────────── shared state ──────────────────────────────────  ┘
                  master-state.md
                  (every system reads/writes here)
```

**What changed**: Composition. Each individual system (Ch 5, 7, 11) is a building block. They share skills (your voice, your categories) and shared state (master tracker). One system's output becomes another's input.

---

## Diagram Authoring Rules

1. **Bracket every component.** `[Prompt]`, `[State]`, `[Skill]`, `[Hook]`, `[Connection]`, `[Pipeline]`. Consistency matters — readers learn to scan for the components they recognize.
2. **Show feedback loops with returning arrows.** If state is written, the arrow returns to the input side. If a hook can fail, show the failure path.
3. **Annotate state and skill files inline.** `(state: expense-state.md)` under the loop, `(skill: budget-rules.md)` near where it loads.
4. **Don't add components that aren't in the chapter.** A Ch 7 diagram does not show hooks — even if you know they're coming. Each diagram reflects the reader's current toolkit.
5. **One picture per chapter, end of chapter.** The reader scrolls back to it as a reference. Don't scatter five diagrams through the chapter.
