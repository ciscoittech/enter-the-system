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

## The New Component: Pipelines

Here's the thing about pipelines: there's no magic new feature to install. No pipeline button. No pipeline configuration file. A pipeline is a PATTERN, built from skills, state files, hooks, and commands you already know. It's what happens when you wire the existing components together into a sequence where each stage's output feeds the next, with a checkpoint between each one.

That's the real lesson of this chapter. You're not learning a new tool. You're learning to COMPOSE the tools you've already built.

**What a pipeline is, concretely**: A set of instructions that tell the AI "do step 1, save the result, check it, then do step 2 using step 1's result, save THAT result, check it, then step 3..." Each step is its own focused task. Each step produces a file you can read. Each transition has a check.

**How it works in practice**: You create a markdown file in `.claude/commands/` that defines the workflow: the stages, the order, the checks. When you type the command name (like `/content-pipeline`), Claude reads that file and follows the stages. Think of it as a recipe card. Claude follows the steps in order.

```
my-ai-systems/.claude/commands/
  content-pipeline.md       <-- 5-stage content production
  study-deep.md             <-- multi-stage deep study session
  job-apply.md              <-- application preparation pipeline
  status-report.md          <-- weekly status generation pipeline
```

You already have `.claude/skills/` (expertise) and `.claude/hooks/` (checks). Now you're adding `.claude/commands/` (workflows). Three folders inside `.claude/`, three purposes: knowledge, quality, and process.

**The vocabulary, in plain language:**

A **stage** is one focused step. Research is a stage. Drafting is a stage. Each one has a single job.

An **artifact** is the thing a stage produces. Research produces a brief. Outlining produces an outline. Drafting produces a draft. Each artifact is saved as a file. You can read it, approve it, or send it back for rework.

A **quality gate** is a check between stages. "Is the research deep enough to start outlining?" "Does the outline have a clear structure before we start drafting?" The gate says "pass" or "rework."

**Entry criteria** are what must exist before a stage can start. The drafting stage needs a completed outline. No outline, no drafting.

**Exit criteria** are what must be true for a stage to be done. The research stage must have 3+ sources with URLs. One source isn't enough.

**Resumability** means the pipeline remembers where it stopped. If you close your laptop after approving the outline, the pipeline picks up at the drafting stage next session. It doesn't start over. Your state file (Ch 5) is the mechanism. The pipeline writes its progress to state. Next session, Claude reads state and continues.

The difference between a pipeline and "a long prompt that says do A then B then C" is the exit criteria. A long prompt produces all outputs in one pass with no checkpoints. A pipeline checks each output before proceeding. Exit criteria are the quality gates. Without them, you have a to-do list, not a pipeline.

**Your workflow engine is now complete.** Remember Chapter 4's promise? "Your project folder is your workflow engine." Here's the payoff. You now have three folders inside `.claude/`, each with a clear job:

```
.claude/
├── skills/      ← what the AI knows (loaded expertise)
├── hooks/       ← what gets checked (validation layer)
└── commands/    ← what runs (workflow definitions)
```

Plus `settings.json` as the control plane that ties them together. If you've used n8n or Make, this is the same architecture: workflow definitions that reference action nodes and filter nodes, triggered on demand. Except yours lives in version-controlled files with no monthly subscription.

**What makes this "agentic."** You may have heard the term "AI agent" and wondered what it means concretely. Here's the answer: an agent is an AI that doesn't just answer questions. It follows a plan, uses tools, checks its own work, and produces results across multiple steps without you guiding each one. That's exactly what your pipeline does. When you type `/content-pipeline`, Claude becomes an agent: it reads the workflow definition, executes stages in order, runs hooks between stages, writes results to state, and either continues or stops based on quality gates. You defined the plan. The agent executes it.

The `.claude/` directory is what makes a chat into an agent. Without it, Claude is reactive (you ask, it answers). With it, Claude is agentic (you trigger, it executes a workflow with expertise, memory, and quality checks built in).

---

## Build It: Content System v6

**Components Used:** `[Prompt (CLAUDE.md)] + [State] + [Skill] + [Hook] + [Connection] + [Pipeline (NEW)]`
**New this chapter:** Pipeline. All 6 components working together.

### Step 1: Create the commands directory.

```
mkdir -p my-ai-systems/.claude/commands
```

Third and final folder inside `.claude/`. Skills hold knowledge. Hooks hold checks. Commands hold workflows. Your `.claude/` directory is now complete.

### Step 2: Build the content pipeline command.

Create `my-ai-systems/.claude/commands/content-pipeline.md`:

```markdown
# Content Pipeline

Run a 5-stage content production pipeline. Each stage produces a saved
artifact. Check quality gates between stages before continuing.

Topic: $ARGUMENTS

## Instructions

Read content/CLAUDE.md for system rules. Load editorial-voice and
content-standards skills. Read content/content-state.md for topic
history and prior performance.

Track pipeline progress in content/content-state.md under a
"## Current Pipeline" section. Update it after each stage so work
can resume if the session ends.

## Stage 1: RESEARCH

**Goal**: Gather material for the topic.
**Actions**:
- Search the web for 3+ credible sources on the topic
- Check content-state.md. Has this topic been covered before? From
  what angle? Find a fresh angle.
- Compile findings into content/pipeline/research-brief.md

**Exit criteria (all must pass)**:
- [ ] 3+ sources with URLs
- [ ] Clear angle identified (different from prior coverage)
- [ ] Key facts and data points listed
- [ ] No unverified claims. Everything has a source or [VERIFY] flag

**If exit criteria fail**: Search again with different queries. If
still insufficient after 2 attempts, tell me the topic needs more
manual research and stop.

Save the research brief. Show me the exit criteria checklist.
Wait for my approval before continuing to Stage 2.

## Stage 2: OUTLINE

**Goal**: Structure the piece.
**Actions**:
- Read the research brief from Stage 1
- Load editorial-voice skill for structure patterns
- Create a section-by-section outline in content/pipeline/outline.md

**Exit criteria**:
- [ ] Opening section has a hook (not a setup paragraph)
- [ ] Each section has a clear purpose noted
- [ ] Structure follows my preferred format from editorial-voice skill
- [ ] Target word count allocated across sections
- [ ] Logical flow: sections build on each other

**If exit criteria fail**: Restructure. Max 2 revisions.

Save the outline. Show me the exit criteria checklist.
Wait for my approval before continuing to Stage 3.

## Stage 3: DRAFT

**Goal**: Write the full piece.
**Actions**:
- Read the outline from Stage 2
- Load editorial-voice skill. Match my voice throughout, not just
  the opening
- Load content-standards skill for format rules
- Write the draft, saving to content/pipeline/draft.md

**Exit criteria**:
- [ ] Follows the outline structure
- [ ] Voice matches my writing examples (check editorial-voice skill)
- [ ] Word count within 10% of target
- [ ] Every factual claim has a source from Stage 1 or a [VERIFY] flag
- [ ] No banned words from editorial-voice skill

**If exit criteria fail**: Revise the specific sections that fail.
Max 2 full revisions.

Save the draft. Show me the exit criteria checklist.
Continue to Stage 4 (automated review).

## Stage 4: REVIEW

**Goal**: Automated quality check.
**Actions**:
- Run all content hooks against the draft:
  - check-content-quality.sh (banned words, word count, sourcing)
  - Voice consistency check against skill examples
- Flag any issues found

**Exit criteria**:
- [ ] All hooks pass
- [ ] No banned words detected
- [ ] All claims sourced
- [ ] Voice consistent throughout (not just opening paragraph)

**If any hook fails**: Return to Stage 3 with specific feedback
from the hook. Fix only the flagged issues.

Show me the review results. If all pass, continue to Stage 5.

## Stage 5: POLISH

**Goal**: Final formatting and state update.
**Actions**:
- Apply final formatting for target platform (blog, newsletter,
  social, based on what I specified)
- Save the final version to content/pipeline/final.md
- Update content/content-state.md:
  - Add the piece to the Pieces table (title, topic, date, status:
    "ready to publish")
  - Update Topics Covered
  - Clear the "Current Pipeline" tracker

**Exit criteria**:
- [ ] Final file saved and formatted
- [ ] State file updated with new piece
- [ ] Pipeline tracker cleared

Deliver the final piece. Show me a summary: topic, word count,
sources used, stages completed, any issues flagged and resolved.
```

That's the longest single file you've created in this book. Walk through what's in it.

Each stage has a **goal**, **actions**, and **exit criteria**. The goal says what this stage is for. One sentence, one job. The actions say what to do. The exit criteria say "you're done when all these boxes are checked." If you remember one thing from this chapter, remember exit criteria. They're what make a pipeline different from "do all of this at once."

Notice the "wait for my approval" lines in Stages 1 and 2. You get to read the research before outlining starts. You get to approve the outline before drafting begins. You're the editor. You set the direction, then the system executes. Stages 3-5 run more automatically because the structure is already locked in. You can adjust this. Add more approval points if you want tighter control, or remove them as you trust the system more.

And notice how the pipeline uses EVERYTHING from prior chapters. CLAUDE.md (Ch 4) for instructions. content-state.md (Ch 5) for topic history. editorial-voice and content-standards skills (Ch 6) for expertise. The check-content-quality hook (Ch 7) for automated checks. Web search (Ch 8) for research. And now the pipeline (Ch 9) to stage it all. Six components, one system.

### Step 3: Create the pipeline workspace.

```
mkdir -p my-ai-systems/content/pipeline
```

This folder holds the intermediate artifacts: the research brief, outline, draft, and final piece. Each stage saves its output here. You can open any of these files, read them, edit them, or restart a stage. The pipeline's work is visible, not hidden.

### Step 4: Update content-state.md for pipeline tracking.

Add to `my-ai-systems/content/content-state.md`:

```markdown
## Current Pipeline

| Field | Value |
|-------|-------|
| Topic | (none) |
| Current Stage | -- |
| Started | -- |
| Last Updated | -- |
| Stages Completed | -- |
```

This is resumability. If you run the pipeline, approve Stage 1 and Stage 2, then close your laptop for the night. Tomorrow, Claude reads this tracker and knows: "Topic is cloud migration mistakes, Stages 1-2 complete, resume at Stage 3." It doesn't start over. The state file gives the pipeline memory. Ch 5's state file pattern, applied one level up.

### Step 5: Run the pipeline.

Open Claude Code in the `my-ai-systems/` directory:

```
claude
```

Type:

```
/content-pipeline Write an 800-word blog post about the three biggest mistakes people make when migrating to the cloud.
```

Here's what you see, stage by stage.

### Stage 1: Research

Claude searches the web. Finds articles from AWS, a Gartner case study, a practitioner's blog with real cost data. Saves `content/pipeline/research-brief.md`. Shows you: "3 sources found. Angle: focus on mistakes that SEEM right (everyone makes them because they look smart) rather than obvious blunders. Exit criteria: all checked." Then it waits.

You open the research brief. Real sources, real data, a fresh angle. You say "continue."

### Stage 2: Outline

Claude reads the research brief. Loads your editorial voice skill. Creates a structure: hook (a migration horror story from the research), three mistakes (each with a real example from the sources), close (the one question to ask before migrating). Saves `content/pipeline/outline.md`. Shows exit criteria. Waits.

You read the outline. The structure builds from small mistake to catastrophic. Maybe you say "swap mistake 2 and 3, build from annoying to devastating." Claude adjusts. Then: "continue."

### Stage 3: Draft

Claude reads the approved outline. Loads both skills. Writes the full draft with your voice loaded from the start, not fading by paragraph four because drafting was the ONLY task this time, not research + drafting + checking all at once. Saves `content/pipeline/draft.md`.

### Stage 4: Review

Your hooks fire against the draft. check-content-quality.sh checks for banned words, word count, sourcing. Voice consistency is measured against your skill examples. Results: "All hooks pass. One [VERIFY] flag on a migration cost statistic, source found, flag resolved."

### Stage 5: Polish

Claude formats for blog publication. Saves `content/pipeline/final.md`. Updates `my-ai-systems/content/content-state.md` with the new piece. Clears the pipeline tracker.

Open the final draft. Compare it to what you'd get from a single-pass prompt. The research is deeper (three sources, not one). The structure is tighter (because the outline was approved before a single word of draft was written). The voice is consistent throughout (because drafting was the only task in Stage 3, not research-and-drafting-and-checking all at once). The facts are verified (because review was its own stage, not an afterthought).

The pipeline didn't make Claude smarter. It made Claude more focused. One job at a time, each job checked. That's what staging buys you.

### Step 6: Test resumability.

Run the pipeline again with a new topic. After Stage 2 (outline approved), close Claude Code. Walk away. Open it tomorrow. Type:

```
Continue the content pipeline.
```

Claude reads content-state.md. Sees "Topic: [your topic], Stages 1-2 complete, current stage: 3." Picks up at Stage 3 (drafting) without re-running research or outlining.

You didn't re-explain the topic. You didn't re-run research. The pipeline has memory because it writes to state. State (Ch 5) and pipeline (Ch 9) working together.

---

## Extend It: Three More Systems Get Pipelines

Same pattern, different stages. Each system gets a command file in `my-ai-systems/.claude/commands/` and a pipeline workspace for intermediate artifacts.

| System | Command File | Pipeline Stages | Key Artifact | What Changes |
|--------|-------------|----------------|-------------|-------------|
| **Study** | `study-deep.md` | 1. Identify weak areas 2. Research the gap 3. Synthesize a study brief 4. Practice (quiz) 5. Analyze results | `study-system/pipeline/study-brief.md` | Turns your tutor into a researcher: finds gaps from quiz data, hunts material, teaches it your way, tests you, tracks progress |
| **Job Hunting** | `job-apply.md` | 1. Research company 2. Tailor materials 3. Quality check (hooks) 4. Prepare interview talking points 5. Track in state | `job-hunting/pipeline/materials.md` | Every application gets company research BEFORE the cover letter, not generic boilerplate |
| **Project Mgmt** | `status-report.md` | 1. Gather from state 2. Analyze status 3. Route to two audiences 4. Verify against state 5. Update state | `project-mgmt/pipeline/analysis.md` | Stage 3 uses the Router pattern from Ch 3: one dataset, two outputs (executive summary + team update) |

Create each pipeline workspace:

```
mkdir -p my-ai-systems/study-system/pipeline
mkdir -p my-ai-systems/job-hunting/pipeline
mkdir -p my-ai-systems/project-mgmt/pipeline
```

The command files follow the same structure as the content pipeline: each stage gets a goal, actions, and exit criteria. The content pipeline you built above is the template. Copy it, change the stages, and you have a pipeline for any recurring workflow.

---

## Maintain It: Finding the Bottleneck

Your pipeline is only as good as its weakest stage. Run it 3 times and pay attention: which stage takes the longest? Which stage fails its exit criteria most often? That's your bottleneck. Fix THAT stage. Leave the rest alone.

After 3 runs of the content pipeline, say Stage 1 (research) takes 60% of the total time and fails exit criteria once (only found 2 sources instead of 3). The draft stage passes every time. The bottleneck is research. Maybe the search queries need refining. Maybe the exit criteria should say "3 sources, but 2 high-quality sources with original data count as sufficient." Fix research. Don't touch drafting.

Track this. Add to your state file:

```markdown
## Pipeline Performance

| Date | Topic | Total Stages | Reworks | Bottleneck Stage | Total Time |
|------|-------|-------------|---------|-----------------|------------|
| | | | | | |
```

After 5 runs, the pattern is obvious. One stage is always the problem.

**When to add a stage.** Only when you can name the failure it prevents. "A formatting stage would be nice" is not enough. "Three times the review stage caught formatting issues that took 10 minutes to fix manually." That's a reason. Name the failure, then add the stage.

**When to remove a stage.** If a stage passes 100% of the time for a month, ask: is the upstream stage so good that this check is redundant? Maybe your editorial-voice skill has gotten so precise that the voice-check in review always passes. Remove it. Simpler pipelines run faster and break less.

**When to skip stages.** Not every piece of content needs all 5 stages. A quick social media post? Skip research and outlining. Go straight to draft. Build this into your command: "For short-form content (under 300 words), skip Stages 1-2 and start at Stage 3." That's the Router pattern from Chapter 3, built into your pipeline.

**Context limits.** A 5-stage pipeline running in a single session generates a lot of text: research briefs, outlines, full drafts, review notes. Claude can only hold so much at once (think of it as desk space; eventually, things get pushed off the edges). If your pipeline starts losing quality in later stages, the fix is simple: break the session. Run Stages 1-2 in one session, Stages 3-5 in another. The state file tracks where you stopped. That's what resumability is for.

---

## Going Further: Subagents and Orchestration

Your pipeline runs all stages in a single session. Claude carries context from stage to stage. This works well for the systems you're building here. But eventually you might notice a later stage producing weaker output because Claude is holding too much in its head at once. Research context pollutes the drafting stage. Fact-checking rules interfere with creative writing.

The fix: split that stage into a **subagent**. A subagent is a separate, focused AI session that handles one stage's work with only the context it needs. The main workflow hands off to a specialist, waits for the result, then continues.

Here's what that looks like in a pipeline command file:

```markdown
## Stage 3: DRAFT (subagent)

Spawn a focused session for drafting. Load ONLY:
- The outline from Stage 2 (content/pipeline/outline.md)
- The editorial-voice skill
- The content CLAUDE.md

Do NOT load: research sources, fact-checking rules, or state
history. The drafter's only job is to write well from the
approved outline.

Save the draft to content/pipeline/draft.md when complete.
```

The subagent loads less context, focuses on one job, and produces better output. The main session picks up the result and continues to Stage 4. The trade-off is cost: each subagent pays its own startup overhead (Chapter 11 covers the math). Start with single-session pipelines. Split into subagents when you notice quality dropping in a specific stage.

**Want to go deeper?** Anthropic's Building Effective Agents guide (docs.anthropic.com/en/docs/build-with-claude/agentic-patterns) covers orchestrator-worker, routing, and evaluation patterns. The Claude Code documentation (docs.anthropic.com/en/docs/claude-code) shows practical Agent tool usage. And n8n's AI workflow templates (n8n.io/ai) show the same patterns in a visual builder for comparison.

---

## What You Built

This is the complete `my-ai-systems/` directory, every file you've created across Chapters 4-9. All four systems at v6, all six components in place.

```
my-ai-systems/
  CLAUDE.md                              <-- root shared rules (Ch 4)
  .claude/
    settings.json                        <-- hooks (Ch 7) + permissions + MCP config (Ch 8)
    skills/
      editorial-voice/SKILL.md           <-- (Ch 6)
      content-standards/SKILL.md         <-- (Ch 6)
      study-method/SKILL.md              <-- (Ch 6)
      career-profile/SKILL.md            <-- (Ch 6)
      pm-methodology/SKILL.md            <-- (Ch 6)
    hooks/
      verify-cover-letter.sh             <-- (Ch 7)
      check-duplicate.sh                 <-- (Ch 7)
      check-quiz-format.sh              <-- (Ch 7)
      check-status-dates.sh             <-- (Ch 7)
      check-content-quality.sh           <-- (Ch 7)
    commands/
      content-pipeline.md               <-- (Ch 9) 5-stage content production
      study-deep.md                     <-- (Ch 9) multi-stage deep study
      job-apply.md                      <-- (Ch 9) application preparation
      status-report.md                  <-- (Ch 9) weekly status generation
  study-system/
    CLAUDE.md                            <-- (Ch 4, updated Ch 5-6, Ch 8)
    study-state.md                       <-- (Ch 5)
    pipeline/                            <-- (Ch 9) intermediate artifacts
  job-hunting/
    CLAUDE.md                            <-- (Ch 4, updated Ch 5-6, Ch 8)
    job-state.md                         <-- (Ch 5)
    pipeline/                            <-- (Ch 9) intermediate artifacts
  project-mgmt/
    CLAUDE.md                            <-- (Ch 4, updated Ch 5-6, Ch 8)
    project-state.md                     <-- (Ch 5)
    pipeline/                            <-- (Ch 9) intermediate artifacts
  content/
    CLAUDE.md                            <-- (Ch 4, updated Ch 5-6, Ch 8)
    content-state.md                     <-- (Ch 5, updated Ch 9: pipeline tracker)
    pipeline/                            <-- (Ch 9) intermediate artifacts
```

Five CLAUDE.md files. Four state files. Five skills. Five hooks. One settings.json. Four command files. Four pipeline workspaces.

You started Chapter 4 with a single CLAUDE.md. Six chapters later, you have four systems, each with instructions, memory, expertise, quality checks, external connections, and staged workflows. That's not a prompt. That's infrastructure.

![The complete system: all six components working together](../diagrams/png/ch09-complete-system.png)

*The complete system after Chapter 9. All six components in place across all four systems.*

---

## Break It on Purpose

### Test 1: Skip a stage.

Run the pipeline but tell Claude "skip Stage 1, go straight to outlining." Without research, the outline is thinner. Claude falls back on general knowledge instead of specific sources. The draft has fewer concrete examples, vaguer data points. Compare this to a full-pipeline draft. The difference is the cost of skipping research.

### Test 2: Fail a quality gate.

Give Claude a topic where credible sources are scarce. Something obscure, something so new that very little has been written about it. Watch the exit criteria fail: "Only found 1 source. Exit criteria require 3." The pipeline stops. It doesn't charge ahead into outlining with inadequate research. It tells you the problem and waits. That's the gate holding.

### Test 3: Compare single-pass to pipeline.

Same topic, same system, same components. Write the blog post two ways:

**(A)** Single prompt, one pass: "Write an 800-word blog post about the three biggest mistakes people make when migrating to the cloud."

**(B)** Full content pipeline, all 5 stages: `/content-pipeline Write an 800-word blog post about the three biggest mistakes people make when migrating to the cloud.`

Read both. The pipeline version has better research (more sources), tighter structure (outline was approved separately), more consistent voice (drafting was the only task in Stage 3), and verified facts (hooks ran in their own stage). The single-pass version is decent but not publish-ready.

This is the chapter's most important test. Same AI. Same topic. Same tools. Different organization. Better results.

### Test 4: Test resumability.

Run the pipeline. Complete Stages 1-2. Close Claude Code. Reopen it. Say "continue the content pipeline." Check that Claude picks up at Stage 3, not Stage 1. If it restarts from the beginning, the pipeline tracker in content-state.md needs a clearer "Current Pipeline" section. Make the current stage and completed stages more explicit.

---

## How to Know It's Clicking

Six checks, one for each component, because this chapter completes them all.

**Pipeline command exists and runs.** `.claude/commands/content-pipeline.md` is in place. Typing `/content-pipeline` starts the workflow. Each stage produces a saved file in `content/pipeline/`.

**Quality gates catch problems.** At least one gate triggers a "rework" during your first pipeline run (insufficient research, weak outline, hook failure). The gate catches it before the next stage inherits the problem.

**Pipeline output is better than single-pass.** Your side-by-side comparison (Test 3) shows the difference: more sources, tighter structure, more consistent voice. The improvement is visible, not theoretical.

**Resumability works.** You stopped the pipeline mid-way, resumed next session, and Claude picked up at the correct stage without re-running completed work.

**All six components are visible.** In one pipeline run, you can point to: CLAUDE.md loading (instructions), skill loading (expertise), state reading and writing (memory), hooks firing (quality checks), web search running (connections), and stages executing in order (pipeline). All six. One system.

**You can name the complete system.** "My Content System has six components. Instructions tell Claude what to do. Skills tell it how to write in my voice. State tracks what I've published and where the pipeline is. Hooks check every draft for banned words, unsourced claims, and word count. Connections let Claude research topics online. And the pipeline breaks production into five stages (research, outline, draft, review, polish) with a quality gate between each one."

That's not a prompt. That's a system. You built it, piece by piece, across six chapters. And you can build another one for any complex, recurring work, using the same six components in the same pattern.

Now you've seen how to build a system from scratch. Chapter 10 shows you what happens when all six components run together under real pressure, a production case study where the stakes are higher than a study quiz or a blog draft. You'll see how the same patterns you just built handle work that actually costs money when it breaks.
