# Act 1 — Detailed Chapter Outlines (v2)

*Chapters 1–3: Universal Systems Thinking*
*Tool-agnostic. No Cowork. Exercises using any gen AI tool (ChatGPT, Claude, Gemini, etc.).*
*The Study System is the running throughline — the reader actually builds a prompt-only version across Act 1 and feels its limitations firsthand.*

---

# Chapter 1: You're Already Building Systems (You're Just Building Them Badly)

**Bridge in**: None — this is the opening. But the first line should grab someone who's used AI a hundred times and still can't make it stick.

## Chapter Goals

By the end of this chapter, the reader can:

1. **Distinguish a prompt from a system**: given any AI interaction, say whether it's a one-shot or a system, and name what's missing.
2. **Name the four universal concepts** (Instruction, Memory, Control, Flow) with one sentence each — just enough to recognize them, not explain them in depth (that's Chapter 2's job).
3. **Recognize the invisible manual labor** they perform in every AI interaction: re-explaining context, checking output, deciding what's next. They see themselves AS the system.
4. **Run a basic Study System prompt** in any AI tool, get useful output, and experience the first crack: it works for one session, but there's no continuity.

## Chapter Narrative Arc

### Section 1: The Coinflip Problem (~700 words)

Open with a scenario the reader has lived:

You ask AI to help you study. Maybe it's a professional certification, maybe it's Spanish, maybe it's investing, maybe it's music theory. Doesn't matter. You type a prompt:

> "Help me study for the AWS Solutions Architect exam. Quiz me on the key concepts."

It generates a solid set of questions. You're impressed. You get 7 out of 10 right, and the explanations for the 3 you missed are actually helpful.

Next day. New chat. Same prompt. The AI generates... mostly the same questions. Two of the three you got wrong yesterday? Not mentioned. The ones you nailed? Asked again. It has no idea what happened yesterday. The magic from Day 1 is gone by Day 3.

Or maybe your thing isn't certifications. Maybe you asked AI to:
- Help you learn conversational Japanese — and every session starts with "I know basic greetings and numbers" because it can't remember you've moved past that
- Explain options trading strategies — and it keeps re-explaining what a call option is even though you've asked a dozen times
- Quiz you on music theory for your piano lessons — and it asks about treble clef notation when you're already working on chord progressions

Same problem, every domain. The AI is doing what you asked — answering a prompt. But you didn't ask for a system. And a single output, no matter how good, doesn't compound.

Extend the pattern to the other three throughlines (brief — one paragraph each):
- **Job hunting**: "Write a cover letter for this PM role at Stripe." Decent. But tomorrow you re-explain your experience. It doesn't know which resume version you sent where. It once invented a project you never worked on.
- **Project management**: "Help me plan the Q3 launch." Good to-do list. Next week it doesn't know what's done, what's blocked, or that the deadline moved.
- **Content creation**: "Write a blog post about remote work trends." Passable. But it doesn't know your voice, doesn't check its facts, and next post sounds nothing like this one.

These aren't four different problems. They're the same structural problem.

### Section 2: The System You're Already Running (~700 words)

The twist: you DO have a system. It's invisible, manual, and entirely dependent on you.

Walk through what actually happens in a multi-session AI interaction:
- **You** remember what was covered last time → that's Memory, and you're providing it manually
- **You** paste in context at the start of each session → that's Instruction, and you're the delivery mechanism
- **You** read the output and fix errors → that's Control, and you're the quality gate
- **You** decide what to do next based on results → that's Flow, and you're the pipeline manager

The system exists. You're just running every part of it by hand. And manual systems fail in predictable ways: you forget context, you skip the quality check when you're tired, you lose track of what version you sent where, you spend 10 minutes re-explaining what you explained yesterday.

This book teaches you to externalize those functions — to build them into the system so they happen automatically, consistently, and without you being the bottleneck.

### Section 3: The Four Concepts — First Pass (~600 words)

Introduce the four concepts. One paragraph each. Don't go deep — just name them and connect each to a failure the reader has already felt:

**Instruction**: What you tell the AI to do. The failure when it's weak: "It didn't do what I wanted." Most people live here — tweaking prompts, making them longer, hoping for better results. Sometimes it helps. But Instruction alone can't fix the other three failures.

**Memory**: Anything that persists between sessions. The failure when it's absent: "I have to re-explain everything every time." This is the concept most people haven't considered. They treat every AI session as independent — because that's how chat interfaces work. But real work is continuous.

**Control**: Checks and rules that catch mistakes. The failure when it's missing: "It gave me confident garbage and I almost used it." AI doesn't hedge. It'll invent achievements for your cover letter, put wrong answers in your quiz, hallucinate statistics for your blog post — all with the same confident tone as its accurate output.

**Flow**: Multi-step sequences where each stage feeds the next. The failure when it's absent: "It tried to do everything at once and botched it." Complex work has stages. Collapse them into one prompt and each stage gets a fraction of the attention it needs.

That's the framework. Four concepts, four failures. Every AI system you'll ever use — in any tool, on any platform — is some combination of these four. Chapter 2 goes deeper on each one. But first, let's feel the problem.

### Section 4: Build It and Break It — Study System Session 1 (~800 words)

This is where the reader stops reading and starts doing. They open any AI tool and build the first version of the Study System.

**The prompt the reader types** (they pick their own topic):

> *Pick something you're actually trying to learn right now — a certification, a language, a hobby, an investment strategy, anything. Then type this:*
>
> "I'm studying [your topic]. I'd say I'm at a [beginner/intermediate/advanced] level. Quiz me on 10 important concepts. For each question, give me 4 multiple-choice options. After I answer all 10, grade me and explain what I got wrong and why."

**What happens** (description of typical output):

The AI generates 10 reasonable questions. They cover a range of the topic. The multiple-choice format works. The reader answers them. The AI grades the answers and gives explanations.

For most readers, this will be a solid experience. The AI is good at this. The questions are relevant, the explanations are clear, and the reader learns something.

**What to notice and write down**:
- Your score (e.g., 7/10)
- Which 3 you got wrong and what the topics were
- Whether the explanations actually helped you understand why you were wrong
- Whether any of the "correct" answers seemed... off (keep an eye on this — it matters in Chapter 2)

**Save these notes.** You'll need them in 10 minutes.

### Section 5: The Crack — Study System "Session 2" (~500 words)

Now the reader experiences the first failure:

> *Close that chat. Open a brand new one. Paste the exact same prompt. Take the quiz again.*

**What happens**:
- Some questions are the same as Session 1. Some are new. The mix is random — not informed by what you got wrong.
- The topics you mastered? Quizzed again. The topics you struggled with? Maybe covered, maybe not. No targeting.
- Your score from Session 1? Gone. The AI has no idea you took a quiz 10 minutes ago.
- That concept you completely whiffed on? No extra attention. No deeper explanation. No follow-up questions drilling into the specific misunderstanding.

**What to write down**:
- How many questions overlapped with Session 1?
- Did Session 2 focus on your weak areas from Session 1? (No.)
- What would a GOOD Session 2 look like? (Focus on the 3 topics you got wrong. Deeper questions on those specific areas. Skip the 7 you already proved you know.)

**Name the gap**: This is a prompt, not a system. It has Instruction (you told it what to do) but no Memory (it can't remember Session 1), no Control (it didn't verify its own answers), and no Flow (it didn't stage the work — assess → target → practice → reassess).

This is the "before" picture. Keep your notes. You'll revisit this exact experience in every subsequent chapter — adding one concept at a time until the system works the way Session 2 SHOULD have worked.

## Assessment: How to Know It's Clicking

### Concept check
You can name the four concepts and, for each one, describe the failure it prevents — not from the book's words, but from your OWN Study System experience. "Memory prevents the problem I hit when I opened a new chat and it forgot my score."

### Pattern recognition
Pick an AI interaction you had this week (not the Study System). Can you identify which of the four concepts were present (even poorly) and which were absent? If you can do this without flipping back to the definitions, the concepts are landing.

### The punchline
You can explain to someone else, in one sentence, why a prompt isn't a system. If your explanation references a specific failure you experienced (not a hypothetical), even better.

---

# Chapter 2: Going Deeper — What Each Concept Actually Means

**Bridge in**: Last chapter, you named the four concepts and felt the first one break. You built a Study System with Instruction only, and watched it forget everything between sessions. That's what "no Memory" feels like. Now let's go deeper on all four — not as taxonomy, but as tools you'll use to diagnose every AI interaction from here on.

## Chapter Goals

By the end of this chapter, the reader can:

1. **Explain each concept with enough depth to diagnose a real problem.** Not subcategory lists to memorize — but understanding deep enough that when something breaks, they can point at the concept and say why.
2. **Run a structured instruction experiment** and measure the difference between vague and structured prompts — then articulate why better instructions alone still aren't enough.
3. **Describe what "memory" means for AI** at a level beyond "it forgets" — understanding WHY it forgets (by design), and what the fix looks like conceptually (a file that carries context forward).
4. **Spot hallucination, drift, and overstep in AI output** — by finding real instances in their own Study System output from Chapter 1.
5. **Break a single-prompt task into stages on paper** and explain why each stage needs focus rather than being crammed into one request.
6. **Push the Study System to its limits** by attempting to manually patch the Memory and Control problems — and experiencing why manual patches don't scale.

## Chapter Narrative Arc

Each section goes deeper on one concept, following this rhythm: what it really means → what it looks like in practice → the Study System example (reader does something, not just reads) → the limit of solving it with prompts alone. The Study System exercises accumulate across the chapter — by the end, the reader has tried 4-5 increasingly elaborate workarounds and felt each one fail.

### Section 1: Instruction — The Part You Already Know (and Its Ceiling) (~900 words)

**Bridge from Ch 1**: You already improved your Study System prompt in Chapter 1 just by being specific about your topic and level. Let's formalize that and then see where it stops helping.

**The structured instruction framework** (Context → Input → Output → Constraints):
- Not a "prompting technique" — a communication structure that removes ambiguity
- Context: the situation. Input: the specific material. Output: what the result should look like. Constraints: what the AI should NOT do.

**The reader runs the experiment** — Study System Session 3:

> *Open a new chat. This time, don't use the basic prompt from Chapter 1. Use a structured one:*
>
> "I'm studying [your topic]. My current level: I understand [what you know] but struggle with [what you don't]. Last time I studied, I got these wrong: [list the 3 topics from Session 1].
>
> Generate 10 quiz questions. Weight them: at least 5 of the 10 should cover the areas I said I struggle with. Each question: 4 multiple-choice options, one correct answer, and a 2-sentence explanation of why the correct answer is right and why the most tempting wrong answer is wrong.
>
> Constraints: Don't ask questions I'd need to memorize a specific number or date to answer — focus on conceptual understanding. If a question could be confusing because two answers seem correct, acknowledge the ambiguity in the explanation."

**What happens**: Noticeably better output. The questions target the weak areas. The explanations are more useful. Constraints are (mostly) followed. Structured Instruction works.

**But notice**: You had to MANUALLY type in what you got wrong last time. You ARE the Memory. You re-typed it from your notes. What if you'd lost the notes? What if there were 30 topics instead of 3? What if you'd been studying for 2 months and couldn't remember which sessions covered what?

Better Instruction helps. But it can't solve the Memory problem — it just forces YOU to be the memory, which means you're still the bottleneck.

### Section 2: Memory — Why AI Forgets and What to Do About It (~1,000 words)

**Bridge**: You just manually loaded your Session 1 results into Session 3's prompt. That's you performing the Memory function by hand. Let's understand why AI forgets in the first place, and what a real solution looks like.

**Why AI forgets — by design**: Every chat session is independent. The AI isn't choosing to forget — it literally doesn't have access to prior conversations. When it seems to "remember" what you said 5 messages ago, it's re-reading the entire conversation each time it responds. Close the tab, and it's gone.

**The progression** (not presented as a taxonomy to memorize — presented as a journey the reader is ON):

Right now, the reader's Study System is at the "Pet" level — it remembers within a session but forgets everything between sessions. They tried to push it toward "Assistant" level by manually typing in prior results (Session 3). That kind of works, but it's fragile and manual.

What the reader actually wants is "Colleague" level — a system that knows their full history, tracks their progress, and uses that history to make every session better than the last. That requires something the AI doesn't have: a file that persists between sessions, that the system reads at the start and writes at the end.

That file is what this book calls "state." The reader can't build it yet (that's Chapter 5). But they can understand what it IS: a document that carries forward everything the system needs to know — topics covered, scores, weak areas, what's next. The difference between manually typing "I got these wrong" and having a file that tracks it automatically.

**The reader tries the manual patch** — Study System Session 4:

> *Before you start a new session, write a short note to yourself:*
>
> ```
> MY STUDY PROGRESS
> Session 1: Scored 7/10. Got wrong: [topic A], [topic B], [topic C]
> Session 3: Scored ?/10 (fill in). Got wrong: [topics]
> Weak areas: [pattern you notice]
> Next session should focus on: [your judgment]
> ```
>
> *Now open a new chat. Paste this note at the TOP of your prompt, before the quiz instructions.*

**What happens**: Better session. The AI reads the pasted context, focuses on weak areas, avoids re-testing mastered topics. Progress!

**But feel the friction**: You wrote that note by hand. You decided what to include. After 5 sessions, maintaining it becomes a chore. After 10 sessions, the note is long enough that pasting it makes the chat unwieldy. After 20 sessions, you've stopped updating it because it's too much work.

This is why manual Memory doesn't scale. The concept is right — carry context forward. The implementation is wrong — you shouldn't be the one doing it. In Chapter 5, you'll build a state file that updates itself. For now, notice the pattern: the right idea, executed manually, eventually collapses under its own weight.

### Section 3: Control — When AI Is Confidently Wrong (~900 words)

**Bridge**: You've now run 3-4 study sessions. The questions have gotten more targeted (better Instruction) and more relevant to your weak areas (manual Memory). But here's a question nobody's asked yet: are the answers actually right?

**The reader checks** — Study System Audit:

> *Go back to your quiz results from Sessions 1 and 3. Pick the 3 questions you got WRONG — the ones where the AI told you the correct answer.*
>
> *Now fact-check those answers. Google the concept. Check an authoritative source (official documentation, a textbook, a reputable tutorial).*
>
> *How many of the AI's "correct" answers were actually correct?*

**What the reader typically finds**: Most answers are correct. But not all. The AI occasionally presents a plausible-sounding answer that's wrong, partly right, or right in one context but not the one being tested. If the reader was studying a specialized topic (options trading, music theory at an advanced level, a specific legal framework), the error rate goes up.

This is hallucination applied to quiz answers — and it's more dangerous here than in a cover letter, because the reader is STUDYING. They're actively trying to learn. A wrong "correct" answer doesn't just waste time — it teaches the wrong thing. And the reader trusted it because the AI presented it with the same confidence as its accurate answers.

**The other failure modes** (introduced through experience, not as a list to memorize):

Walk the reader through finding drift and overstep in their own outputs:
- **Drift**: Did the AI follow your constraints from Session 3? Check — were there date/number memorization questions you explicitly excluded? Were any explanations shorter than the 2 sentences you requested? Were all 5+ questions actually on your weak areas? Drift is subtle. Each violation is small. You don't notice until you look.
- **Overstep**: Did the AI add anything you didn't ask for? Unsolicited study plan? Tips about exam-day strategy? Recommendations for courses or books? Sometimes helpful, sometimes not — but you didn't ask for it, and it used tokens that could have gone to better quiz questions.

**The point**: Control isn't about the AI being malicious. It's about the AI being confidently imprecise — and you being the only thing catching it. Right now, you ARE the Control. You just fact-checked by hand. Would you do that every session? For every question? At midnight before the exam?

In Chapter 7, you'll build automated checks. For now, just notice: the system needs Control, and you're currently providing it manually.

### Section 4: Flow — Why One Prompt Can't Do Everything (~800 words)

**Bridge**: You've now seen three concepts fail: Memory (the system forgets), Control (the system makes confident mistakes), and Instruction (better prompts help but hit a ceiling). The fourth concept is about the SHAPE of the work itself.

**The core idea**: Your Study System prompt asks the AI to do several things at once — assess your level, generate appropriate questions, calibrate difficulty, and produce helpful explanations. Each of these is a different task. Cramming them into one prompt means each gets partial attention.

**The reader tries to stage it manually** — Study System Session 5:

> *Instead of one prompt, try breaking your study session into explicit stages. Open a new chat and do them one at a time:*
>
> **Stage 1 — Assess**: "Based on what I paste below, identify my 3 weakest areas and my 3 strongest. Here's my study progress so far: [paste your notes from Session 4]."
>
> *Read the assessment. Does it match your sense of your weak areas? Correct it if not.*
>
> **Stage 2 — Generate**: "Now generate 10 quiz questions. 6 should target my weak areas: [list from Stage 1]. 4 should be review questions on my strong areas to make sure I'm retaining them."
>
> *Take the quiz.*
>
> **Stage 3 — Analyze**: "Here are my answers: [paste them]. Grade me, but also: what PATTERN do you see in my mistakes? Am I consistently confused about a specific sub-topic? Is there a foundational concept I'm missing that's causing multiple errors?"
>
> *Read the analysis.*

**What happens**: Noticeably better session. Each stage gets the AI's full attention. The assessment is more nuanced because it wasn't competing with quiz generation. The quiz is better calibrated because it was informed by a real assessment. The analysis finds patterns because it's ONLY doing analysis, not trying to assess + generate + grade + explain all at once.

**But feel the friction again**: You just ran a 3-stage pipeline by hand. You copy-pasted between stages. You decided when to move from Stage 1 to Stage 2. You were the pipeline manager. For a 30-minute study session, that's tolerable. For a daily routine? You'll stop doing the stages and collapse back to one prompt within a week, because the manual overhead isn't worth it.

Flow as a concept is right. Manual flow doesn't survive contact with a busy schedule. In Chapter 9, you'll build a pipeline that runs the stages automatically. For now, notice: the improvement from staging was real, and you'll lose it the moment you stop doing it manually.

### Section 5: The Full Picture — Where Your Study System Stands (~400 words)

The reader has now run 5 study sessions:
- **Session 1** (Ch 1): Basic prompt. Worked once, no continuity.
- **Session 2** (Ch 1): Same prompt, new chat. Repeated questions, no memory.
- **Session 3** (Ch 2): Structured instruction. Better questions, but memory was manual.
- **Session 4** (Ch 2): Manual memory (pasted progress notes). Better continuity, but manual and fragile.
- **Session 5** (Ch 2): Manual staging. Better quality per stage, but unsustainable overhead.

Each session got better — and each improvement required more manual effort from the reader. They're now doing the work of Instruction, Memory, Control (fact-checking), and Flow (staging) BY HAND. The system is working, but the reader IS the system. That's exactly the problem this book solves.

Map each session to the four concepts:

| Session | Instruction | Memory | Control | Flow |
|---------|------------|--------|---------|------|
| 1 | Basic | None | None | None |
| 2 | Basic | None | None | None |
| 3 | Structured | Manual | None | None |
| 4 | Structured | Manual | Manual (spot-check) | None |
| 5 | Structured | Manual | Manual | Manual |

The progression: each session added a concept. Each concept helped. Each one was manual. By Session 5, the reader is doing so much manual work that the AI's contribution has actually shrunk as a proportion of total effort.

Act 2 flips this. Each concept gets externalized — built into the system so it happens without the reader being the bottleneck. But first: Chapter 3 gives you the thinking tools to DESIGN the system before you build it.

## Exercises

The exercises for this chapter are embedded in the narrative — Sessions 3, 4, and 5 ARE the exercises. Each one is a real prompt the reader types into a real AI tool, producing real output they evaluate. The chapter doesn't have a separate exercises section because the entire chapter is hands-on.

**Carry-forward**: The reader should have, in their notes:
- Quiz scores from Sessions 1-5
- Their study progress note (from Session 4)
- At least one fact-checked answer that was wrong (from the Control audit)
- The staged session results (from Session 5)
- The summary table showing concept coverage per session

These notes are the raw material for Chapter 3's design exercise and Chapter 4's real build.

## Assessment: How to Know It's Clicking

### Concept check
You can explain each concept not from the book's definitions, but from your own experience:
- "Instruction is [the structured prompt that made Session 3 better than Session 1]"
- "Memory is [the progress note I pasted in Session 4 — and the reason it'll stop working after 20 sessions]"
- "Control is [the fact-checking I did when I found that wrong quiz answer]"
- "Flow is [the staging I did in Session 5 that made each step better but added so much overhead]"

If your explanations reference YOUR sessions with YOUR data, the concepts are grounded. If they're still abstract definitions, re-run Sessions 3-5 with a different topic.

### Diagnosis ability
Find an AI workflow post online (YouTube, LinkedIn, Twitter — there are thousands). Can you identify which concepts it addresses and which it ignores? Can you predict what will break? If you can do this in under 2 minutes without checking the chapter, you're ready for Chapter 3.

### The limit test
You can articulate, in your own words, why manual implementations of Memory, Control, and Flow don't scale. Not because the book said so — because you felt it. Session 4 was better but fragile. Session 5 was better but unsustainable. If you can explain WHY (too much manual overhead, human inconsistency, doesn't survive a busy week), you've internalized the motivation for everything Act 2 builds.

---

# Chapter 3: Design Patterns — Three Shapes Every System Takes

**Bridge in**: Last chapter, you pushed the Study System through 5 sessions. Each one got better. Each one required more manual work. You've now felt all four concepts — and felt each one break under manual execution. Before we fix that with real tools (Act 2), you need one more thing: a way to THINK about system design. Three shapes. That's all you need.

## Chapter Goals

By the end of this chapter, the reader can:

1. **Recognize the three patterns** (Loop, Gate, Router) in everyday life — not just AI systems. The patterns are universal. Once named, the reader sees them everywhere.
2. **Choose the right pattern for a problem**: given a failure description, select the pattern that addresses it and explain why.
3. **Sketch a system on paper** using simple notation (arrows, checkpoints, diamonds), before touching any tool.
4. **Apply the napkin test**: if a system can't be drawn simply, it's too complicated.
5. **Design the Study System on paper** — a full blueprint with patterns, concept components, and failure scenarios — ready to build in Chapter 4.

## Chapter Narrative Arc

### Section 1: The Loop — Getting Better Each Time (~700 words)

**Process → Check → Improve → Repeat**

The system does something, checks the result, learns, does it again better. Each cycle carries forward what the last one revealed.

**You've already seen this**: Session 5 was a manual Loop. You quizzed yourself → scored → identified weak areas → planned to study them next time. That's Loop. You just did it by hand.

**Non-AI examples** (the reader should recognize these instantly):
- Editing your own writing: draft → read it → cringe at a sentence → rewrite → read again
- Cooking without a recipe: taste → too salty → adjust → taste again
- Learning a guitar chord: play → sounds wrong → adjust fingers → play again

**AI examples**:
- Study System: quiz → score → identify weak areas → study weak areas → quiz again. After 5 loops, the system has zeroed in on real gaps — not random topic coverage.
- Content creation: draft → compare to your style → identify where tone drifts → revise → compare again.

**When to use it**: Any task where the output can be measured and the measurement informs the next attempt. The key question: "Is this good enough, or should we go again?"

**The danger**: Without an exit condition, the Loop runs forever. "Good enough" has to be defined. Quiz score above 80%. Draft passes your style check. Budget variance under 5%. No exit condition = infinite revision.

### Section 2: The Gate — Checking Before You Ship (~700 words)

**Stage → Quality Check → Pass or Rework**

A checkpoint between stages. Binary decision: good enough to continue, or go back. The Gate doesn't improve the work — it decides whether the work is ready to proceed.

**You've already seen this**: When you fact-checked your quiz answers in Chapter 2. That was a Gate — you checked output quality before trusting it. The Gate said "this answer is wrong" and the response was "go back, don't learn this."

**Non-AI examples**:
- Reviewing an email before hitting send
- A manager approving a proposal before it goes to the client
- Tasting food before serving it to guests
- Airport security: you proceed or you go back

**AI examples**:
- Job Hunting: cover letter drafted → does it name the company? Reference the specific role? Match the resume? Under word count? Pass all → ready to send. Fail any → back to drafting with specific feedback.
- Project Management: status report → do the numbers match the tracker? Are blocked items explained? Right format for this audience? Pass → deliver. Fail → regenerate.

**When to use it**: When shipping bad output costs more than checking it. Cover letters, client communications, financial reports, quiz answers you're going to study from.

**The danger**: A Gate too strict blocks everything. A Gate too loose catches nothing. Calibration is the hard part. Start strict, loosen over time — it's easier to relax a gate than to untangle the damage from bad output that slipped through.

**Key question**: "Is this ready to move forward?"

### Section 3: The Router — Different Inputs, Different Handling (~700 words)

**Decision Point → Path A or Path B**

The system looks at input and chooses a different process based on what it sees.

**You've already seen this (almost)**: In Session 5, when you broke studying into stages, you implicitly routed — "this topic I scored high on, so it gets light review; this topic I bombed, so it gets deep study." You just didn't formalize it. A Router formalizes it.

**Non-AI examples**:
- Email triage: from your boss → reply now; newsletter → reading list; spam → delete
- Getting dressed: board meeting → suit; team standup → casual; gym after work → change clothes
- Customer service: simple question → FAQ; complex issue → specialist; billing dispute → finance

**AI examples**:
- Study System: scored 90%+ → light maintenance quiz (verify retention). Scored 50-89% → focused practice. Below 50% → deep study from fundamentals. One input (topic score), three paths, three intensities.
- Project Management: same status data, three audiences. CEO → 3-bullet executive summary. Engineering team → detailed action items. Client → progress highlights with timeline. One input, three routes, three formats.

**When to use it**: When different inputs genuinely need different handling. NOT when you're adding complexity for its own sake. If everything can be handled the same way, skip the Router.

**The danger**: Route proliferation. Every route is a process to maintain. Three paths: manageable. Seven paths: nightmare. If your Router has more than 3 paths, ask: can any be merged?

**Key question**: "What kind of input is this, and what does it need?"

### Section 4: Combining Patterns + The Napkin Test (~600 words)

Real systems use more than one. Walk through two combinations:

**Content System** (all three):
- Router: what format? Blog → long-form process. Social → short-form. Newsletter → personal tone.
- Gate: after research, enough material? 3+ credible sources → proceed. Otherwise → back to research.
- Loop: draft → check against style → revise → check again. Exit: passes style check, or max 2 revisions.

**Job Hunting System** (two):
- Router: dream job → full custom treatment. Wide-net application → template with targeted tweaks.
- Gate: before sending, check: company name correct? Experience claims verified? Under word count? All pass or no send.

**The napkin test**: If you can't draw the system on a napkin, it's too complicated. This isn't a cute metaphor — it's a real constraint. A system too complex to sketch is too complex to maintain, debug, or explain to someone else. Simplify until it fits.

### Section 5: Designing From Scratch — The Six-Step Process (~600 words)

The reader's first system design experience. The steps:

1. **Start with the goal**: What does RIGHT look like? Not "a good study session" — "I spent 80% of my time on topics I haven't mastered, and the quiz targeted the specific concepts I keep getting wrong."
2. **Map inputs and outputs**: What goes in, what comes out.
3. **Identify the constraint**: What fails most or costs the most? For studying: random topic coverage instead of targeted weak-area focus. That's the constraint.
4. **Pick a pattern**: Random coverage → needs a Loop (assess → study → reassess → improve) + Router (route intensity by mastery level). Two patterns.
5. **Add concepts to prevent specific failures**: Memory → prevents "starts from zero." Control → prevents "learning wrong answers." Flow → prevents "everything at once." Only add what prevents a named failure.
6. **Imagine failure**: What if input is bad? State file is wrong? Reader is short on time? Each anticipated failure is a check you can build later.

### Section 6: The Worked Example — Study System Napkin Sketch (~800 words)

**This section includes a visual the reader can reference.** The sketch is presented as a text-based diagram that works in any medium (print, ebook, screen). The notation is deliberately simple:

```
STUDY SYSTEM — NAPKIN SKETCH

[Study materials + Progress notes]
              |
              v
    +---------+---------+
    |    ASSESS LEVEL    |  ← reads progress notes
    +---+-----+-----+---+
        |     |     |
        v     v     v
      [90%+] [50-89%] [<50%]     ← ROUTER: score determines path
        |       |       |
        v       v       v
    [Light   [Focused [Deep
     review]  practice] study]
        |       |       |
        +---+---+---+---+
            |
            v
    +-------+-------+
    |  GENERATE QUIZ  |  ← calibrated to path
    +-------+-------+
            |
            v
    +-------+-------+
    |   TAKE QUIZ    |
    +-------+-------+
            |
            v
    +-------+-------+
    | CHECK ANSWERS  |  ← GATE: are answers correct?
    +-------+-------+   (verify against sources)
         |       |
       [pass]  [fail → flag & correct]
         |
         v
    +----+----+
    |  SCORE  |
    +----+----+
         |
         v
    +----+------+
    | UPDATE    |  ← writes to progress notes
    | PROGRESS  |  (Memory: topics, scores, weak areas)
    +----+------+
         |
         v
    +----+------+
    | GOOD      |  ← LOOP exit check:
    | ENOUGH?   |  score ≥ 80% on weak areas?
    +----+--+---+
         |  |
       [yes] [no → back to ASSESS]
         |
         v
      [DONE — plan next session]
```

**Walk through the sketch with the reader**:
- The Router sits near the top: it looks at the score for each topic and routes to the right study intensity
- The Gate sits after the quiz: it checks whether the AI's "correct" answers are actually correct before the reader studies from them
- The Loop wraps the whole thing: if the score on weak areas is below 80%, go back to ASSESS and run another cycle
- Memory flows through: progress notes are read at the start and written at the end
- Every piece maps to something the reader experienced in Chapter 2's sessions

**Then point out**: This is a design. Not code. Not prompts. Not a tool. Just a sketch. And it already tells you everything the system needs to do. In Chapter 4, you'll start turning this sketch into a real system. The shape doesn't change — just the implementation.

## Exercises

### Exercise 3.1: Pattern Spotting

Over the next 24 hours, find one real-world example of each pattern in your daily life. NOT in AI — in anything.

For each one, write down: what's being processed, what the check/decision is, and what happens when it fails. Three examples, three sentences each. That's it.

### Exercise 3.2: Design the Study System

Using the six-step process from Section 5 and the worked example from Section 6 as a reference, draw YOUR version of the Study System napkin sketch. Use your actual topic, your actual weak areas from Sessions 1-5, your actual scores.

Your sketch should include:
- At least one pattern (Loop, Gate, or Router) drawn and labeled
- Where Memory enters and exits (what gets read at start, what gets written at end)
- Where Control checks happen (what specifically gets verified)
- Your exit condition for the Loop (what score or threshold means "done for today")

Don't overthink the drawing. Boxes and arrows. Labels. 10 minutes max.

**Keep this sketch.** It's your blueprint for Chapter 4.

### Exercise 3.3: Design a Second System

Pick ONE of the other three throughlines — whichever matches your life right now:
- **Job Hunting**: if you're searching, considering a change, or want to be ready
- **Project Management**: if you manage work, tasks, or deadlines
- **Content Creation**: if you write, create, or publish anything

Same six-step process. Same napkin sketch. Same 10 minutes. The goal isn't a perfect design — it's practicing the process. A rough sketch with the right patterns identified beats a polished diagram with the wrong constraint.

### Exercise 3.4: Audit Someone Else's System

Find an "AI workflow" or "AI automation" post online. Sketch their system using the three patterns. Then answer in 5 sentences or fewer:
- Which patterns are they using?
- Which are missing?
- Where's the constraint?
- If you added one Gate, where would it go and what would it check?

## Assessment: How to Know It's Clicking

### Pattern recognition
Without looking at the chapter, draw all three patterns from memory and write one sentence describing when to use each. If someone else could choose the right pattern for a task from your descriptions alone, you've got it.

### Pattern selection
Try these three scenarios. For each, pick the pattern and say why the other two don't fit:

- "My AI drafts are okay but never great. I keep tweaking and re-running." → (Loop — the work improves through iteration. Gate doesn't fit: the work isn't wrong, it's just not good enough. Router doesn't fit: the process doesn't change based on input type.)
- "Sometimes my AI output is fine and sometimes it has errors that would embarrass me." → (Gate — you need a quality check before using it. Loop would over-iterate work that's already fine. Router doesn't apply: the issue is quality, not input type.)
- "I use the same AI prompt for quick emails and detailed proposals, and it works badly for both." → (Router — different inputs need different processes. Loop won't help: iterating on the wrong process doesn't fix the process. Gate would catch bad output but not prevent the mismatch.)

If you got all three and can explain why the alternatives don't fit, you're solid.

### Design ability
Set a timer for 15 minutes. Pick a task not covered in any exercise. Produce a napkin sketch: at least one pattern, at least two concept components named with the failure each prevents, at least one "what if it breaks" scenario. If someone else can understand the sketch without you narrating it, you're ready.

### Ready for Act 2
You've built a prompt-only Study System (5 sessions). You've felt each concept help and each concept fail under manual execution. You have a napkin sketch of the system you want to build. You have vocabulary (4 concepts, 3 patterns) that doesn't depend on any tool.

Act 2 gives you the tools. You already know what you're building and why.

---

# Act 1 Summary: What the Reader Has After 3 Chapters

**A built experience**: 5 Study System sessions, each progressively more capable and more manually laborious. The reader has FELT the concepts, not just read about them. They know why Memory matters because they tried studying without it. They know why Control matters because they found a wrong answer. They know why Flow matters because they staged a session manually and saw the quality jump.

**A vocabulary**: Four concepts (Instruction, Memory, Control, Flow). Three patterns (Loop, Gate, Router). No subcategories to memorize — those come later when the reader is building with them. The vocabulary is grounded in personal experience, not abstract definitions.

**A diagnosis tool**: Given any AI interaction, the reader can identify which concepts are present and missing, predict what will fail, and choose the pattern that would fix it.

**A blueprint**: A napkin sketch of the Study System (and at least one other system) with patterns labeled, concept components mapped, and failure scenarios anticipated.

**A visceral motivation**: The reader knows the manual approach doesn't scale. They maintained a study progress note by hand (Memory). They fact-checked quiz answers (Control). They ran a 3-stage session manually (Flow). Each one helped. Each one was unsustainable. They want the system to do it for them. That's what Act 2 delivers.

**What they do NOT have**: Cowork experience. Built systems. Implementation skills. Any component beyond prompts. All of that is Act 2. Act 1 gave them the thinking and the motivation. Act 2 gives them the tools and the builds.
