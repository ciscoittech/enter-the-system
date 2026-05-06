# Chapter 6: Skills — Loading Expertise On Demand

You've drafted three blog posts with your Content System. The state file works — Claude knows what you've already covered, avoids repetition, picks complementary topics. But read those three drafts side by side.

They sound like AI.

Not terrible AI. They follow your CLAUDE.md constraints. No "leverage" or "delve." The word count is right. The structure is fine. But the voice is... flat. Generic. If someone who reads your real writing saw these, they'd say "this doesn't sound like you."

Your CLAUDE.md says "my tone is conversational, like explaining to a smart friend over coffee." That's a rule. But it's not expertise. Claude follows the rule — avoids formal language, keeps sentences short — but it can't reproduce YOUR specific voice because it's never seen your voice. It's guessing at "conversational" based on a one-sentence description.

You could paste samples of your writing into the prompt every session. But that's manual. It clogs the conversation with 2,000 words of examples before you even ask for anything. And you'd paste the same examples every single time.

The state file tells Claude what happened. But it doesn't tell Claude how to do the work well — your voice, your methodology, your standards. You need a file that carries your expertise and loads automatically when the system does content work. Not instructions ("be conversational"). Evidence ("here's what conversational looks like when I write it").

---

## See the System

Your Content System right now:

```
[Topic] + [CLAUDE.md + content-state.md] → [Claude] → [Draft + State write]
```

Instructions and memory. But no expertise loaded. Claude knows WHAT to write (from the prompt), knows WHAT you've already written (from state), but doesn't know HOW you write.

After this chapter:

```
[Topic] + [CLAUDE.md + Skill loaded + State read] → [Claude] → [Draft + State write]
```

The skill sits alongside the CLAUDE.md — but notice WHERE it loads. Here's the actual sequence when you start a session:

```
1. You type: claude (or open your AI tool in the content/ folder)
2. Claude Code reads CLAUDE.md → knows your rules, your constraints
3. Claude Code scans .claude/skills/ → reads skill names + descriptions
4. You type your prompt: "Write a blog post about remote work burnout"
5. Claude matches your request to a skill description → loads editorial-voice
6. Claude reads content-state.md (via @import) → knows what you've written before
7. Claude drafts — with your voice loaded from the start, not guessing
```

The skill doesn't load at startup like CLAUDE.md does. It loads on demand — when Claude decides (or you tell it) the skill matches the current task. That's the difference between instructions (always on) and expertise (loaded when relevant). You don't load your career-profile skill when generating a quiz. You don't load your study-method skill when writing a blog post. Skills are selective.

CLAUDE.md says "write an 800-word blog post, no jargon." The skill says "here's what my writing actually sounds like — here are three paragraphs I wrote, here are the patterns that make my content mine."

---

## The New Component: Skills

Your CLAUDE.md says: "Write in a conversational tone."
A skill file shows: three paragraphs of YOUR conversational tone — real sentences you wrote, with annotations about what makes them yours.

Your CLAUDE.md says: "Keep cover letters under 400 words."
A skill file shows: a cover letter that got a callback, annotated with why it worked.

CLAUDE.md = what to do. Skill = how to do it well.

Here's the thing. Claude Code has a built-in feature for this — the `.claude/skills/` directory. You create a folder structure inside `.claude/skills/` at the root of your project. Each skill is a folder containing a file called `SKILL.md`. That file is a knowledge document — a domain of expertise. Claude loads them based on what you're working on.

The file format is simple. At the top of `SKILL.md`, you put a small header block between `---` lines — just a name and description. Below that, the skill content in markdown. Same format you've been writing all along.

```
---
name: editorial-voice
description: My writing voice, style patterns, and editorial standards. Use when drafting any content.
---

(skill content goes here)
```

The folder name becomes a command you can type. If your skill lives in `.claude/skills/editorial-voice/SKILL.md`, you can type `/editorial-voice` in Claude Code to load it. That's the reliable path — you ask for it, it loads.

Claude can also load skills on its own. It reads the description line from every skill at startup and decides when one matches what you're doing. But here's what you should know: automatic loading works about half the time. Sometimes Claude picks it up, sometimes it doesn't. For anything important, type the command. `/editorial-voice`. Done.

**How skills differ from state:**
- State changes every session — new applications, new scores, new drafts
- Skills change rarely. They're stable expertise that evolves slowly
- State tracks what happened. Skills define how to do things well
- Both live as files. Both can load automatically. Different purpose

**This isn't a Claude Code feature.** It's a pattern that shows up everywhere. Cursor has `.cursor/rules/` — same idea, different folder name. Codex and Kimi CLI use `AGENTS.md` files that can reference external knowledge docs. Windsurf has its own rules system. The concept is: separate your instructions (what to do) from your expertise (how to do it well), and load the expertise when relevant. If you switch tools next year, your skill files transfer. Rename the folder, keep the content.

And the core design principle, the rule that makes everything in this chapter work: **show, don't describe.** Three examples of your real writing teach Claude more about your voice than 500 words of rules describing your voice. Put the examples in the skill. Cut the rules.

---

## Build It: Content System v3

**Components Used:** `[Prompt (CLAUDE.md)] + [State] + [Skill (NEW)]`
**New this chapter:** The skill — a reusable knowledge document Claude loads before doing work

### Step 1: Create the skills directory.

Open your terminal and run:

```
mkdir -p my-ai-systems/.claude/skills
```

A note on what just happened. `.claude/` is a hidden folder — it starts with a dot, so it won't show up in a regular file listing. Run `ls -a` to see it. This folder is the engine room of your AI system. Skills live here. Later, hooks will live here too.

The skills directory goes at the ROOT of `my-ai-systems/`, not inside each system folder. That's deliberate. Skills are shared expertise — your editorial voice skill loads when doing content work, but the same career-profile skill could load when writing a cover letter OR when writing a blog post about your professional experience. Skills belong to the whole system, not to one corner of it.

### Step 2: Build the editorial voice skill.

Create the folder and file:

```
mkdir -p my-ai-systems/.claude/skills/editorial-voice
```

Now create `my-ai-systems/.claude/skills/editorial-voice/SKILL.md`:

```markdown
---
name: editorial-voice
description: My writing voice, patterns, and style. Use when drafting any written content — blog posts, newsletters, social media.
---

# Editorial Voice

## My Writing — Real Examples

### Example 1: Blog opening
"[Paste a paragraph from something you actually wrote and published
or shared. A blog intro, a newsletter opening, even a long social
post. The more representative of your voice, the better.]"

### Example 2: Explaining something technical
"[Paste a paragraph where you explained something complex to your
audience. This teaches Claude how you handle complexity — do you
use analogies? Short sentences? Walk through step by step?]"

### Example 3: Strong close
"[Paste how you end pieces. The closing voice is often where AI
drifts most. Your real examples anchor it.]"

## Voice Patterns

Words I use: [list 5-10 words or phrases that are distinctly yours]
Words I never use: [list words that aren't you — AI-isms, jargon,
  phrases you'd never say out loud]

Sentence rhythm: [short? Long and layered? A mix? Point to
  your examples above — "see Example 1 for how I alternate
  short and long."]

How I open pieces: [with a question? A story? A bold claim?
  A scenario? Point to Example 1.]

How I close pieces: [with a call to action? A callback to the
  opening? A question for the reader? Point to Example 3.]

## What Makes My Content Different

[One paragraph. Not "I'm authentic" — something concrete.
"I use client stories with exact numbers." "I always connect
abstract concepts to something the reader did that morning."
"I challenge the standard advice in my field and show why
the alternative works better."]
```

This is the most personal step in the book so far. You're putting your actual voice into a file. It feels strange — describing how you write, picking examples, analyzing your own patterns.

The trick is to let the examples do most of the talking. Claude learns more from reading your writing than from reading your description of your writing. If you spend 20 minutes on this, spend 15 finding good examples and 5 on the patterns section.

### Step 3: Build the content standards skill.

Create the folder and file:

```
mkdir -p my-ai-systems/.claude/skills/content-standards
```

Now create `my-ai-systems/.claude/skills/content-standards/SKILL.md`:

```markdown
---
name: content-standards
description: Editorial standards, fact-checking rules, and format requirements for all content. Use alongside editorial-voice when drafting.
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
- Thread: first post must stand alone

## Quality Checks (Self-Review)
Before delivering any draft, verify:
- [ ] Opens with a hook, not a setup paragraph
- [ ] No banned words from editorial-voice skill
- [ ] Every claim has a source or flag
- [ ] Word count within target range
- [ ] Reads like my voice, not AI voice (compare to examples)
```

Two skills. One carries your voice. One carries your standards. They work together — voice shapes HOW Claude writes, standards shape WHAT it checks before delivering.

### Step 4: Update the Content System's CLAUDE.md.

Open `content/CLAUDE.md` and add a new section:

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

This is the second time you've updated CLAUDE.md to orchestrate other files. In Chapter 5, it told Claude to read and write state. Now it tells Claude to load skills. Your CLAUDE.md doesn't contain the expertise — it points to it. It's the conductor. The skills are the musicians.

### Step 5: Run the system.

Open Claude Code in your `my-ai-systems/` folder:

```
claude
```

Give it a topic for a blog post. Something you'd actually write about.

Here's what you should see happen. Claude loads CLAUDE.md (format preferences, constraints). It reads content-state.md through the `@` import (what's been written before). Then — because your CLAUDE.md says "load these skills when drafting content" — it loads the editorial-voice and content-standards skills. You might see it mention the skills in its response, or you can type `/editorial-voice` to load it explicitly if it doesn't pick them up automatically. Either way, the skills are in context before Claude writes a word.

Then it drafts.

The draft sounds different from what you got in Chapters 4 and 5. The opening matches your style. The word choices reflect your examples. The tone is yours, not generic. It's not perfect — but it's recognizably closer to your voice than anything the system produced before.

Read the draft against Example 1 from your voice skill. Does the opening have the same energy? If your Example 1 uses short punchy sentences, does the draft? If your Example 3 closes with a question, does the draft?

If the voice still feels generic, your examples aren't doing enough work. Go back to the skill file and paste stronger, more distinctive samples. The more YOUR voice comes through in the examples, the more it comes through in the output.

If you prefer a graphical interface, these same skill files work in any editor — VS Code, Cursor, or any tool that reads the `.claude/skills/` directory.

### Step 6: The state-to-skill feedback loop.

You read the draft. Some parts sound right. Some don't. You edit — fixing the parts that miss your voice.

Here's where state and skill start working together. Your state file captures what you wrote and what you changed. After a few sessions, you'll notice a pattern: maybe Claude keeps using semicolons and you always remove them. Maybe it structures paragraphs with a topic sentence first and you prefer leading with an example.

Those patterns become new rules in your skill. Open `editorial-voice/SKILL.md` and add: "No semicolons — use periods or dashes." Or: "Lead paragraphs with a specific example, not a topic sentence."

Next draft: no more semicolons. Paragraphs lead with examples. Fewer edits needed.

Better skill produces a better first draft. Better first draft means fewer edits. Fewer edits means fewer corrections in state. That's the Loop pattern from Chapter 3 — running across two components. The system learns from its own output, through you.

---

## Extend It: Three More Systems Get Skills

Each system gets a skill folder and a CLAUDE.md update. Same idea, different expertise.

### Study System v3

Create `my-ai-systems/.claude/skills/study-method/SKILL.md`:

```markdown
---
name: study-method
description: How I learn best — preferred formats, explanation style, quiz structure. Use when generating study material or quizzes.
---

# Study Method

## How I Learn
- [Examples-first or theory-first? Do you learn by seeing
  a worked example, or by reading the concept first?]
- [Short sessions (25 min) or deep dives (2+ hours)?]
- [Visual diagrams or text explanations?]

## Quiz Preferences
- [Multiple choice? Short answer? Scenario-based?]
- [How many questions per session?]
- [Do you want explanations with wrong answers?]

## How to Explain Complex Concepts
- Use analogies from: [your field — networking, cooking,
  construction, whatever you already understand]
- Build from what I already know about: [list strong topics]
- Don't assume I know: [list topics you're weak on]
```

Update `study-system/CLAUDE.md` to reference the skill.

What changes: Quiz questions match how you actually learn. Explanations connect to your existing knowledge instead of starting from zero. Claude teaches the way you learn, not the way it defaults to teaching.

### Job Hunting v3

Create `my-ai-systems/.claude/skills/career-profile/SKILL.md`:

```markdown
---
name: career-profile
description: Full career history, achievements, and winning cover letter examples. Use when drafting cover letters, resume bullets, or interview prep.
---

# Career Profile

## Work History (Detailed)
[More detailed than your CLAUDE.md summary. Include specific
projects, metrics, technologies. This is the source of truth
for what you've actually done.]

## Cover Letters That Worked
### Example 1: [Company] — Got an interview
"[Paste the letter. Annotate what you think made it work.]"

### Example 2: [Company] — Got a callback
"[Paste it. What was the angle that connected?]"

## Target Role Criteria
- Must have: [what matters — remote, salary range, team size]
- Nice to have: [negotiable items]
- Dealbreakers: [what makes you walk away]

## Industry Language
[Keywords and phrases that matter in your field.
Claude uses these naturally in cover letters.]
```

Update `job-hunting/CLAUDE.md` to reference the skill.

What changes: Cover letters cite specific achievements from the skill — real numbers from real projects. Claude has your full career context loaded every session. You never re-explain your background. And those cover letter examples? They teach Claude what a WINNING letter from you looks like, not just a grammatically correct one.

### Project Management v3

Create `my-ai-systems/.claude/skills/pm-methodology/SKILL.md`:

```markdown
---
name: pm-methodology
description: How I manage projects — status formats, risk criteria, definition of done. Use when creating status updates, risk assessments, or task breakdowns.
---

# PM Methodology

## How I Manage Projects
[Formal agile? Informal kanban? Weekly check-ins with a
shared doc? Whatever your actual process is.]

## Status Update Formats
- Boss/executive: [bullets, outcomes, risks — what format?]
- Team: [detailed tasks, blockers, what's next — what format?]
- Client/stakeholder: [progress, timeline, decisions needed]

## Risk Assessment
- High risk: [what counts? Budget impact > $X? Timeline slip > 2 weeks?]
- Medium risk: [your criteria]
- Low risk: [your criteria]

## Definition of Done
[What has to be true before a task moves to "complete"?
Reviewed? Tested? Approved by someone? Documented?]
```

Update `project-mgmt/CLAUDE.md` to reference the skill.

What changes: Status updates match YOUR format — the one your boss actually reads, not a generic project update template. Risk assessments use your criteria. "Done" means what you say it means.

---

## Maintain It: Skill Versioning

Skills aren't write-once. They evolve. And sometimes the new version is worse.

**Version your skills.** When you update a skill, add a changelog at the top of the SKILL.md:

```markdown
## Changelog
- 2025-05-15: Added "no semicolons" rule based on 3 sessions of corrections
- 2025-05-01: Initial version with 3 writing examples
```

Why bother? Because sometimes an update makes things worse. You add a rule that conflicts with an example. You cut an example that was doing more work than you realized. If the output degrades after a skill update, roll back. Change the content to the previous version. Skills aren't always-forward — sometimes the last version was better.

**The state-to-skill feedback cycle.** Your state file captures corrections over time. Every month, review: what does Claude keep getting wrong? If there's a pattern, add a rule to the skill. If the rule works — fewer corrections next month — keep it. If it doesn't — new problems appear — roll back.

**When to split a skill.** Keep each SKILL.md under about 500 lines. That's roughly 2,000 words. Beyond that, Claude's attention gets diluted — the last section gets less weight than the first. If your editorial voice skill is growing past that, split it. Voice in one skill, standards in another. Each stays focused.

**The quarterly check.** Read your skill files. Do they still match how you actually work? Your voice evolves. Your standards shift. A skill that hasn't been updated in six months might be teaching Claude the person you were, not the person you are.

---

## What You Built

```
my-ai-systems/
├── CLAUDE.md                              ← root shared rules (Ch 4)
├── .claude/
│   └── skills/
│       ├── editorial-voice/
│       │   └── SKILL.md                   ← NEW: your writing voice + examples
│       ├── content-standards/
│       │   └── SKILL.md                   ← NEW: format rules, fact-checking
│       ├── study-method/
│       │   └── SKILL.md                   ← NEW: how you learn best
│       ├── career-profile/
│       │   └── SKILL.md                   ← NEW: full career history + winning letters
│       └── pm-methodology/
│           └── SKILL.md                   ← NEW: project management style
├── study-system/
│   ├── CLAUDE.md                          ← updated: now references skills
│   └── study-state.md                     ← (Ch 5)
├── job-hunting/
│   ├── CLAUDE.md                          ← updated: now references skills
│   └── job-state.md                       ← (Ch 5)
├── project-mgmt/
│   ├── CLAUDE.md                          ← updated: now references skills
│   └── project-state.md                   ← (Ch 5)
└── content/
    ├── CLAUDE.md                          ← updated: now references skills
    └── content-state.md                   ← (Ch 5)
```

Three kinds of files now load before Claude writes a word: instructions (CLAUDE.md), expertise (skills), and history (state). The full Content System:

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

The system has Instruction, Memory, and loaded expertise. Three of four universal concepts covered. What's missing: nothing checks the output before it ships. Claude could invent a statistic. It could drift from your voice mid-draft. You'd catch it — if you're paying attention. But attention is inconsistent.

That's the guard rail. Next chapter.

---

## Break It on Purpose

### Test 1: Remove the voice skill.

Rename the `editorial-voice` folder temporarily — add `-disabled` to the end. Run your Content System. Draft a blog post.

Compare it to a draft produced WITH the skill loaded.

The difference should be obvious. The no-skill draft is competent but generic — it follows CLAUDE.md rules, but the voice is flat. The skill-loaded draft sounds like you. If the difference isn't clear, your skill needs stronger examples. Go back, paste better writing samples, try again.

Restore the folder name when you're done.

### Test 2: Poison the skill.

Open `editorial-voice/SKILL.md`. Add this line near the top of the content: "Use formal academic tone with complex sentence structures."

Now run the system. Watch the output struggle. Formal phrasing mixed with casual examples. Long academic sentences followed by short punchy ones. The draft can't decide what it wants to be.

That's Claude trying to serve two masters — your casual examples say one thing, the formal rule says another. Skills need internal consistency. Examples and rules must agree. If you tell Claude "be formal" but show it casual writing, the output is confused. And confused output is worse than either style on its own.

Remove the contradictory line. Restore the skill. Run again. The output should snap back to your voice.

---

## How to Know It's Clicking

Five checks.

**Skills directory exists and has content.** `my-ai-systems/.claude/skills/` contains at least two skill folders (editorial-voice, content-standards), each with a `SKILL.md` file. The files have real content — your actual writing examples, your actual standards — not just the placeholder text.

**Voice match.** Show a skill-loaded draft and one of your real writing examples to someone who reads your work. Ask: "Which one did I write?" If they can't reliably tell, the skill is working. If they immediately spot the AI draft, the skill needs better examples.

**The skill loads.** Open Claude Code, type `/editorial-voice`, and verify the skill content appears. Then give a topic and check that the draft reflects your voice patterns. If the draft sounds generic even after loading the skill, the examples in SKILL.md aren't distinctive enough.

**State-to-skill loop is visible.** After three or more sessions, you've added at least one rule to a skill based on a pattern you noticed in your edits. Maybe "don't start paragraphs with 'However'" or "always include a specific number in the opening." The skill evolved from use, not just from the initial setup.

**You can name the gap.** You can explain to someone: "CLAUDE.md tells Claude what to do. Skills tell Claude how to do it well. State tracks what happened. But nothing checks the output automatically — if Claude invents a statistic or drifts from my voice mid-draft, I'm the one catching it. That's what hooks fix in Chapter 7."
