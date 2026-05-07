# From Prompts to Pipelines

## A Systems-Based Approach to Prompt Engineering and Agentic Workflows

### Act 1: The System

*Three chapters. The reader walks away with vocabulary (4 concepts, 3 patterns), experience (5 hands-on sessions), and a napkin sketch of the system they'll build in Act 2.*

---

# Chapter 1: You're Already Building Systems (You're Just Building Them Badly)

You ask AI to help you study for something.

Maybe it's the AWS Solutions Architect exam because your company is migrating to the cloud and you want to be the person who knows what they're talking about. Maybe it's conversational Spanish because you're spending two weeks in Mexico City this fall. Maybe it's music theory because you've been playing guitar for years but you still can't explain why certain chords work together. Maybe it's personal investing because you just opened a brokerage account and the number of options (pun intended) is paralyzing.

Doesn't matter. You open an AI tool (ChatGPT, Claude, Gemini, whatever's on your phone) and you type something like:

> "Help me study for the AWS Solutions Architect exam. Quiz me on the key concepts."

And it works. The AI generates ten solid questions. They're relevant. The difficulty is reasonable. You answer them, get seven right, and the explanations for the three you missed are genuinely helpful. One of them clears up a confusion about VPC subnets that had been bugging you for a week. You feel like you've found something.

Next day. You come back. New chat window. Same prompt.

The AI generates... mostly the same questions. Two of the three concepts you got wrong yesterday? Not mentioned. The thing about VPC subnets you finally understood? Asked again, as if yesterday never happened. The topics you clearly knew? Quizzed on those too. No targeting. No adaptation. No sign that anything happened twenty-four hours ago.

Because from the AI's perspective, nothing did.

---

This isn't unique to studying. It's the same experience everywhere.

You ask AI to help you learn conversational Japanese. Every session you type some version of "I already know basic greetings and can count to a hundred" because the AI has no idea you've been doing this for three months. You're still getting quizzed on *konnichiwa*.

You ask AI to write a cover letter for a product manager role at Stripe. It produces something decent. Next week, different role, different company. You paste the job posting into a fresh chat and re-explain your entire career from scratch. Your seven years of experience. Your three biggest accomplishments. The fact that you led the mobile app redesign, not just "contributed to" it. Last time, the AI invented a project you never worked on and you almost didn't catch it.

You ask AI to help you plan the Q3 product launch. It gives you a solid task list with timelines and owners. The following Monday, you come back to check progress, and the AI has no idea what the launch is, who's on the team, or that the design deadline moved to Friday.

These aren't four different problems. They're the same structural problem. You're asking AI for single outputs when what you need is a system.

---

## The System You're Already Running

Here's the part most people miss: you DO have a system. It's just invisible, manual, and entirely dependent on you.

Think about what actually happens when you use AI across multiple sessions. Not the single prompt, but the whole routine around it. You remember what you covered last time. You paste in context at the start of the conversation: maybe your resume, maybe last week's project update, maybe a note to yourself about what topics to focus on. You read the output and check for mistakes. You decide what to do next based on what worked and what didn't.

That's a system. A bad one. A manual one. But a system.

You're providing the memory. You're the one who remembers that you already covered VPC subnets, or that you sent resume version 3 to Stripe, or that the design deadline moved to Friday. The AI doesn't know any of this. You know it, and you re-supply it every session.

You're providing the quality control. You're the one who reads the cover letter and catches that the AI invented a project. You're the one who checks whether the quiz answers are actually correct. You're the one who notices the project plan has impossible timelines. If you don't check, nobody does.

You're managing the workflow. You're the one who decides "today I'll focus on VPC" or "this week I'll do the research, next week I'll write the report." The AI doesn't sequence the work. You do.

This is fine — for a while. Then the manual system breaks in predictable ways. You forget context. You skip the quality check because it's late and you're tired. You lose track of which resume version you sent where. You spend ten minutes at the start of every session re-explaining things you explained last Tuesday. You're doing so much work managing the AI that the AI's actual contribution is shrinking.

You're the bottleneck — and you shouldn't be.

This book teaches you to externalize those functions. Build them into the system so they happen automatically, consistently, and without you running every piece by hand.

---

## Four Things Every System Needs

Every AI system (the study quiz, the cover letter, the project plan, anything) needs four things to work reliably. When one is missing, the system fails in a specific, predictable way. Once you know the four, you can diagnose any AI interaction by checking which ones are present and which ones aren't.

**Instruction** is what you tell the AI to do. It's the prompt, the request, the description of what you want. When Instruction is weak, the failure sounds like: "It didn't do what I wanted." Most people live here. They think the problem is their prompt, so they make it longer, add more detail, try different wording. Sometimes that helps. But Instruction alone can't fix the other three failures, and most people don't realize the other three exist.

**Memory** is anything that persists between sessions. When Memory is absent, the failure sounds like: "I have to re-explain everything every time." This is the concept most people have never considered. Chat interfaces treat every conversation as independent. You open a new window, and the slate is blank. But real work is continuous. A study session should build on the last one. A job application campaign should learn from prior results. A project plan should know what's changed since Monday. Without Memory, every session starts from zero, no matter how good the session before it was.

**Control** is any check, rule, or constraint that catches mistakes before they reach you. When Control is missing, the failure sounds like: "It gave me confident garbage and I almost used it." AI doesn't hedge. It doesn't say "I'm not sure about this one." It'll invent achievements for your cover letter, put wrong answers in your quiz, and hallucinate statistics for your blog post, all delivered with the same confident tone as its accurate output. Without Control, you're the only thing standing between AI output and real consequences. And you're not always paying close enough attention.

**Flow** is multi-step sequencing — breaking complex work into stages where each stage's output feeds the next. When Flow is absent, the failure sounds like: "It tried to do everything at once and botched it." Complex work has stages. Research is different from drafting is different from editing is different from formatting. When you ask AI to do all of those in a single prompt, each stage gets a fraction of the attention it needs, and the output is uniformly mediocre — passable at everything, excellent at nothing.

Four concepts. Four failures. Every AI system you'll ever use, in any tool, on any platform, today or five years from now, is some combination of these four. The tools change. The framework doesn't.

![The Four Concepts: Instruction, Memory, Control, and Flow](../diagrams/png/ch01-four-concepts.png)

*The four universal concepts and the specific failure each one prevents.*

Chapter 2 goes deep on each one, and you'll feel every single failure firsthand. But first, let's build something and watch it break.

---

## Session 1: Build It

Put this book down and open an AI tool. Any of them: ChatGPT, Claude, Gemini, whatever you have. This works in all of them, because the framework is about the system, not the software. The whole thing takes about fifteen minutes. Ten for Session 1, five for Session 2.

Pick something you're actually trying to learn right now. Not a hypothetical — your real thing. A certification you need for work. A language you're studying. A hobby you're trying to get better at. A skill you've been meaning to develop. If nothing comes to mind, pick personal investing. Everyone could stand to understand their own money better.

Now type this:

> **I'm studying [your topic]. I'd say I'm at a [beginner / intermediate / advanced] level. Quiz me on 10 important concepts. For each question, give me 4 multiple-choice options. After I answer all 10, grade me and explain what I got wrong and why.**

Replace the blanks with your actual topic and your honest level. Then take the quiz.

Here's roughly what you'll get. (I'll use personal investing at a beginner level as the example. Yours will look different, but the shape is the same.)

---

**What the AI produces** (abbreviated, showing 3 of 10):

*Question 1: What is the primary difference between a stock and a bond?*
- A) Stocks represent ownership in a company; bonds are loans to a company or government
- B) Stocks are guaranteed to increase in value; bonds are not
- C) Bonds always pay higher returns than stocks
- D) Stocks can only be purchased through a financial advisor

*Question 4: What does "diversification" mean in investing?*
- A) Putting all your money into the highest-performing stock
- B) Spreading investments across different asset types to reduce risk
- C) Only investing in international markets
- D) Keeping all your money in a savings account

*Question 8: What is a key advantage of a Roth IRA over a Traditional IRA?*
- A) Contributions are tax-deductible
- B) There are no income limits for contributions
- C) Qualified withdrawals in retirement are tax-free
- D) You can withdraw contributions and earnings at any time without penalty

**After you answer all 10, the AI grades you:**

*You scored 7/10! Here's what you got wrong:*

*Question 3: You answered B, but the correct answer is C. An expense ratio is the annual fee a fund charges, expressed as a percentage of your investment. A fund with a 0.5% expense ratio charges you $5 per year for every $1,000 invested. This matters because...*

*(The explanation continues for each wrong answer, usually 2-3 sentences connecting the concept to why it matters.)*

---

For most people, this is a solid experience. The questions are relevant. The difficulty is appropriate. The explanations are clear and helpful. You probably learned something — maybe the quiz surfaced a gap you didn't know you had, or clarified something you were fuzzy on.

This is AI doing what it does well: generating knowledgeable, structured content on demand. The prompt worked.

Write down four things before you move on:

1. Your score (how many out of 10)
2. The topics you got wrong
3. Whether the explanations helped you actually understand why
4. Whether any of the "correct" answers felt a little off. Not necessarily wrong, but maybe oversimplified or not quite right. (Don't fact-check yet. Just notice the feeling. It'll matter in Chapter 2.)

Save these notes. You'll need them in about ten minutes.

---

## Session 2: Break It

Close that chat. Don't save it, don't screenshot it — just close it.

Open a brand new chat window. Paste the exact same prompt. Take the quiz again.

Here's what happens:

Some questions are the same as Session 1. Some are new. The mix is random. The AI isn't choosing based on what you need to practice. It's generating a fresh set of ten questions from scratch, with no information about what happened five minutes ago.

The topics you nailed in Session 1? You're quizzed on them again. Those seven correct answers? Wasted effort, from a learning perspective. You already proved you know this material, but the system doesn't know that, so it tests you on it anyway.

The topics you got wrong? Maybe one shows up. Maybe not. There's no targeting. The three concepts you struggled with don't get extra attention, deeper questions, or a different angle of explanation. The AI can't focus on your weak areas because it doesn't know you have weak areas. It doesn't know you exist as a continuing learner. As far as it's concerned, you just walked in off the street.

Your score from Session 1? Gone. Your trajectory over time? Nonexistent. The feeling of progress you had ten minutes ago? Not reflected anywhere in the system. It's reflected in your head and in the notes you wrote down — but the AI has access to neither.

Now write down three things:

1. How many questions overlapped with Session 1?
2. Did Session 2 focus on your weak areas from Session 1?
3. What would a GOOD Session 2 look like? (Write this one out, even just a sentence or two. What should the AI have done differently?)

That third question is the important one. Most people write something like: "It should have focused on the topics I got wrong. It should have asked harder questions about those specific concepts. It should have skipped the ones I already knew. It should have known my score."

Exactly. And it can't do any of that — because it's a prompt, not a system.

Map what just happened to the four concepts:

**Instruction**: Present. You told it what to do, and it did it. No problem here.

**Memory**: Absent. The AI can't remember Session 1. Your score, your weak areas, your learning trajectory: none of it carried over. You'd have to re-type all of that yourself, every session, forever.

**Control**: Absent. The AI didn't verify its own quiz answers. Were all ten "correct" answers actually correct? You don't know. It didn't check. (We'll investigate this in Chapter 2, and what you find might surprise you.)

**Flow**: Absent. The AI didn't stage the work. A good study session would assess your current knowledge, target your gaps, generate appropriate practice, test you, then update your progress. That's five stages. Your prompt collapsed it into one.

One out of four. That's what a prompt gives you.

![A prompt-only system: Instruction present, Memory, Control, and Flow absent](../diagrams/png/ch01-prompt-only.png)

*Your Study System after two sessions: one concept present, three missing.*

---

## Where This Goes

By the end of this book, that study session will be unrecognizable from what you just experienced.

Right now, the system quizzes you on random topics. By Chapter 11, it reads your progress file, identifies the three concepts you've scored lowest on across all prior sessions, and generates questions that specifically target the gaps in your understanding, skipping everything you've already mastered.

Right now, the system forgets everything between sessions. By Chapter 5, it reads a study tracker at the start of every session and writes updated results at the end. Session 12 builds on Session 11 builds on Session 10. Your weak areas from last month inform today's practice.

Right now, you're the one checking whether the answers are right. By Chapter 8, the system verifies its own answers before you see them and flags anything it's uncertain about.

Right now, one prompt tries to do everything. By Chapter 11, a multi-stage pipeline assesses your level, generates targeted practice, tests you, analyzes the patterns in your mistakes, updates your progress, and plans the next session. Each stage focused, each stage checked before the next one begins.

Same AI. Same underlying technology. Different architecture around it.

This isn't theoretical. The author's own study system tracks 127 topics across 21 columns (quiz scores, gap keywords, completion dates, next-session priorities), all updated automatically after every session. You'll see the evidence in this book's research repository. What you're about to build in Act 2 is based on systems that run in production, not tutorials written for a book.

And it's not just studying. The same four concepts turn a one-shot cover letter into a career campaign system that tracks applications and learns from outcomes. They turn a task-list prompt into a work operations system with 15 specialized agents and 80,000 reference documents. They turn a generic blog post into a content pipeline that's produced 26 scored posts, each one graded on six dimensions, with a minimum quality threshold enforced by the system, not by willpower.

Four concepts. Applied to anything you already use AI for. That's what this book builds.

---

## How to Know It's Clicking

Three checks before you move on:

**Can you name them?** Without looking back, name the four concepts and describe the failure each one prevents. Not in the book's words — in yours. Bonus if your descriptions reference what you just experienced. "Memory prevents the thing where I opened a new chat and it forgot my quiz score" is better than "Memory means things persist between sessions."

**Can you spot them?** Think of another AI interaction you've had this week — not the study quiz, something else. Which of the four concepts were present (even partially)? Which were missing? If you can do this without flipping back to the definitions, the framework is sticking.

**Can you say it simply?** Explain to an imaginary friend, in one sentence, why a prompt isn't a system. If your sentence sounds like something from a textbook, try again. If it sounds like something you'd actually say to a real person, you've got it.

Now: you've named the four concepts and felt the first one break. You have a study system with solid Instruction and zero Memory, zero Control, zero Flow. In Chapter 2, you're going to push on all four: upgrading your prompt, manually patching the memory gap, fact-checking the AI's answers, and staging the work into steps. Each fix will make the session better. Each fix will also reveal why doing it manually doesn't scale.

That's where it gets interesting.


---

# Chapter 2: Going Deeper: What Each Concept Actually Means

Last chapter, you named the four concepts and felt the first one break. You built a Study System with Instruction only, ran it twice, and watched it forget everything between sessions. You mapped the gap: one concept present, three missing.

Now you're going to push on all four. Not as theory, but as experiments you run on the same Study System you already started. By the end of this chapter, you'll have run three more sessions, each one better than the last, and each one revealing a new reason why doing it manually doesn't work.

---

## Instruction: The Part You Already Know (and Its Ceiling)

Your Session 1 prompt was basic. "Quiz me on the key concepts." It worked, but it was vague. The AI decided what to quiz you on, how hard to make it, what format to use. You got a reasonable result because the AI is good at filling in blanks. But "reasonable" isn't the same as "targeted to what you actually need."

Let's fix that.

Open a new chat. Any AI tool, same as Chapter 1. But this time, instead of the basic prompt, use a structured one. The structure has four parts: Context (the situation), Input (the specific material), Output (what the result should look like), and Constraints (what the AI should NOT do).

Here's what to type. Replace the blanks with your actual topic and your actual results from Sessions 1 and 2:

> "I'm studying [your topic]. My current level: I understand [what you're solid on] but struggle with [what trips you up]. In my last study session, I got these concepts wrong: [list the 2-3 topics you missed in Chapter 1].
>
> Generate 10 quiz questions. Weight them: at least 5 of the 10 should cover the areas I said I struggle with. Each question should have 4 multiple-choice options, one correct answer, and a 2-sentence explanation of why the correct answer is right and why the most tempting wrong answer is wrong.
>
> Constraints: Don't ask questions I'd need to memorize a specific number or date to answer. Focus on conceptual understanding. If a question could be confusing because two answers seem close, acknowledge the ambiguity in your explanation."

Take the quiz. Grade yourself.

The difference should be obvious. The questions are more targeted. Instead of random coverage, at least half the quiz focuses on your weak areas, the ones you specifically named. The explanations are better because you told the AI what format to use. The constraints are mostly followed: fewer gotcha questions, more conceptual ones.

This is what structured Instruction does. It removes ambiguity. Instead of hoping the AI guesses what you need, you told it: here's where I am, here's what I struggle with, here's exactly what I want back, and here's what I don't want. Four parts. Same AI, dramatically better output.

We tested this formally. Same AI model, same topic. A vague "quiz me" prompt versus the structured four-part version. We scored both outputs on relevance, specificity, difficulty calibration, and format compliance (each 1-5). The vague prompt averaged 11 out of 20. The structured prompt scored 20 out of 20. Every run. The biggest gap was format compliance: the vague prompt couldn't even produce the right number of questions consistently. The structured prompt nailed the format every time. (You can see the full eval with scoring breakdowns in the research section of this book's repository.)

![Eval comparison: vague prompt vs structured prompt](../diagrams/png/ch02-eval-comparison.png)

*Side-by-side scoring of the vague prompt versus the structured four-part version.*

But notice something. To make this work, you had to manually type in what you got wrong last time. You dug through your notes from Chapter 1, found your weak topics, and typed them into the prompt. You were the delivery mechanism for your own history.

What if you'd lost those notes? What if you'd been studying for two months instead of two sessions, and you couldn't remember which of the forty topics you'd covered were still weak? What if there were twelve concepts you'd gotten wrong across eight sessions, and you had to decide which ones were "still wrong" versus "wrong once but probably fine now"?

You can't scale by typing harder. Structured Instruction is a real improvement; use it forever. But it can't solve the Memory problem. It just forces you to be the memory yourself. And you're the part of the system most likely to forget, get lazy, or decide "close enough" at 11pm.

Write down your Session 3 score and which topics you got wrong. You'll need them in a few minutes.

---

## Memory: Why AI Forgets (and Why That's the Point)

You just performed a magic trick without realizing it. You carried information from one AI session into another. Your Session 3 prompt included your Session 1 results: topics you got wrong, your current level, your weak areas. That's Memory. You provided it by hand, by typing it in.

Here's why that matters: the AI didn't do this. It couldn't. It had no idea Session 1 ever happened.

This isn't a bug. It's how every AI chat tool works, by design. Each conversation is independent. When you open a new chat window, the AI starts with a blank slate. No history, no prior context, no knowledge that you exist as a continuing user. When it seems to "remember" what you said ten messages ago in the same conversation, it's not remembering. It's re-reading the entire conversation thread every time it generates a response. The moment you close that tab or start a new chat, everything is gone.

Think about what that means for your Study System. Session 3 was better than Session 1 because you manually injected context. But that context was a snapshot, a few sentences you typed from memory. A real study system would need to know:

- Every topic you've been quizzed on, and your score on each
- Which concepts you've gotten wrong multiple times (persistent weak areas) versus which you missed once and then got right (probably fine)
- How your understanding has changed over time. Are you improving on VPC subnets, or has it been three weeks and you're still guessing?
- What you should focus on next, not based on your gut feeling, but based on the actual data from all prior sessions

That's not a few sentences you can type from memory. That's a file. A document that the system reads at the start of every session and writes to at the end. A record that accumulates over time, getting more useful with every session because it has more data to work with.

This book calls that file "state": a running record of what's happened and what to do next. You'll build one in Chapter 5.

To give you a sense of what state looks like at scale: the study system the author uses in production is a spreadsheet with 127 rows and 21 columns. Every topic has a status (not started, in progress, known, close, gap), a quiz score, a quiz date, free-text notes on what was mastered and what wasn't, and comma-separated gap keywords like "tokenization, attention vocab, parameter count." When the system plans the next session, it reads this file, finds the gaps, and generates practice that targets those specific weaknesses. Not random coverage, not the author's gut feeling, but data from every prior quiz. That's what a state file can become. You'll start simpler. But right now, let's feel what manual memory actually looks like, and where it breaks.

Before you start your next session, write yourself a progress note. Something like this:

```
MY STUDY PROGRESS
Session 1: Scored 7/10. Got wrong: [topic A], [topic B], [topic C]
Session 3: Scored ?/10 (fill in your actual score). Got wrong: [topics]
Weak areas so far: [any pattern you notice]
Next session should focus on: [your best guess]
```

Fill in the real numbers from your real sessions. Now open a new chat, and paste this note at the top of your prompt, before the quiz instructions from Session 3.

This is Session 4. Take the quiz.

What happens: better. The AI reads your pasted progress, focuses on your documented weak areas, and avoids re-testing topics you've already proven you know. You can feel the system getting smarter because it has context now. Context you gave it.

But feel the friction too.

You wrote that note by hand. You decided what to include and what to leave out. You estimated your weak areas based on gut feeling, not systematic analysis. After five sessions, updating this note will feel like homework. After ten sessions, it'll be long enough that pasting it into the chat starts to feel awkward. After twenty sessions, if you get that far, you'll have quietly stopped updating it because the overhead isn't worth the payoff.

This is the pattern with manual memory: the concept is right, the execution is fragile. Carrying context forward genuinely makes every session better. But when you're the one carrying it, the system's quality depends on your diligence. Miss an update, forget a detail, get lazy on a Friday night — and the context degrades. The system gets worse not because the AI got worse, but because you stopped feeding it.

Chapter 5 solves this. You'll build a state file that reads and writes automatically — no manual updates, no forgotten details, no degrading over time. For now, just notice what happened: the improvement was real, the effort was unsustainable, and the gap between those two things is exactly what systems are for.

---

## Control: When AI Is Confidently Wrong

You've now run four study sessions. The questions are getting more targeted (structured Instruction). The focus areas are improving (manual Memory). Things feel good.

Time to check whether the answers are actually right.

Go back to your quiz results. Sessions 1 and 3 are the most useful because you have the clearest records. Find three questions you got wrong. Not the ones you got right, but the ones where the AI told you the correct answer and you accepted it.

Now fact-check those "correct" answers. Google the concept. Check an authoritative source: official documentation if it exists, a well-known textbook, a university resource, a reputable tutorial. Compare what the AI said was correct against what the source says.

How many held up?

If you're studying something well-established and broad (basic investing, introductory Spanish, common certifications), most of the answers are probably right. Maybe all of them. AI is genuinely good at well-trodden material.

But look closer. Was every answer completely right, or were some partially right? Was the explanation accurate in general but slightly off for the specific context of the question? Was there a nuance the AI glossed over, a case where the "correct" answer is correct most of the time but not in the specific scenario described?

If you're studying something more specialized (advanced options strategies, music theory beyond the basics, a niche professional certification, a specific legal framework), the odds go up that you'll find at least one answer that's wrong, misleading, or oversimplified to the point of being inaccurate.

This matters more than it seems. You're not just reading AI output for entertainment — you're studying from it. A wrong "correct" answer doesn't just waste your time. It teaches you the wrong thing. And the AI delivers wrong answers with exactly the same confident, helpful tone as correct ones. There's no asterisk, no hedging, no "I'm less sure about this one." Every answer sounds equally authoritative.

That's hallucination — not the dramatic kind where the AI invents entire fictional events, but the quiet kind where it's 90% right and the other 10% sounds just as convincing. In a cover letter, a hallucinated detail is embarrassing. In a study system, it's actively counterproductive. You're trying to learn, and the system is occasionally teaching you wrong things without any signal that it's doing so.

Now check for two more problems in your Session 3 output. These are subtler.

**Drift.** You gave the AI specific constraints: focus on conceptual understanding, not memorization. At least 5 questions on weak areas. Two-sentence explanations. Did it follow all of them? Count. Were there any date-or-number questions that slipped in despite your constraint? Were any explanations one sentence instead of two? Were there really five or more questions on your weak topics, or did the AI quietly shift the balance back toward general coverage? Drift is small. Each individual deviation is barely noticeable. You only see the pattern when you go looking for it.

**Overstep.** Did the AI add anything you didn't ask for? A study plan you didn't request? Tips about test-day strategy? Book recommendations? Links to resources? Sometimes these are helpful. Sometimes they're not. Either way, you didn't ask for them, and generating them used attention that could have gone toward better quiz questions or more thorough explanations.

Here's the uncomfortable part: you just fact-checked, counted constraint violations, and audited for extras. That took effort. Would you do that every session? For every question? At midnight the night before your certification exam, when you just want to cram through one more round of practice questions?

You wouldn't. Nobody would. And that's the problem. Right now, you ARE the Control: the quality check, the error catcher, the constraint enforcer. When you pay attention, the system works well. When you don't (because you're tired, rushed, or just trusting the output because it sounds right), mistakes pass through.

In Chapter 8, you'll build automated checks that catch these problems without you having to look for them. Hooks that verify answers against constraints, flag uncertain claims, and refuse to let bad output through unchecked. For now, just know this: the system needs Control, and you're currently the only thing providing it.

---

## Flow: Why One Prompt Can't Do Everything

Three concepts down: Instruction (how you ask), Memory (what carries forward), Control (what catches mistakes). The fourth is about the shape of the work itself.

Look at what your Study System prompt actually asks the AI to do. Not the topic, but the tasks. In a single prompt, you're asking it to:

1. Assess your current knowledge level (based on whatever context you gave it)
2. Identify which topics to focus on
3. Generate appropriately difficult questions for those topics
4. Calibrate the difficulty based on your stated level
5. Write clear, targeted explanations for each answer

That's five different jobs in one request. Each one is real work. And when you cram them all into one prompt, each gets a fraction of the AI's attention. The assessment is shallow because it's competing with question generation. The difficulty calibration is approximate because it's sharing space with explanation writing. Everything comes out adequate. Nothing comes out great.

Let's test this. Open a new chat (this is Session 5). Instead of one prompt, you're going to break the work into stages and run them one at a time.

**Stage 1: Assess.** Paste your progress note from Session 4 and type:

> "Based on the study progress I'm pasting below, identify my 3 weakest areas and my 3 strongest. For each weak area, explain specifically what I seem to be confused about, not just 'you got it wrong' but what pattern you see in my mistakes."

Read the assessment. Does it match your sense of your own weak areas? Correct it if it's off.

**Stage 2: Generate.** Now type:

> "Based on that assessment, generate 10 quiz questions. 6 should target my weak areas, specifically the confusions you just identified, not just the broad topics. 4 should be review questions on my strong areas to verify I'm retaining them. Same format: 4 options, correct answer, 2-sentence explanation."

Take the quiz.

**Stage 3: Analyze.** Now type:

> "Here are my answers: [paste them]. Grade me, but go further: what pattern do you see in my mistakes? Am I consistently confused about a specific sub-topic? Is there a foundational concept I'm missing that's causing multiple errors? What should my next study session prioritize, and why?"

Read the analysis.

Compare this to Session 3, where you did everything in one prompt.

The assessment is more nuanced. It identified specific confusions, not just "you got this wrong." The quiz questions are better calibrated. They target the actual gaps, not just the broad topic areas. The analysis finds patterns because it's only doing analysis, so it goes deeper than when it was trying to assess, generate, test, and explain simultaneously.

Each stage, on its own, is doing A-level work. The single-prompt version was doing B-level work across all stages at once. The difference is focus.

But you just ran a three-stage pipeline by hand. You copy-pasted output from Stage 1 into Stage 2. You decided when to move between stages. You managed the entire workflow manually. For a focused thirty-minute study session, that overhead is tolerable. For a daily study habit? You'll collapse back to one prompt by the end of the week. Not because the staged approach doesn't work — because the manual overhead makes it unsustainable. The improvement is real. The effort to maintain it is not.

![The manual overhead of running each concept by hand](../diagrams/png/ch02-manual-overhead.png)

*The more concepts you add manually, the more work falls on you, not the AI.*

In Chapter 11, you'll build a pipeline that runs these stages automatically — with quality checks between each one and state updates that happen without you lifting a finger. For now, just notice: staging genuinely produces better results, and you will absolutely stop doing it the moment it's your job to manage each stage manually.

---

## Where Your Study System Stands

Five sessions. Same Study System, same topic. Here's what happened:

**Session 1** (Chapter 1): Basic prompt. Good output for one session. No continuity.

**Session 2** (Chapter 1): Same prompt, new chat. Repeated questions, forgotten scores. The system doesn't know you.

**Session 3** (this chapter): Structured Instruction. Better targeting, clearer output. But you manually typed your weak areas from memory.

**Session 4** (this chapter): Manual Memory. You pasted a progress note, and the system focused on documented gaps. Better continuity, but you wrote and maintained that note by hand.

**Session 5** (this chapter): Manual Flow. You staged the work into three steps (assess, generate, analyze). Each stage produced better results. But you managed the pipeline yourself.

Each session got better. And each improvement required more manual effort from you. Here's the progression:

![Session progression from Session 1 to Session 5](../diagrams/png/ch02-session-progression.png)

*How each session added a concept and added manual work.*

| Session | Instruction | Memory | Control | Flow |
|---------|------------|--------|---------|------|
| 1 | Basic | None | None | None |
| 2 | Basic | None | None | None |
| 3 | Structured | Manual | None | None |
| 4 | Structured | Manual | Manual (spot-check) | None |
| 5 | Structured | Manual | Manual | Manual |

By Session 5, you're providing all four concepts by hand. The AI is doing the generating, but you're doing the remembering, the checking, the sequencing, and the precision-targeting. You're working harder so the AI can work better. That ratio is backwards.

This is the core tension this book resolves. Each concept genuinely improves the system. But when you're the one running each concept manually, the overhead compounds until the system collapses — not because the ideas are wrong, but because human consistency can't sustain them.

Act 2 externalizes all four. The Instruction becomes a structured prompt loaded from a file. The Memory becomes a state file that reads and writes automatically. The Control becomes hooks that check output before you see it. The Flow becomes a pipeline that manages its own stages. Same concepts. Same AI. But the system runs them instead of you.

Before we get there: Chapter 3 gives you the thinking tools to design these systems before you build them. Three shapes. That's all you need.

---

## How to Know It's Clicking

The exercises for this chapter weren't in a separate section — they were the chapter. Sessions 3, 4, and 5 were real prompts you typed into a real AI tool, producing real output you evaluated. If you skipped them and just read, go back. The concepts don't stick without the experience.

Here's what you should have in your notes by now:

- Quiz scores from all five sessions
- Your study progress note (the one you wrote before Session 4)
- At least one fact-checked answer that was wrong or questionable (from the Control audit)
- The staged session results from Session 5
- A gut feeling for which sessions felt better and which felt like more work

**Concept check.** Can you explain each concept from your own experience, not the book's words?

- "Instruction is what made Session 3 better than Session 1 — I told it specifically what I needed instead of hoping it would guess."
- "Memory is the progress note I pasted in Session 4 — and the reason I'll stop updating it after ten sessions."
- "Control is the fact-checking I did when I found that iffy quiz answer — and the reason I won't do it at midnight."
- "Flow is the staging I did in Session 5 — and the reason I'll collapse back to one prompt by Friday."

If your explanations reference your sessions with your data, the concepts are grounded. If they still sound like textbook definitions, re-run Sessions 3 through 5 with a different topic.

**Diagnosis test.** Find an "AI workflow" post online (YouTube, LinkedIn, Twitter, there are thousands). Can you identify which of the four concepts the workflow addresses and which it ignores? Can you predict where it will break? If you can do this in under two minutes without looking back at this chapter, you're ready.

**The limit test.** Can you articulate, in your own words, why manual Memory, Control, and Flow don't scale? Not because this book said so — because you felt it. Session 4 was better but fragile. Session 5 was better but unsustainable. If you can explain why (too much overhead, human inconsistency, doesn't survive a busy week), you've internalized the motivation for everything Act 2 builds.

Keep your notes. Chapter 3 uses them.


---

# Chapter 3: Design Patterns: Three Shapes Every System Takes

You've now pushed a Study System through five sessions. Each one got better. Each one required more work from you. By Session 5, you were providing all four concepts manually (structured prompts, pasted progress notes, fact-checked answers, staged pipeline) and the AI's actual contribution had shrunk to the part in the middle.

Before we fix that with real tools (that's Act 2), you need one more thing: a way to think about how systems are shaped. Not the concepts (you've got those). The architecture. How the pieces connect.

It turns out every system you'll ever build is some combination of three patterns. Once you know the three shapes, you can design systems on the back of a napkin. Without them, you'll either over-engineer something that should be simple or under-build something that needs structure.

Three shapes. That's the whole chapter.

---

## The Loop: Getting Better Each Time

Process → Check → Improve → Repeat.

You've already used this pattern. Session 5 was a manual Loop. You took a quiz, scored it, identified weak areas, and planned to focus on those areas next time. Quiz → score → analyze → adjust → quiz again. Each cycle carries forward what the last one revealed.

The Loop is the most intuitive pattern because you see it everywhere outside of AI:

Editing your own writing. You draft something, read it back, wince at a sentence, rewrite it, read it back again. Each pass gets closer to what you meant. You stop when it sounds right, or when the deadline hits, whichever comes first.

Cooking without a recipe. You taste the sauce. Too salty. Add some acid. Taste again. Better. Needs heat. Add chili flakes. Taste again. Each cycle is tiny (taste, adjust, taste) but after five cycles, the sauce is yours.

Learning a guitar chord. You press the strings, strum, hear a buzzing sound. Adjust your ring finger. Strum again. Cleaner, but the high E is muted. Shift your index finger. Strum. There it is. Process, check, improve, repeat.

In an AI system, the Loop works the same way:

Your Study System: quiz → score → identify weak areas → generate targeted practice → quiz again. After five loops, the system has zeroed in on your real gaps. After ten, it's focusing on the specific sub-concepts within those gaps. The coverage gets tighter with every cycle because each loop's data informs the next one.

Content creation: draft a blog post → compare it to your writing style → identify where the tone drifts toward generic AI voice → revise with specific corrections → compare again. Each draft is closer to sounding like you.

**When to use it**: Any task where the output can be measured and the measurement tells you what to change. The key question is: "Is this good enough, or should we go again?" If you can answer that question with data (a score, a checklist, a comparison), the Loop applies.

**The danger**: Loops without exit conditions run forever. "Good enough" has to be defined before the loop starts, not discovered along the way. Quiz score above 80% on weak areas. Draft passes the style check on all five criteria. Budget variance under 5%. Without a number, "one more round" becomes infinite revision.

![The Loop pattern: Process, Check, Improve, Repeat](../diagrams/png/ch03-loop.png)

*The Loop: each cycle carries forward what the last one revealed.*

---

## The Gate: Checking Before You Ship

Stage → Quality Check → Pass or Rework.

You've used this one too. When you fact-checked your quiz answers in Chapter 2, you were running a Gate. You took the AI's output (the "correct" answer), checked it against a source, and made a binary decision: correct or not. The Gate didn't improve the answer. It decided whether the answer was trustworthy enough to study from.

A Gate is a checkpoint between stages. Work arrives, the Gate inspects it, and the verdict is pass or go back. There's no "mostly pass." There's no "pass with reservations." It's a yes or a no. That binary is what makes Gates powerful. They force a clear decision at the exact point where bad output becomes expensive.

You know this pattern from life:

Reviewing an email before hitting send. You read it back, check for the right tone, make sure you didn't accidentally CC the wrong person. If something's off, you go back and fix it. If it reads right, you hit send. Gate.

A manager approving a proposal before it goes to the client. They don't rewrite it — they decide whether it's ready. If it's not, it goes back to you with notes. If it is, it moves forward. Gate.

Tasting food before serving it to guests. You taste. It's good? Serve it. Something's off? Fix it first. You don't serve food you haven't tasted because the cost of a bad dish at the table is higher than the cost of five extra seconds at the stove.

In AI systems:

Job Hunting: the AI drafts a cover letter. Before you send it, a check fires: does it mention the company by name (the actual name, not "your company")? Does it reference something specific about the role? Does every claimed accomplishment match your real experience? Is it under 400 words? Pass all four → ready to send. Fail any one → back to drafting with specific feedback about what's wrong.

Project Management: the AI generates a status report. Check: do the task counts match the tracker? Are all blocked items explained? Is the format right for this specific audience (executive summary for the boss, detailed action items for the team)? Pass → deliver. Fail → regenerate with corrections.

**When to use it**: When shipping bad output costs more than checking it. Cover letters you can't un-send. Financial reports people make decisions from. Quiz answers you're going to study and internalize. Client communications that shape how people see you. Anything where a mistake that gets through is worse than a few extra seconds catching it.

**The danger**: Gates can be too strict or too loose. A Gate that blocks everything is as useless as a Gate that passes everything. If your cover letter check requires five paragraphs of personalization for a wide-net application, nothing will ever ship. If your fact-check only verifies that answers "sound right," hallucinations will sail through. Calibration matters. Start strict and loosen over time. It's easier to relax a standard than to undo the damage from bad output that slipped through.

![The Gate pattern: Stage, Quality Check, Pass or Rework](../diagrams/png/ch03-gate.png)

*The Gate: a binary checkpoint between stages. Pass or go back.*

---

## The Router: Different Inputs, Different Handling

Decision Point → Path A or Path B.

The system looks at what's coming in and chooses a different process based on what it sees. Same system, different treatment depending on context.

You almost used this in Chapter 2. In Session 5, when you staged your studying, you implicitly routed: topics you scored high on got light review, topics you bombed got deep study. You made that routing decision in your head, based on your scores. A Router formalizes it — the system looks at the data and picks the path automatically.

Routing is everywhere in daily life:

Email triage. Message from your boss → reply within the hour. Industry newsletter → reading list for the weekend. Promotional email from a store you bought something from once → delete without opening. Three inputs, three paths, decided in about one second based on who sent it.

Getting dressed. Board meeting with external clients → the nice outfit. Team standup on Zoom → whatever you're already wearing. Gym after work → change clothes at 5:30. Same person, same morning, different paths based on what the day requires.

Customer service. Simple question about business hours → FAQ page, no human needed. Complex question about a specific order → route to a specialist. Billing dispute → finance team. One intake, three paths, based on what the customer actually needs.

In AI systems:

Study System: topic mastery score above 90% → light maintenance quiz, just verifying retention. Score between 50-89% → focused practice on the specific gaps. Below 50% → deep study starting from fundamentals, not advanced questions. One input — the topic score — three paths, three intensities. A 92% topic doesn't need the same treatment as a 45% topic.

Project Management: same underlying status data, three different audiences. CEO → three-bullet executive summary with the one thing they need to decide. Engineering team → detailed action items with owners and deadlines. Client → progress highlights with timeline and no internal drama. One input, three routes, three formats. The data doesn't change. The presentation changes completely.

**When to use it**: When different inputs genuinely need different handling. The key word is "genuinely." If you can handle everything the same way with minor tweaks, you don't need a Router. You need a slightly more flexible process. Routing adds complexity. Only route when the difference in handling is substantial, not cosmetic.

**The danger**: Route proliferation. Every route is a process you have to build, maintain, and debug. Three paths: manageable. Five paths: suspicious. Seven paths: you're probably splitting hairs that don't need splitting. If your Router has more than three paths, step back and ask: can any of these be merged? Do paths 2 and 3 really need different handling, or is it the same process with one variable changed?

![The Router pattern: Decision Point, Path A or Path B](../diagrams/png/ch03-router.png)

*The Router: same system, different treatment depending on what comes in.*

---

## Combining Patterns

Real systems aren't pure. They combine patterns. The three shapes are building blocks, not finished buildings.

Here's what a Content System looks like with all three:

**Router** first: blog post → long-form process. Social post → short-form. Newsletter → personal tone. The format determines the path.

**Gate** after research: at least three credible sources and a clear angle? If yes, proceed to drafting. If not, back to research. Don't draft on a foundation of one half-relevant article.

**Loop** on the draft: write → check against voice and style → revise → check again. Exit: passes the style check, or maximum two revision cycles.

Router → Gate → Loop. Three patterns, one system. Variety, quality, refinement. Each pattern handles a different problem.

This isn't a thought experiment. The author runs a content pipeline with exactly this structure: 26 posts tracked, each scored on six dimensions with a 24-out-of-30 minimum to publish. The Gate has sent 15 drafts back to rework. The Router handles four output formats from the same source material. The Loop refines voice until AI-generated text is indistinguishable from the author's own writing. The patterns work at production scale, not just on napkins.

A Job Hunting System uses two:

**Router**: Dream company you'd give anything to work for → full custom treatment. Every sentence tailored, deep company research, specific examples matched to their values. Wide-net application to keep pipeline full → solid template with targeted adjustments. Same system, two paths, appropriate effort for each.

**Gate**: Before sending anything (dream job or wide-net), check: company name correct and spelled right? (You'd be amazed.) Specific reference to the role, not just the job title? Every experience claim matches the real career profile? Under word count? All pass → ready. Any fail → back to drafting. No exceptions. The Gate doesn't care whether you're excited about this application or exhausted by it.

Notice what's NOT combined: the Job Hunting System doesn't need a Loop. The cover letter either passes the Gate or it doesn't. If it fails, it goes back to drafting with specific feedback. That's the Gate's rework path, not a Loop. A Loop would be for iteratively improving something that's already acceptable but not great. The Gate handles the "is this ready" question. Different pattern, different job.

---

## The Napkin Test

If you can't draw your system on a napkin (an actual napkin, a sticky note, the back of a receipt), it's too complicated.

This isn't a cute metaphor. It's a real design constraint. A system you can't sketch is a system you can't explain to someone else, which means it's a system you can't debug when it breaks, which means it's a system that will break and stay broken.

The notation is simple: boxes for processes, arrows for flow, diamonds for decisions (Router), horizontal lines for checkpoints (Gate), curved arrows going backward for loops. If you need more symbols than that, you're designing something too complex.

The napkin test forces you to leave out everything that doesn't matter. When you only have a small space, you can't include every edge case. You can't diagram what happens when the API times out AND the state file is corrupted AND the user gives bad input all at the same time. You have to draw the main path (the normal flow of the system) and trust that edge cases will be handled when they come up.

That constraint is the feature. Systems that try to handle every scenario up front end up handling none of them well. Systems that nail the main path and add edge-case handling when real failures occur end up simple, reliable, and maintainable.

![A napkin sketch of a system using all three patterns](../diagrams/png/ch03-napkin-sketch.png)

*A napkin sketch of the Study System. Boxes, arrows, and labels. That's all you need.*

---

## Designing From Scratch: Six Steps

You now have a vocabulary (four concepts) and a set of shapes (three patterns). Here's how to put them together when you're starting from nothing.

**Step 1: Start with the goal.** Not a vague goal, but a specific picture of what RIGHT looks like. "A good study session" is vague. "I spent 80% of my time on topics I haven't mastered, and the quiz targeted the specific concepts I keep getting wrong, not just the broad topic areas" is specific. The more concrete your picture of success, the easier it is to design toward it.

**Step 2: Map inputs and outputs.** What goes in? Study materials, prior quiz scores, a list of topics. What comes out? A targeted quiz, a score, an updated progress record, a plan for next session. Write them down. When you can see the inputs and outputs, you can see the gap in between — that's where the system lives.

**Step 3: Identify the constraint.** Not everything that could go wrong — the thing that goes wrong MOST, or costs the MOST when it does. For your Study System, the biggest constraint is probably random topic coverage. The AI quizzes you on whatever it feels like instead of targeting your weak areas. That's the constraint. Fix that, and the system improves more than fixing anything else.

**Step 4: Pick a pattern.** Random coverage → you need a **Loop** (assess → study → reassess → the system gets smarter with each cycle) and probably a **Router** (different mastery levels get different study intensity). Two patterns. You might also need a **Gate** (are the quiz answers actually correct before you study from them?). Three patterns if the accuracy problem is bad enough.

**Step 5: Add concepts to prevent specific failures.** This is where the four concepts from Chapters 1 and 2 come back. Memory → prevents "starts from zero every session." Control → prevents "learning wrong answers." Flow → prevents "trying to do everything in one prompt." Instruction → prevents "vague output from vague requests." Only add a concept when you can name the failure it prevents. If you can't name the failure, you don't need the concept yet.

**Step 6: Imagine failure.** What if the input is bad (incomplete notes, wrong topic)? What if the state file has outdated information? What if the reader is short on time and can only do a 10-minute session instead of 30? Each anticipated failure is a check you could build. You don't build them all now. You note them and build the checks when (if) the failures actually occur. Design for the common case. Handle the edge cases when they bite you.

That's six steps. Not a rigid methodology, but a thinking process. For simple systems, you'll skip steps or combine them. For complex ones, you might spend real time on Step 3, because identifying the right constraint is the difference between a system that solves the actual problem and one that solves a problem nobody has.

---

## The Worked Example: Your Study System on a Napkin

Before the full sketch, here's what a simple system looks like in this notation. A basic Loop for editing a draft:

```
[Draft] --> [Check: sounds like me?]
               |           |
             [yes]        [no]
               |           |
             [Done]    [Revise] --> back to Draft
```

That's it. Boxes for steps, arrows for flow, a decision point, and a backward arrow for the loop. Everything you need.

Now the full Study System, the one you've been running manually for five sessions, sketched as a design. Every element maps to something you've already experienced.

```
STUDY SYSTEM - NAPKIN SKETCH

[Study materials + Progress notes]
              |
              v
    +---------+---------+
    |    ASSESS LEVEL    |  <-- reads progress notes (MEMORY)
    +---+-----+-----+---+
        |     |     |
        v     v     v
      [90%+] [50-89%] [<50%]     <-- ROUTER: score determines path
        |       |       |
        v       v       v
    [Light   [Focused [Deep
     review]  practice] study]
        |       |       |
        +---+---+---+---+
            |
            v
    +-------+-------+
    |  GENERATE QUIZ  |  <-- calibrated to path
    +-------+-------+
            |
            v
    +-------+-------+
    |   TAKE QUIZ    |
    +-------+-------+
            |
            v
    +-------+-------+
    | CHECK ANSWERS  |  <-- GATE: are answers correct? (CONTROL)
    +-------+-------+
         |       |
       [pass]  [fail --> flag & correct]
         |
         v
    +----+----+
    |  SCORE  |
    +----+----+
         |
         v
    +----+------+
    | UPDATE    |  <-- writes to progress notes (MEMORY)
    | PROGRESS  |
    +----+------+
         |
         v
    +----+------+
    | GOOD      |  <-- LOOP exit check:
    | ENOUGH?   |  score >= 80% on weak areas?
    +----+--+---+
         |  |
       [yes] [no --> back to ASSESS]
         |
         v
      [DONE -- plan next session]
```

Walk through it with me.

The system starts by reading your progress notes — that's Memory. It knows your history before generating anything.

Then the **Router** kicks in. It looks at your score for each topic and routes to the right intensity. Topics you've mastered (90%+) get light review, just enough to verify retention, not enough to waste your time. Topics in the middle range (50-89%) get focused practice: targeted questions on the specific concepts you're getting wrong. Topics below 50% get deep study, back to fundamentals, not advanced questions you're not ready for.

The quiz gets generated, calibrated to whichever path the Router chose. You take it.

Then the **Gate**. Before you study from the answers, the system checks: are they actually correct? You experienced this in Chapter 2 when you fact-checked and found a questionable answer. The Gate catches that before the wrong "correct" answer becomes something you memorize.

You score. The progress notes get updated. That's Memory again, writing this time. Your topics, scores, and weak areas are recorded so the next session can read them.

Finally, the **Loop** decides: good enough? If your weak-area scores are above 80%, you're done for today. Plan the next session and stop. If they're below 80%, loop back to ASSESS and run another cycle. Each loop gets tighter because the progress notes now include the latest round's data.

Every piece of this diagram maps to something you felt in Chapters 1 and 2. The Router is what you did implicitly in Session 5 when you focused more on weak topics. The Gate is the fact-checking you did when you audited quiz answers. The Loop is the progression from Session 1 to Session 5, each one informed by what you learned in the last. The Memory reads and writes are the progress note you maintained by hand.

The difference: in this design, the system does all of it. You're the one studying. The system handles everything else.

This is a design. Not code. Not prompts. Not a specific tool. Just boxes, arrows, and labels on what could literally be a napkin. And it already tells you everything the system needs to do. In Chapter 4, you'll start turning this sketch into a real system that actually runs. The shape won't change — just the implementation.

---

## Exercises

### Exercise 1: Pattern Spotting

Over the next 24 hours, find one real-world example of each pattern in your daily life. Not in AI — in anything. Cooking, commuting, work, hobbies, errands, conversations.

For each one, write down: what's being processed, what the check or decision is, and what happens when it fails. Three examples, three sentences each. That's it.

The point isn't to practice AI design. The point is to train your eye. Once you start seeing Loops, Gates, and Routers in everyday life, you'll see them in every AI interaction too — and you'll see where they're missing.

### Exercise 2: Design Your Study System

Using the six-step process and the worked example as reference, draw your own version of the Study System napkin sketch. Use your actual topic, your actual weak areas from Sessions 1-5, your actual scores.

Your sketch should include:
- At least one pattern (Loop, Gate, or Router), drawn and labeled
- Where Memory enters and exits (what gets read at start, what gets written at end)
- Where a Control check happens (what specifically gets verified)
- Your exit condition for the Loop (what score or threshold means "done for today")

Boxes and arrows. Labels. Ten minutes maximum. Don't overthink it. A rough sketch with the right patterns beats a polished diagram with the wrong constraint.

Keep this sketch. It's your blueprint for Chapter 4.

### Exercise 3: Design a Second System

Pick one of the other three throughlines, whichever matches your life right now:

- **Job Hunting**: if you're searching, considering a change, or want to be ready when an opportunity shows up
- **Project Management**: if you manage work, deadlines, or tasks for yourself or a team
- **Content Creation**: if you write, create, or publish anything: blog posts, newsletters, social media, reports

Same six steps. Same napkin sketch. Same ten minutes. The goal isn't a perfect design. It's practicing the process. A rough sketch with the right patterns identified beats a detailed diagram with the wrong constraint identified.

### Exercise 4: Audit Someone Else's System

Find an "AI workflow" or "AI automation" post online (YouTube, LinkedIn, Twitter, there are thousands). Sketch their system using the three patterns. Then answer:

- Which patterns are they using?
- Which are missing?
- Where's the constraint? What fails most or costs the most?
- If you added one Gate, where would it go and what would it check?

Five sentences maximum. The brevity is the exercise. If you can diagnose a system in five sentences, you understand the patterns.

---

## How to Know It's Clicking

**Pattern recall.** Without looking back, draw all three patterns from memory and write one sentence describing when to use each. If someone else could choose the right pattern for a given problem using only your descriptions, you've got it.

**Pattern selection.** Try these three scenarios. For each, pick the pattern and explain why the other two don't fit:

*"My AI drafts are okay but never great. I keep tweaking and re-running."* That's a Loop. The work improves through iteration. A Gate doesn't fit because the work isn't wrong, just not good enough yet. A Router doesn't fit because the process doesn't change based on input type.

*"Sometimes my AI output is perfectly fine and sometimes it has errors that would embarrass me."* That's a Gate. You need a quality check before using the output. A Loop would over-iterate work that's already fine. A Router doesn't apply; the issue is quality, not input type.

*"I use the same AI prompt for quick emails and detailed proposals, and it works badly for both."* That's a Router. Different inputs need different processes. A Loop won't help; iterating on the wrong process doesn't make it the right process. A Gate would catch bad output but not prevent the mismatch that caused it.

If you got all three and can explain why the alternatives don't fit, you're solid.

**Design ability.** Set a timer for fifteen minutes. Pick a task not covered in any exercise, something from your own life. Produce a napkin sketch with at least one pattern, at least two concept components (with the failure each one prevents), and at least one "what if it breaks" scenario. If someone else can understand the sketch without you narrating it, you're ready for Act 2.

---

## Ready for Act 2

Here's where you are.

You've built a Study System from nothing — five sessions, each one better, each one requiring more manual labor. You've felt all four concepts work and watched each one fail when you're the one running it by hand. You have a vocabulary that doesn't depend on any tool: four concepts, three patterns, a six-step design process.

You have a napkin sketch of the system you want to build. You know what each piece does and which failure it prevents.

Act 2 gives you the tools to build it for real. You already know what you're building and why. That's the hard part — and you've already done it.

One more thing before we start building. Everything in Act 2 comes from real systems the author uses in production, not tutorials written for a book. A study system tracking 127 curriculum items with quiz scoring and gap detection. A work operations system with 15 specialized agents and 80,000 reference documents. A content pipeline that's produced 26 scored posts across multiple platforms. The patterns you're about to learn are extracted from systems that run every day. The research repository for this book has the evidence: architecture diagrams, prompt comparisons, eval notebooks you can run yourself. When someone asks "does this actually work?" the answer isn't "trust me." It's "here's the data."

Let's build.
