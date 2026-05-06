# Act 2, Part II-III — Detailed Chapter Outlines

*Chapters 5, 6, 7: State, Skill, Hook*
*CLI-demonstrated, interface-agnostic. Each chapter introduces one component, does a deep build on one throughline system, extends to the other three.*

*The reader enters Act 2 Part II with 5 CLAUDE.md files (1 root + 4 systems), working Claude Code sessions, and the habit of writing structured instructions in persistent files. They leave Part III with state files tracking progress, skill documents loading expertise, and hook scripts catching mistakes — all four systems at v4.*

---

# Chapter 5: State Files — Teaching Your Systems to Remember

**Title**: State Files — Teaching Your Systems to Remember
**Word target**: 3,500–4,500 words
**Component introduced**: State (a file that persists data across sessions)
**Primary system**: Job Hunting (deep build)
**Other systems**: Study, Project Management, Content (extend)
**Universal concept**: Memory
**Claude Code feature**: State files — markdown files the system reads at session start and writes at session end

---

## Bridge from Chapter 4

The reader finished Ch 4 with:
- 5 CLAUDE.md files (1 root + 4 system-specific)
- Four working v1 systems — each produces good output for a single session
- The habit of creating persistent instruction files instead of pasting prompts
- A clear gap they can name: "It doesn't remember what happened last session"

Ch 5 closes that gap. The reader builds a file that carries forward what happened — applications submitted, scores recorded, tasks completed, pieces drafted. The AI reads it at session start, writes to it at session end. The system now has a feedback loop.

---

## Chapter Goals

By the end of this chapter, the reader can:

1. **Create a state file** that tracks structured data across sessions (status tables, session logs, derived insights)
2. **Update their CLAUDE.md** to tell the AI to read the state file at session start and write to it at session end
3. **Run a system across 3+ sessions** and verify that session 3 references data from session 1 without the reader re-explaining anything
4. **Recognize the three state patterns** (status table, session log, derived field) and choose the right one for a task
5. **Practice state hygiene** — archiving stale data, keeping active state lean, knowing when the file is too long

---

## Section-by-Section Breakdown

### Section 1: The Problem (~300 words)

**Narrative beat**: Concrete scenario — the reader feels the pain of no memory in the domain where it hurts most.

**Content**:

Open with a job hunting scenario the reader has lived or can vividly imagine:

You applied to 6 jobs last week. You open Claude Code in your `job-hunting/` folder. You paste a new job posting. Claude drafts a solid cover letter — but it doesn't know you already applied to this company's competitor last Tuesday with a different angle. It doesn't know which resume version got you a callback. It doesn't know you've been emphasizing "data infrastructure" in your last 3 letters because that's what's working. It starts from zero. Every. Single. Time.

You could paste all of that context into your prompt. But after 20 applications, that paste is 3 pages long. After 50, it's unmanageable. And you're the one maintaining it — by hand, in a text file, copying and pasting like it's 2004.

The CLAUDE.md told Claude WHO you are. But it can't tell Claude what HAPPENED. Instructions are static. Your job search is dynamic — it changes every day.

**One-sentence component introduction**: A state file is a document the AI reads at the start of every session and writes to at the end — so the system remembers what happened without you re-explaining it.

---

### Section 2: See the System (~150 words)

**Narrative beat**: Show the current system architecture and name the gap.

**Content**:

Here's what your Job Hunting System looks like right now:

```
[Job posting] + [CLAUDE.md auto-loaded] → [Claude] → [Cover letter + resume bullets]
```

Good output. No feedback arrow. Each session is independent. The system has Instruction but no Memory.

Here's what it looks like after this chapter:

```
[Job posting] + [CLAUDE.md + State read] → [Claude] → [Output + State write]
                                                              ↓
                                                    [State file updated]
```

The feedback arrow appears. The system remembers.

---

### Section 3: The New Component — State Files (~350 words)

**Narrative beat**: Explain what a state file is, in plain language, with the failure it prevents.

**Content**:

A state file is a markdown document that lives in your system's folder. It tracks what happened — not what you want (that's CLAUDE.md), but what IS. Applications submitted, dates, statuses, outcomes, patterns.

The AI reads it at the start of every session. Writes to it at the end. You don't paste it. You don't copy it. It loads automatically because you'll add one line to your CLAUDE.md telling Claude where it is and what to do with it.

**Three state patterns** (introduced here, used in every system going forward):

**Status table**: Rows of items with columns — like a spreadsheet in markdown. Each row is an application, a task, a topic, a draft. Each column tracks something: date, status, outcome.

| Company | Role | Date Applied | Resume Version | Status | Notes |
|---------|------|-------------|----------------|--------|-------|
| Stripe | Sr PM | 2025-04-12 | v3-data | Phone screen scheduled | Emphasized data infra |
| Notion | PM Lead | 2025-04-14 | v2-general | Applied | Generic approach — test |

**Session log**: Timestamped entries of what happened. Useful when the work is sequential — study sessions, drafts, project meetings.

**Derived fields**: Calculated from raw data. "Callback rate by resume version." "Average quiz score by topic." "Completion percentage." The AI updates these when it writes to state. These are where patterns emerge.

**The failure it prevents**: Without state, the system treats every session as day one. With state, session 10 is informed by sessions 1–9. That's the difference between 10 isolated cover letters and a campaign that learns.

---

### Section 4: Build It — Job Hunting System v2 (Deep Build) (~1,800 words)

**Components Used**: `[Prompt (CLAUDE.md)] + [State (NEW)]`
**New this chapter**: `[State]`

This is the heart of the chapter — 70% of the build energy. Step-by-step, every file shown, every command shown.

**Step 1: Create the state file.**

The reader creates `job-hunting/job-state.md`:

```markdown
# Job Hunting State

## Applications

| # | Company | Role | Date Applied | Resume Version | Cover Letter Approach | Status | Callback? | Notes |
|---|---------|------|-------------|----------------|----------------------|--------|-----------|-------|
| | | | | | | | | |

## Resume Versions

| Version | Emphasis | Where Sent | Callback Rate |
|---------|----------|-----------|---------------|
| v1-general | Broad PM experience | — | — |

## Patterns & Insights

(After 5+ applications, Claude will note what's working and what isn't.)

## Interview Log

| Company | Date | Questions Asked | What Went Well | What I'd Change |
|---------|------|----------------|----------------|-----------------|

## Next Actions

- [ ] (Claude updates this at session end)
```

**Writer guidance**: Show the full file. The reader types this. It's intentionally sparse — the table headers are there but the rows are empty. The system fills them in. Point out: "This looks like an empty spreadsheet. That's intentional. The AI populates it. You don't maintain it by hand — that's the whole point."

**Step 2: Update the CLAUDE.md to use the state file.**

The reader opens `job-hunting/CLAUDE.md` and adds a new section:

```markdown
## State File

Read `job-state.md` at the start of every session. Before you do anything,
check what's in there — applications I've submitted, patterns you've noticed,
resume versions that are getting callbacks.

At the end of every session, update `job-state.md`:
- Add any new applications to the Applications table
- Update statuses if I tell you about callbacks, interviews, or rejections
- Recalculate Callback Rate in the Resume Versions table
- Update Patterns & Insights if you notice something
- Update Next Actions based on what we did today

Never delete rows from the Applications table. If something is old, mark
the status as "Archived" — don't remove it.
```

**Writer guidance**: This is a critical moment. The reader is learning that CLAUDE.md doesn't just describe who they are — it tells the AI HOW TO USE other files. The instruction file orchestrates the state file. Make this explicit: "Your CLAUDE.md just became a conductor. It tells Claude what files exist, when to read them, and when to write them."

**Step 3: Run Session 1 — first application.**

The reader opens Claude Code in `job-hunting/`:

```
claude
```

They paste a real job posting (or a realistic one). They tell Claude to draft a tailored cover letter and resume bullets.

**What happens** (describe what the reader sees):
- Claude reads CLAUDE.md (their career info, format preferences, constraints)
- Claude reads `job-state.md` (empty — first session)
- Claude drafts the cover letter and resume bullets — same quality as Ch 4
- Claude writes to `job-state.md`: adds the application to the table, notes the resume version used, records the cover letter approach (e.g., "emphasized data infrastructure"), sets status to "Applied"

**What to check**: Open `job-state.md`. It now has one row in the Applications table. The system wrote it. You didn't.

**Step 4: Run Session 2 — second application, different job.**

New session. Paste a different job posting.

**What happens**:
- Claude reads CLAUDE.md + `job-state.md` (now has one row)
- Claude sees Application #1. It knows the reader emphasized data infrastructure last time.
- For this new posting (say it's a different kind of role), Claude adjusts. If the role calls for a different strength, Claude uses a different resume version or creates a new one. The cover letter takes a different angle — not because the reader told it to, but because the state file shows what was already used.
- Claude writes to state: adds Application #2, notes the different approach, updates Resume Versions table.

**What to notice**: "You didn't tell Claude about Application #1. You didn't paste your notes. It read the state file. Session 2 is informed by Session 1 automatically."

**Step 5: Run Session 3 — the pattern emerges.**

Reader tells Claude that Application #1 got a callback but Application #2 hasn't heard back.

**What happens**:
- Claude updates statuses in the state file
- Claude recalculates callback rate: v3-data resume → 100% (1/1), v2-general → 0% (0/1)
- Claude notes in Patterns & Insights: "Data infrastructure emphasis getting callbacks. General approach not converting."
- For the next application, Claude recommends the data-infrastructure angle unprompted — the state informed the strategy.

**What to notice**: "After 3 sessions, the system has an opinion. Not because you programmed an opinion — because the data in the state file reveals a pattern, and Claude surfaces it. That's the feedback loop. That's what Memory does."

**Writer guidance**: This is the chapter's big payoff moment. The reader should feel the difference viscerally — the system is LEARNING from its own history. Linger here. Don't rush to the extensions.

---

### Section 5: Extend It — State Files for the Other Three Systems (~600 words)

Shorter walkthroughs — each gets a state file and a CLAUDE.md update. NOT full step-by-step. Show the file, explain the key fields, describe what 3 sessions looks like.

**Study System v2** (~200 words):

Create `study-system/study-state.md`:
- Topics table: topic, date covered, quiz score, mastery level (weak/moderate/strong)
- Session log: date, what was covered, score, key takeaways
- Weak Areas: topics scored < 70% more than once — auto-calculated
- Next Session Focus: Claude updates based on weak areas

Update `study-system/CLAUDE.md` to read/write state.

What 3 sessions look like: Session 1 covers broad topics, baseline scores. Session 2 focuses on weak areas from Session 1 instead of random coverage. Session 3 shows progress — weak areas shrinking, mastery building. The reader stops re-explaining their level. The state file IS their level.

**Project Management v2** (~200 words):

Create `project-mgmt/project-state.md`:
- Tasks table: task, owner, status (not started/in progress/done/blocked), dependency, due date
- Decisions log: date, decision, rationale, who decided
- Completed this week: timestamped
- Blocked items: what's blocked, why, what unblocks it

Update `project-mgmt/CLAUDE.md`.

What 3 sessions look like: Session 1 creates the initial task breakdown. Session 2 — reader updates Claude on what's done and what's blocked. Claude updates the state, recalculates timeline, flags risks. Session 3 — Monday morning, Claude reads state and generates a status report without the reader summarizing the week.

**Content System v2** (~200 words):

Create `content/content-state.md`:
- Pieces table: title, topic, date drafted, status (draft/published/shelved), performance notes
- Topics covered: prevents repetition
- Editorial calendar: upcoming topics and dates
- What's working: notes on audience response (reader updates manually when they have data)

Update `content/CLAUDE.md`.

What 3 sessions look like: Session 1 drafts a piece, logs it. Session 2 — Claude knows what was already written, picks a different angle. Session 3 — Claude notices the reader has covered topic X from three angles and suggests moving to topic Y. No more accidental repetition.

---

### Section 6: Maintain It — State Hygiene (~300 words)

**Narrative beat**: The first maintenance lesson. Systems aren't build-and-forget. State files need upkeep — or they rot.

**Content**:

**When to archive**: If your Applications table has 50 rows and 40 are "Rejected" or "Ghosted," those 40 are noise. Move them to an `## Archive` section at the bottom of the file — or a separate `job-state-archive.md`. Keep active state lean: items with status "Applied," "Phone Screen," "Interview," or "Offer."

**The 50-row rule of thumb**: If the AI starts ignoring entries near the bottom of a table, or if sessions feel slower at startup, the state file is too long. Cut it. Archive old entries. The AI's attention is finite — treat your state file like its working memory, not its filing cabinet.

**What to keep active**: Only items with a status that matters for the current session. Everything else is archive.

**The monthly check**: Set a calendar reminder. 30 minutes. Open each state file. What's stale? What's missing? What pattern should be captured that isn't? This is the equivalent of cleaning your desk — unglamorous, necessary, prevents drift.

**How to know state is healthy**: Open your state file and read it like the AI will. Does it tell a clear, current story? Or does it read like a cluttered database? If you can't parse it quickly, neither can the AI.

---

### Section 7: System Diagram (~100 words)

**Content**:

```
[Job posting] + [Root CLAUDE.md + Job Hunting CLAUDE.md + job-state.md]
                              ↓
                          [Claude]
                              ↓
              [Cover letter + Resume bullets]
                              ↓
                    [job-state.md updated]
                    (new application row,
                     callback rates recalculated,
                     patterns & insights updated)
```

"The feedback arrow is real now. The system's output includes updating its own memory. Session 10 is informed by sessions 1–9."

Reference the Mermaid diagram for all four systems at v2.

---

### Section 8: Break It on Purpose (~150 words)

**Narrative beat**: The reader proves the component works by testing what happens when it fails.

**Content**:

**Test 1 — Delete the state file.** Rename `job-state.md` to `job-state-backup.md`. Start a new session. Paste a job posting. Claude drafts a cover letter — but it's generic. No reference to prior applications. No pattern-based recommendations. No "last time you emphasized data infrastructure and got a callback." The system is back to Ch 4.

**Test 2 — Feed a duplicate.** Paste the same job posting from Application #1. If state is working, Claude should flag it: "You already applied to [Company] for [Role] on [Date] — status: [X]. Do you want to apply again, or update the existing application?" If it doesn't flag it, the CLAUDE.md instructions for reading state need to be more explicit.

Restore the backup. Verify the system remembers again.

---

### Section 9: Quality Gate (~150 words)

**Five checks**:

1. **State file exists and is populated.** Open `job-state.md`. It has real data from at least 2 sessions — rows in the Applications table, dates, statuses.

2. **Session 3 references Session 1.** In your third session, Claude mentions something from the first session (an application, a pattern, a recommendation) WITHOUT you re-explaining it.

3. **Derived insights appear.** After 3+ entries, the Patterns & Insights section has something Claude wrote — a callback rate, a trend, a recommendation based on data.

4. **Duplicate detection works.** Paste a previously-used job posting. Claude flags it or references the prior application.

5. **You can name the gap.** You can explain to someone: "The CLAUDE.md tells the system how I work. The state file tracks what happened. Together, the system has both instructions and memory. What's still missing: it doesn't have expertise loaded (that's skills, next chapter) and it doesn't have automated checks (that's hooks, Chapter 7)."

---

## Files the Reader Creates

| File | Purpose |
|------|---------|
| `job-hunting/job-state.md` | Application tracker, resume versions, patterns, interview log |
| `study-system/study-state.md` | Topics, quiz scores, weak areas, session log |
| `project-mgmt/project-state.md` | Tasks, decisions, completed work, blocked items |
| `content/content-state.md` | Pieces drafted, topics covered, calendar, performance |

Plus CLAUDE.md updates in all 4 system folders (adding the "State File" section with read/write instructions).

## Technical Notes for the Writer

- **The CLAUDE.md update is the key teaching moment.** The reader learns that CLAUDE.md orchestrates other files — it's not just a bio, it's a conductor that tells the AI what to read and write. This concept carries forward to skills (Ch 6) and hooks (Ch 7).
- **State files are markdown, not JSON or YAML.** Keep it accessible. Tables are markdown tables. Logs are bullet points with dates. The reader should be able to open the file and read it like a document.
- **Show abbreviated state after each session.** Don't show 50 rows — show 2-3 rows after each session so the reader sees it growing. Use `...` for omitted rows.
- **The "pattern emerges" moment in Step 5 is the chapter climax.** Build to it. The reader should feel the system getting smarter — not because they programmed intelligence, but because accumulated data reveals patterns.
- **Don't teach archiving as a chore.** Frame it as: "Your state file is the AI's working memory. A cluttered desk makes for bad work. A clean state file makes for sharp sessions."
- **Forward teaser**: "The state file tells Claude what happened. But it doesn't tell Claude how to do the work well — your voice, your methodology, your standards. That's expertise. Chapter 6 loads it on demand."
- **Voice**: Keep it practical, not reverent. State files are useful, not magical. "It's a text file that the AI reads and writes. The magic isn't the file — it's what happens when 10 sessions of data accumulate."

---
---

# Chapter 6: Skills — Loading Expertise On Demand

**Title**: Skills — Loading Expertise On Demand
**Word target**: 3,500–4,500 words
**Component introduced**: Skill (a reusable knowledge document Claude loads before working)
**Primary system**: Content System (deep build)
**Other systems**: Study, Job Hunting, Project Management (extend)
**Universal concept**: Instruction (advanced — persistent, reusable knowledge)
**Claude Code feature**: `.claude/skills/` directory + `SKILL.md` files loaded by keyword match or manually via `@skill-name`

---

## Bridge from Chapter 5

The reader finished Ch 5 with:
- 5 CLAUDE.md files (root + 4 systems)
- 4 state files tracking data across sessions
- The feedback loop working — systems remember what happened
- A clear remaining gap: the systems know WHAT happened, but not HOW to do the work well. Claude writes decent cover letters, but they're generic — because it doesn't know the reader's voice. Claude drafts blog posts, but they sound like AI — because it doesn't have the reader's editorial standards loaded. The system has memory but not expertise.

Ch 6 adds loaded expertise. The reader builds skill documents — reusable knowledge files that Claude reads before doing work — so the AI has domain knowledge, not just instructions.

---

## Chapter Goals

By the end of this chapter, the reader can:

1. **Explain the difference between a prompt, a CLAUDE.md, and a skill**: prompts change per task, CLAUDE.md defines how the system works, skills carry domain expertise that applies across many tasks
2. **Create a skill file** in the `.claude/skills/` directory following the SKILL.md format (frontmatter + structured content)
3. **Build a voice skill** from real writing samples — not self-description, but examples the AI learns FROM
4. **Update their CLAUDE.md** to reference skills and tell the AI when to load them
5. **Recognize the state-to-skill feedback loop**: corrections captured in state become rules in the skill, which produces better output, which requires fewer corrections
6. **Practice skill versioning** — noting changes, rolling back when a new version is worse

---

## Section-by-Section Breakdown

### Section 1: The Problem (~300 words)

**Narrative beat**: The reader's Content System produces output that sounds like AI, not like them. The state file tracks what was written, but can't fix HOW it's written.

**Content**:

You've drafted 3 blog posts with your Content System. The state file works — Claude knows what you've already covered, avoids repetition, picks complementary topics. But read those 3 drafts side by side.

They sound like AI.

Not terrible AI — they follow your CLAUDE.md constraints. No "leverage" or "delve." The word count is right. The structure is fine. But the voice is... flat. Generic. If someone who reads your real writing saw these, they'd say "this doesn't sound like you."

Your CLAUDE.md says "my tone is conversational, like explaining to a smart friend over coffee." That's a rule. But it's not expertise. The AI follows the rule — it avoids formal language, keeps sentences short — but it can't reproduce your SPECIFIC voice because it's never seen your voice. It's guessing at "conversational" based on a one-sentence description.

You could paste samples of your writing into the prompt every session. But that's manual. It's long. It clogs the context with 2,000 words of examples before you even ask for anything. And you'd paste the same examples every single time.

You need a file that carries your expertise — your voice, your standards, your editorial preferences — and loads automatically when the system does content work. Not instructions ("be conversational"). Evidence ("here's what conversational looks like when I write it").

**One-sentence component introduction**: A skill is a reusable knowledge document the AI loads before working — not instructions for what to do, but expertise for how to do it well.

---

### Section 2: See the System (~150 words)

**Content**:

Your Content System right now:

```
[Topic] + [CLAUDE.md + content-state.md] → [Claude] → [Draft + State write]
```

Instructions + memory. But no expertise loaded. Claude knows WHAT to write (from the prompt), knows WHAT you've already written (from state), but doesn't know HOW you write.

After this chapter:

```
[Topic] + [CLAUDE.md + Skill loaded + State read] → [Claude] → [Draft + State write]
```

The skill sits alongside the CLAUDE.md — both load before Claude works. But they do different things: CLAUDE.md says "write an 800-word blog post." The skill says "here's what my writing actually sounds like, here are my editorial standards, here are the specific things that make my content mine."

---

### Section 3: The New Component — Skills (~400 words)

**Narrative beat**: Explain what a skill file is, how it differs from CLAUDE.md, and the Claude Code feature that makes it work.

**Content**:

**The difference between prompts, CLAUDE.md, and skills** (teach through a specific example, not abstract taxonomy):

Your CLAUDE.md says: "Write in a conversational tone."
A skill file shows: 3 paragraphs of YOUR conversational tone — real sentences you wrote, with annotations about what makes them yours.

Your CLAUDE.md says: "Keep cover letters under 400 words."
A skill file shows: a cover letter that got a callback, annotated with why it worked.

CLAUDE.md = what to do. Skill = how to do it well.

**The Claude Code feature**: Claude Code has a built-in concept for this — the `.claude/skills/` directory. You create a folder called `.claude/skills/` at the root of your project. Inside it, you put markdown files. Each one is a skill — a domain of expertise. Claude loads them based on what you're working on.

The file format is simple: a small header block (called frontmatter — just a name and description between `---` lines) followed by the skill content. That's it. Markdown. The same format you've been writing.

```
---
name: editorial-voice
description: My writing voice, style patterns, and editorial standards. Load when drafting any content.
---

(skill content goes here)
```

**When Claude loads skills**: You can reference them explicitly ("use the editorial-voice skill") or Claude loads them when the description matches what you're doing. The description line is the trigger — write it clearly and Claude finds it when relevant.

**How skills differ from state**:
- State changes every session (new applications, new scores, new drafts)
- Skills change rarely — they're stable expertise that evolves slowly
- State tracks what happened. Skills define how to do things well.
- Both live as files. Both load automatically. Different purpose.

**Skill design principle** (the core rule): Show, don't describe. Three examples of your real writing teach Claude more about your voice than 500 words of rules describing your voice. Put the examples in the skill. Cut the rules.

---

### Section 4: Build It — Content System v3 (Deep Build) (~1,800 words)

**Components Used**: `[Prompt (CLAUDE.md)] + [State] + [Skill (NEW)]`
**New this chapter**: `[Skill]`

**Step 1: Create the skills directory.**

```
mkdir -p my-ai-systems/.claude/skills
```

**Writer guidance**: Point out that `.claude/` is a hidden folder (starts with a dot). On Mac/Linux, it won't show in a regular file listing — use `ls -a` to see it. The reader should understand this is a Claude Code convention: the `.claude/` folder holds system configuration, skills, and (later) hooks. It's the "engine room" of their AI system.

Also explain the directory placement: `.claude/skills/` goes at the ROOT of `my-ai-systems/`, not inside each system folder. Skills are shared across systems — the editorial voice skill loads when doing content work, but the same career-profile skill could load in job hunting OR content (if writing about professional topics). Skills are expertise, not system-specific.

**Step 2: Build the editorial voice skill.**

Create `my-ai-systems/.claude/skills/editorial-voice.md`:

```markdown
---
name: editorial-voice
description: My writing voice, patterns, and style. Load when drafting any written content — blog posts, newsletters, social media.
---

# Editorial Voice

## My Writing — Real Examples

(The reader pastes 3-5 paragraphs from their own real writing here.
Show a placeholder example that's clearly marked as "replace this with
YOUR writing." Use a fictional example that demonstrates the concept —
a blog post paragraph that has a distinctive voice.)

### Example 1: Blog opening
"[Paste a paragraph from something you actually wrote and published
or shared. The more representative, the better.]"

### Example 2: Explaining something technical
"[Paste a paragraph where you explained something complex to your
audience. This teaches Claude how you handle complexity.]"

### Example 3: Strong close
"[Paste how you end pieces. The closing voice is often where AI
drifts most — your real examples anchor it.]"

## Voice Patterns

Words I use: [list 5-10 words or phrases that are distinctly yours]
Words I never use: [list banned words — AI-isms, jargon, phrases
  that aren't you]

Sentence rhythm: [short? Long and layered? Mix of both? Describe
  by pointing to your examples above.]

How I open pieces: [with a question? A story? A bold claim? A
  scenario? Point to Example 1.]

How I close pieces: [with a call to action? A callback to the
  opening? A question for the reader? Point to Example 3.]

## What Makes My Content Different

[One paragraph. What's the specific edge — the thing that makes
your content recognizably yours? Not "I'm authentic" — something
concrete. "I use client stories with exact numbers." "I always
connect abstract concepts to something the reader did today."
"I challenge the standard advice in my field."]
```

**Writer guidance**: This is the most personal step in the book so far. The reader is putting their actual voice into a file. Acknowledge the weirdness: "This feels strange — describing your own voice. The trick is to let your examples do most of the talking. Claude learns more from reading your writing than from reading your description of your writing."

**Step 3: Build the content standards skill.**

Create `my-ai-systems/.claude/skills/content-standards.md`:

```markdown
---
name: content-standards
description: Editorial standards, fact-checking rules, and format requirements for all content. Load alongside editorial-voice when drafting.
---

# Content Standards

## Fact-Checking

Every factual claim needs one of:
- A source link
- A "based on my experience" qualifier
- A flag: "[VERIFY: need source for this claim]"

No confident claims without backing. If Claude can't verify
something, it flags it rather than stating it as fact.

## Structure by Format

### Blog Post (800-1,200 words)
- Hook in the first sentence — not "In today's world"
- One clear argument that builds across the piece
- At least one specific example or story (not hypothetical)
- Close that gives the reader something to do or think about

### Newsletter (400-600 words)
- Personal anecdote in the first paragraph
- One insight, not a survey of many
- Direct, like an email to a smart friend

### Social Post (under 280 characters or thread)
- One sharp point per post
- No hedging
- Thread: first tweet must stand alone

## Quality Checks (Self-Review)
Before delivering any draft, verify:
- [ ] Opens with a hook, not a setup paragraph
- [ ] No banned words from editorial-voice skill
- [ ] Every claim has a source or flag
- [ ] Word count within target range
- [ ] Reads like my voice, not AI voice (compare to examples)
```

**Step 4: Update the Content System's CLAUDE.md.**

Open `content/CLAUDE.md` and add:

```markdown
## Skills

When drafting any content, load these skills:
- `editorial-voice` — my writing voice and style patterns
- `content-standards` — format requirements, fact-checking rules, quality checks

Read the voice examples in `editorial-voice` BEFORE writing. Match
the rhythm, word choice, and tone of those examples — not a generic
"conversational" tone, but MY specific conversational tone.

After drafting, run the Quality Checks from `content-standards`
before delivering the draft. Flag anything that fails.
```

**Writer guidance**: This is the second time the reader updates CLAUDE.md to orchestrate other files (first was state in Ch 5). Reinforce the pattern: "CLAUDE.md is your conductor. In Ch 5, it told Claude to read and write state. Now it tells Claude to load skills. The CLAUDE.md doesn't contain the expertise — it points to it."

**Step 5: Run the system — draft a piece.**

The reader opens Claude Code in `content/`:

```
claude
```

They give a topic. Claude loads CLAUDE.md (format preferences, what NOT to do), loads the editorial-voice skill (their real writing examples), loads content-standards (structure rules, fact-checking), reads content-state.md (what's been written before).

**What happens**: The draft sounds different from Ch 4 and Ch 5's output. The opening matches the reader's style. The word choice reflects their examples. The tone is theirs, not generic. It's not perfect — but it's recognizably closer to their voice than anything the system produced before.

**What to check**: Read the draft against Example 1 from the voice skill. Does the opening have the same energy? Are the word choices similar? If the reader's Example 1 uses short punchy sentences, does the draft? If Example 3 closes with a question, does the draft?

**Step 6: The state-to-skill feedback loop.**

The reader edits the draft — fixing the parts that still don't sound right. These edits are captured (the reader can note them, or simply compare the draft to their edited version).

"Here's where state and skill work together. Your state file captures what Claude got wrong — the edits you made. After a few sessions, you'll notice a pattern: maybe Claude keeps using semicolons and you always remove them. Maybe it structures paragraphs with a topic sentence first and you prefer leading with an example.

Those patterns become new rules in your skill. Add to editorial-voice: 'No semicolons — use periods or dashes.' 'Lead paragraphs with a specific example, not a topic sentence.'

Better skill → better first draft → fewer edits → fewer state corrections. That's the Loop pattern from Chapter 3 — implemented across two components."

---

### Section 5: Extend It — Skills for the Other Three Systems (~600 words)

**Study System v3** (~200 words):

Create `my-ai-systems/.claude/skills/study-method.md`:
- How the reader learns best: examples-first or theory-first? Visual or textual? Short sessions or deep dives?
- Preferred quiz format (they already have this in CLAUDE.md — move the detailed preferences to the skill, keep the brief version in CLAUDE.md)
- How to explain complex concepts: use analogies from their field, build from what they already know
- Per-subject skills (optional): `aws-cert.md` or `spanish-verbs.md` with domain-specific terminology, common misconceptions, and exam patterns

Update `study-system/CLAUDE.md` to reference the skill.

What changes: Quiz questions match the reader's actual learning style. Explanations connect to their existing knowledge. The system teaches the way the reader learns, not the way the AI defaults to teaching.

**Job Hunting v3** (~200 words):

Create `my-ai-systems/.claude/skills/career-profile.md`:
- Full work history with quantified achievements (more detailed than CLAUDE.md's brief summary)
- 2-3 cover letter examples that actually got interviews — annotated with what worked
- Target role criteria: what matters, what's negotiable, what's a dealbreaker
- Industry-specific language and keywords

Update `job-hunting/CLAUDE.md` to reference the skill.

What changes: Cover letters cite specific achievements from the skill — not vague summaries. The language matches the reader's industry. Claude has the full career context loaded every session, never re-explained.

**Project Management v3** (~200 words):

Create `my-ai-systems/.claude/skills/pm-methodology.md`:
- How the reader manages projects (formal agile? Informal kanban? Something custom?)
- Status update format by audience (boss gets bullets, team gets details, client gets progress)
- Risk assessment criteria: what counts as high/medium/low risk
- Definition of "done" — what has to be true before a task moves to complete

Update `project-mgmt/CLAUDE.md` to reference the skill.

What changes: Status updates match the reader's actual format. Risk assessments use their criteria, not generic ones. The system manages projects the way the reader manages projects.

---

### Section 6: Maintain It — Skill Versioning (~300 words)

**Narrative beat**: Skills aren't write-once. They evolve — and sometimes the new version is worse.

**Content**:

**Version your skills.** When you update a skill, add a note at the top:

```markdown
## Changelog
- 2025-05-15: Added "no semicolons" rule based on 3 sessions of corrections
- 2025-05-01: Initial version with 3 writing examples
```

**Why version**: Because sometimes the update makes things worse. You add a rule that conflicts with an example. You cut an example that was doing more work than you realized. If the output gets worse after a skill update, roll back. Change the content back to the previous version. Skills aren't always-forward — sometimes the last version was better.

**The state-to-skill feedback cycle**: Your state file captures corrections over time. Every month, review: what does Claude keep getting wrong? If there's a pattern, add a rule to the skill. If the rule works (fewer corrections), keep it. If it doesn't (new problems appear), roll back.

**When to split a skill**: If a skill file is over 2,000 words, the AI's attention gets diluted. The last section gets less weight than the first. Split it: voice in one file, standards in another. Each stays focused.

**The quarterly check**: Read your skill files. Do they still match how you actually work? Your voice evolves. Your standards shift. A skill that hasn't been updated in 6 months might be teaching Claude the person you were, not the person you are.

---

### Section 7: System Diagram (~100 words)

**Content**:

```
[Topic] + [Root CLAUDE.md + Content CLAUDE.md]
        + [editorial-voice skill + content-standards skill]
        + [content-state.md]
                              ↓
                          [Claude]
                              ↓
                   [Draft in your voice]
                              ↓
                    [content-state.md updated]
```

"Three kinds of files now load before Claude writes a word: instructions (CLAUDE.md), expertise (skills), and history (state). The system has Instruction, Memory, and loaded expertise. What's missing: nothing checks the output before it ships. Chapter 7 adds the guard rail."

---

### Section 8: Break It on Purpose (~150 words)

**Test 1 — Remove the voice skill.** Temporarily rename `editorial-voice.md`. Run the Content System. Draft a blog post. Compare it to a draft produced WITH the skill loaded. The difference should be obvious: the no-skill draft is competent but generic. The skill-loaded draft sounds like the reader.

**Test 2 — Poison the skill.** Add contradictory instructions to the voice skill: "Use formal academic tone" while the examples are casual. Run the system. Watch the output struggle — formal phrasing mixed with casual structure. The AI can't serve two masters. This teaches the reader why skills need internal consistency — examples and rules must agree.

Remove the contradictory line. Restore the skill. Verify the output is back to normal.

---

### Section 9: Quality Gate (~150 words)

**Five checks**:

1. **Skills directory exists.** `my-ai-systems/.claude/skills/` contains at least 2 skill files (editorial-voice, content-standards).

2. **Voice match.** Show a skill-loaded draft and one of your real writing examples to someone who reads your work. Ask: "Which one is mine?" If they can't reliably tell, the skill is working.

3. **Skill loads without prompting.** Open Claude Code in `content/`, give a topic, and verify Claude references the skill content (uses your word patterns, follows your structure preferences) without you saying "use the editorial-voice skill."

4. **State-to-skill loop is visible.** After 3+ sessions, you've added at least one rule to a skill based on a pattern you noticed in your edits. The skill evolved from use, not just from initial setup.

5. **You can name the gap.** "CLAUDE.md tells Claude what to do. Skills tell Claude how to do it well. State tracks what happened. But nothing checks the output automatically — if Claude invents a statistic or drifts from my voice mid-draft, I'm the one catching it. That's what hooks fix in Chapter 7."

---

## Files the Reader Creates

| File | Location | Purpose |
|------|----------|---------|
| `editorial-voice.md` | `.claude/skills/` | Writing voice, style patterns, real examples |
| `content-standards.md` | `.claude/skills/` | Fact-checking, format rules, quality checklist |
| `study-method.md` | `.claude/skills/` | Learning style, quiz preferences, explanation approach |
| `career-profile.md` | `.claude/skills/` | Full career history, winning cover letters, target criteria |
| `pm-methodology.md` | `.claude/skills/` | Project management style, audience formats, risk criteria |

Plus CLAUDE.md updates in all 4 system folders (adding "Skills" section referencing which skills to load).

## Technical Notes for the Writer

- **Skills live at the root `.claude/skills/`, not per-system.** This is deliberate — skills are shared expertise. The editorial-voice skill could load when writing content OR when writing a cover letter in the job hunting system. The CLAUDE.md in each system folder tells Claude WHICH skills to load for THAT system's work. Explain this clearly — the reader might assume each system gets its own skills folder.
- **The "show don't describe" principle is load-bearing.** If the reader fills their voice skill with rules ("be conversational, use short sentences, avoid jargon") instead of examples, the output will be generic. Hammer this: 3 paragraphs of YOUR writing teach Claude more than 500 words of rules. Show the difference if possible.
- **Frontmatter format matters.** The `---` block with `name:` and `description:` is how Claude Code identifies skills. Keep it simple. The reader doesn't need to know why — just that the format matters.
- **The state-to-skill feedback loop is the chapter's conceptual payoff.** It connects state (Ch 5) to skill (Ch 6) and shows the Loop pattern (Ch 3) implemented across two components. Don't just mention it — walk through a concrete example: "You noticed Claude uses 'however' at the start of every counter-argument. You always delete it. Add to the voice skill: 'Don't start counter-arguments with however — restructure the sentence.' Next draft: no more 'however.' The loop closed."
- **Skill file length matters.** Under 2,000 words per skill. If the reader puts their entire life story in career-profile.md, Claude will lose focus on the later sections. Teach brevity: "A skill is a cheat sheet, not an autobiography."
- **Forward teaser**: "Your system now has instructions, memory, and expertise. It knows what to do, what happened, and how to do it well. But here's what's still missing: nobody's checking the output. Claude wrote a cover letter that invented a project you never worked on. Claude cited a statistic in a blog post that doesn't exist. You caught those — but only because you were paying attention. Chapter 7 builds the guard rail so the system catches them even when you're not."
- **Voice**: Keep it grounded. Skills sound abstract until the reader builds one. Front-load the concrete: "You're creating a file. It has your writing in it. Claude reads it before working. That's it."

---
---

# Chapter 7: Hooks — Automated Guard Rails

**Title**: Hooks — Automated Guard Rails
**Word target**: 3,500–4,500 words
**Component introduced**: Hook (an automated check that runs before or after Claude acts)
**Primary system**: Job Hunting (deep build)
**Other systems**: Study, Project Management, Content (extend)
**Universal concept**: Control
**Claude Code feature**: `.claude/settings.json` (hook registration) + `.claude/hooks/` directory (shell scripts that run automatically)

---

## Bridge from Chapter 6

The reader finished Ch 6 with:
- 5 CLAUDE.md files orchestrating state and skills
- 4 state files tracking session history
- 5 skill files loading expertise on demand
- Three kinds of files loading automatically: instructions, memory, expertise
- A clear remaining gap: nothing checks the output. Claude wrote a cover letter that invented a project. Claude cited a statistic that doesn't exist. Claude addressed a letter to "your company" instead of the actual name. The reader caught these — because they were paying attention. But attention is inconsistent. At 11pm after 6 applications, they won't catch the error. They need automated checks.

Ch 7 adds the guard rail. The reader builds shell scripts that run automatically — before Claude saves a file or after it generates output — catching specific, named errors that the reader has already experienced.

---

## Chapter Goals

By the end of this chapter, the reader can:

1. **Explain what a hook is in plain language**: an automated check that runs before or after Claude does something — like a spell-checker that runs before you hit send, except you defined the rules
2. **Create a hook script** (a shell script in `.claude/hooks/`) that checks output for specific errors
3. **Register hooks in `.claude/settings.json`** so they run automatically without the reader triggering them
4. **Distinguish pre-action from post-action hooks**: pre-action blocks bad output before it's saved; post-action verifies what just happened
5. **Apply the "most expensive mistake" test**: build hooks for failures that cost the most, not for everything that COULD go wrong
6. **Practice hook tuning**: adjusting thresholds, handling false positives, removing hooks that never fire

---

## Section-by-Section Breakdown

### Section 1: The Problem (~350 words)

**Narrative beat**: A specific, cringe-worthy failure that the reader has experienced or can vividly imagine. Job hunting is perfect for this — the mistakes are high-stakes and embarrassing.

**Content**:

Open with the scenario:

It's Tuesday night. You've been applying to jobs for three hours. Your Job Hunting System is humming — state file tracking everything, career-profile skill loaded, Claude tailoring each application. You're on application #7.

Claude generates a cover letter for the Senior PM role at Datadog. You skim it. Looks good. You submit it.

Wednesday morning, you re-read the letter. Third paragraph: "In my role leading the data migration at Nexus Technologies, I reduced query latency by 73%."

You never worked at Nexus Technologies. You never led a data migration. That "73%" is fabricated. Claude invented a project, a company, and a metric — and presented it with the same confidence as your real achievements. And you submitted it.

This is what "no Control" looks like. The system has Instruction (CLAUDE.md), Memory (state file), and Expertise (career-profile skill). It has everything it needs to do good work. But it has nothing checking whether the work IS good. You're the quality gate. And you blinked.

The career-profile skill has your REAL achievements. A check that compares the cover letter's claims against the skill file would have caught this in 2 seconds. Not "maybe caught it" — definitely caught it. The claim "data migration at Nexus Technologies" doesn't appear anywhere in your career profile. Flag. Block. Fix.

That's a hook: an automated check that runs before Claude saves or delivers output, catching specific errors you've defined. You write the check once. It runs every time. It doesn't get tired at 11pm.

**One-sentence component introduction**: A hook is a script that runs automatically before or after Claude acts — checking the output against rules you defined, so errors get caught even when you're not paying attention.

---

### Section 2: See the System (~150 words)

**Content**:

Your Job Hunting System right now:

```
[Job posting] + [CLAUDE.md + career-profile skill + job-state.md]
                              ↓
                          [Claude]
                              ↓
              [Cover letter + Resume bullets]
                              ↓
                    [job-state.md updated]
```

Instructions, expertise, and memory. No check between Claude's output and your use of it.

After this chapter:

```
[Job posting] + [CLAUDE.md + Skill + State]
                              ↓
                          [Claude]
                              ↓
                    [HOOK CHECK ← runs automatically]
                         ↓          ↓
                    [PASS]      [FAIL → feedback to Claude]
                       ↓
              [Output delivered + State updated]
```

The hook sits between Claude's work and your use of it. It's the Gate pattern from Chapter 3 — automated.

---

### Section 3: The New Component — Hooks (~400 words)

**Narrative beat**: Explain the Claude Code hook system in plain language. Demystify shell scripts. Make the `.claude/settings.json` registration feel approachable.

**Content**:

**What hooks are, mechanically**: A hook is a small script — a file with a few lines of instructions — that Claude Code runs at specific moments. You define WHEN it runs (before saving a file, after generating text, etc.) and WHAT it checks. The script either passes (everything's fine, continue) or fails (something's wrong, stop and report).

**Where hooks live**: Two files work together.

The script itself goes in `.claude/hooks/` — a folder inside the `.claude/` directory you created in Chapter 6.

The registration goes in `.claude/settings.json` — a configuration file that tells Claude Code which hooks to run and when. Think of `settings.json` as the schedule and the hook script as the worker. The schedule says "run this check after every file save." The worker does the actual checking.

**Pre-action vs. post-action**:
- **Pre-action** (runs BEFORE Claude saves/delivers): "Don't save this file until it passes these checks." Use when bad output is costly — cover letters, client communications, anything that leaves your desk.
- **Post-action** (runs AFTER Claude acts): "Check what just happened and report." Use for logging, state verification, non-blocking alerts.

**The "most expensive mistake" test**: You don't hook everything. You hook the failures that cost the most. For job hunting: submitting a cover letter with fabricated experience → career-damaging. Sending to the wrong company → embarrassing. Resume date inconsistency → sloppy. Each is worth a hook. A typo in your notes? Not worth automating.

Ask: "What's the worst thing this system could do?" Build a hook for THAT. Everything else is a maybe.

**Shell scripts for non-programmers**: "If you've never written a script, that's fine. A hook script is 5-15 lines. It reads a file, checks for something, and says 'pass' or 'fail.' I'll show you exactly what to type. You don't need to be a programmer — you need to be someone who can copy 10 lines and change the words inside the quotes."

---

### Section 4: Build It — Job Hunting System v4 (Deep Build) (~1,800 words)

**Components Used**: `[Prompt (CLAUDE.md)] + [State] + [Skill] + [Hook (NEW)]`
**New this chapter**: `[Hook]`

**Step 1: Create the hooks directory.**

```
mkdir -p my-ai-systems/.claude/hooks
```

**Step 2: Build Hook #1 — Cover Letter Verification.**

Create `my-ai-systems/.claude/hooks/verify-cover-letter.sh`:

```bash
#!/bin/bash
# Hook: Verify cover letter before saving
# Checks: company name present, no fabricated experience, word count

FILE="$1"

# Only run on cover letter files
if [[ "$FILE" != *"cover-letter"* ]]; then
  exit 0
fi

CONTENT=$(cat "$FILE")
ERRORS=""

# Check 1: Company name is not a placeholder
if echo "$CONTENT" | grep -qi "your company\|the company\|\[company\]"; then
  ERRORS="$ERRORS\n- Cover letter uses a placeholder instead of the actual company name"
fi

# Check 2: Word count under 400
WORD_COUNT=$(echo "$CONTENT" | wc -w | tr -d ' ')
if [ "$WORD_COUNT" -gt 400 ]; then
  ERRORS="$ERRORS\n- Cover letter is $WORD_COUNT words (limit: 400)"
fi

# Check 3: No claims that aren't in the career profile
PROFILE="../.claude/skills/career-profile.md"
if [ -f "$PROFILE" ]; then
  # Check for company names in the letter that aren't in the profile
  # (Simple version — checks for "at [Company]" patterns)
  COMPANIES=$(echo "$CONTENT" | grep -oP "at \K[A-Z][a-zA-Z]+" | sort -u)
  for COMPANY in $COMPANIES; do
    if ! grep -qi "$COMPANY" "$PROFILE"; then
      ERRORS="$ERRORS\n- Mentions '$COMPANY' but this company isn't in your career profile — possible fabrication"
    fi
  done
fi

if [ -n "$ERRORS" ]; then
  echo "COVER LETTER FAILED CHECKS:"
  echo -e "$ERRORS"
  exit 1
fi

echo "Cover letter passed all checks."
exit 0
```

**Writer guidance**: Walk through the script line by line. Not as a programming lesson — as a "here's what each line does in plain English" explanation:
- "The first line (`#!/bin/bash`) tells the computer this is a script. You'll type this same line in every hook. Copy it."
- "The `if` block at the top says: only run this check on files with 'cover-letter' in the name. If it's a different file, skip the check."
- "Check 1 looks for placeholder text. If the letter says 'your company' instead of 'Datadog,' it fails."
- "Check 2 counts words. Over 400? Fail."
- "Check 3 is the important one. It looks for company names in the cover letter and checks whether they appear in your career profile. If the letter mentions 'Nexus Technologies' and that company isn't in your career-profile.md, it flags it as a possible fabrication."

Then: "Make the script executable":

```
chmod +x .claude/hooks/verify-cover-letter.sh
```

**Step 3: Build Hook #2 — Duplicate Application Check.**

Create `my-ai-systems/.claude/hooks/check-duplicate-application.sh`:

```bash
#!/bin/bash
# Hook: Check for duplicate applications before saving
# Reads the state file for prior applications to the same company+role

FILE="$1"

if [[ "$FILE" != *"cover-letter"* ]]; then
  exit 0
fi

STATE="../job-hunting/job-state.md"
CONTENT=$(cat "$FILE")

# Extract company name from the cover letter (first line after "Dear")
COMPANY=$(echo "$CONTENT" | grep -oP "Dear.*at \K[^,]+" | head -1)

if [ -n "$COMPANY" ] && [ -f "$STATE" ]; then
  if grep -qi "$COMPANY" "$STATE"; then
    echo "WARNING: You may have already applied to $COMPANY."
    echo "Check job-state.md before submitting."
    # Exit 0 (warning, not block) — the reader decides
    exit 0
  fi
fi

exit 0
```

**Writer guidance**: This hook is simpler — and intentionally non-blocking (exits 0 even on a match). Use this to teach the distinction: "This hook warns you but doesn't block. The cover letter verification hook BLOCKS — exit 1 means 'stop, don't save.' This one exits 0 with a warning — 'hey, you might have applied here before, check your records.' Not every check needs to be a hard stop."

**Step 4: Register the hooks in settings.json.**

Create `my-ai-systems/.claude/settings.json`:

```json
{
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

**Writer guidance**: Explain `settings.json` simply: "This file tells Claude Code: 'After saving any file, run these two scripts.' The `postSaveFile` trigger means the hooks fire after Claude saves a file — not before, not during, after. If a hook fails (exit 1), Claude sees the error message and can fix the problem."

Explain the `$FILE` variable: "Claude Code passes the filename to your script automatically. That's what `$FILE` is — the file that was just saved. Your script reads it and checks it."

**Step 5: Test it — trigger the hooks.**

The reader opens Claude Code in `job-hunting/`. Pastes a job posting. Asks Claude to draft a cover letter and save it.

**Test A — Clean output.** If Claude follows the career-profile skill correctly, the hooks pass. "Cover letter passed all checks." The reader sees confirmation.

**Test B — Trigger a failure.** The reader tells Claude: "Draft a cover letter for this role, and mention my experience leading the data migration project at Nexus Technologies." (A company that isn't in their career profile.)

**What happens**: Claude drafts the letter. Saves the file. Hook fires. Output:

```
COVER LETTER FAILED CHECKS:
- Mentions 'Nexus' but this company isn't in your career profile — possible fabrication
```

Claude sees this feedback and can offer to fix the letter — removing the fabricated claim and replacing it with a real achievement from the career profile.

"That's the hook working. You told Claude to fabricate something. It did — because Claude follows instructions, even bad ones. But the hook caught it. The system caught what the AI couldn't catch in itself."

**Step 6: Confirm hooks fire automatically.**

Close Claude Code. Reopen. Draft another cover letter without mentioning hooks. The hooks should still fire — they're registered in settings.json, they run every time. "You set them up once. They run forever. That's the point."

---

### Section 5: Extend It — Hooks for the Other Three Systems (~600 words)

**Study System v4** (~200 words):

Create `.claude/hooks/verify-quiz-answers.sh`:
- After Claude generates a quiz, the hook checks: does each question have exactly 4 options? Is exactly one marked as correct? Are the "correct" answers in the AI's response consistent with each other (no contradictions)?
- Optional stronger check: flag any answer that seems to conflict with the study-method skill or well-known facts the reader defined

Create a simpler hook: `.claude/hooks/check-weak-area-focus.sh`:
- Reads `study-state.md` for weak areas
- Checks whether at least 60% of quiz questions target those areas
- If too many questions cover mastered topics, flag: "Quiz is covering areas you've already mastered. Weak areas: [list]. Refocus."

Register both in settings.json under the appropriate trigger.

**Project Management v4** (~200 words):

Create `.claude/hooks/verify-status-consistency.sh`:
- After a status update is generated, check: does the task count match the state file? Are there tasks listed as "done" that the state file still shows as "in progress"? Are any due dates in the past without a status of "done" or "blocked"?
- Flag impossible timelines: task due before its dependency

Create `.claude/hooks/check-audience-format.sh`:
- If generating a status update, check whether it matches the expected audience format from the PM methodology skill (executive → bullets, team → details)

**Content System v4** (~200 words):

Create `.claude/hooks/verify-content-quality.sh`:
- After a draft is saved: check for banned words from the editorial-voice skill (grep for "leverage," "utilize," "delve," etc.)
- Check word count against the target from content-standards skill
- Flag any sentence starting with "In today's" (the forbidden opener)
- Check that every factual claim has a source or a "[VERIFY]" flag

Register in settings.json. Now ALL FOUR systems have automated checks.

**Writer guidance**: These extensions are intentionally shorter than the deep build. Show the hook concept (what it checks) and the filename, but don't walk through every line of every script. The reader has seen the pattern — they can adapt it. Include enough code that a motivated reader could type it, but don't make extensions feel like homework.

---

### Section 6: Maintain It — Hook Tuning (~350 words)

**Narrative beat**: Hooks aren't set-and-forget. They need calibration — or they become noise.

**Content**:

**False positives — the boy who cried wolf.** If a hook flags every cover letter because it mis-parses a company name, you'll start ignoring hook output. That's worse than no hook at all — you lose the trust signal. When a hook has false positives:
1. Review the flagged output. Was the flag correct?
2. If not, tighten the check. The company-name check might need a better matching pattern.
3. If the hook flags more than 30% of good output, something's wrong with the check, not the output.

**False negatives — the miss.** Periodically feed known-bad input on purpose. Can the hook still catch it? If Claude has gotten better at avoiding the pattern (great!), the hook might never fire. That's fine — but verify it still WOULD fire on bad input. If it can't catch the error anymore because the check is too narrow, update it.

**The calibration loop**: Run your system normally for a week. At the end of the week, review:
- What did each hook catch? Were the flags correct?
- Were there errors the hooks DIDN'T catch? Should you add a check?
- Did any hook fire on good output? Adjust the threshold.

This is the Gate pattern from Chapter 3 — applied to your own guard rails. You're calibrating the gate.

**When to remove a hook.** If a hook hasn't fired in a month, ask: is it still needed? Maybe the skill improvements upstream (Ch 6) fixed the problem the hook was catching. A hook that never fires is code with no purpose. Remove it, simplify settings.json. You can always add it back.

**The golden rule**: Hooks exist for failures that COST something. A typo in your notes isn't worth a hook. A fabricated credential in a cover letter is. Match the investment (building and maintaining the hook) to the risk (what happens if the error slips through).

---

### Section 7: System Diagram (~100 words)

**Content**:

```
[Job posting] + [Root CLAUDE.md + Job CLAUDE.md]
              + [career-profile skill]
              + [job-state.md]
                              ↓
                          [Claude]
                              ↓
                    [Draft saved to file]
                              ↓
                 [HOOKS RUN AUTOMATICALLY]
                 ├── verify-cover-letter.sh
                 └── check-duplicate-application.sh
                         ↓          ↓
                    [PASS]      [FAIL → Claude fixes + re-saves]
                       ↓
              [Output delivered + job-state.md updated]
```

"Four components working together. Instructions tell Claude what to do. Skills tell it how. State tracks what happened. Hooks verify the result. This is a real system — not a prompt, not a chat, a system with automated checks."

---

### Section 8: Break It on Purpose (~200 words)

**Three deliberate failures the reader introduces**:

**Test 1 — Fabricated experience.** Tell Claude: "In this cover letter, mention my experience at [company you never worked at]." The verify-cover-letter hook should catch the unfamiliar company name and flag it.

**Test 2 — Placeholder name.** Tell Claude: "Write the cover letter but leave the company name generic — just say 'your company.'" The hook should catch the placeholder text and refuse to pass.

**Test 3 — Overly long letter.** Tell Claude: "Write a detailed 600-word cover letter." The word count check should flag it as over the 400-word limit.

"All three caught. You introduced the errors deliberately — but the hooks don't know that. They would have caught these errors just as reliably at 11pm on application #12 when your eyes are glazing over. That's the point: the system's quality doesn't depend on your attention. The gate holds whether you're watching or not."

If any test fails to trigger the hook, troubleshoot: Is the hook registered in settings.json? Is the script executable (`chmod +x`)? Does the file naming match the pattern the hook checks for? Debug one hook now — it's easier than debugging after you've built 10.

---

### Section 9: Quality Gate (~200 words)

**Five checks**:

1. **Hooks exist and are registered.** `.claude/hooks/` contains at least 2 scripts. `.claude/settings.json` references them with the correct trigger.

2. **Hooks fire automatically.** Draft a cover letter in Claude Code. The hooks run without you triggering them. You see the pass/fail output.

3. **Hooks catch bad input.** Feed the system a cover letter with at least 2 deliberate problems (fabricated experience, placeholder company name, over word count). Both are caught and flagged.

4. **Hooks DON'T block good output.** Draft a legitimate cover letter with real achievements, real company name, under 400 words. All hooks pass. No false positives.

5. **You can name the full stack.** "My Job Hunting System has four components: CLAUDE.md (instructions), career-profile skill (expertise), job-state.md (memory), and two hooks (automated checks). The instructions tell Claude what to do. The skill tells it how. The state tracks what happened. The hooks verify the output. Four components, four roles, one system."

And: "What's still missing? My system only works with data I give it. It can't go out and research a company on its own, can't check job boards, can't pull live data. That's connections — Chapter 8."

---

## Files the Reader Creates

| File | Location | Purpose |
|------|----------|---------|
| `verify-cover-letter.sh` | `.claude/hooks/` | Checks cover letters for placeholders, fabrication, word count |
| `check-duplicate-application.sh` | `.claude/hooks/` | Warns about duplicate company applications |
| `verify-quiz-answers.sh` | `.claude/hooks/` | Checks quiz format and answer consistency |
| `check-weak-area-focus.sh` | `.claude/hooks/` | Verifies quiz targets weak areas from state |
| `verify-status-consistency.sh` | `.claude/hooks/` | Checks PM status updates match state file |
| `check-audience-format.sh` | `.claude/hooks/` | Verifies PM updates match audience format |
| `verify-content-quality.sh` | `.claude/hooks/` | Checks drafts for banned words, word count, sourcing |
| `settings.json` | `.claude/` | Registers all hooks with triggers |

Plus CLAUDE.md updates if needed (most hook behavior is driven by settings.json, not CLAUDE.md — but the reader may want to add a note in each system's CLAUDE.md explaining what the hooks check, so the AI is aware of the guard rails and can self-correct before hooks even need to fire).

## Complete Folder Structure After Chapter 7

```
my-ai-systems/
├── CLAUDE.md                          ← root shared rules
├── .claude/
│   ├── settings.json                  ← hook registration (NEW Ch 7)
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
│   ├── CLAUDE.md                      ← (Ch 4, updated Ch 5-6)
│   └── study-state.md                 ← (Ch 5)
├── job-hunting/
│   ├── CLAUDE.md                      ← (Ch 4, updated Ch 5-6)
│   └── job-state.md                   ← (Ch 5)
├── project-mgmt/
│   ├── CLAUDE.md                      ← (Ch 4, updated Ch 5-6)
│   └── project-state.md              ← (Ch 5)
└── content/
    ├── CLAUDE.md                      ← (Ch 4, updated Ch 5-6)
    └── content-state.md               ← (Ch 5)
```

## Technical Notes for the Writer

- **Shell scripts must be approachable.** The reader may never have written a shell script. Don't teach bash — teach "here's a file that checks something, line by line, in plain English." Every line gets a plain-language annotation the first time. Subsequent hook scripts can be shown with less annotation because the reader has seen the pattern.
- **`chmod +x` must be explained.** "This tells your computer the file is a script it can run, not just a text file it can read. Without this, the hook won't execute." One sentence, no deeper.
- **`settings.json` is new and important.** This is the first configuration file (as opposed to content files like CLAUDE.md and skills). It uses JSON format — curly braces, quotes, colons. Show the exact file. If the reader gets a JSON syntax error (missing comma, extra bracket), that's a common stumbling point — consider a brief "if you see an error about JSON, check for missing commas or extra brackets" note.
- **Hook scripts check FILES, not conversations.** This is an important distinction from how the reader might imagine hooks working. The hook doesn't monitor the conversation — it runs when a FILE is saved. The reader needs to understand that Claude Code saves output to files, and hooks fire on those file saves. If Claude just says something in the conversation without saving a file, the hook doesn't fire. Make this distinction clear.
- **The fabrication check (Check 3) is intentionally simplified.** A real fabrication detector would need NLP or an LLM call. The grep-based version catches obvious cases (company names not in the career profile). Acknowledge this: "This is a first-pass check. It catches the obvious fabrications — company names that don't appear in your career profile. A more sophisticated version could catch subtle exaggerations too. Start here. Upgrade later if needed."
- **Pre-action vs. post-action hooks — the actual Claude Code mechanism.** In the deep build, we use `postSaveFile` (post-action) because it's the most straightforward: Claude saves, hook checks, Claude sees result. Pre-action hooks (if Claude Code supports them) would block the save entirely. The writer should check the current Claude Code hook API and use whichever trigger is most appropriate and well-documented. The CONCEPT (pre vs. post) is tool-agnostic. The IMPLEMENTATION may vary.
- **Don't overload on hooks.** The extensions show 5 additional hooks across 3 systems. That's a lot. Frame them as "here's what you CAN build" not "build all of these right now." The reader should build the 2 deep-build hooks and then pick 1-2 extensions that match their highest-risk system.
- **Forward teaser**: "Your four systems now have instructions, expertise, memory, and guard rails. They do good work and catch their own mistakes. But they only know what you tell them and what they remember. In Chapter 8, your systems reach outside — pulling live data from the web, from other tools, from sources you haven't fed them yet. The system stops being a closed box and starts being connected."
- **Voice**: The tone here should be slightly more serious than other chapters — not heavy, but the examples involve real career stakes (fabricated credentials). The reader should feel the weight of WHY hooks matter, not just how they work. "This isn't a nice-to-have. A fabricated claim on a cover letter can end a candidacy — or worse."
- **PII Redactor — Production Evidence (use in "Where This Goes" sidebar or extension).** A real production system uses a PII redactor as a pre-processing hook for network configurations. Three design decisions worth surfacing: (1) what to redact vs. preserve (private IPs kept for routing analysis, public IPs mapped, passwords destroyed), (2) reversible vs. non-reversible redaction (token store for restoration, except secrets), (3) **context injection** — prepending a header that tells the LLM "this data has been sanitized, here's how to interpret it." The context injection is the systems-thinking payoff: the hook doesn't just block bad data, it shapes how the AI interprets its input. A simple version for the chapter: a hook that scans for email/phone/API-key patterns before saving. The full production example lives in `research/systems/pii-redactor/README.md`. The progression from "grep for patterns" to "domain-aware redaction with context injection" mirrors the book's arc from prompts to systems.

---

# Cross-Chapter Summary: Reader's System After Ch 5-6-7

| Component | Introduced | What It Does | Reader Has |
|-----------|-----------|-------------|------------|
| Prompt (CLAUDE.md) | Ch 4 | Persistent instructions | 5 files (root + 4 systems) |
| State | Ch 5 | Session memory | 4 state files |
| Skill | Ch 6 | Loaded expertise | 5 skill files |
| Hook | Ch 7 | Automated checks | 7 hook scripts + settings.json |

**Universal concepts covered**: Instruction (Ch 4), Memory (Ch 5), Instruction-advanced (Ch 6), Control (Ch 7).

**Remaining**: Connection (Ch 8, primary: Study System) and Pipeline (Ch 9, primary: Content System) complete the six-component build. After Ch 9, all four systems are at v6 with all six components.
