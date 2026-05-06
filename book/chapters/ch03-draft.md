# Chapter 3: Design Patterns — Three Shapes Every System Takes

You've now pushed a Study System through five sessions. Each one got better. Each one required more work from you. By Session 5, you were providing all four concepts manually — structured prompts, pasted progress notes, fact-checked answers, staged pipeline — and the AI's actual contribution had shrunk to the part in the middle.

Before we fix that with real tools (that's Act 2), you need one more thing: a way to think about how systems are shaped. Not the concepts — you've got those. The architecture. How the pieces connect.

It turns out every system you'll ever build is some combination of three patterns. Once you know the three shapes, you can design systems on the back of a napkin. Without them, you'll either over-engineer something that should be simple or under-build something that needs structure.

Three shapes. That's the whole chapter.

---

## The Loop: Getting Better Each Time

Process → Check → Improve → Repeat.

You've already used this pattern. Session 5 was a manual Loop. You took a quiz, scored it, identified weak areas, and planned to focus on those areas next time. Quiz → score → analyze → adjust → quiz again. Each cycle carries forward what the last one revealed.

The Loop is the most intuitive pattern because you see it everywhere outside of AI:

Editing your own writing. You draft something, read it back, wince at a sentence, rewrite it, read it back again. Each pass gets closer to what you meant. You stop when it sounds right — or when the deadline hits, whichever comes first.

Cooking without a recipe. You taste the sauce. Too salty. Add some acid. Taste again. Better. Needs heat. Add chili flakes. Taste again. Each cycle is tiny — taste, adjust, taste — but after five cycles, the sauce is yours.

Learning a guitar chord. You press the strings, strum, hear a buzzing sound. Adjust your ring finger. Strum again. Cleaner, but the high E is muted. Shift your index finger. Strum. There it is. Process, check, improve, repeat.

In an AI system, the Loop works the same way:

Your Study System: quiz → score → identify weak areas → generate targeted practice → quiz again. After five loops, the system has zeroed in on your real gaps. After ten, it's focusing on the specific sub-concepts within those gaps. The coverage gets tighter with every cycle because each loop's data informs the next one.

Content creation: draft a blog post → compare it to your writing style → identify where the tone drifts toward generic AI voice → revise with specific corrections → compare again. Each draft is closer to sounding like you.

**When to use it**: Any task where the output can be measured and the measurement tells you what to change. The key question is: "Is this good enough, or should we go again?" If you can answer that question with data — a score, a checklist, a comparison — the Loop applies.

**The danger**: Loops without exit conditions run forever. "Good enough" has to be defined before the loop starts, not discovered along the way. Quiz score above 80% on weak areas. Draft passes the style check on all five criteria. Budget variance under 5%. Without a number, "one more round" becomes infinite revision.

---

## The Gate: Checking Before You Ship

Stage → Quality Check → Pass or Rework.

You've used this one too. When you fact-checked your quiz answers in Chapter 2, you were running a Gate. You took the AI's output (the "correct" answer), checked it against a source, and made a binary decision: correct or not. The Gate didn't improve the answer. It decided whether the answer was trustworthy enough to study from.

A Gate is a checkpoint between stages. Work arrives, the Gate inspects it, and the verdict is pass or go back. There's no "mostly pass." There's no "pass with reservations." It's a yes or a no. That binary is what makes Gates powerful — they force a clear decision at the exact point where bad output becomes expensive.

You know this pattern from life:

Reviewing an email before hitting send. You read it back, check for the right tone, make sure you didn't accidentally CC the wrong person. If something's off, you go back and fix it. If it reads right, you hit send. Gate.

A manager approving a proposal before it goes to the client. They don't rewrite it — they decide whether it's ready. If it's not, it goes back to you with notes. If it is, it moves forward. Gate.

Tasting food before serving it to guests. You taste. It's good? Serve it. Something's off? Fix it first. You don't serve food you haven't tasted because the cost of a bad dish at the table is higher than the cost of five extra seconds at the stove.

In AI systems:

Job Hunting: Claude drafts a cover letter. Before you send it, a check fires: does it mention the company by name — the actual name, not "your company"? Does it reference something specific about the role? Does every claimed accomplishment match your real experience? Is it under 400 words? Pass all four → ready to send. Fail any one → back to drafting with specific feedback about what's wrong.

Project Management: Claude generates a status report. Check: do the task counts match the tracker? Are all blocked items explained? Is the format right for this specific audience — executive summary for the boss, detailed action items for the team? Pass → deliver. Fail → regenerate with corrections.

**When to use it**: When shipping bad output costs more than checking it. Cover letters you can't un-send. Financial reports people make decisions from. Quiz answers you're going to study and internalize. Client communications that shape how people see you. Anything where a mistake that gets through is worse than a few extra seconds catching it.

**The danger**: Gates can be too strict or too loose. A Gate that blocks everything is as useless as a Gate that passes everything. If your cover letter check requires five paragraphs of personalization for a wide-net application, nothing will ever ship. If your fact-check only verifies that answers "sound right," hallucinations will sail through. Calibration matters. Start strict and loosen over time — it's easier to relax a standard than to undo the damage from bad output that slipped through.

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

**When to use it**: When different inputs genuinely need different handling. The key word is "genuinely." If you can handle everything the same way with minor tweaks, you don't need a Router — you need a slightly more flexible process. Routing adds complexity. Only route when the difference in handling is substantial, not cosmetic.

**The danger**: Route proliferation. Every route is a process you have to build, maintain, and debug. Three paths: manageable. Five paths: suspicious. Seven paths: you're probably splitting hairs that don't need splitting. If your Router has more than three paths, step back and ask: can any of these be merged? Do paths 2 and 3 really need different handling, or is it the same process with one variable changed?

---

## Combining Patterns

Real systems aren't pure. They combine patterns. The three shapes are building blocks, not finished buildings.

Here's what a Content System looks like with all three:

Start with a **Router**. What kind of content? Blog post → long-form research and drafting process. Social media post → short-form, different structure, different voice. Newsletter → personal tone, different opening style. The format determines the path.

Then a **Gate**. After the research stage, check: are there at least three credible sources? Is there a clear angle that hasn't been covered a hundred times? If yes, proceed to drafting. If not, back to research with a note about what's missing. Don't draft a blog post on a foundation of one half-relevant article.

Then a **Loop**. Draft → check against the writer's voice and style rules → revise where the tone drifts → check again. Exit condition: passes the style check on all criteria, or maximum two revision cycles (because infinite polishing is its own problem).

Router → Gate → Loop. Three patterns, one system. Each pattern handles a different problem: the Router handles variety (different formats need different processes), the Gate handles quality (don't build on bad research), the Loop handles refinement (get the voice right through iteration).

A Job Hunting System uses two:

**Router**: Dream company you'd give anything to work for → full custom treatment. Every sentence tailored, deep company research, specific examples matched to their values. Wide-net application to keep pipeline full → solid template with targeted adjustments. Same system, two paths, appropriate effort for each.

**Gate**: Before sending anything — dream job or wide-net — check: company name correct and spelled right? (You'd be amazed.) Specific reference to the role, not just the job title? Every experience claim matches the real career profile? Under word count? All pass → ready. Any fail → back to drafting. No exceptions. The Gate doesn't care whether you're excited about this application or exhausted by it.

Notice what's NOT combined: the Job Hunting System doesn't need a Loop. The cover letter either passes the Gate or it doesn't. If it fails, it goes back to drafting with specific feedback — that's the Gate's rework path, not a Loop. A Loop would be for iteratively improving something that's already acceptable but not great. The Gate handles the "is this ready" question. Different pattern, different job.

---

## The Napkin Test

If you can't draw your system on a napkin — an actual napkin, a sticky note, the back of a receipt — it's too complicated.

This isn't a cute metaphor. It's a real design constraint. A system you can't sketch is a system you can't explain to someone else, which means it's a system you can't debug when it breaks, which means it's a system that will break and stay broken.

The notation is simple: boxes for processes, arrows for flow, diamonds for decisions (Router), horizontal lines for checkpoints (Gate), curved arrows going backward for loops. If you need more symbols than that, you're designing something too complex.

The napkin test forces you to leave out everything that doesn't matter. When you only have a small space, you can't include every edge case. You can't diagram what happens when the API times out AND the state file is corrupted AND the user gives bad input all at the same time. You have to draw the main path — the normal flow of the system — and trust that edge cases will be handled when they come up.

That constraint is the feature. Systems that try to handle every scenario up front end up handling none of them well. Systems that nail the main path and add edge-case handling when real failures occur end up simple, reliable, and maintainable.

---

## Designing From Scratch: Six Steps

You now have a vocabulary (four concepts) and a set of shapes (three patterns). Here's how to put them together when you're starting from nothing.

**Step 1: Start with the goal.** Not a vague goal — a specific picture of what RIGHT looks like. "A good study session" is vague. "I spent 80% of my time on topics I haven't mastered, and the quiz targeted the specific concepts I keep getting wrong, not just the broad topic areas" is specific. The more concrete your picture of success, the easier it is to design toward it.

**Step 2: Map inputs and outputs.** What goes in? Study materials, prior quiz scores, a list of topics. What comes out? A targeted quiz, a score, an updated progress record, a plan for next session. Write them down. When you can see the inputs and outputs, you can see the gap in between — that's where the system lives.

**Step 3: Identify the constraint.** Not everything that could go wrong — the thing that goes wrong MOST, or costs the MOST when it does. For your Study System, the biggest constraint is probably random topic coverage. The AI quizzes you on whatever it feels like instead of targeting your weak areas. That's the constraint. Fix that, and the system improves more than fixing anything else.

**Step 4: Pick a pattern.** Random coverage → you need a **Loop** (assess → study → reassess → the system gets smarter with each cycle) and probably a **Router** (different mastery levels get different study intensity). Two patterns. You might also need a **Gate** (are the quiz answers actually correct before you study from them?). Three patterns if the accuracy problem is bad enough.

**Step 5: Add concepts to prevent specific failures.** This is where the four concepts from Chapters 1 and 2 come back. Memory → prevents "starts from zero every session." Control → prevents "learning wrong answers." Flow → prevents "trying to do everything in one prompt." Instruction → prevents "vague output from vague requests." Only add a concept when you can name the failure it prevents. If you can't name the failure, you don't need the concept yet.

**Step 6: Imagine failure.** What if the input is bad — incomplete notes, wrong topic? What if the state file has outdated information? What if the reader is short on time and can only do a 10-minute session instead of 30? Each anticipated failure is a check you could build. You don't build them all now — you note them and build the checks when (if) the failures actually occur. Design for the common case. Handle the edge cases when they bite you.

That's six steps. Not a rigid methodology — a thinking process. For simple systems, you'll skip steps or combine them. For complex ones, you might spend real time on Step 3, because identifying the right constraint is the difference between a system that solves the actual problem and one that solves a problem nobody has.

---

## The Worked Example: Your Study System on a Napkin

Let's put it all together. Here's the Study System — the one you've been running manually for five sessions — sketched as a design. Every element maps to something you've already experienced.

```
STUDY SYSTEM — NAPKIN SKETCH

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

Then the **Router** kicks in. It looks at your score for each topic and routes to the right intensity. Topics you've mastered (90%+) get light review — just enough to verify retention, not enough to waste your time. Topics in the middle range (50-89%) get focused practice — targeted questions on the specific concepts you're getting wrong. Topics below 50% get deep study — back to fundamentals, not advanced questions you're not ready for.

The quiz gets generated, calibrated to whichever path the Router chose. You take it.

Then the **Gate**. Before you study from the answers, the system checks: are they actually correct? You experienced this in Chapter 2 when you fact-checked and found a questionable answer. The Gate catches that before the wrong "correct" answer becomes something you memorize.

You score. The progress notes get updated — that's Memory again, writing this time. Your topics, scores, and weak areas are recorded so the next session can read them.

Finally, the **Loop** decides: good enough? If your weak-area scores are above 80%, you're done for today — plan the next session and stop. If they're below 80%, loop back to ASSESS and run another cycle. Each loop gets tighter because the progress notes now include the latest round's data.

Every piece of this diagram maps to something you felt in Chapters 1 and 2. The Router is what you did implicitly in Session 5 when you focused more on weak topics. The Gate is the fact-checking you did when you audited quiz answers. The Loop is the progression from Session 1 to Session 5 — each one informed by what you learned in the last. The Memory reads and writes are the progress note you maintained by hand.

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

Boxes and arrows. Labels. Ten minutes maximum. Don't overthink it — a rough sketch with the right patterns beats a polished diagram with the wrong constraint.

Keep this sketch. It's your blueprint for Chapter 4.

### Exercise 3: Design a Second System

Pick one of the other three throughlines — whichever matches your life right now:

- **Job Hunting**: if you're searching, considering a change, or want to be ready when an opportunity shows up
- **Project Management**: if you manage work, deadlines, or tasks for yourself or a team
- **Content Creation**: if you write, create, or publish anything — blog posts, newsletters, social media, reports

Same six steps. Same napkin sketch. Same ten minutes. The goal isn't a perfect design — it's practicing the process. A rough sketch with the right patterns identified beats a detailed diagram with the wrong constraint identified.

### Exercise 4: Audit Someone Else's System

Find an "AI workflow" or "AI automation" post online — YouTube, LinkedIn, Twitter, there are thousands. Sketch their system using the three patterns. Then answer:

- Which patterns are they using?
- Which are missing?
- Where's the constraint — what fails most or costs the most?
- If you added one Gate, where would it go and what would it check?

Five sentences maximum. The brevity is the exercise. If you can diagnose a system in five sentences, you understand the patterns.

---

## How to Know It's Clicking

**Pattern recall.** Without looking back, draw all three patterns from memory and write one sentence describing when to use each. If someone else could choose the right pattern for a given problem using only your descriptions, you've got it.

**Pattern selection.** Try these three scenarios. For each, pick the pattern and explain why the other two don't fit:

*"My AI drafts are okay but never great. I keep tweaking and re-running."* That's a Loop. The work improves through iteration. A Gate doesn't fit — the work isn't wrong, just not good enough yet. A Router doesn't fit — the process doesn't change based on input type.

*"Sometimes my AI output is perfectly fine and sometimes it has errors that would embarrass me."* That's a Gate. You need a quality check before using the output. A Loop would over-iterate work that's already fine. A Router doesn't apply — the issue is quality, not input type.

*"I use the same AI prompt for quick emails and detailed proposals, and it works badly for both."* That's a Router. Different inputs need different processes. A Loop won't help — iterating on the wrong process doesn't make it the right process. A Gate would catch bad output but not prevent the mismatch that caused it.

If you got all three and can explain why the alternatives don't fit, you're solid.

**Design ability.** Set a timer for fifteen minutes. Pick a task not covered in any exercise — something from your own life. Produce a napkin sketch with at least one pattern, at least two concept components (with the failure each one prevents), and at least one "what if it breaks" scenario. If someone else can understand the sketch without you narrating it, you're ready for Act 2.

---

## Ready for Act 2

Here's where you are.

You've built a Study System from nothing — five sessions, each one better, each one requiring more manual labor. You've felt all four concepts work and watched each one fail when you're the one running it by hand. You have a vocabulary that doesn't depend on any tool: four concepts, three patterns, a six-step design process.

You have a napkin sketch of the system you want to build. You know what each piece does and which failure it prevents.

Act 2 gives you the tools to build it for real. You already know what you're building and why. That's the hard part — and you've already done it.

Let's build.
