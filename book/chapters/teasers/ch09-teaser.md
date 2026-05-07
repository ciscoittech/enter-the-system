# Chapter 9: Pipelines — Multi-Stage Workflows with Quality Gates

You tell your Content System: "Write an 800-word blog post about the three biggest mistakes people make when migrating to the cloud."

Claude goes to work. It searches the web (your Ch 8 connection). Loads your editorial voice skill (Ch 6). Checks your content-state.md (Ch 5) to avoid repeating a topic you've already covered. Your hooks are standing by (Ch 7).

The draft arrives. And it's... fine.

The opening is decent. The structure makes sense. But read it closely. The "research" is thin. Claude found one source and built the whole post around it. A deeper search would have turned up three better ones. The outline is invisible. The piece wanders from point 1 to point 3 without a clear arc because Claude was writing and structuring at the same time. The voice starts strong but drifts generic by paragraph four because Claude was juggling too many concerns at once. And the fact-checking? That happened after the draft was already done, which means Claude built arguments on unchecked claims and had to awkwardly patch them.

Your hook catches the unchecked facts. Your skill file makes the opening paragraph sound like you. But the structural problems (shallow research, wandering outline, fading voice) aren't things hooks can fix after the fact. They're problems that need to be PREVENTED by doing each step properly before moving on.

You know how this works in real life. You don't sit down and write a polished blog post in one pass. You research first. Then you outline. Then you draft. Then you edit. Each step is separate. Each step is focused. You don't research WHILE drafting. That produces shallow research and rough drafts.

Your AI system needs the same discipline.

---

## See the System

Your Content System right now, single-pass:

```
[Topic + CLAUDE.md + Skill + State + Web search]
                    |
                [Claude does everything at once]
                    |
          [Draft (decent, not great)]
                    |
              [Hooks check output]
```

One input. One pass. One output. Every stage (research, outline, draft, edit) happens simultaneously inside Claude's head. You can't see the intermediate work. You can't check the research before Claude starts drafting. You can't redirect the outline before 800 words are written.

After this chapter:

```
[Topic] --> STAGE 1: RESEARCH --> [quality gate] -->
            STAGE 2: OUTLINE  --> [quality gate] -->
            STAGE 3: DRAFT    --> [quality gate] -->
            STAGE 4: REVIEW   --> [quality gate] -->
            STAGE 5: POLISH   --> [publish-ready output]
```

Five stages. Four quality gates. Each stage produces a visible file you can read. Each gate decides "continue" or "rework." The system does to itself what you used to do manually: one thing at a time, check it, move on.

---

*This is a preview. The full chapter continues with building a five-stage content pipeline, creating quality gates between each stage, and wiring every component from the last five chapters into a single workflow that produces publish-ready output.*

**[Read the full book →](https://frontierengineering.dev/book)**

---

**What you'll build in this chapter:**
- A five-stage content pipeline where research, outline, draft, review, and polish each happen separately
- Quality gates between every stage that catch problems before they compound
- The realization that pipelines aren't a new tool — they're every component you already built, wired together

**Free preview:** [Act 1 (Chapters 1-3)](../ch01-draft.md) is free — start there.
