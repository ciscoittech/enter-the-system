# From Prompts to Pipelines — Outline (v3)

**Full Title**: *From Prompts to Pipelines: A Systems-Based Approach to Prompt Engineering and Agentic Workflows*
**Audience**: Knowledge workers who already use AI for everyday tasks — but hit the wall every time. Their prompts work once, then break. They re-explain context every session. They can't trust the output without checking everything manually. They're smart, they're motivated, and they're tired of AI being a coinflip.
**Thesis**: You're already using AI. You're just using it wrong — not because your prompts are bad, but because a prompt isn't a system. This book teaches you to see the system, then build it.

---

## The Three Systems

These aren't chapter projects. They're throughlines — each one starts as a single prompt the reader already knows how to write, and grows across the entire book into something genuinely powerful. By the final chapter, each system is unrecognizable from where it started.

### 1. The Study System
**Entry point**: "Help me study for [certification/exam/course]"
**Exit point**: An adaptive learning system that researches topics, builds structured knowledge bases, generates quizzes calibrated to weak areas, tracks mastery over time, and pulls in current information from live sources. The reader went from "quiz me on chapter 3" to a system that knows what they know, what they don't, and what to do about it.

### 2. The Job Hunting System
**Entry point**: "Write me a resume for this job posting"
**Exit point**: A full career operations system that tracks every application, tailors resumes and cover letters using loaded career expertise, monitors job boards, preps for interviews using company research, manages follow-ups, and learns from outcomes (which approaches get callbacks, which don't). The reader went from pasting job descriptions into ChatGPT to running a data-informed job campaign.

### 3. The Project Management System
**Entry point**: "Help me plan this project"
**Exit point**: A project operations system that tracks tasks and dependencies, generates status updates for different audiences (boss gets the executive summary, team gets the action items), monitors deadlines, flags risks before they become problems, and produces dashboards showing progress. The reader went from a to-do list prompt to a system that actually manages work.

### 4. The Content System
**Entry point**: "Write me a blog post about X"
**Exit point**: A content production pipeline that researches topics, maintains editorial voice consistency, manages an editorial calendar, drafts across formats (blog, newsletter, social), checks facts against sources, and tracks what resonates with the audience. The reader went from one-shot drafts they had to rewrite to a system that produces publish-ready content in their voice.

**Why these four**: They cover the territory of what people actually want from AI — learning something, advancing their career, managing their work, and creating content. Together they make the reader formidable. And each one naturally exercises all six system components, so nothing feels forced.

**How they work in the book**: Each chapter introduces one system component. The chapter does a deep build on ONE system (the one where that component's value is most obvious), then shows the reader how to add the same component to the other systems. The reader doesn't build four systems from scratch every chapter — they build one deeply, then extend the pattern.

---

## The Four Universal Concepts

These are tool-agnostic. They work in ChatGPT, Claude, Gemini, Cursor, n8n, or whatever ships next year.

| Concept | What It Means | The Failure It Prevents |
|---------|--------------|------------------------|
| **Instruction** | What you tell the AI to do — and how precisely you tell it | "It didn't do what I wanted" |
| **Memory** | Anything that persists between sessions — files, logs, trackers | "I have to re-explain everything every time" |
| **Control** | Checks, rules, and constraints that catch mistakes before they ship | "It gave me confident garbage and I almost used it" |
| **Flow** | Multi-step sequences where each stage's output feeds the next | "It tried to do everything at once and botched it" |

## The Six Implementation Components (Cowork-specific)

| Universal Concept | Cowork Component | What It Is |
|-------------------|-----------------|------------|
| Instruction | **Prompt** | The structured request you give Claude |
| Instruction | **Skill** | A reusable knowledge doc Claude loads on demand |
| Memory | **State** | A file that tracks what happened across sessions |
| Control | **Hook** | An automated check that runs before/after actions |
| Flow | **Pipeline** | Multi-stage workflow with quality gates |
| Flow | **Connection** | External data sources (APIs, MCP, web search) |

---

# ACT 1: THE SYSTEM (Universal)

*3 chapters. Lean, fast, tool-agnostic. The reader walks away with a mental model for why AI breaks and what to do about it. Examples drawn from the four systems — but kept simple, using ChatGPT/Claude/Gemini prompts everyone recognizes. This is the "before" picture.*

---

## Chapter 1: You're Already Building Systems (You're Just Building Them Badly)

**The hook**: You've used AI a hundred times. Sometimes it's magic. Sometimes it's useless. The difference isn't the AI — it's whether you accidentally built a system or just fired off a prompt.

**What this chapter covers**:
- The "coinflip problem": why the same prompt gives great results on Monday and garbage on Thursday
- You're already building systems — you just can't see them yet. When you paste context, re-explain your preferences, manually check output, and retry when it fails — that's a system. A bad one, a manual one, but a system.
- The four things every AI system needs: Instruction, Memory, Control, Flow
- The anatomy diagram: `INPUTS → PROCESS → OUTPUTS ← FEEDBACK`
- Why most people stop at Instruction and wonder why nothing sticks

**The "before" picture** — show the reader three prompts they already write:
- "Help me study for the AWS Solutions Architect exam. Quiz me on the key concepts." → Works once. Tomorrow it re-covers what you already know. It can't track your weak areas because it doesn't remember today.
- "Write a cover letter for this Senior PM role at Stripe." → Decent output. But you re-explain your experience every time. It doesn't know which version of your resume you sent where. It can't learn from which letters got callbacks.
- "Help me plan the Q3 product launch." → Gives you a to-do list. But next week it doesn't know what's been done, what's blocked, or that the deadline moved. You become the state tracker.

Each of these is a prompt, not a system. By the end of this book, each one will be unrecognizable.

**Exercises**:
- Pick the scenario above (or your own) that's closest to something you've actually done. Write down: What did you type? What context did you paste? What did you check manually after? What broke when you tried it again the next day?
- Identify which of the four concepts (Instruction, Memory, Control, Flow) were missing.

**Key idea**: A prompt is one input. A system is the whole loop. You need the loop.

---

## Chapter 2: The Four Concepts — X-Ray Vision for AI Workflows

**The hook**: Before you build anything, you need to see the moving parts. This chapter gives you the vocabulary to diagnose any AI interaction — yours or anyone else's.

**What this chapter covers**:

### Instruction: Telling AI What You Actually Mean
- The gap between what you think you said and what AI heard
- Specificity isn't word count — it's removing ambiguity
- Structured instruction vs. vague request — same task, radically different results
- Tool-agnostic examples across ChatGPT, Claude, and Gemini
- Why even perfect instructions aren't enough (preview of the other three)

### Memory: Making It Stick
- Why AI forgets everything between sessions — by design, not by accident
- The three kinds of memory: session context (gone when you close the tab), persistent instructions (always loaded), external state (files the system reads and writes)
- The "goldfish to colleague" spectrum
- Example using the Study System: re-explaining your progress every session vs. a file that tracks what you've mastered and what you haven't

### Control: Catching Mistakes Before They Ship
- AI is fast and confident. That's the problem.
- Three failure modes: hallucination (stating false things), drift (gradually ignoring your rules), overstep (doing more than asked)
- Guard rails vs. quality gates: prevention vs. verification
- Example using the Job Hunting System: a cover letter that invents project details, uses the wrong tone, and addresses the wrong company — because nothing checked it before it shipped
- You don't need AI to be perfect. You need it to fail loudly instead of quietly.

### Flow: Breaking Big Work Into Stages
- Why "do everything at once" produces worse results than staged execution
- Sequential stages, decision points, and feedback loops
- Example using the Content System: one-shot blog post vs. a pipeline that researches → outlines → drafts → fact-checks → polishes. Each stage is simple. The pipeline is powerful.
- The constraint principle: your system is only as fast as its weakest stage

**Exercises**:
- Take the AI interaction you mapped in Chapter 1. For each concept, write what's currently happening (even if "nothing") and what SHOULD happen.
- Find an "AI workflow" post online. Map it to the four concepts. Which ones are they addressing? Which are they ignoring?

**Key idea**: These four concepts are the periodic table of AI systems. Every system in every tool is some combination. Once you see them, you can't unsee them.

---

## Chapter 3: Design Patterns — Three Shapes Every System Takes

**The hook**: You don't need to invent from scratch. Every AI system is a variation of three patterns.

### Pattern 1: The Loop (Process → Check → Improve → Repeat)
- What it is: the system processes, checks the result, learns, does better next time
- Where you see it: spell check, budget review, workout tracking
- In AI: draft → review → revise → better draft
- Study System example: quiz → score → identify weak areas → study weak areas → quiz again
- When to use it: any task where output can be measured and improved
- Danger: infinite loops. Define "good enough."

### Pattern 2: The Gate (Stage → Quality Check → Pass or Rework)
- What it is: a checkpoint that decides "continue" or "go back"
- Where you see it: code review, manager approval, QA
- In AI: draft passes quality check before formatting; research passes source verification before analysis
- Job Hunting example: cover letter must reference the company by name, cite a specific reason for interest, and stay under 400 words — or it goes back for revision
- When to use it: shipping bad output is more expensive than catching it
- Danger: too strict (nothing passes) or too loose (why bother)

### Pattern 3: The Router (Decision Point → Path A or Path B)
- What it is: the system chooses a different process based on input
- Where you see it: email filters, customer service triage
- In AI: short doc → summarize directly; long doc → chunk, summarize sections, synthesize
- Project Management example: task update from team lead → executive summary format; same update for the team → detailed action items format
- When to use it: different inputs need different handling
- Danger: too many routes. 2-3 max.

### Combining Patterns
- Real systems combine patterns. The Content System: Route (what format?) → Gate (is research sufficient?) → Loop (draft → review → revise)
- The napkin test: if you can't sketch it using these three shapes, it's too complicated

### How to Design From Scratch
1. Start with the goal: what does RIGHT look like?
2. Map inputs and outputs
3. Identify the constraint: what fails most or costs the most time?
4. Pick a pattern
5. Add components only when you can name the failure they prevent
6. The over-engineering trap: if removing something doesn't break anything, remove it

**Exercises**:
- Sketch one of the four systems (Study, Job Hunting, Project Management, or Content) using the three patterns. Where would you put a gate? Does anything need routing?
- Look at a current AI workflow of yours. Is there an implicit loop, gate, or router you're doing manually? Name it.

**Key idea**: Three shapes, a napkin, and the discipline to ask "what breaks if I remove this?"

---

# ACT 2: THE BUILD (CLI-Demonstrated, Interface-Agnostic)

*The reader knows the concepts and patterns. Now they build. All examples are shown in the terminal (CLI) because the reader needs to see the system's parts — state files, skill documents, hook scripts — as real files they create and edit. The same patterns work in Claude Code, Codex, Kimi CLI, or any similar tool. Warp Terminal is recommended (free, open-source) but not required.*

*Each chapter introduces one component and does a deep build on the system where that component's value is most obvious. Then the reader extends the component to the other three systems. By the end of Act 2, all four systems are fully built — each with all six components working together.*

*Every component chapter includes a "Maintain It" section teaching how to keep that component healthy over time — because systems that aren't maintained drift.*

---

## Part II: First Builds — Instruction + Memory
*Components introduced: Prompt, State*
*Universal concepts: Instruction, Memory*
*Claude Code features introduced as needed: CLAUDE.md (Ch 4), state files (Ch 5), folder structure (Ch 6)*

---

### Chapter 4: Structured Prompts — Your Systems Start Here

**Component introduced**: Prompt (the 4-part formula: Context → Input → Output → Constraints)
**Primary system**: Study System
**Universal concept**: Instruction

**The transition to CLI**:
- Why the terminal: you see every file, every state change, every system part. GUIs hide this. When you're learning to build systems, transparency matters.
- Setting up: install Warp Terminal (free, open-source, supports any AI CLI agent) or use any terminal you have. Install Claude Code (or equivalent: Codex, Kimi CLI).
- "If you prefer a graphical interface, everything in this book works in Cowork, VS Code, or Cursor. The files are the same — only the interface is different."
- Opening the tool, giving it folder access, writing your first structured instruction in the CLI

**Deep build — Study System v1 (Prompt only)**:
The reader picks a real topic they're currently learning and writes a structured prompt:
- Context: "I'm studying [topic]. My current level: [X]. My goal: [Y by Z date]."
- Input: "Here are my notes from today: [file or pasted content]"
- Output: "Generate: (1) key concept summary, (2) 5 quiz questions with answers, (3) one analogy that connects this to something I already know"
- Constraints: "Use plain language. Flag concepts I might confuse with similar ones. Don't just list facts — explain WHY each matters."

Run it. It works for one session. Run it again tomorrow — it re-covers yesterday's material. It can't track weak areas because it has no memory of today. The quiz questions overlap.

**Now extend — the other three systems get their v1 prompts**:

*Job Hunting v1*: Structured prompt that takes a job posting + the reader's experience and produces a tailored resume + cover letter. Works once. But next application, they re-explain everything. No tracking of what they sent where.

*Project Management v1*: Structured prompt that takes a project goal and produces a task breakdown with owners, dependencies, and timeline. Works once. Next week, it doesn't know what's been done or that the deadline moved.

*Content System v1*: Structured prompt that takes a topic and audience and produces a blog post draft. Works once. But it doesn't know the reader's voice, doesn't fact-check, and can't maintain consistency across posts.

**The lesson**: Structured prompts are better than vague ones — dramatically better. But they're still one-shots. Each system works for a single session and forgets everything.

**System diagram (all four)**: `[Input] → [Structured Prompt] → [Claude] → [Output]` — no feedback arrow. Four instances of the same incomplete architecture.

**Quality gate**: All four prompts produce noticeably better output than unstructured versions. But running any of them twice reveals the gap: no continuity.

---

### Chapter 5: State Files — Teaching Your Systems to Remember

**Component introduced**: State file (persistent memory across sessions)
**Primary system**: Job Hunting System
**Universal concept**: Memory

**Why Job Hunting is the primary build**: Job hunting is where the pain of no memory is most acute. Every application is a fresh start. You lose track of where you applied, which resume version you sent, what worked, what didn't. The state file transforms this from a series of isolated one-shots into a campaign with intelligence.

**Deep build — Job Hunting System v2 (Prompt + State)**:

Build a `job-hunt-state.md`:
- **Applications tracker**: company, role, date applied, resume version used, cover letter approach, status (applied / phone screen / interview / offer / rejected / ghosted)
- **Resume versions**: which version emphasizes which skills, where each was sent
- **Response patterns**: callback rate by resume version, by cover letter approach, by job type
- **Interview log**: questions asked, how they answered, what they'd change
- **Networking contacts**: who, where they work, last contact date, follow-up needed
- **Insights**: after 5+ applications, what's actually working?

Update the prompt to read the state at session start, write to it at session end.

Run it across 3+ applications:
- Application 1: Claude drafts resume + cover letter, creates initial state
- Application 2: Claude reads state, knows what was sent before, tailors differently for this role, avoids repeating the same cover letter structure
- Application 3: Claude notices Application 1 got a callback but Application 2 didn't — suggests what might have worked about version 1's approach

**State file patterns** (taught here, used everywhere):
- Status tables: rows of items with a status column (applications, tasks, topics)
- Session logs: timestamped entries of what happened (meetings, study sessions, drafts)
- Derived fields: calculated from raw data (callback rate, weak area score, completion percentage)
- State hygiene: when to archive old entries, how to keep active state lean

**Now extend — state files for the other three systems**:

*Study System v2*: `study-state.md` tracking topics covered, quiz scores by concept, weak areas (concepts scored low repeatedly), connections between concepts, next session priorities. Run 3 sessions — by session 3, the system focuses on weak areas instead of re-covering mastered material.

*Project Management v2*: `project-state.md` tracking tasks (description, owner, status, dependencies, due date), completed work, blocked items, scope changes, decisions made. Run it over a week — next Monday, the system knows exactly where the project stands without the reader re-explaining.

*Content System v2*: `content-state.md` tracking pieces drafted, topics covered, editorial calendar, performance notes (what resonated, what fell flat), voice consistency observations. Over 3 posts, the system avoids topic repetition and notices patterns in what works.

**System diagram (all four)**: `[Input] → [Prompt + State read] → [Claude] → [Output + State write]` — the feedback arrow appears.

**Maintain It — State Hygiene**:
- When to archive: move completed/old entries out of active state. 50 rows is working memory; 500 is a database you can't process.
- What to keep active: only items with status "in progress" or "recent." Everything else goes to an archive section or separate file.
- How to know it's bloating: if the AI starts ignoring entries at the bottom, or if session start takes noticeably longer, the state file is too long.
- The monthly check: read your state files once a month. What's stale? What's missing? 30 minutes saves hours of drift.

**Quality gate**: Run any system 3 times. On session 3: it doesn't repeat work from session 1, it references patterns from prior sessions, and the state file shows clear progression. The system is learning.

---

## Part III: Knowledge and Guard Rails
*Components introduced: Skill, Hook*
*Universal concepts: Instruction (advanced), Control*
*Claude Code features introduced: .claude/skills/ directory + SKILL.md (Ch 6), .claude/settings.json + hooks/ (Ch 7), .claude/commands/ (Ch 7)*

---

### Chapter 6: Skills — Loading Expertise On Demand

**Component introduced**: Skill (a reusable knowledge document Claude loads before working)
**Primary system**: Content System
**Universal concept**: Instruction (advanced — persistent, reusable knowledge)

**Why Content is the primary build**: Content creation is where the gap between "AI output" and "my output" is most painful. The AI doesn't know the reader's voice, their audience, their editorial standards. They re-explain these every session, and the output still drifts to generic AI-speak by paragraph 3. A skill file solves this permanently.

**The difference between prompts and skills**:
- A prompt says "write a blog post about X"
- A skill says "here's everything about how I write, what my audience expects, what good looks like, and what to avoid" — and it loads automatically every time
- Prompts change per task. Skills are reusable across all tasks in a domain.

**Deep build — Content System v3 (Prompt + State + Skill)**:

Build a `editorial-voice.md` skill:
- 3-5 examples of the reader's real writing (AI learns FROM them, not from the reader's self-description)
- Words and phrases they use vs. words they never use
- Sentence structure patterns (short and punchy? Layered and detailed?)
- Tone by format: blog post (conversational, opinionated), newsletter (personal, direct), social (sharp, compressed)
- What makes their content different from generic AI output — the specific edge
- Formatting preferences, structural patterns, how they open and close pieces

Build a `content-standards.md` skill:
- Fact-checking requirements: every claim needs a source or gets flagged
- Structure rules by format (blog posts need a hook in the first sentence, newsletters need a personal anecdote in the intro)
- Word count targets by format
- SEO considerations if relevant

The prompt loads both skills, reads the state, drafts the content.

**The feedback loop between state and skill**:
- State captures what Claude gets wrong (the reader's edits after each draft)
- Those patterns become new rules in the skill
- Skill produces better output next time
- State captures fewer corrections
- This is the Loop pattern from Chapter 3, implemented.

Over 5+ pieces of content, the system converges on the reader's voice. The state file becomes the evidence.

**Now extend — skills for the other three systems**:

*Study System v3*: `study-method.md` skill — how the reader learns best (examples vs. theory first? Visual vs. textual? Short sessions vs. deep dives?), preferred quiz format, how to explain complex concepts (use analogies from their field), what level of detail they need. A second skill loaded per subject: `aws-cert.md` or `marketing-fundamentals.md` with domain-specific terminology, common misconceptions, and exam-specific patterns.

*Job Hunting v3*: `career-profile.md` skill — full work history with quantified achievements, target roles and companies, industry-specific language, 3 strong cover letter examples that actually got interviews, common interview questions + best answers. This skill means Claude knows the reader's career as well as they do — loaded every time, never re-explained.

*Project Management v3*: `pm-methodology.md` skill — how the reader manages projects (agile? waterfall? something informal?), status update format by audience, risk assessment criteria, definition of "done" vs. "done done," escalation rules. A second skill per project: `q3-launch.md` with stakeholders, constraints, and context specific to that project.

**Skill design principles**:
- Show, don't describe: examples of good output beat rules about good output
- Keep it under 2,000 words: Claude's attention isn't infinite. Cut anything the system doesn't need every session.
- Version your skills: note what changed and why. If the new version is worse, roll back.
- One skill per domain, not one skill per task

**System diagram (all four)**: `[Input] → [Prompt + Skill loaded + State read] → [Claude] → [Output + State write]`

**Maintain It — Skill Versioning**:
- Version your skills: when you update, note what changed and why at the top of the file.
- If the new version produces worse output, roll back. Skills aren't "always forward" — sometimes the previous version was better.
- The state-to-skill feedback loop: your state file captures what the AI gets wrong. Those patterns become new rules in the skill. The skill produces better output. The state captures fewer corrections. This is the Loop pattern from Ch 3, implemented.
- Quarterly check: read your skill files. Do they still match how you actually work? Roles change. Preferences evolve. A skill that hasn't been updated in 6 months is a skill that's drifting from reality.

**Quality gate**: For the Content System — show 3 AI-drafted pieces to someone who reads the reader's work. They can't reliably tell which are AI-written. For the Job Hunting System — a cover letter generated using the career-profile skill is materially better than one generated without it (specific, voice-accurate, not generic).

---

### Chapter 7: Hooks — Automated Guard Rails

**Component introduced**: Hook (automated check that runs before or after Claude acts)
**Primary system**: Job Hunting System
**Universal concept**: Control

**Why Job Hunting is the primary build**: In job hunting, the cost of errors is high and immediate. A cover letter addressed to the wrong company. A resume that invents experience Claude hallucinated. A follow-up email sent too soon or too late. These are the kinds of mistakes the reader WOULD catch in manual review — but manual review is inconsistent. They'll catch it at 9am. At 11pm after 6 applications, they won't. Hooks catch it every time.

**Deep build — Job Hunting System v4 (Prompt + State + Skill + Hook)**:

Hook #1 — Cover letter pre-send check:
- Does it mention the company by name (not a placeholder)?
- Does it reference something specific about the role or company (not just the job title)?
- Is it under 400 words?
- Does every claimed experience match the career-profile skill? (Prevents Claude from inventing achievements.)
- Does the tone match the reader's voice skill?

Hook #2 — Resume consistency check:
- Does the tailored resume still align with the master career profile?
- Are dates consistent? Are job titles accurate?
- Did Claude add any experience or skills that aren't in the source material?

Hook #3 — Application state check:
- Has the reader already applied to this company for this role? (Prevents duplicate applications.)
- Is the follow-up timing appropriate based on the state file?

Test by breaking: Feed the system a job posting and intentionally leave the company name ambiguous. Does Hook #1 catch that the cover letter says "your company" instead of the actual name? Feed it a resume request for a role requiring a skill the reader doesn't have. Does Hook #2 catch Claude fabricating the skill?

**Types of hooks**:
- Pre-action hooks: run BEFORE Claude saves or sends. Prevent bad output.
- Post-action hooks: run AFTER Claude acts. Verify what just happened.
- The "most expensive mistake" test: what's the worst thing this system could do? Build a hook for THAT.

**Now extend — hooks for the other three systems**:

*Study System v4*: Hooks that check quiz questions for accuracy (is the "correct" answer actually correct?), flag when the system is re-covering mastered material (wasting the reader's time), and verify that explanations don't use jargon above the reader's stated level.

*Project Management v4*: Hooks that check status updates for consistency (does the task count match the state file?), flag overdue tasks, catch impossible timelines (task due before its dependency), and verify that stakeholder communications match the appropriate audience format.

*Content System v4*: Hooks that check every factual claim for a source, verify the draft matches the voice skill (sentence length, word choice, tone), flag clichés and AI-isms, and check that the piece meets word count and structural requirements.

**System diagram (all four)**: `[Input] → [Prompt + Skill + State] → [Claude] → [Hook check] → [Output + State write]` — the hook sits between Claude's output and the final save.

**Maintain It — Hook Tuning**:
- False positives: if the hook flags everything, it becomes noise. Tune thresholds — start strict, loosen when you see the false positive pattern.
- False negatives: periodically "break it on purpose" by feeding known-bad input. If the hook doesn't catch it anymore (because the AI got better at avoiding the pattern), update the hook.
- The calibration loop: run your system for a week, review what the hooks caught. Were any flags wrong? Were any errors missed? Adjust. This is the Gate from Ch 3 — calibrating the gate is maintenance.
- Don't add hooks for problems that never happen. If a hook hasn't fired in a month, consider whether it's still needed or whether the skill/prompt already prevents that failure.

**Quality gate**: Feed any system input with 3 deliberate problems. All 3 are caught and flagged before the output is finalized. The hook doesn't fix them — it refuses to let bad output through and tells the reader (or Claude) what's wrong.

---

## Part IV: Connections and Full Pipelines
*Components introduced: Connection, Pipeline*
*Universal concepts: Flow*
*Claude Code features introduced: MCP servers in settings.json (Ch 8), subagents + multi-step orchestration (Ch 9)*

---

### Chapter 8: Connections — Your Systems Reach the Outside World

**Component introduced**: Connection (MCP servers, APIs, web search, CLI tools)
**Primary system**: Study System
**Universal concept**: Flow (external inputs)

**Why Study is the primary build**: Until now, the Study System only knows what the reader feeds it — their notes, their textbook summaries. But effective studying requires MORE than the reader's materials: current industry developments, multiple perspectives on the same concept, practice questions from diverse sources, real-world applications they wouldn't find in a textbook. Connections let the system go out and GET information.

**Deep build — Study System v5 (Prompt + State + Skill + Hook + Connection)**:

Add connections:
- **Web search**: Claude searches for current information on study topics, finds alternative explanations, locates practice resources
- **MCP connection (optional)**: Connect to Google Drive or Notion where the reader keeps course materials, or to a flashcard app's API

The system now:
- Researches topics the reader is weak on (identified by state), pulling in explanations from multiple sources
- Finds practice questions beyond what the reader's textbook provides
- Gets current developments in the field (critical for fast-moving topics like cloud computing, marketing, data science)
- Cross-references the reader's notes against authoritative sources, flagging gaps or misunderstandings
- Builds concept summaries that combine the reader's notes WITH outside material

The hook still fires: every external fact needs a source. No hallucinated "facts" from web search pass through unchecked.

**Connections explained for non-technical readers**:
- MCP servers: plugins that give Claude access to tools you already use (Google Drive, Notion, Slack, databases). Think of them like connecting apps on your phone.
- Web search: Claude looks things up online, like you would. It can find information that isn't in your files.
- APIs: Claude talks to a web service to pull data (stock prices, weather, schedules, etc.)
- CLI tools: Claude runs a command-line program to do something your computer can do but you'd normally do manually

**Setting up your first connection**: Step-by-step walkthrough for 2-3 common setups (web search, Google Drive MCP, one other). Non-technical, screenshot-level detail.

**When to connect vs. when local files are enough**: Decision framework. If the information exists in your files and doesn't change, you don't need a connection. If you need current information, information from another tool, or data you don't have yet — you need a connection.

**Now extend — connections for the other three systems**:

*Job Hunting v5*: Web search for company research before writing cover letters (pull recent news, company values, tech stack). Optional: job board API or MCP for monitoring new postings matching criteria. The system stops being reactive (you paste a job posting) and becomes proactive (it finds postings that match your profile).

*Project Management v5*: MCP connections to the reader's actual project tools (Slack for team updates, calendar for deadlines, issue tracker for task status). The system pulls live project data instead of requiring manual updates. Status reports are generated from real data, not the reader's summary of real data.

*Content System v5*: Web search for research before drafting. Connection to the reader's publishing platform or CMS. The system can research a topic, draft the post, AND check what's already been published to avoid repetition — all without the reader copy-pasting anything.

**System diagram (all four)**: New element — the Connection is shown as an external input arrow, separate from the reader's files.

**Maintain It — Connection Health**:
- Check that external sources still work: APIs change, MCP servers update, web search results shift. Run a test query monthly.
- Handle failures gracefully: build into the prompt "if you can't reach [source], note the gap and continue with available data." Connections will fail — the system should degrade, not crash.
- Monitor cost: some connections (API calls, web searches) have costs. Track usage in your state file so you know what you're spending.

**Quality gate**: The Study System produces a research brief on a weak-area topic containing information that wasn't in the reader's files — live data pulled from web search. Every fact has a source link. The hook caught at least one unsourced claim during the process.

---

### Chapter 9: Pipelines — Multi-Stage Workflows with Quality Gates

**Component introduced**: Pipeline (multi-stage workflow with checkpoints between stages)
**Primary system**: Content System
**Universal concept**: Flow (sequential stages)

**Why Content is the primary build**: Content creation is the most natural pipeline. Everyone intuitively knows the stages — research, outline, draft, edit, polish — but when they ask AI to do it, they collapse it into one prompt: "write a blog post." The single-prompt approach produces B- work across all stages. A pipeline produces A-level work at each stage because each stage is focused and checked.

**Deep build — Content System v6 (All 6 components)**:

A multi-stage content pipeline for the reader's recurring content need (blog, newsletter, social, whatever they actually produce):

**Stage 1: RESEARCH**
- Pull data from connections (web search, linked sources)
- Read state file for topic history (what's been covered, what resonated)
- Load research methodology skill
- Output: research brief with findings, sources, and angles
- Exit criteria: minimum 3 credible sources, clear angle identified

**Stage 2: OUTLINE**
- Read research brief from Stage 1
- Load editorial voice skill for structure patterns
- Output: structured outline with section summaries
- Exit criteria: outline follows the reader's preferred structure (from voice skill), each section has a clear purpose

**Stage 3: DRAFT**
- Read outline from Stage 2, load voice skill
- Write the full piece
- Output: complete draft
- Quality gate: Does it match voice skill? Are facts sourced? Does it meet word count? Is the hook strong? → If not, loop back to Stage 3 with specific feedback. Max 2 revisions.

**Stage 4: REVIEW**
- Hook battery fires: fact-check, voice check, structure check, AI-ism check
- Output: annotated draft with pass/fail on each check
- Exit criteria: all hooks pass. If any fail, loop back to Stage 3 with the hook's specific complaints.

**Stage 5: POLISH**
- Final formatting for the target platform
- State update: log the piece, its topic, its performance (to be updated later when the reader has audience data)
- Output: publish-ready content

**Pipeline concepts**:
- Entry and exit criteria per stage: each stage knows what it needs to start and what "done" looks like
- Quality gates between stages: the system decides "good enough to continue" or "needs rework"
- The constraint: the pipeline is only as fast as its weakest stage. If drafting is fine but research is unreliable, fix research. Ignore drafting.
- Resumability: state tracks which stage the piece is in. If the system stops mid-pipeline, it picks up at the right stage — not from the beginning.
- Feedback loops: review findings feed back to the voice skill over time (if the hook keeps catching the same problem, add a rule to prevent it)

**Now extend — pipelines for the other three systems**:

*Study System v6*: Pipeline for deep topic mastery: Research (pull material from connections) → Synthesize (combine with existing notes) → Generate Practice (create quiz calibrated to weak areas) → Test (quiz the reader) → Analyze (update state with results, recalculate weak areas) → Adapt (adjust next session's focus). Quality gate between Generate and Test: are the questions actually testing the weak areas identified in state, or are they rehashing mastered material?

*Job Hunting v6*: Pipeline for each application: Research Company (pull from connections) → Tailor Materials (use career skill to customize resume and cover letter) → Quality Check (hooks verify accuracy, specificity, voice) → Submit (or flag for human review if hooks found issues) → Track (update state with application details) → Follow Up (generate follow-up at appropriate interval from state). Quality gate between Tailor and Quality Check: does the cover letter pass the specificity test, or is it generic filler?

*Project Management v6*: Pipeline for weekly status cycles: Gather Data (pull from connections — Slack, calendar, issue tracker) → Analyze (identify blockers, overdue items, risks) → Route Updates (Router pattern: executive audience → summary format, team audience → detailed actions, stakeholder → progress highlights) → Quality Check (hooks verify data consistency, flag missing items) → Deliver (format and send/save). Quality gate between Analyze and Route: does the analysis match the raw data from Gather, or has Claude introduced trends that aren't supported?

**System diagram**: Full pipeline diagram with stages, gates, feedback loops, connections, and skill loading all visible. This is the most complex diagram in the book — and the reader built every piece of it across prior chapters.

**Maintain It — Pipeline Bottlenecks**:
- Find the constraint: your pipeline is only as fast as its weakest stage. Run the pipeline 3 times and note which stage takes longest or fails most. Fix THAT stage. Ignore the rest.
- Stage-level monitoring: track time and pass/fail rate per stage in your state file. After 10 runs, you'll see the pattern.
- When to add a stage: only when you can name the failure it prevents. "It would be nice to have a formatting stage" is not a reason. "Three times the review stage caught formatting issues that cost me 20 minutes to fix manually" is a reason.
- When to remove a stage: if a stage passes 100% of the time for a month, consider whether it's still needed or whether the upstream stages have gotten good enough to make it redundant.

**Quality gate**: Run the Content Pipeline on a real piece. Intentionally provide a topic where one of the sources contradicts another. The system should flag the contradiction at the REVIEW stage (not silently pick one and present it as fact). The gate works.

---

## Part V: Production & Mastery
*No new components. Production reality, cost management, debugging what breaks, composing what works.*
*Claude Code features introduced: memory files (Ch 14), full .claude/ directory architecture (Ch 15)*

---

### Chapter 10: A Real System — Production Case Study

**What this chapter covers**: No new component — a production-scale example using all 6. The reader has built their systems component by component. Now they see what a real system looks like when all six components operate together at production scale — and they map every piece back to what they already built.

**The production system**: An abstracted specialty food import system that matches products from global suppliers to local market demand. The system uses a 37-tool AI agent orchestrating MongoDB aggregation pipelines to perform forensic-grade product matching and market analysis.

**What the reader sees**:
- **$facet multi-dimensional profiling**: A single database query that simultaneously profiles products across price ranges, category distribution, brand frequency, and seasonal patterns — like running four analyses at once. Maps to: *Connection* (Ch 8) pulling structured data, *Pipeline* (Ch 9) parallel stage execution.
- **Price correlation supply chain forensics**: The system detects when products from different suppliers are actually the same item by comparing price patterns, packaging descriptions, and ingredient lists. Maps to: *Hook* (Ch 7) pattern-matching validation, *State* (Ch 5) tracking known product identities across sessions.
- **Multi-signal demand scoring**: Combines sales velocity, social media mentions, competitor pricing, and seasonal trends into a single demand score per product. Maps to: *Connection* (Ch 8) pulling from multiple external sources, *Skill* (Ch 6) encoding scoring methodology.
- **Entity resolution**: Matching "Shea Moisture Coconut & Hibiscus Curl Enhancing Smoothie" with "SM Coco-Hibiscus Smoothie" and "Shea M. C&H Curl Cream" as the same product. Maps to: *Skill* (Ch 6) encoding domain knowledge about product naming patterns.
- **Mode detection (factual/analyst/strategic)**: The system detects whether the user is asking for raw data, analysis, or strategic recommendations — and responds differently. Maps to: *Router pattern* (Ch 3), implemented as a pipeline stage that classifies intent before processing.
- **Tool composition**: 37 tools that the agent selects and sequences dynamically based on the query. Maps to: *Pipeline* (Ch 9) with dynamic stage selection, *Hook* (Ch 7) validating tool output before passing to the next stage.

**The mapping exercise**: For each production component, the reader identifies:
1. Which of their Ch 4-9 components does the same job
2. What's different at production scale (volume, complexity, error handling)
3. What's the same (the pattern, the purpose, the failure it prevents)

**The gap between "working" and "production"**: The reader's systems work for personal use. Production systems handle thousands of items, multiple users, real money on the line. The COMPONENTS are the same — the scale is different. This chapter shows that the framework they learned isn't a toy version of real engineering. It IS real engineering.

**Quality gate**: The abstraction holds — the reader can explain every production component using vocabulary from Ch 4-9. Technical patterns are preserved (the reader understands what $facet does and why). Every production element maps back to a component they've already built.

---

### Chapter 11: The Cost of Intelligence

**What this chapter covers**: No new component — a practical operations chapter. AI systems cost money to run. This chapter teaches the reader to understand, estimate, track, and reduce those costs without sacrificing system quality.

**Token economics — what you're actually paying for**:
- Every word in, every word out costs tokens. Your prompt, your skill files, your state files, Claude's response — all tokens.
- The model ladder: fast models ($0.04-1/M tokens), standard models ($3-15/M tokens), reasoning models ($15-75/M tokens)
- When you load a 2,000-word skill file + a 500-word state file + a 300-word prompt, that's ~2,800 words of input tokens BEFORE Claude generates a single word of output
- The multiplication problem: a pipeline with 5 stages runs 5 separate AI calls. Each loads skills and state. Costs multiply.

**Five cost reduction strategies**:
1. **Lean state files**: Keep active state small. Archive completed items. Every word in the state file is tokens you pay for every session. (References state hygiene from Ch 5.)
2. **Hooks over model judgment**: Hooks that check word count, format, or presence of required fields cost zero tokens — they're code, not AI calls. Every check you move from "ask Claude to verify" to "run a script" saves money. (References Ch 7.)
3. **Selective skill loading**: Don't load every skill every time. The content voice skill doesn't need to load when you're updating project status. Load what's needed for THIS task. (References Ch 6.)
4. **Cache connections**: If you're pulling the same company research for multiple cover letters, cache it locally instead of re-fetching. Connection calls cost time and sometimes money. (References Ch 8.)
5. **Batch pipelines**: Instead of running the full pipeline for every small change, batch similar items. Research 3 topics at once instead of 3 separate research stages. (References Ch 9.)

**Monitoring what you spend**:
- **Built-in tracking**: Most AI CLI tools show token usage per session. Check after each session.
- **State file cost log**: Add a "Session Cost" section to your state files. Log date, task, tokens used, estimated cost. After a week, you'll see patterns.
- **Production-grade monitoring (Langfuse)**: For readers who want detailed tracking — what Langfuse is (an open-source tool that records every AI call with cost, latency, and token counts), how it connects, what it shows. Not required, but powerful for anyone running systems daily.

**When free is good enough**:
- Hooks are always free — they're scripts, not AI calls
- Local models (Ollama, LM Studio) for tasks that don't need frontier intelligence: formatting, simple classification, template filling
- The hybrid approach: use a fast cheap model for drafting, a standard model for analysis, a reasoning model only for complex decisions. Match the model to the task.

**The reader's cost exercise**:
- Run each of their four systems once and record the token usage
- Estimate weekly cost if they used each system daily
- Apply 2-3 cost reduction strategies and measure the difference
- Set a monthly budget and design their usage around it

**Quality gate**: The reader can estimate the cost of any session before running it (within 50%). They have logged costs for a week and can identify their most expensive system and their cheapest optimization opportunity.

---

### Chapter 12: When Systems Break — Debugging

**What this chapter covers**: Every system breaks. This chapter teaches the reader to diagnose failures and fix them — fast, without adding complexity. Maintenance (preventing drift) was taught per-component in Ch 5, 6, 7, 8, 9. This chapter is about what to do when something breaks DESPITE maintenance.

**The failure taxonomy** — every system failure maps to a component:

| Symptom | Component | What Broke |
|---------|-----------|-----------|
| "It didn't understand what I wanted" | Instruction | Prompt or skill issue |
| "It forgot what we did last time" | Memory | State file not reading/writing correctly |
| "It gave me confident nonsense" | Control | Missing or weak hook |
| "It tried to do too much at once" | Flow | Needs staging/pipeline |
| "It couldn't get the data it needed" | Flow | Connection failure |

**Debugging protocol**:
1. Identify the symptom: what specifically went wrong?
2. Map to a component: which of the six is responsible?
3. Isolate: test that component alone. Does the skill load? Does the state have the right data? Does the hook fire?
4. Fix the component, not the prompt. If you're adding words to the prompt to fix a problem, you're probably patching the wrong thing.
5. Add a check: whatever broke, add a hook or state tracker so you'll know if it breaks again.

**Common failures and fixes** — organized by the four systems:

*Study System debug scenarios*:
- Quiz questions are too easy / too hard → state file isn't accurately tracking difficulty levels (Memory issue)
- System keeps covering mastered topics → state read isn't working or weak-area calculation is wrong (Memory issue)
- Explanations use jargon above the reader's level → skill needs updated level constraints (Instruction issue)

*Job Hunting debug scenarios*:
- Cover letter sounds generic despite career skill → skill file needs more examples, fewer rules (Instruction issue)
- System doesn't catch wrong company name → hook check is too loose or not firing (Control issue)
- Application tracker is growing unwieldy → state file needs archiving strategy (Memory maintenance)

*Project Management debug scenarios*:
- Status update contradicts task list → pipeline stage ordering issue, analysis running before data gathering completes (Flow issue)
- Slack connection returns stale data → connection caching or auth issue (Flow issue)
- Risk flags for everything (false positives) → hook thresholds need tuning (Control issue)

*Content System debug scenarios*:
- Voice drifts to generic by paragraph 3 → skill file is too long and Claude loses the thread (Instruction issue — cut the skill down)
- Pipeline gets stuck in revision loop → quality gate is too strict, or feedback isn't specific enough (Flow issue)
- Facts slip through without sources → fact-check hook needs tightening (Control issue)

**The debugging mindset**:
- Fix the component, not the prompt. If you're adding words to the prompt to work around a bug, you're patching the wrong thing.
- Isolate before you fix. Test the suspected component alone — does the skill load? Does the state have the right data? Does the hook fire on test input?
- Add a check after every fix. Whatever broke, add a hook or state tracker so you'll know if it breaks again.
- Reference the maintenance practices from earlier chapters (state hygiene Ch 5, skill versioning Ch 6, hook tuning Ch 7, connection health Ch 8, pipeline bottlenecks Ch 9) — these are the preventive measures. This chapter is the emergency room.

**Quality gate**: The reader can diagnose a real failure in one of their systems, identify the responsible component, fix it, and add a check to prevent recurrence — without adding complexity to the prompt.

---

### Chapter 13: Composing Systems — Your Personal AI Operating System

**What this chapter covers**: The reader has four independent systems. Now they wire them together into something greater than the sum of its parts.

**What a personal AI OS is**: Multiple systems sharing state and skills, where one system's output becomes another's input. Not a monolith — a network of independent systems that cooperate.

**Cross-system connections the reader builds**:

**Study × Content**: Research and learning feed content creation. The reader studies a topic → the Study System builds deep understanding → the Content System turns that understanding into a blog post or newsletter, using the same research and the reader's voice. The state files connect: study-state shows the reader has deep knowledge on topic X → content-state knows that topic X is ready for a post.

**Job Hunting × Content**: The reader's content establishes expertise that strengthens job applications. Content-state tracks published pieces → the career-profile skill references them → cover letters can cite the reader's published work. Connections go the other way too: job research reveals industry trends → content ideas.

**Project Management × Content**: Status updates and project learnings become content. PM-state tracks project milestones → Content System generates "lessons learned" posts or project updates for a portfolio.

**Study × Job Hunting**: Studying for certifications directly feeds career advancement. Study-state tracks certification progress → job-hunt-state knows which certifications to highlight → the system tailors applications to emphasize in-progress or completed credentials.

**Composition patterns**:
- **Chain**: System A's output → System B's input (study findings → content draft)
- **Shared state**: Multiple systems read/write to a shared index that tracks cross-system context
- **Shared skills**: The voice skill loads into any system that writes. Research methodology loads into any system that gathers.
- **Cross-system hooks**: The fact-check hook fires on content AND study summaries AND project status reports

**What you're NOT building**: An over-engineered monolith. Each system still works independently. The composition is optional connections between them — remove any connection and both systems still function. That's the test.

**The personal OS architecture**: A master index file (not one giant state file) that points to individual system state files. Each system checks the index for relevant cross-system context. Nothing is tightly coupled.

**Quality gate**: The reader runs their composed systems for a full work week. At least 2 cross-system interactions work correctly (output from one system used by another). Each system still works independently if disconnected from the others.

---

### Chapter 14: Designing New Systems — From Problem to Blueprint

**What this chapter covers**: The reader has built four systems by following this book. Now they design and build one from scratch, for a problem the book never addressed. This is the test of whether the framework transferred.

**The design process**:
1. **Start with frustration**: What task do you do repeatedly that AI helps with inconsistently?
2. **Map current state**: How are you doing it now? What do you paste, re-explain, manually check?
3. **Identify the constraint**: What breaks most often? What costs the most time?
4. **Choose a pattern**: Loop, Gate, or Router from Chapter 3
5. **Start minimal**: Prompt only. Run it. See what breaks.
6. **Add one component at a time**: State when it forgets. Skill when it needs expertise. Hook when it makes dangerous errors. Connection when it needs live data. Pipeline when it needs stages.
7. **Test by breaking**: Bad input. Skip steps. See what fails. Add checks for failures that matter.
8. **Document**: System diagram, component list, failure modes, maintenance schedule.

**The reader builds a new system** — not one from this book. The chapter walks through the design process with the reader making choices at each step. Possible domains: personal finance, fitness tracking, travel planning, home maintenance, client management, event planning, language learning, team management, side business operations — whatever matches their life.

**Anti-patterns**:
- "Just add more to the prompt" → you probably need a skill
- "Build it all at once" → start with prompt only, add components when you can name the failure they prevent
- "Automate everything" → some tasks don't need systems. If it's quarterly and takes 10 minutes, a prompt is fine.
- "Set it and forget it" → systems decay. Schedule maintenance.

**Quality gate**: The reader has a working system for a problem not covered in this book. They can articulate what each component does, what failure it prevents, and what they'd add next.

---

### Chapter 15: What's Next — Systems That Grow With You

**What this chapter covers**: Forward-looking, not a recap. Where to go from here.

**Systems evolve**:
- When AI improves, your constraint moves. Today's bottleneck (output quality) might vanish — but a new one appears (input quality, integration complexity, trust calibration)
- Add components when you find new constraints. Remove them when problems disappear. A system that never changes is being ignored.

**Staying current without drowning**:
- The "3 sources" rule: pick 3 sources of AI news relevant to YOUR workflows. Ignore everything else.
- When to update systems for new capabilities vs. when to wait
- "New feature" vs. "actually useful for my workflow" — different things

**Teaching others**:
- The 15-minute demo: show someone your SYSTEM, not your prompts. The state file, the skill, the hook. That's what convinces people.
- Building shared systems: team skills, shared state, common conventions
- The systems-thinking conversation: helping someone see components instead of tasks

**The reader's toolkit**:
- 4 universal concepts: Instruction, Memory, Control, Flow
- 6 Cowork components: Prompt, State, Skill, Hook, Connection, Pipeline
- 3 design patterns: Loop, Gate, Router
- 1 debugging protocol: symptom → component → isolate → fix → check
- 4 working systems that do real work
- A framework that works regardless of what ships next

**Quality gate**: The reader can pick up a new AI tool and within 30 minutes identify which universal concepts it supports and which it doesn't. They're evaluating tools, not learning them.

---

## Appendices

### Appendix A: System Component Reference
Every component: what it is, when to add it, template to copy, which systems use it, common mistakes.

### Appendix B: Complete System Files
All four systems, fully built, ready to copy:
- **Study System**: prompt, state file, study-method skill, subject skill template, quiz accuracy hook, web search connection config, study pipeline spec
- **Job Hunting System**: prompt, state file, career-profile skill, cover letter hook, resume consistency hook, duplicate check hook, company research connection, application pipeline spec
- **Project Management System**: prompt, state file, PM methodology skill, project context skill template, data consistency hook, timeline hook, tool connections, status pipeline spec
- **Content System**: prompt, state file, editorial voice skill, content standards skill, fact-check hook, voice consistency hook, research connections, content pipeline spec
- **Personal OS**: master index, cross-system hook configs, shared skill registry

### Appendix C: Troubleshooting
Common problems by component: prompt, state, skill, hook, connection, pipeline issues with symptoms and fixes.

### Appendix D: Glossary
Plain-language definitions. One sentence each. No jargon in the definitions.

### Appendix E: Resources
Official docs, community guides, MCP server directory, systems thinking references (Meadows, Goldratt — translated for this audience).

---

## Book Specs

| Spec | Value |
|------|-------|
| Total chapters | 15 (Ch 1–15) |
| Structure | 2 Acts: Universal (Ch 1–3), Cowork Build (Ch 4–15) |
| Parts | I: The System / II: First Builds / III: Knowledge & Guard Rails / IV: Connections & Flow / V: Production & Mastery |
| Throughline systems | 4: Study, Job Hunting, Project Management, Content |
| Universal concepts | 4: Instruction, Memory, Control, Flow |
| Cowork components | 6: Prompt, State, Skill, Hook, Connection, Pipeline |
| Design patterns | 3: Loop, Gate, Router |
| Target words/chapter | 3,000–4,500 |
| Total book estimate | 45,000–67,500 words |

## Component Introduction Schedule

| Chapter | Component | Primary System | All Systems At |
|---------|-----------|---------------|----------------|
| Ch 4 | Prompt | Study | Prompt |
| Ch 5 | State | Job Hunting | Prompt + State |
| Ch 6 | Skill | Content | Prompt + State + Skill |
| Ch 7 | Hook | Job Hunting | Prompt + State + Skill + Hook |
| Ch 8 | Connection | Study | + Connection |
| Ch 9 | Pipeline | Content | All 6 |
| Ch 10 | — (production) | Production case study | All 6 (production scale) |
| Ch 11 | — (cost) | All four | All 6 + cost awareness |
| Ch 12 | — (debugging) | All four | All 6 |
| Ch 13 | — (composition) | All four combined | All 6 + cross-system |
| Ch 14 | — (new design) | Reader's choice | All 6 |
| Ch 15 | — (forward) | — | — |

## System Growth Across Chapters

Each system's version at each chapter:

| Chapter | Study System | Job Hunting | Project Mgmt | Content |
|---------|-------------|-------------|--------------|---------|
| Ch 1–3 | "before" prompt | "before" prompt | "before" prompt | "before" prompt |
| Ch 4 | v1: structured prompt | v1: structured prompt | v1: structured prompt | v1: structured prompt |
| Ch 5 | v2: + state | **v2: + state (deep)** | v2: + state | v2: + state |
| Ch 6 | v3: + skill | v3: + skill | v3: + skill | **v3: + skill (deep)** |
| Ch 7 | v4: + hook | **v4: + hook (deep)** | v4: + hook | v4: + hook |
| Ch 8 | **v5: + connection (deep)** | v5: + connection | v5: + connection | v5: + connection |
| Ch 9 | v6: + pipeline | v6: + pipeline | v6: + pipeline | **v6: + pipeline (deep)** |
| Ch 10 | production-mapped | production-mapped | production-mapped | production-mapped |
| Ch 11 | cost-optimized | cost-optimized | cost-optimized | cost-optimized |
| Ch 12 | debugged | debugged | debugged | debugged |
| Ch 13 | composed | composed | composed | composed |

**(deep)** = this system is the primary build for that chapter, with full walkthrough. Other systems get shorter "now extend" treatment.

## Why These Four Systems

| System | Life Domain | What It Proves |
|--------|------------|---------------|
| Study | Learning | "I went from asking ChatGPT to quiz me to having an adaptive learning system" |
| Job Hunting | Career | "I went from pasting job descriptions to running a data-informed campaign" |
| Project Management | Work | "I went from a to-do list to a system that actually manages projects" |
| Content | Expression | "I went from one-shot drafts to a pipeline that produces publish-ready work in my voice" |

Together: the reader learns faster, advances their career, manages their work, and creates content — all with systems, not prompts. That's formidable.
