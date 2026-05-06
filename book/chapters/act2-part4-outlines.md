# Act 2, Part IV — Detailed Chapter Outlines

*Chapters 8, 9: Connection, Pipeline*
*CLI-demonstrated, interface-agnostic. Each chapter introduces one component, does a deep build on one throughline system, extends to the other three.*

*The reader enters Act 2 Part IV with 5 CLAUDE.md files, 4 state files, 5 skill files, 7 hook scripts, and a settings.json — all four systems at v4. They leave Part IV with external data connections feeding live information into their systems AND multi-stage pipelines orchestrating complex work with quality gates between stages. All four systems are at v6 — every component in place.*

---

# Chapter 8: Connections — Your Systems Reach the Outside World

**Title**: Connections — Your Systems Reach the Outside World
**Word target**: 3,500–4,500 words
**Component introduced**: Connection (external data sources — web search, MCP servers, CLI tools)
**Primary system**: Study System (deep build)
**Other systems**: Job Hunting, Project Management, Content (extend)
**Universal concept**: Flow (external inputs)
**Claude Code feature**: MCP servers configured in `.claude/settings.json`, web search via `claude --allowedTools`, tool permissions

---

## Bridge from Chapter 7

The reader finished Ch 7 with:
- 5 CLAUDE.md files orchestrating state, skills, and hooks
- 4 state files tracking session history across all four systems
- 5 skill files loading expertise on demand
- 7 hook scripts catching errors automatically + settings.json registering them
- Four systems at v4 — Prompt + State + Skill + Hook — doing good work with automated quality checks
- A clear remaining gap: every piece of information the system uses came from the reader. The reader pastes job postings. The reader types study notes. The reader provides project data. The system is a closed box — smart, but blind to the outside world. It can't look up a company before writing a cover letter. It can't find a better explanation of a concept the reader is struggling with. It can't check whether a deadline changed in the team's calendar.

Ch 8 opens the box. The reader adds connections — ways for the system to pull data from outside: web search, tools the reader already uses, live data sources. The system stops waiting to be fed and starts reaching out.

---

## Chapter Goals

By the end of this chapter, the reader can:

1. **Explain what a connection is in plain language**: a link that lets the AI pull data from a tool or source outside your project folder — like plugging in an external hard drive, except it's a website, a Google Doc, or a calendar
2. **Enable web search** so Claude can look things up online during a session
3. **Configure an MCP server** in `.claude/settings.json` so Claude can pull data from a tool the reader already uses (Google Drive, Notion, a file system, etc.)
4. **Distinguish when connections add value vs. when local files are enough**: if the data exists in your files and doesn't change, skip the connection. If you need current data or data from another tool, connect.
5. **Handle connection failures gracefully**: build instructions that tell the AI "if you can't reach the source, note the gap and keep going" — because connections WILL fail
6. **Practice connection hygiene**: checking that sources still work, monitoring cost, removing unused connections

---

## Section-by-Section Breakdown

### Section 1: The Problem (~350 words)

**Narrative beat**: The reader's Study System hits a wall that no amount of good prompts, state tracking, skill loading, or hook checking can fix — the system only knows what the reader already knows.

**Content**:

Open with a study scenario the reader has lived:

You're studying for your AWS Solutions Architect certification. Your Study System is running well — state file tracks your weak areas (networking and IAM keep scoring below 70%), the study-method skill calibrates explanations to your learning style, the quiz hook verifies question quality.

But here's the problem: you're studying from the same notes you took three months ago. AWS released a new service last week that's already showing up in exam questions. A blog post on Medium explains VPC peering better than anything in your textbook — but your system doesn't know that blog post exists. Your colleague mentioned a free practice exam from a community site, but the system can't go find it.

Your state file knows you're weak on networking. Your skill file knows how you learn best. Your hooks verify quiz quality. But none of them can DO anything about the weakness except re-quiz you on the same material. The system can't research a better explanation. It can't find a practice resource. It can't pull in updated information. It's limited to what YOU put in — and you're the bottleneck.

You could spend 30 minutes searching for better study material, copy it, paste it into a file, and then let the system use it. But that's you doing the research manually, which is exactly the work you built the system to handle.

What you need: the system goes out and GETS information. Searches the web for alternative explanations. Pulls your course materials from Google Drive. Finds practice resources you didn't know existed. The system becomes a researcher, not just a tutor.

**One-sentence component introduction**: A connection is a link that lets the AI reach outside your project folder — searching the web, pulling data from tools you use, or accessing information you haven't manually provided.

---

### Section 2: See the System (~150 words)

**Narrative beat**: Show the current system architecture and name the gap — the box is closed.

**Content**:

Your Study System right now:

```
[Your notes] + [CLAUDE.md + study-method skill + study-state.md]
                              ↓
                          [Claude]
                              ↓
                 [Quiz + Explanations + State write]
                              ↓
                    [HOOKS CHECK: quiz quality]
```

Everything inside the box is excellent. But everything OUTSIDE the box is invisible. The system can only work with what you've already given it.

After this chapter:

```
[Your notes] + [CLAUDE.md + Skill + State]
             + [Web search results]
             + [Google Drive course materials]
                              ↓
                          [Claude]
                              ↓
                 [Quiz + Explanations + State write]
                              ↓
                    [HOOKS CHECK: quiz quality + source verification]
```

Two new arrows feed into the system from outside. The box is open. The system sees more than you told it.

---

### Section 3: The New Component — Connections (~500 words)

**Narrative beat**: Explain what connections are, the types available, and how Claude Code makes them work. Demystify MCP servers for someone who has never heard the term.

**Content**:

**What connections do, in one sentence**: They let Claude pull data from outside your project folder — the same way you'd open a browser tab, check your Google Drive, or look something up while working.

**Four types of connections** (introduced here, used across all systems):

**Web search**: Claude looks things up online. You ask "find alternative explanations of VPC peering" and Claude searches the web, reads what it finds, and uses that information in its response. It's like having a research assistant who Googles for you — except it reads the results and synthesizes them.

**MCP servers**: Think of these as plugins. An MCP server connects Claude to a specific tool — Google Drive, Notion, Slack, a database, a calendar. Once connected, Claude can read (and sometimes write) data from that tool. "MCP" stands for Model Context Protocol — but you don't need to remember that. Just think: "a plugin that connects Claude to a tool I already use."

**CLI tools**: Claude runs a command on your computer to get information. Check the weather with `curl`, list files in a directory, run a script that pulls data from somewhere. If your computer can do it from the terminal, Claude can do it through a CLI tool connection.

**APIs**: Claude talks directly to a web service — pulling stock prices, checking flight status, querying a database. These are more advanced and most readers won't need them for the systems in this book. Mentioned for completeness, not built here.

**The decision framework** — when to connect vs. when local files are enough:

- The data is in your files and doesn't change → **No connection needed.** Your career history doesn't change between sessions. Keep it in a skill file.
- You need information that changes frequently → **Web search.** Current news, updated docs, recent blog posts.
- You need data from a tool you already use → **MCP server.** Course materials in Google Drive. Notes in Notion. Tasks in a project tracker.
- You need the system to DO something on your machine → **CLI tool.** Run a script, check a file in another directory, convert a format.

**The trade-off**: Connections are powerful but fragile. Websites go down. APIs change. MCP servers need authentication that expires. Local files are always available. A system that REQUIRES a connection to function is a system that breaks when WiFi drops. Build your connections as enhancements, not foundations. The system should degrade gracefully — give you a worse answer using local data rather than crash because it can't reach the web.

---

### Section 4: Build It — Study System v5 (Deep Build) (~1,800 words)

**Components Used**: `[Prompt (CLAUDE.md)] + [State] + [Skill] + [Hook] + [Connection (NEW)]`
**New this chapter**: `[Connection]`

This is the heart of the chapter. The reader adds web search and (optionally) an MCP server connection to their Study System, then runs sessions that demonstrate the difference.

**Step 1: Enable web search.**

The reader enables web search for their Claude Code sessions. Show the exact command:

```
claude --allowedTools "web search"
```

**Writer guidance**: Explain what this does simply: "This tells Claude it's allowed to search the web during your session. Without this, Claude only knows what's in your files and its training data. With it, Claude can look things up in real time." Note that web search may also be enabled in settings — show both approaches:

```json
{
  "permissions": {
    "allowedTools": ["web_search"]
  }
}
```

Add this to the existing `.claude/settings.json` (which already has hooks from Ch 7). Show the merged file:

```json
{
  "permissions": {
    "allowedTools": ["web_search"]
  },
  "hooks": {
    "postSaveFile": [
      {
        "command": ".claude/hooks/verify-cover-letter.sh $FILE",
        "description": "Verify cover letter: company name, word count, no fabricated experience"
      },
      {
        "command": ".claude/hooks/check-duplicate-application.sh $FILE",
        "description": "Warn if already applied to this company"
      }
    ]
  }
}
```

**Writer guidance**: The reader has already seen `settings.json` in Ch 7 for hooks. Reinforce the pattern: "Same file, new section. settings.json is the control panel for your system — hooks on one side, permissions on the other. One file configures everything."

**Step 2: Update the Study System's CLAUDE.md to use web search.**

Open `study-system/CLAUDE.md` and add:

```markdown
## Connections

You have web search access. Use it when:
- I'm weak on a topic (check study-state.md) and need a better explanation
  than what's in my notes
- A concept needs a current, real-world example
- I ask about something not in my existing materials
- You need to verify whether your explanation is accurate for the
  current version of the technology

When you search:
- Prefer official documentation and well-known educational sites
- Always include the source URL with any external information
- If you can't find reliable information, say so — don't guess
- Never present web search results as if they came from my notes

If web search is unavailable (no internet, tool not enabled), continue
with what you have. Note what you couldn't look up so I can research
it later.
```

**Writer guidance**: This is the third time CLAUDE.md orchestrates another capability (first: state in Ch 5, second: skills in Ch 6, third: connections here). The pattern should feel familiar now. Point this out: "Your CLAUDE.md is becoming a real conductor. It tells Claude when to read state, which skills to load, and now when and how to reach outside the project."

**Step 3: Run Session 1 — web search in action.**

The reader opens Claude Code in `study-system/`:

```
claude
```

They say: "I'm weak on VPC peering — my quiz scores on networking topics are below 70%. Find me a clear explanation and create practice questions based on it."

**What happens** (describe what the reader sees):
- Claude reads study-state.md — confirms networking is a weak area (score: 62%)
- Claude reads the study-method skill — knows the reader prefers examples-first, analogies from their field
- Claude searches the web for VPC peering explanations
- Claude finds 2-3 sources: an AWS doc, a blog tutorial, a Stack Overflow answer
- Claude synthesizes them into an explanation that matches the reader's learning style (from the skill) — not just pasting web results, but teaching the concept the way the reader learns
- Claude generates 5 quiz questions based on the external material — covering angles the reader's own notes didn't include
- Claude saves the questions to a file, hooks fire (quiz format check passes), state updates

**What to check**: The explanation includes information that WASN'T in the reader's notes. The source URLs are included. The quiz questions cover aspects of VPC peering the reader hadn't studied before. The study-state.md shows the session happened and what was covered.

**Step 4: (Optional) Set up an MCP server connection.**

This step is optional — marked clearly as "if you use Google Drive, Notion, or a similar tool for your study materials." Not every reader will do this. That's fine.

Show the concept: an MCP server lets Claude read files from Google Drive (or Notion, or another tool) as if they were local files. The reader's course PDFs, lecture slides, or shared study notes become available to the system without copy-pasting.

Show the settings.json configuration for one common MCP server (use a well-documented, stable one):

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@anthropic/mcp-filesystem",
        "/Users/reader/Documents/study-materials"
      ]
    }
  }
}
```

**Writer guidance**: This is the most technically complex step in the book so far. Keep it grounded: "An MCP server is a small program that runs on your computer and gives Claude access to something — in this case, a folder of study materials that lives outside your project. You configure it once in settings.json. After that, Claude can read those files like they're part of your project."

Acknowledge the setup friction: "If this step feels like too much right now, skip it. Web search alone is a massive upgrade. You can always come back and add an MCP connection later. The system works without it — it just works better with it."

Provide a troubleshooting note: "If the MCP server doesn't connect: check that the path is correct (does the folder exist?), that you have the required software installed (`npx` comes with Node.js — install Node.js from nodejs.org if you don't have it), and that Claude Code has permission to run the server. The most common problem is a wrong path."

**Step 5: Run Session 2 — the difference compounds.**

New session. The reader says: "Quiz me on networking — focus on my weak areas."

**What happens**:
- Claude reads study-state.md — sees last session covered VPC peering with web-sourced material
- Claude sees networking is still flagged weak (needs more sessions to move to moderate)
- Claude searches the web for current networking practice questions for the reader's specific exam
- If MCP is configured: Claude also pulls in the reader's lecture notes on subnets from Google Drive
- Claude generates a quiz that blends the reader's own notes, last session's web-sourced material, AND newly found practice questions
- The quiz is broader and deeper than anything the system could produce from local files alone

**What to notice**: "The system just did research for you. Last chapter, it could only quiz you on what you'd given it. Now it goes out, finds better material, and builds quizzes from MULTIPLE sources — your notes, the web, and (if connected) your other files. The constraint moved: it's no longer limited by what you paste in."

**Step 6: Verify the hook still catches problems.**

Critical step: connections bring in external data, which means external errors. The hook from Ch 7 (verify-quiz-answers) should still catch bad questions. Test it:

Tell Claude: "Search for common AWS networking misconceptions and build a tricky quiz that includes some deliberately wrong 'correct' answers."

**What should happen**: Claude builds the quiz. The hook fires. If a "correct" answer contradicts the reader's study materials or the skill file's known-good information, the hook flags it.

"Connections bring in the world — but hooks still guard the gate. The web is full of wrong answers. Your hook doesn't care where the data came from — it checks the output regardless. That's why you built hooks BEFORE connections."

---

### Section 5: Extend It — Connections for the Other Three Systems (~700 words)

Shorter walkthroughs — each gets a connection type and a CLAUDE.md update. NOT full step-by-step. Show the concept, the CLAUDE.md addition, and what changes.

**Job Hunting System v5** (~250 words):

Connection type: Web search for company research.

Update `job-hunting/CLAUDE.md`:

```markdown
## Connections

You have web search access. Use it when:
- I give you a job posting — research the company before writing the
  cover letter. Find: recent news, company values, tech stack, culture
  signals, Glassdoor sentiment.
- I'm preparing for an interview — find the company's recent blog
  posts, press releases, and product launches.
- A role mentions a technology or methodology I haven't covered — look
  it up so you can speak to it accurately in the cover letter.

When you search:
- Include source URLs for company research findings
- Separate facts (from their website/press releases) from opinions
  (from Glassdoor/Reddit)
- If you can't verify something, flag it — don't invent company details
```

What changes: The cover letter for Datadog now opens with a reference to their recent product launch that the reader didn't paste in. The system researched the company autonomously. The career-profile skill provides the reader's experience; the web search provides the company context. The hook still verifies that experience claims match the career profile — connections don't bypass guard rails.

Optional MCP: Connect to a job board or LinkedIn if an MCP server exists. Note this as aspirational — most readers won't have a job board MCP. Web search is the pragmatic choice.

**Project Management System v5** (~250 words):

Connection type: File system MCP or web search for project context.

Update `project-mgmt/CLAUDE.md`:

```markdown
## Connections

You have web search access. Use it when:
- I reference a tool, framework, or methodology you need context on
- A status update needs industry benchmarks for comparison
- I ask you to research best practices for a specific project challenge

If file system MCP is configured:
- Read shared project documents from the connected folder
- Pull meeting notes, specs, and design docs without me copying them in
- Never modify files in the connected folder — read only

If connections are unavailable, continue with local state and skill
files. Note any gaps so I know what wasn't included.
```

What changes: Monday morning status reports now include context the reader didn't manually provide. If the file system MCP points to a shared project folder, Claude reads the latest meeting notes and spec changes before generating the status update. The PM methodology skill shapes the format; the connection provides fresh data.

**Content System v5** (~200 words):

Connection type: Web search for research before drafting.

Update `content/CLAUDE.md`:

```markdown
## Connections

You have web search access. Use it when:
- Researching a topic before drafting — find 3+ credible sources
- Fact-checking claims in a draft — verify statistics, quotes, dates
- Looking for the current conversation around a topic — what are
  people saying? What angles have been covered? What's missing?

When you search for research:
- Always note the source URL
- Flag anything you couldn't verify with "[VERIFY: source needed]"
- Distinguish between primary sources (research, official data) and
  secondary (blog posts, opinion pieces)
```

What changes: Before drafting a blog post, Claude researches the topic — finding sources, data points, and angles the reader didn't provide. The draft arrives with citations. The content-quality hook verifies that every factual claim has a source or a [VERIFY] flag. Connections feed the system; hooks check what it produces.

---

### Section 6: Maintain It — Connection Health (~350 words)

**Narrative beat**: Connections are the most fragile component. External sources change, go down, require updated credentials. Maintenance matters here more than anywhere else.

**Content**:

**Monthly connection check.** Open your settings.json. For each connection:
- Web search: run a test query. Does Claude return current results? If results feel stale or web search seems disabled, check your permissions settings.
- MCP servers: does the connection still work? Has the path changed? Did you move the folder? Did your authentication expire? Run a simple "read a file from [connected source]" test.
- Remove unused connections. If you configured a Notion MCP three months ago and haven't used it since, remove it. Every connection is a potential failure point. Fewer connections = fewer things to break.

**Handle failures gracefully.** Your CLAUDE.md already says "if connections are unavailable, continue with local data." But test it: disconnect WiFi. Run your system. Does it degrade gracefully (gives a good-enough answer from local files) or crash (refuses to work because it can't search)?

If it crashes, the problem is in your CLAUDE.md — the instructions make the connection sound mandatory. Rewrite: "Use web search when available. If unavailable, note what you couldn't look up and continue with what you have."

**Monitor cost.** Some connections have costs — web search uses API credits, some MCP servers charge per request. Add a line to your state file:

```markdown
## Connection Usage

| Date | Connection | Queries | Notes |
|------|-----------|---------|-------|
| | | | |
```

This isn't detailed billing — it's awareness. If your study session ran 15 web searches on a topic you already had good notes for, that's waste. The connection should supplement, not replace, your local files.

**The rule**: Connections are enhancements, not foundations. Your system should work without them — slower, with less data, but functional. If removing a connection breaks the system entirely, you're over-relying on it.

---

### Section 7: System Diagram (~100 words)

**Content**:

```
[Your notes] + [Root CLAUDE.md + Study CLAUDE.md]
             + [study-method skill]
             + [study-state.md]
             + [WEB SEARCH → external sources]
             + [MCP → Google Drive study materials (optional)]
                              ↓
                          [Claude]
                              ↓
       [Quiz + Explanations using ALL sources]
                              ↓
                 [HOOKS CHECK: quiz quality + source verification]
                              ↓
                    [study-state.md updated]
```

"Five components working together. Instructions define the system. Skills carry expertise. State tracks history. Hooks verify quality. Connections bring in the world. The system is no longer a closed box — it reaches outside for better material, then checks what it found before using it."

---

### Section 8: Break It on Purpose (~200 words)

**Narrative beat**: The reader proves connections work by seeing what happens without them — and by testing that hooks still catch bad external data.

**Content**:

**Test 1 — Remove web search.** Edit settings.json to remove the web search permission. Run a study session on a weak topic. Claude still works — but it can only use your notes and its training data. The explanation is generic, not current. The quiz questions are the same kind you've already seen. Restore web search. Run the same request. The difference: current information, diverse sources, broader quiz questions.

**Test 2 — Feed it a bad source.** Tell Claude: "I found this explanation of VPC peering on a blog: [paste something with a deliberate error]. Build quiz questions from it." Does the quiz-quality hook catch the error? If not, the hook needs tightening — it should verify answers against authoritative sources, not just check format.

**Test 3 — Disconnect and degrade.** Turn off WiFi. Run a study session. The system should work — slower, narrower, but functional. If Claude stops cold because it can't search, your CLAUDE.md instructions need the "if unavailable, continue" clause.

"Connections are powerful when they're working and invisible when they're not — IF you built your system to handle both states. That's the mark of a well-designed system: it degrades, it doesn't crash."

---

### Section 9: Quality Gate (~200 words)

**Five checks**:

1. **Web search works.** In a study session, Claude returns information that isn't in your notes — with source URLs. You can click the URLs and verify the information is real.

2. **External data improves output.** Compare a study session WITH web search to one WITHOUT (your Test 1). The web-search session produces broader, more current material. The difference is obvious.

3. **Hooks still catch errors.** External data doesn't bypass quality checks. Feed the system bad external information (Test 2). The hook catches it — or you know what to tighten.

4. **Graceful degradation.** Without internet access, the system still works using local files. It notes what it couldn't look up. It doesn't crash or refuse to help.

5. **You can name the full stack.** "My Study System has five components: CLAUDE.md (instructions), study-method skill (expertise), study-state.md (memory), quiz hooks (quality checks), and web search + optional MCP (connections to outside data). The system knows what to do, how to do it well, what happened before, checks its own output, and reaches outside for better material. What's still missing: it does all of this in a single pass. One prompt, one response. Chapter 9 breaks work into stages — research first, then synthesize, then quiz, each stage checked before the next begins. That's a pipeline."

---

## Files the Reader Creates

| File | Location | Purpose |
|------|----------|---------|
| `settings.json` (updated) | `.claude/` | Add web search permission + optional MCP server config |
| `study-system/CLAUDE.md` (updated) | `study-system/` | Add "Connections" section with web search guidance |
| `job-hunting/CLAUDE.md` (updated) | `job-hunting/` | Add "Connections" section for company research |
| `project-mgmt/CLAUDE.md` (updated) | `project-mgmt/` | Add "Connections" section for project context |
| `content/CLAUDE.md` (updated) | `content/` | Add "Connections" section for research before drafting |

No new standalone files — connections are configured in settings.json and directed by CLAUDE.md. The infrastructure files from earlier chapters (hooks, skills, state) remain unchanged.

## Complete Folder Structure After Chapter 8

```
my-ai-systems/
├── CLAUDE.md                          ← root shared rules (Ch 4)
├── .claude/
│   ├── settings.json                  ← hook registration (Ch 7) + web search permission + MCP config (Ch 8)
│   ├── skills/
│   │   ├── editorial-voice.md         ← (Ch 6)
│   │   ├── content-standards.md       ← (Ch 6)
│   │   ├── study-method.md            ← (Ch 6)
│   │   ├── career-profile.md          ← (Ch 6)
│   │   └── pm-methodology.md          ← (Ch 6)
│   └── hooks/
│       ├── verify-cover-letter.sh     ← (Ch 7)
│       ├── check-duplicate-application.sh  ← (Ch 7)
│       ├── verify-quiz-answers.sh     ← (Ch 7)
│       ├── check-weak-area-focus.sh   ← (Ch 7)
│       ├── verify-status-consistency.sh   ← (Ch 7)
│       ├── check-audience-format.sh   ← (Ch 7)
│       └── verify-content-quality.sh  ← (Ch 7)
├── study-system/
│   ├── CLAUDE.md                      ← (Ch 4, updated Ch 5-6, updated Ch 8: Connections)
│   └── study-state.md                 ← (Ch 5)
├── job-hunting/
│   ├── CLAUDE.md                      ← (Ch 4, updated Ch 5-6, updated Ch 8: Connections)
│   └── job-state.md                   ← (Ch 5)
├── project-mgmt/
│   ├── CLAUDE.md                      ← (Ch 4, updated Ch 5-6, updated Ch 8: Connections)
│   └── project-state.md              ← (Ch 5)
└── content/
    ├── CLAUDE.md                      ← (Ch 4, updated Ch 5-6, updated Ch 8: Connections)
    └── content-state.md               ← (Ch 5)
```

## Technical Notes for the Writer

- **Web search is the primary connection for most readers.** MCP servers require Node.js, terminal comfort, and a tool with an available MCP server. Web search requires one setting. Lead with web search. MCP is the optional advanced step. Don't make the reader feel they need MCP to succeed.
- **The settings.json merge is important to show.** The reader already has hooks in settings.json from Ch 7. Show the COMPLETE file with both hooks AND the new permissions section. Don't show a fresh settings.json — show the one they've been building. Continuity matters.
- **MCP setup varies by tool and platform.** Don't promise a specific MCP server will work perfectly. Use the file system MCP as the example — it's the simplest and most reliable. Mention Google Drive and Notion MCP servers as aspirational options the reader can explore. Link to the MCP server directory (Appendix E) for the full catalog.
- **"Graceful degradation" is the key design lesson.** This is the chapter's conceptual payoff beyond the component itself. Systems that require every component to function are brittle. Systems that work at reduced capacity when a component fails are robust. This principle applies to everything the reader builds — not just connections.
- **Hooks and connections interact.** Connections bring in unverified external data. Hooks verify output regardless of where the data came from. This combination is the reason Ch 7 came before Ch 8: the guard rails were in place BEFORE the system opened up to the outside world. Make this explicit.
- **Don't teach API connections in depth.** Mention APIs exist. Show they're a type of connection. Don't walk through building one. The reader doesn't need API integration to complete any of the four systems. Web search and optionally file system MCP are enough.
- **The "closed box" metaphor runs through the chapter.** Start with it: the system is a closed box. End with it: the box is open. Use it in the bridge, the problem section, and the quality gate. Consistent metaphors help non-technical readers anchor abstract concepts.
- **Forward teaser**: "Your systems now have all five individual components: instructions, memory, expertise, guard rails, and outside connections. Each component does its job well. But the system still does everything in a single pass — you ask, Claude responds. For simple tasks, that's fine. But for complex work — producing a blog post, running a full study session, preparing a complete job application — one pass isn't enough. The AI tries to research, outline, draft, and polish all at once, and the quality suffers everywhere. Chapter 9 breaks complex work into stages, with a quality gate between each one. The system stops doing everything at once and starts doing each thing well."
- **Voice**: Keep it exciting but grounded. Connections are the moment the system feels "real" — like it's actually doing work, not just processing what the reader provides. Let that excitement come through, but don't oversell. "It searched the web and found a better explanation" is more powerful than "It connects to the entire world of knowledge."

---
---

# Chapter 9: Pipelines — Multi-Stage Workflows with Quality Gates

**Title**: Pipelines — Multi-Stage Workflows with Quality Gates
**Word target**: 4,000–5,000 words
**Component introduced**: Pipeline (multi-stage workflow with checkpoints between stages)
**Primary system**: Content System (deep build)
**Other systems**: Study, Job Hunting, Project Management (extend)
**Universal concept**: Flow (sequential stages)
**Claude Code feature**: `.claude/commands/` directory (custom slash commands), subagent orchestration, multi-step workflows

---

## Bridge from Chapter 8

The reader finished Ch 8 with:
- All four systems at v5 — Prompt + State + Skill + Hook + Connection
- Web search enabled, CLAUDE.md files updated with connection guidance
- The ability to pull external data into every system
- A clear remaining gap: the system does everything in a single pass. Ask Claude to write a blog post and it researches, outlines, drafts, and polishes in one response. Ask for a study session and it finds material, synthesizes it, generates questions, and quizzes you all at once. The problem: each of those steps needs different focus. When the AI tries to do research AND drafting in the same breath, the research is shallow (because it's rushing to draft) and the draft is rough (because it's still processing research). The result is B- work across every stage instead of A work at each stage.

Ch 9 introduces the final component: the pipeline. The reader breaks complex work into stages — each one focused, each one checked before the next begins. The Content System goes from "write a blog post" to a 5-stage production line where each stage does one thing well.

This is the chapter where all six components come together. After this chapter, all four systems are complete.

---

## Chapter Goals

By the end of this chapter, the reader can:

1. **Explain what a pipeline is in plain language**: a multi-step workflow where each step finishes and passes a quality check before the next step starts — like an assembly line where each station does one job and inspects the work before passing it down the line
2. **Create a custom command** in `.claude/commands/` that runs a multi-stage workflow
3. **Define entry and exit criteria** for each pipeline stage — what must be true before a stage starts, and what must be true before it can finish
4. **Build quality gates between stages** — checkpoints that decide "good enough to continue" or "needs rework"
5. **Implement resumability** — the pipeline tracks which stage a piece of work is in, so if you stop mid-pipeline, you pick up where you left off, not from the beginning
6. **Recognize when a pipeline adds value vs. when a single pass is fine**: one-off tasks don't need pipelines. Recurring complex work does.

---

## Section-by-Section Breakdown

### Section 1: The Problem (~350 words)

**Narrative beat**: The reader's Content System produces decent drafts — but "decent" isn't publish-ready. The single-pass approach collapses distinct work stages into one muddled response.

**Content**:

Open with the content scenario:

You tell your Content System: "Write an 800-word blog post about the three biggest mistakes people make when migrating to the cloud."

Claude goes to work. It searches the web (Ch 8 connection). Loads your editorial voice skill (Ch 6). Checks your content-state.md (Ch 5) to avoid repeating a topic you've already covered. Hooks are standing by (Ch 7).

The draft arrives. And it's... fine. The opening is decent. The structure makes sense. But read it closely:

The "research" is thin — Claude found one source and built the whole post around it. A deeper search would have found three better ones. The outline is invisible — the piece wanders from point 1 to point 3 without a clear arc because Claude was writing and structuring simultaneously. The voice starts strong but drifts to generic by paragraph 4 because Claude was juggling too many concerns. The fact-checking happened after the draft was done — which means Claude built arguments on unchecked claims and had to awkwardly patch them.

The hook catches the unchecked facts. The skill file makes the opening paragraph sound like you. But the structural problems — shallow research, wandering outline, fading voice — aren't things hooks can fix after the fact. They're problems that need to be PREVENTED by doing each step properly BEFORE moving on.

You know how this works in real life. You don't sit down and write a polished blog post in one pass. You research first. Then you outline. Then you draft. Then you edit. Each step is separate. Each step is focused. You don't research WHILE drafting — that produces shallow research and rough drafts.

A pipeline does the same thing: breaks the work into stages, focuses each one, and checks the result before moving on. The system stops trying to do everything at once and starts doing each thing well.

**One-sentence component introduction**: A pipeline is a multi-stage workflow where each stage does one focused task and passes a quality check before the next stage begins — so the AI does each part well instead of doing everything at once and doing everything poorly.

---

### Section 2: See the System (~200 words)

**Content**:

Your Content System right now (single-pass):

```
[Topic + CLAUDE.md + Skill + State + Web search]
                    ↓
                [Claude does everything at once]
                    ↓
          [Draft (decent, not great)]
                    ↓
              [Hooks check output]
```

One input. One pass. One output. Every stage (research, outline, draft, edit) happens inside Claude's head simultaneously. You can't see the intermediate work. You can't check the research before Claude starts drafting. You can't redirect the outline before 800 words are written.

After this chapter:

```
[Topic] → STAGE 1: RESEARCH → [quality gate] →
          STAGE 2: OUTLINE  → [quality gate] →
          STAGE 3: DRAFT    → [quality gate] →
          STAGE 4: REVIEW   → [quality gate] →
          STAGE 5: POLISH   → [publish-ready output]
```

Five stages. Four quality gates. Each stage produces a visible artifact the reader can inspect. Each gate decides "continue" or "rework." The pipeline is the system doing to itself what you used to do manually: one thing at a time, check it, move on.

---

### Section 3: The New Component — Pipelines (~500 words)

**Narrative beat**: Explain what a pipeline is, how Claude Code enables multi-stage workflows, and introduce the Claude Code feature that makes it work: custom commands in `.claude/commands/`.

**Content**:

**What a pipeline is, concretely**: A set of instructions that tell the AI "do step 1, save the result, check it, then do step 2 using step 1's result, save THAT result, check it, then step 3..." and so on. Each step is its own focused task. Each step produces a file you can read. Each transition has a check.

**How Claude Code enables pipelines**: Two features work together.

**Custom commands** (`.claude/commands/`): You create markdown files in `.claude/commands/` that define a workflow. When you type the command name (like `/content-pipeline` or `/study-deep`), Claude reads the file and follows the workflow. It's like a recipe card — Claude follows the steps in order.

```
my-ai-systems/.claude/commands/
├── content-pipeline.md       ← 5-stage content production
├── study-deep.md             ← multi-stage deep study session
├── job-apply.md              ← application preparation pipeline
└── status-report.md          ← weekly status generation pipeline
```

**Writer guidance**: Explain the directory: "You already have `.claude/skills/` (expertise) and `.claude/hooks/` (checks). Now you're adding `.claude/commands/` (workflows). Three folders inside `.claude/`, three purposes: knowledge, quality, and process."

**Subagent orchestration**: For longer pipelines, Claude can delegate stages to focused sub-tasks. Think of it as the manager assigning work to specialists: "Research agent, go find sources. Drafting agent, use those sources to write. Review agent, check the draft." In practice, this means Claude runs each stage with focused attention rather than trying to hold the entire pipeline in its head at once.

**Writer guidance**: Don't go deep on the technical mechanics of subagents. The reader doesn't need to know how Claude internally delegates. They need to know that a well-structured command file makes Claude treat each stage as a separate task. "Claude focuses on one stage at a time because your command file tells it to. The command file is the pipeline — it defines the stages, the order, and the checks."

**Pipeline vocabulary** (plain language):

- **Stage**: One step in the pipeline. Research is a stage. Drafting is a stage. Each stage has one job.
- **Artifact**: The thing a stage produces. Research produces a brief. Outlining produces an outline. Drafting produces a draft. Each artifact is saved as a file — you can read it, approve it, or send it back for rework.
- **Quality gate**: A check between stages. "Is the research sufficient to start outlining?" "Does the outline have a clear structure before we start drafting?" The gate says "pass" or "rework."
- **Entry criteria**: What must exist before a stage can start. The drafting stage needs a completed outline. No outline, no drafting.
- **Exit criteria**: What must be true for a stage to be done. The research stage must have 3+ sources with URLs. One source isn't enough.
- **Resumability**: If you stop the pipeline mid-way (it's lunch, or you want to review the outline before drafting continues), the pipeline knows where you stopped. Next session, you say "continue the content pipeline" and it picks up at Stage 3, not Stage 1.

---

### Section 4: Build It — Content System v6 (Deep Build) (~2,000 words)

**Components Used**: `[Prompt (CLAUDE.md)] + [State] + [Skill] + [Hook] + [Connection] + [Pipeline (NEW)]`
**New this chapter**: `[Pipeline]` — All 6 components working together.

This is the culminating build of the book. Every prior component comes together. The reader builds a 5-stage content pipeline that uses instructions, memory, expertise, quality checks, external data, and staged execution.

**Step 1: Create the commands directory.**

```
mkdir -p my-ai-systems/.claude/commands
```

**Writer guidance**: "Third and final folder inside `.claude/`. Skills hold knowledge. Hooks hold checks. Commands hold workflows. Your `.claude/` directory is now complete."

**Step 2: Build the content pipeline command.**

Create `my-ai-systems/.claude/commands/content-pipeline.md`:

```markdown
# Content Pipeline

Run a 5-stage content production pipeline. Each stage produces a saved
artifact. Check quality gates between stages before continuing.

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
- Check content-state.md — has this topic been covered before? From
  what angle? Find a fresh angle.
- Compile findings into `content/pipeline/research-brief.md`

**Exit criteria (all must pass)**:
- [ ] 3+ sources with URLs
- [ ] Clear angle identified (different from prior coverage)
- [ ] Key facts and data points listed
- [ ] No unverified claims — everything has a source or [VERIFY] flag

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
- Create a section-by-section outline in
  `content/pipeline/outline.md`

**Exit criteria**:
- [ ] Opening section has a hook (not a setup paragraph)
- [ ] Each section has a clear purpose noted
- [ ] Structure follows my preferred format from editorial-voice skill
- [ ] Target word count allocated across sections
- [ ] Logical flow — sections build on each other

**If exit criteria fail**: Restructure. Max 2 revisions.

Save the outline. Show me the exit criteria checklist.
Wait for my approval before continuing to Stage 3.

## Stage 3: DRAFT

**Goal**: Write the full piece.
**Actions**:
- Read the outline from Stage 2
- Load editorial-voice skill — match my voice throughout, not just
  the opening
- Load content-standards skill for format rules
- Write the draft, saving to `content/pipeline/draft.md`

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
  - verify-content-quality.sh (banned words, word count, sourcing)
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
  social — based on what I specified)
- Save the final version to `content/pipeline/final.md`
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

**Writer guidance**: This is the longest single file the reader creates. Walk through it section by section, not line by line. The key teaching moments:

1. "Each stage has a GOAL, ACTIONS, and EXIT CRITERIA. The goal says what this stage is for. The actions say what to do. The exit criteria say 'you're done when all these boxes are checked.' If you remember one thing from this chapter, it's exit criteria — they're what make a pipeline different from 'do all of this at once.'"

2. "Notice the 'wait for my approval' notes in Stages 1 and 2. You get to review the research before outlining starts. You get to approve the outline before drafting starts. That's the human in the loop — not because you don't trust the system, but because you're the editor. Stages 3-5 run more automatically because the structure is already set."

3. "The pipeline uses EVERYTHING from prior chapters. CLAUDE.md (Ch 4) for instructions. content-state.md (Ch 5) for topic history. editorial-voice and content-standards skills (Ch 6) for expertise. verify-content-quality hook (Ch 7) for automated checks. Web search (Ch 8) for research. And now the pipeline (Ch 9) for staging. All six components, one system."

**Step 3: Create the pipeline workspace.**

```
mkdir -p my-ai-systems/content/pipeline
```

"This folder holds the intermediate artifacts — the research brief, outline, draft, and final piece. Each stage saves its output here. You can read them, edit them, or restart a stage. The pipeline's work is visible, not hidden inside Claude's head."

**Step 4: Update content-state.md for pipeline tracking.**

Add to `content/content-state.md`:

```markdown
## Current Pipeline

| Field | Value |
|-------|-------|
| Topic | (none) |
| Current Stage | — |
| Started | — |
| Last Updated | — |
| Stages Completed | — |
```

**Writer guidance**: "This is resumability. If you run the pipeline, approve Stage 1 and Stage 2, then close your laptop for the night — tomorrow, Claude reads this tracker and knows: 'Topic is X, Stages 1-2 complete, resume at Stage 3.' It doesn't start over. The state file gives the pipeline memory."

**Step 5: Run the pipeline.**

The reader opens Claude Code in the `my-ai-systems/` directory:

```
claude
```

They type:

```
/content-pipeline Write an 800-word blog post about the three biggest mistakes people make when migrating to the cloud.
```

**What happens, stage by stage** (describe what the reader sees):

**Stage 1 — Research**: Claude searches the web. Finds articles, case studies, data points. Saves `content/pipeline/research-brief.md`. Shows the reader: "3 sources found. Angle: focus on mistakes that SEEM right (everyone makes them because they look smart) rather than obvious blunders. Exit criteria: [all checked]." Waits.

The reader reads the research brief. It has real sources. The angle is fresh. They say "continue."

**Stage 2 — Outline**: Claude reads the research brief. Loads the editorial voice skill. Creates a section structure: hook (a migration horror story), three mistakes (each with a real example from the research), close (the one question to ask before migrating). Saves `content/pipeline/outline.md`. Shows exit criteria. Waits.

The reader reads the outline. The structure is strong — each section builds on the last. They might say "swap mistake 2 and 3 — build from small to catastrophic." Claude adjusts. Then: "continue."

**Stage 3 — Draft**: Claude reads the outline. Loads both skills. Writes the full draft in the reader's voice. Saves `content/pipeline/draft.md`. Shows exit criteria self-check.

**Stage 4 — Review**: Hooks fire against the draft. verify-content-quality.sh checks for banned words, word count, sourcing. Voice consistency is checked against skill examples. Results: "All hooks pass. One [VERIFY] flag on a migration cost statistic — source found, flag resolved."

**Stage 5 — Polish**: Claude formats for blog publication. Saves `content/pipeline/final.md`. Updates content-state.md with the new piece. Clears the pipeline tracker.

**What the reader sees**: A finished blog post that's materially better than a single-pass draft. The research is deeper (3 sources, not 1). The structure is tighter (because the outline was approved before drafting). The voice is consistent throughout (because drafting was the ONLY task in Stage 3, not research + drafting + checking). The facts are verified (because review was its own stage, not an afterthought).

"That's the pipeline. Five stages, each focused, each checked. The system didn't do more work — it did the SAME work, but in order, with checkpoints. The quality difference comes from focus, not effort."

**Step 6: Test resumability.**

Tell the reader: "Run the pipeline again with a new topic. After Stage 2 (outline approved), close Claude Code. Open it again. Type: 'Continue the content pipeline.' Claude reads content-state.md, sees Stage 2 is complete, and picks up at Stage 3."

"You didn't re-explain the topic. You didn't re-run research. The pipeline has memory — because it writes to state. State (Ch 5) and Pipeline (Ch 9) work together."

---

### Section 5: Extend It — Pipelines for the Other Three Systems (~800 words)

Shorter walkthroughs — each gets a pipeline command file and a description of stages. Show the command file structure but not every line of content.

**Study System v6 — Deep Study Pipeline** (~300 words):

Create `my-ai-systems/.claude/commands/study-deep.md`:

Pipeline stages:

**Stage 1: IDENTIFY** — Read study-state.md for weak areas. Pick the weakest topic. Entry criteria: at least 3 quiz sessions logged (so weak areas are real data, not guesses).

**Stage 2: RESEARCH** — Search the web for explanations, tutorials, and practice resources on the weak topic. Find at least 3 sources. Save to `study-system/pipeline/research.md`.

**Stage 3: SYNTHESIZE** — Combine web findings with the reader's existing notes. Load study-method skill for the reader's learning preferences. Create a focused study brief: `study-system/pipeline/study-brief.md`. Exit criteria: the brief uses examples-first (or whatever the skill says), connects to concepts the reader already knows (from state), and is at the right level.

**Stage 4: PRACTICE** — Generate a quiz focused on the weak topic. 10 questions, calibrated to the gap between the reader's current understanding and the target level. Save to `study-system/pipeline/quiz.md`. Hook fires: verify-quiz-answers checks format and consistency.

**Stage 5: ANALYZE** — After the reader takes the quiz, analyze results. Update study-state.md: new scores, adjusted weak areas, mastery progress. If the topic scored above 70%, move it from "weak" to "moderate." Recommend next session focus.

"This pipeline turns your Study System from a tutor that quizzes you into a researcher that identifies your gaps, finds the best material, teaches it your way, tests you, and tracks your progress. All six components working: instructions define the pipeline, skills shape the teaching, state tracks progress, hooks verify quiz quality, connections find material, and the pipeline stages it all."

Create the pipeline workspace: `mkdir -p my-ai-systems/study-system/pipeline`

**Job Hunting System v6 — Application Pipeline** (~250 words):

Create `my-ai-systems/.claude/commands/job-apply.md`:

Pipeline stages:

**Stage 1: RESEARCH COMPANY** — Web search for the company: recent news, values, tech stack, culture, Glassdoor sentiment. Save to `job-hunting/pipeline/company-brief.md`. Exit criteria: at least 3 data points the reader can reference in the cover letter.

**Stage 2: TAILOR MATERIALS** — Load career-profile skill. Read job-state.md for prior applications and patterns. Draft a tailored cover letter and resume bullets. Save to `job-hunting/pipeline/materials.md`. Exit criteria: references company research, uses the resume version with the best callback rate (from state), under 400 words.

**Stage 3: QUALITY CHECK** — Hooks fire: verify-cover-letter (company name, word count, no fabrication), check-duplicate-application (haven't applied here before). Exit criteria: all hooks pass.

**Stage 4: PREPARE** — Generate interview prep notes based on company research. Common questions for this role type + company-specific talking points. Save to `job-hunting/pipeline/interview-prep.md`.

**Stage 5: TRACK** — Update job-state.md with the new application: company, role, date, resume version, cover letter approach, status "Applied." Calculate updated callback rates.

Create the pipeline workspace: `mkdir -p my-ai-systems/job-hunting/pipeline`

**Project Management System v6 — Status Report Pipeline** (~250 words):

Create `my-ai-systems/.claude/commands/status-report.md`:

Pipeline stages:

**Stage 1: GATHER** — Read project-state.md for current task status. If file system MCP is configured, pull latest meeting notes and updates. Compile raw data into `project-mgmt/pipeline/raw-data.md`.

**Stage 2: ANALYZE** — Identify: what's done since last report, what's blocked, what's at risk (overdue or approaching deadline), what changed. Save analysis to `project-mgmt/pipeline/analysis.md`. Exit criteria: analysis matches state file data (no invented progress).

**Stage 3: ROUTE** — Load PM methodology skill for audience formats. Generate TWO versions: executive summary (bullets, outcomes, risks) and team update (detailed actions, owners, deadlines). Save to `project-mgmt/pipeline/exec-summary.md` and `project-mgmt/pipeline/team-update.md`. Hook fires: check-audience-format verifies each matches the expected structure.

**Stage 4: VERIFY** — Hook fires: verify-status-consistency checks that task counts and statuses match the state file. Flag any discrepancy. Exit criteria: all hooks pass.

**Stage 5: UPDATE** — Update project-state.md with the report date, any status changes discussed, and new action items identified during analysis.

Create the pipeline workspace: `mkdir -p my-ai-systems/project-mgmt/pipeline`

---

### Section 6: Maintain It — Pipeline Bottlenecks (~350 words)

**Narrative beat**: Pipelines are the most complex component. They need monitoring — not just for errors, but for efficiency.

**Content**:

**Find the constraint.** Your pipeline is only as good as its weakest stage. Run it 3 times and notice: which stage takes the longest? Which stage fails its exit criteria most often? That's your bottleneck. Fix THAT stage. Ignore the rest.

Example: After 3 runs of the content pipeline, Stage 1 (research) takes 60% of the total time and fails exit criteria once (only found 2 sources instead of 3). The draft stage passes every time. The bottleneck is research — maybe the search queries need refining, or the exit criteria should specify "3 sources, but 2 high-quality sources count as sufficient." Fix research. Don't touch drafting.

**Track pipeline performance in state.** Add to your state file:

```markdown
## Pipeline Performance

| Date | Topic | Total Stages | Reworks | Bottleneck Stage | Total Time |
|------|-------|-------------|---------|-----------------|------------|
| | | | | | |
```

After 5 runs, you'll see the pattern. One stage is always the problem. Focus there.

**When to add a stage**: Only when you can name the failure it prevents. "It would be nice to have a formatting stage" is not enough. "Three times the review stage caught formatting issues that took 10 minutes to fix manually" — that's a reason. Name the failure, then add the stage.

**When to remove a stage**: If a stage passes 100% of the time for a month, ask: is the upstream stage so good that this check is redundant? Maybe the editorial-voice skill has gotten so precise that the voice-check in Stage 4 always passes. Remove it. Simpler pipelines are faster and less likely to break.

**When to skip stages**: Not every piece of content needs the full 5-stage pipeline. A quick social media post? Skip research and outlining — go straight to draft. Build this into your command: "For short-form content (under 300 words), skip Stages 1-2 and start at Stage 3." That's the Router pattern from Chapter 3, built into your pipeline.

---

### Section 7: System Diagram (~150 words)

**Content**:

```
                    CONTENT PIPELINE (5 stages)

[Topic]
   ↓
STAGE 1: RESEARCH → [research-brief.md] → Gate: 3+ sources? ──NO──→ Rework
   ↓ YES
STAGE 2: OUTLINE  → [outline.md]        → Gate: structure sound? ──NO──→ Rework
   ↓ YES
STAGE 3: DRAFT    → [draft.md]          → Gate: voice + facts? ──NO──→ Rework
   ↓ YES
STAGE 4: REVIEW   → [hooks fire]        → Gate: all pass? ──NO──→ Back to Stage 3
   ↓ YES
STAGE 5: POLISH   → [final.md]          → State updated
```

"All six components visible in one diagram. CLAUDE.md defines each stage's rules. Skills load before Stages 2 and 3. State tracks the pipeline's progress and the piece's metadata. Hooks fire at Stage 4. Connections power Stage 1's web search. And the pipeline stages it all. This is what a system looks like — not a prompt, not a chat, a system."

---

### Section 8: Break It on Purpose (~250 words)

**Narrative beat**: The reader proves the pipeline works by testing its quality gates and comparing staged vs. single-pass output.

**Content**:

**Test 1 — Skip a stage.** Run the pipeline but tell Claude "skip Stage 1, go straight to outlining." Without research, the outline is thinner — Claude falls back on general knowledge instead of specific sources. The draft has fewer concrete examples. Compare this to a full-pipeline draft. The difference is the cost of skipping research.

**Test 2 — Fail a quality gate.** During Stage 1, give Claude a topic where credible sources are scarce. Watch the exit criteria fail: "Only found 1 source. Exit criteria require 3." The pipeline stops. It doesn't charge ahead into outlining with inadequate research — it tells you the problem and waits. That's the gate holding.

**Test 3 — Compare single-pass to pipeline.** Ask Claude to write the same blog post topic in two ways: (A) single prompt, one pass, everything at once. (B) full content pipeline, all 5 stages. Read both. The pipeline version has better research (more sources), tighter structure (outline was approved separately), more consistent voice (drafting was the only task in Stage 3), and verified facts (hooks ran in Stage 4). The single-pass version is decent but not publish-ready.

**Test 4 — Test resumability.** Run the pipeline. Complete Stages 1-2. Close Claude Code. Reopen. Say "continue the content pipeline." Check that Claude picks up at Stage 3, not Stage 1. If it restarts from the beginning, the state tracking in content-state.md needs a clearer "Current Pipeline" section.

"The pipeline doesn't make Claude smarter. It makes Claude more focused — one job at a time, each job checked. That's what systems thinking buys you: not better AI, but better-organized AI."

---

### Section 9: Quality Gate (~250 words)

**Six checks** (one for each component, since this chapter completes them all):

1. **Pipeline command exists and runs.** `.claude/commands/content-pipeline.md` is in place. Typing `/content-pipeline` starts the workflow. Each stage produces a saved file in `content/pipeline/`.

2. **Quality gates catch problems.** At least one gate triggers a "rework" during your first pipeline run — insufficient research, weak outline, hook failure. The gate catches it before the next stage inherits the problem.

3. **Pipeline output is better than single-pass.** Side-by-side comparison: the pipeline version of a blog post has more sources, tighter structure, and more consistent voice than the single-pass version. The improvement is visible, not theoretical.

4. **Resumability works.** Stop the pipeline mid-way. Resume next session. Claude picks up at the correct stage without re-running completed stages.

5. **All six components are visible.** In one pipeline run, you can point to: CLAUDE.md loading (instructions), skill loading (expertise), state reading/writing (memory), hooks firing (quality checks), web search running (connections), and stages executing in order (pipeline). All six. One system.

6. **You can name the complete system.** "My Content System has six components: instructions tell Claude what to do. Skills tell it how to write in my voice. State tracks what I've published and where the pipeline is. Hooks check every draft for banned words, unsourced claims, and word count. Connections let Claude research topics online. And the pipeline breaks production into five stages — research, outline, draft, review, polish — with a quality gate between each one. That's not a prompt. That's a system."

---

## Files the Reader Creates

| File | Location | Purpose |
|------|----------|---------|
| `content-pipeline.md` | `.claude/commands/` | 5-stage content production workflow |
| `study-deep.md` | `.claude/commands/` | Multi-stage deep study session |
| `job-apply.md` | `.claude/commands/` | Application preparation pipeline |
| `status-report.md` | `.claude/commands/` | Weekly status report generation |
| `content/pipeline/` | `content/` | Directory for content pipeline artifacts |
| `study-system/pipeline/` | `study-system/` | Directory for study pipeline artifacts |
| `job-hunting/pipeline/` | `job-hunting/` | Directory for job hunting pipeline artifacts |
| `project-mgmt/pipeline/` | `project-mgmt/` | Directory for PM pipeline artifacts |

Plus updates to `content/content-state.md` (adding "Current Pipeline" tracker and "Pipeline Performance" section).

## Complete Folder Structure After Chapter 9

This is the complete `my-ai-systems/` directory — every file the reader has created across Chapters 4-9. All four systems at v6, all six components in place.

```
my-ai-systems/
├── CLAUDE.md                              ← root shared rules (Ch 4)
├── .claude/
│   ├── settings.json                      ← hooks (Ch 7) + permissions + MCP config (Ch 8)
│   ├── skills/
│   │   ├── editorial-voice.md             ← (Ch 6)
│   │   ├── content-standards.md           ← (Ch 6)
│   │   ├── study-method.md                ← (Ch 6)
│   │   ├── career-profile.md              ← (Ch 6)
│   │   └── pm-methodology.md              ← (Ch 6)
│   ├── hooks/
│   │   ├── verify-cover-letter.sh         ← (Ch 7)
│   │   ├── check-duplicate-application.sh ← (Ch 7)
│   │   ├── verify-quiz-answers.sh         ← (Ch 7)
│   │   ├── check-weak-area-focus.sh       ← (Ch 7)
│   │   ├── verify-status-consistency.sh   ← (Ch 7)
│   │   ├── check-audience-format.sh       ← (Ch 7)
│   │   └── verify-content-quality.sh      ← (Ch 7)
│   └── commands/
│       ├── content-pipeline.md            ← (Ch 9) 5-stage content production
│       ├── study-deep.md                  ← (Ch 9) multi-stage deep study
│       ├── job-apply.md                   ← (Ch 9) application preparation
│       └── status-report.md              ← (Ch 9) weekly status generation
├── study-system/
│   ├── CLAUDE.md                          ← (Ch 4, updated Ch 5-6, Ch 8: Connections)
│   ├── study-state.md                     ← (Ch 5)
│   └── pipeline/                          ← (Ch 9) intermediate artifacts
│       ├── research.md                    ← generated by study-deep pipeline
│       ├── study-brief.md                 ← generated by study-deep pipeline
│       └── quiz.md                        ← generated by study-deep pipeline
├── job-hunting/
│   ├── CLAUDE.md                          ← (Ch 4, updated Ch 5-6, Ch 8: Connections)
│   ├── job-state.md                       ← (Ch 5)
│   └── pipeline/                          ← (Ch 9) intermediate artifacts
│       ├── company-brief.md               ← generated by job-apply pipeline
│       ├── materials.md                   ← generated by job-apply pipeline
│       └── interview-prep.md              ← generated by job-apply pipeline
├── project-mgmt/
│   ├── CLAUDE.md                          ← (Ch 4, updated Ch 5-6, Ch 8: Connections)
│   ├── project-state.md                   ← (Ch 5)
│   └── pipeline/                          ← (Ch 9) intermediate artifacts
│       ├── raw-data.md                    ← generated by status-report pipeline
│       ├── analysis.md                    ← generated by status-report pipeline
│       ├── exec-summary.md                ← generated by status-report pipeline
│       └── team-update.md                 ← generated by status-report pipeline
└── content/
    ├── CLAUDE.md                          ← (Ch 4, updated Ch 5-6, Ch 8: Connections)
    ├── content-state.md                   ← (Ch 5, updated Ch 9: pipeline tracker)
    └── pipeline/                          ← (Ch 9) intermediate artifacts
        ├── research-brief.md              ← generated by content-pipeline
        ├── outline.md                     ← generated by content-pipeline
        ├── draft.md                       ← generated by content-pipeline
        └── final.md                       ← generated by content-pipeline
```

## Technical Notes for the Writer

- **The content pipeline command file is the chapter's centerpiece.** Give it the full treatment — walk through each stage, explain exit criteria, show what artifacts look like. The reader should understand every line. The extension pipelines (study, job, PM) can be shown at summary level because the reader now understands the pattern.
- **`.claude/commands/` is the Claude Code feature that enables pipelines.** Markdown files in this directory become custom slash commands. The reader types `/content-pipeline` and Claude follows the stages defined in the file. This is the simplest, most approachable way to implement multi-stage workflows. Don't introduce more complex orchestration tools.
- **Exit criteria are the conceptual core.** The difference between a pipeline and "a long prompt that says do A then B then C" is the EXIT CRITERIA. A long prompt produces all outputs in one pass with no checkpoints. A pipeline checks each output before proceeding. Hammer this distinction. "Exit criteria are the quality gates. Without them, you have a to-do list, not a pipeline."
- **"Wait for my approval" is a design choice, not a requirement.** The content pipeline has human checkpoints at Stages 1-2 (research and outline) but runs Stages 3-5 more automatically. This reflects real content production: you want to review direction before committing to a draft, but once the structure is set, the mechanical stages can run. The reader can adjust — more or fewer human checkpoints — based on their trust level. Over time, they'll likely remove checkpoints as the system proves reliable.
- **Resumability connects back to state (Ch 5).** The "Current Pipeline" tracker in content-state.md is a state pattern applied to the pipeline itself. The pipeline uses the state file to remember where it stopped. Point this out: "Ch 5 gave your system memory. Ch 9 gives your pipeline memory. Same pattern, higher level."
- **Pipeline artifacts should be real, readable files.** The reader should be able to open `content/pipeline/research-brief.md` and read it like a document. Not JSON, not structured data — markdown they can review, edit, and approve. This is transparency: the pipeline's work is visible at every stage.
- **The single-pass vs. pipeline comparison (Test 3) is the chapter's most convincing moment.** Same topic, same system, same components — different results. The only variable is staging. Let the quality difference speak for itself.
- **Don't oversell subagents.** The reader doesn't need to understand Claude's internal delegation mechanics. They need to write a good command file with clear stages. Claude handles the execution. If the writer mentions subagents, keep it to one sentence: "Claude treats each stage as a focused task because your command file defines clear boundaries between them."
- **The Router pattern from Ch 3 reappears.** In the maintenance section, suggest routing: "For short-form content, skip Stages 1-2." This is a callback to Ch 3's design patterns, now implemented. The reader has come full circle — they learned the pattern in theory, now they're using it in a real pipeline.
- **This chapter closes the build arc.** After Ch 9, all four systems have all six components. The writer should mark this moment: "You started with a prompt. You now have a system. Actually, four systems — each with instructions, memory, expertise, quality checks, external connections, and staged workflows. That's what this book has been building toward." Don't over-celebrate, but acknowledge the milestone. The reader has done real work to get here.
- **Voice**: This chapter should feel like a culmination. Not breathless or congratulatory — but the reader should sense they've arrived somewhere meaningful. The tone is confident: "This is what systems look like. You built this." The excitement comes from the comparison in Test 3: seeing the same AI produce materially better work simply because the work was organized into stages.

---

# Cross-Chapter Summary: Reader's System After Ch 8-9

| Component | Introduced | What It Does | Reader Has |
|-----------|-----------|-------------|------------|
| Prompt (CLAUDE.md) | Ch 4 | Persistent instructions | 5 files (root + 4 systems) |
| State | Ch 5 | Session memory | 4 state files |
| Skill | Ch 6 | Loaded expertise | 5 skill files |
| Hook | Ch 7 | Automated checks | 7 hook scripts + settings.json |
| Connection | Ch 8 | External data access | Web search + optional MCP in settings.json |
| Pipeline | Ch 9 | Multi-stage workflows | 4 command files + 4 pipeline directories |

**Universal concepts covered**: Instruction (Ch 4, 6), Memory (Ch 5), Control (Ch 7), Flow (Ch 8, 9).

**All four systems are now at v6 with all six components.** The build arc is complete.

**What remains**: Ch 10 (debugging — what to do when systems break), Ch 11 (composition — wiring systems together), Ch 12 (designing new systems from scratch), Ch 13 (what's next — systems that grow with you). No new components — only mastery of the ones built in Ch 4-9.
