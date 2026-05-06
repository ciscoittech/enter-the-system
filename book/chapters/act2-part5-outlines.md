# Act 2, Part V — Detailed Chapter Outlines

*Chapters 10, 11, 12, 13: Mastery*
*No new components introduced. The reader enters Part V with all six components (Prompt, State, Skill, Hook, Connection, Pipeline) deployed across all four systems. These chapters teach debugging, composition, independent design, and forward-looking skills.*

*The reader enters Part V with a complete toolkit: 5 CLAUDE.md files, 4 state files, 5+ skill files, 7+ hook scripts, connections to external sources, and multi-stage pipelines — all four systems at v6. They leave the book able to diagnose failures, wire systems together, design new systems from scratch, and evaluate new tools without starting over.*

---

# Chapter 10: When Systems Break — Debugging

**Title**: When Systems Break — Debugging
**Word target**: 3,500–4,500 words
**Component introduced**: None — this chapter teaches diagnosis and repair
**Primary system**: All four (organized by failure type)
**Universal concept**: All four, applied to failure analysis
**Claude Code feature**: No new features — applies everything from Ch 4–9

---

## Bridge from Chapter 9

The reader finished Ch 9 with:
- All four systems at v6 — every system has all six components (Prompt, State, Skill, Hook, Connection, Pipeline)
- A working content pipeline that produces publish-ready work in stages
- Pipelines extended to all four systems with quality gates between stages
- The confidence that comes from building something complex that actually works

And then something breaks.

Not dramatically. Not all at once. The Study System starts re-covering mastered topics. The Content Pipeline gets stuck in a revision loop. A cover letter slips through with a fabricated credential the hook should have caught. The PM system generates a status update that contradicts its own task list.

Ch 10 gives the reader a protocol for finding what broke and fixing it — without adding complexity. The instinct will be to add more to the prompt. This chapter teaches them to fix the component instead.

---

## Chapter Goals

By the end of this chapter, the reader can:

1. **Use the failure taxonomy** to map any system symptom to the responsible component in under 2 minutes
2. **Follow the debugging protocol**: symptom → component → isolate → fix → add a check — without skipping steps
3. **Distinguish debugging from maintenance**: maintenance prevents drift (taught per-component in Ch 5–9); debugging fixes what broke despite maintenance
4. **Resist the "add more to the prompt" instinct**: recognize when they're patching the wrong component
5. **Diagnose a real failure** in one of their own systems and fix it without making the system more complex

---

## Section-by-Section Breakdown

### Section 1: The Failure That Looked Like a Prompt Problem (~400 words)

**Narrative beat**: Open with a specific, relatable scenario that the reader misdiagnoses at first — they think the prompt is wrong, but the real problem is a different component.

**Content**:

Your Content System has been running for three weeks. 9 blog posts drafted, 7 published. The pipeline works. Then Post #10 comes out wrong. The voice is off — formal, stiff, nothing like your writing. The hook didn't catch it because the hook checks for banned words and word count, not overall tone.

Your instinct: fix the prompt. You open your Content CLAUDE.md and add: "Remember to match my casual, conversational tone. Don't be formal. Sound like me." You run the pipeline again. Post #11 is slightly better. Post #12 drifts back to stiff. You add more words to the prompt. Post #13 is better. Post #14 is stiff again.

You're playing whack-a-mole with the prompt. That's the tell — when you keep adding words to the prompt and the problem keeps coming back, you're fixing the wrong thing.

The real problem: your editorial-voice skill file. You updated it two weeks ago — added 8 new "rules" about tone and structure. The file is now 2,800 words. Claude's attention is diluted. The examples that used to anchor your voice are buried under rules that contradict each other. The skill got too long and too noisy.

The fix isn't more prompt words. It's cutting the skill back to 1,500 words — keeping the 3 strongest writing examples, removing the rules that restate what the examples already show. One component change. Problem solved. No prompt bloat.

That's what debugging looks like: the symptom points one direction (bad output → must be the prompt), but the cause is somewhere else (overloaded skill). This chapter teaches you to follow the trail to the real problem.

---

### Section 2: The Failure Taxonomy (~500 words)

**Narrative beat**: Give the reader a diagnostic map. Every symptom maps to a component. This is the reference they'll use every time something breaks.

**Content**:

Present the taxonomy as a table the reader can bookmark:

| What You See | What's Actually Wrong | Component | First Thing to Check |
|---|---|---|---|
| "It didn't do what I asked" | Instructions unclear or conflicting | Instruction (Prompt/Skill) | Is the CLAUDE.md specific? Are skill rules contradicting examples? |
| "It forgot what we did last time" | State not reading or writing | Memory (State) | Open the state file — is recent session data there? |
| "It remembers wrong things" | State file has stale or incorrect data | Memory (State) | When was the state file last cleaned? Are archived items polluting active data? |
| "Output sounds generic, not like me" | Skill not loading or too diluted | Instruction (Skill) | Is the skill under 2,000 words? Are the examples still representative? |
| "It gave me confident garbage" | Hook missing or not firing | Control (Hook) | Test the hook manually — does it catch known-bad input? |
| "It caught everything, even good stuff" | Hook too strict | Control (Hook) | Check false positive rate. Loosen thresholds. |
| "It tried to do everything at once" | Missing pipeline stages | Flow (Pipeline) | Does the task need staging? Where should the gates be? |
| "It couldn't get the data it needed" | Connection down or auth expired | Flow (Connection) | Test the connection independently — does a simple query return data? |
| "Pipeline gets stuck in a loop" | Quality gate too strict or feedback too vague | Flow (Pipeline) | What does the gate reject? Is the feedback specific enough for Claude to fix? |
| "It used to work and now it doesn't" | Something changed — find what | Any | What's different since it last worked? File edit, skill update, connection change? |

**Writer guidance**: This table is the chapter's most reusable artifact. Design it to be pinned to a wall or saved as a screenshot. Each row is a real failure the reader has seen or will see. The "First Thing to Check" column saves them 20 minutes of guessing.

After the table, add the key insight: "Notice what's NOT in this table: 'The AI is broken.' In six months of building these systems, you will never fix a problem by blaming the AI. Every failure maps to a component YOU built. That's not an insult — it's freedom. If you built it, you can fix it."

---

### Section 3: The Debugging Protocol (~400 words)

**Narrative beat**: A repeatable 5-step process. Not a flowchart to memorize — a habit to build.

**Content**:

**Step 1: Name the symptom.** Not "it's broken" — what SPECIFICALLY went wrong? "The cover letter mentioned a project I never worked on." "The quiz covered topics I already mastered." "The status update says 5 tasks are done but the state file shows 3." Specific symptoms point to specific components.

**Step 2: Map to a component.** Use the taxonomy table. The symptom tells you where to look. "Mentioned a project I never worked on" → the career-profile skill doesn't have it, so either the skill isn't loading or the hook isn't catching fabrications. That's Instruction or Control. Two suspects, not six.

**Step 3: Isolate.** Test the suspected component alone. Does the skill file load? (Ask Claude: "What's in my career-profile skill?" If it can't answer, the skill isn't loading.) Does the hook fire? (Feed it known-bad input — a cover letter that mentions a fake company. If it doesn't flag it, the hook is the problem.) Does the state file have the right data? (Open it and read it yourself.)

**Step 4: Fix the component.** Not the prompt — the component. If the skill isn't loading, check the frontmatter. If the hook isn't firing, check settings.json registration and `chmod +x`. If the state is wrong, correct the data and check the read/write instructions in CLAUDE.md. One fix, one component.

**Step 5: Add a check.** Whatever just broke, make sure you'll know if it breaks again. If the skill wasn't loading, add a line to your CLAUDE.md: "At session start, confirm you've loaded the career-profile skill." If the hook wasn't firing, add a test to your monthly maintenance: "Feed a fake company name and verify the hook catches it." The fix stops the bleeding. The check prevents the recurrence.

**Writer guidance**: The protocol should feel like a habit, not a ceremony. Linger on Step 2 — mapping to a component is the hard part. Steps 3-5 are mechanical once you know where to look. The skill is diagnosis, not surgery.

---

### Section 4: Debug Scenarios — Study System (~500 words)

**Narrative beat**: Real failures the reader can reproduce in their own system. Each scenario follows the protocol.

**Content**:

**Scenario A: The quiz keeps covering mastered topics.**

*Symptom*: You've scored 90%+ on "subnet masks" three sessions in a row. Session 4 still quizzes you on subnet masks. The system isn't adapting.

*Map to component*: The system should know you've mastered this. That's Memory — the state file.

*Isolate*: Open `study-state.md`. Look at the topics table. Is "subnet masks" marked as strong/mastered? If not, the state isn't being written correctly — Claude isn't updating mastery levels after each quiz. If it IS marked as mastered, the problem shifts: Claude reads the state but ignores it. That's Instruction — the CLAUDE.md doesn't tell Claude to deprioritize mastered topics strongly enough.

*Fix*:
- If state isn't updating: check the CLAUDE.md section that tells Claude to write to state. Is the instruction specific? "Update mastery level based on quiz score" is vague. "If I score 90%+ on a topic in 2 consecutive sessions, mark it as MASTERED and don't include it in future quizzes unless I ask" is actionable.
- If state is correct but ignored: add to CLAUDE.md: "Before generating a quiz, read study-state.md. Do NOT quiz me on topics marked MASTERED. Spend 80% of questions on WEAK topics, 20% on MODERATE."

*Add a check*: The `check-weak-area-focus.sh` hook from Ch 7 should catch this. If it's not, tighten it — verify at least 60% of quiz questions target weak or moderate topics. If the hook exists and isn't firing, check registration in settings.json.

**Scenario B: Explanations use jargon above your level.**

*Symptom*: You set your level as "beginner — no networking background" in the study-method skill. Claude explains OSPF routing using terms like "link-state advertisement" and "Dijkstra's algorithm" without translation.

*Map to component*: Claude knows your level (it's in the skill) but isn't applying it. That's Instruction — the skill.

*Isolate*: Open `study-method.md`. Does it say "explain at beginner level"? That's too vague. Claude's version of "beginner" might include Dijkstra. Does it say "never use a technical term without immediately explaining it in one sentence of plain English"? That's specific.

*Fix*: Update the skill with a concrete rule: "Every technical term gets a plain-language equivalent in the same sentence. Example: 'OSPF uses a link-state advertisement — basically, each router announces what it's directly connected to, and the network pieces together the full map.'"

*Add a check*: Consider a hook that scans generated explanations for uncommon technical terms and flags any that appear without a parenthetical or dash-delimited explanation nearby.

---

### Section 5: Debug Scenarios — Job Hunting System (~500 words)

**Content**:

**Scenario A: Cover letter sounds generic despite the career-profile skill.**

*Symptom*: The letter says "I have extensive experience in project management and a track record of delivering results." That's resume filler, not the reader's voice. Their career-profile skill has specific, quantified achievements.

*Map to component*: Instruction — the skill isn't doing its job. Either it's not loading or Claude isn't using the examples in it.

*Isolate*: Ask Claude mid-session: "What achievements from my career-profile skill are most relevant to this role?" If Claude lists them correctly, the skill is loading — Claude just isn't using the specifics in the letter. If Claude can't answer, the skill isn't loading.

*Fix*:
- If the skill isn't loading: check the frontmatter `description:` field. Does it match what you're doing? Check the CLAUDE.md "Skills" section — does it tell Claude to load career-profile for job hunting work?
- If the skill loads but isn't applied: the CLAUDE.md needs a stronger instruction. Not "reference my career profile" but "Every cover letter must cite at least 2 specific achievements from career-profile.md, with numbers. No generic claims like 'extensive experience' — replace with the specific achievement."

*Add a check*: Update `verify-cover-letter.sh` to grep for generic phrases: "extensive experience," "track record," "proven ability," "results-driven." If any appear, fail: "Generic language detected. Replace with specific achievements from career-profile.md."

**Scenario B: Hook misses a fabricated credential.**

*Symptom*: Claude wrote "In my role at Meridian Analytics" — a company the reader never worked at. The verify-cover-letter hook didn't catch it.

*Map to component*: Control — the hook.

*Isolate*: Run the hook manually against the saved cover letter file. Does it fire? If not, check the company-name extraction logic — maybe "Meridian Analytics" is two words and the regex only catches single-word company names. Feed it a test file with an obvious fake company. If it catches some fakes but not others, the pattern matching is too narrow.

*Fix*: Improve the grep pattern. Or switch strategies: instead of trying to catch every fake company, check that every "at [Company]" claim in the letter has a matching entry in career-profile.md. Positive matching (what's IN the profile) is more reliable than negative matching (what's NOT in the profile).

*Add a check*: After fixing the hook, keep 3 test cover letters with known fabrications. Run them through the hook quarterly to verify it still catches them. This is the "break it on purpose" maintenance practice from Ch 7.

---

### Section 6: Debug Scenarios — Project Management System (~500 words)

**Content**:

**Scenario A: Status update contradicts the task list.**

*Symptom*: The status report says "5 of 8 tasks complete" but the state file shows only 3 tasks marked "done." The report invented 2 completions.

*Map to component*: This could be Memory (state has wrong data) or Flow (the pipeline analyzed before gathering, so it's using stale data). Two suspects.

*Isolate*: Open `project-state.md`. Count the "done" tasks yourself. If there are 3, the state is correct — Claude miscounted. That's a pipeline issue: the analysis stage isn't reading state accurately. If there are 5, the state was updated incorrectly — a previous session marked tasks done that aren't actually done. That's a Memory issue.

*Fix*:
- If Claude miscounted (Flow issue): add an explicit instruction to the pipeline's analysis stage: "Before generating any status numbers, count the rows in project-state.md by status. List the count per status. Use ONLY these counts in the report. Do not estimate or infer."
- If state has wrong data (Memory issue): correct the state file manually. Then check: does the CLAUDE.md clearly define what "done" means? If Claude is marking tasks done when they're merely "in progress," the definition-of-done in the PM methodology skill needs sharpening.

*Add a check*: The `verify-status-consistency.sh` hook should be comparing the status report's numbers against the state file. If it's not doing this, add the check. Parse the report for "X of Y tasks complete" and verify X matches the count of "done" rows in state.

**Scenario B: Slack connection returns stale data.**

*Symptom*: The PM system pulls team updates from Slack via MCP. But the status report references messages from last week, not this week. The connection is working — but returning old data.

*Map to component*: Flow — Connection.

*Isolate*: Test the connection directly. Ask Claude: "What are the most recent 5 messages in [channel]?" Check the timestamps. If they're current, the connection works and the pipeline's data gathering stage is filtering incorrectly. If they're old, the connection has a caching issue or the query parameters are wrong.

*Fix*: Check the connection configuration. Is there a date filter? A "since" parameter? MCP connections may cache results — check if there's a refresh/cache setting. If the connection returns current data when queried directly but old data in the pipeline, the pipeline's gather stage needs an explicit date range: "Pull messages from the last 7 days only."

*Add a check*: Add to the pipeline's gather stage: "After pulling data, verify the most recent item is from within the last 48 hours. If not, flag: 'Connection may be returning stale data — verify manually.'"

---

### Section 7: Debug Scenarios — Content System (~500 words)

**Content**:

**Scenario A: Voice drifts to generic by paragraph 3.**

*Symptom*: The first two paragraphs sound like you. By paragraph 3, it's AI-speak: longer sentences, hedging phrases, generic structure. The voice skill is loaded — it just fades.

*Map to component*: Instruction — Skill. Claude's attention is finite. By paragraph 3, the influence of the writing examples weakens.

*Isolate*: Check the skill file length. Over 2,000 words? Claude loses focus on later content. Check the structure: are the writing examples at the top (where they get the most attention) or buried below rules?

*Fix*: Restructure the skill. Put the 3 strongest writing examples FIRST — before any rules. Cut rules that restate what the examples show. If you have an example of a punchy opening AND a rule that says "use punchy openings," cut the rule. The example does more work. Target under 1,500 words.

Also add to the pipeline's draft stage: "After writing each paragraph, re-read the voice examples in editorial-voice.md. Does this paragraph match? If not, rewrite before continuing." This adds a mid-draft voice check instead of relying on end-of-draft review.

*Add a check*: Consider a post-draft hook that compares sentence length and word patterns in paragraphs 1-2 vs. paragraphs 5-6. If the metrics diverge significantly (sentences get 50%+ longer, banned words appear), flag: "Voice drift detected in later paragraphs."

**Scenario B: Pipeline gets stuck in a revision loop.**

*Symptom*: The content pipeline hits the REVIEW stage, fails, goes back to DRAFT, revises, hits REVIEW again, fails again. Three cycles. The revision instruction says "Max 2 revisions" but the gate keeps rejecting.

*Map to component*: Flow — Pipeline. Specifically, the quality gate between DRAFT and REVIEW.

*Isolate*: What is the gate rejecting? Read the hook output from the last 3 rejections. If it's the same issue every time (say, "no source for claim in paragraph 4"), Claude isn't fixing it in revision — the feedback isn't specific enough. If it's a different issue each time, the gate might be too strict (fixing one thing introduces another failure).

*Fix*:
- Same issue every time: the revision feedback isn't actionable. Instead of "fact-check hook failed," the pipeline should pass the SPECIFIC failure to the draft stage: "Paragraph 4 claims 'AI adoption grew 340% in healthcare.' No source found. Either add a source URL or replace with a qualified statement ('according to [source]') or flag as [VERIFY]." Specific feedback → specific fix.
- Different issue each time: the gate has too many checks firing at once. Prioritize: fact-checking passes first, then voice, then structure. Don't require all checks to pass simultaneously — stage them. Or loosen the strictest check by one threshold.

*Add a check*: Track revision count in your state file. If any piece goes through 3+ revisions, flag it for manual review. The pipeline should escalate, not loop forever.

---

### Section 8: The Debugging Mindset (~300 words)

**Narrative beat**: The takeaway principles — not a summary, but a way of thinking the reader carries forward.

**Content**:

**Fix the component, not the prompt.** This is the sentence to tattoo on the wall. When something breaks, the instinct is always to add words to the prompt. That instinct is wrong 80% of the time. If the prompt were the problem, the system would have been broken from the start. If it used to work and now it doesn't, something changed in a component — a skill update, a state file that got too long, a hook that stopped firing, a connection that expired. Find the component. Fix the component.

**Isolate before you fix.** Don't guess. Test. "I think the skill isn't loading" is a hypothesis. "I asked Claude what's in my career-profile skill and it couldn't answer" is evidence. The debugging protocol takes 5 minutes when you follow it. It takes 45 minutes when you skip to guessing.

**Reference, don't repeat.** You learned maintenance practices for every component:
- State hygiene (Ch 5): archiving stale data, the 50-row rule, monthly checks
- Skill versioning (Ch 6): changelogs, rollbacks, quarterly reviews
- Hook tuning (Ch 7): false positive calibration, the break-it-on-purpose test
- Connection health (Ch 8): monthly test queries, graceful degradation, cost monitoring
- Pipeline bottlenecks (Ch 9): constraint identification, stage-level monitoring, when to add/remove stages

Those are preventive. This chapter is the emergency room. If maintenance is brushing your teeth, debugging is the dentist visit when something goes wrong anyway.

**Every fix adds a check.** Whatever broke, make it impossible to break silently again. A hook, a state tracker, a monthly test. The system gets more resilient with every failure — not because you add complexity, but because you add visibility.

---

### Section 9: Quality Gate (~200 words)

**Five checks**:

1. **You diagnosed a real failure.** At least one of your four systems has had a real problem (not a test — an actual failure during use). You identified it, followed the protocol, and fixed it.

2. **You mapped symptom to component correctly.** The fix was in the component the taxonomy predicted, not in the prompt. If you added words to the prompt, that was the wrong fix.

3. **Isolation confirmed the cause.** You tested the suspected component alone before changing it. You have evidence the component was the problem — not a guess.

4. **The fix didn't add complexity.** Your system has the same number of components (or fewer) after the fix. You didn't add a new hook to work around a broken skill. You fixed the skill.

5. **You added a check.** Whatever broke has a monitoring mechanism — a hook, a state tracker, or a monthly test item — that will flag the recurrence. The system is more visible now than before the failure.

And: "Your four systems work. They break sometimes, and now you can fix them. But they're still four separate systems. The Study System doesn't know about the Content System. Your career research doesn't feed your blog posts. Chapter 11 wires them together."

---

## Files the Reader Creates

| File | Purpose |
|------|---------|
| No new files | This chapter teaches diagnosis, not construction |

The reader may modify existing files (skills, hooks, CLAUDE.md sections, state files) as part of debugging. But no new files are created — that's deliberate. Debugging means fixing what exists, not adding more.

## Technical Notes for the Writer

- **The opening scenario is critical.** The reader needs to feel the specific frustration of misdiagnosing a problem — adding more to the prompt when the skill was the issue. This is the chapter's thesis in action. Don't rush it.
- **The failure taxonomy table is the chapter's most reusable artifact.** Spend design energy on it. Every row should describe a failure the reader has seen or will see. The "First Thing to Check" column is what makes it actionable vs. just a reference table.
- **Debug scenarios should feel like case studies, not exercises.** The reader is reading about failures they've already started to experience (they've been building for 6 chapters). Use specific details — file names, field values, exact symptoms. Vague scenarios ("the system doesn't work well") teach nothing.
- **The "fix the component, not the prompt" principle is the chapter's core teaching.** It should appear in the opening scenario, in at least 2 debug scenarios, and in the debugging mindset section. Repetition through different examples, not repeated statements.
- **Reference earlier maintenance sections but don't repeat them.** Ch 5 taught state hygiene, Ch 6 taught skill versioning, Ch 7 taught hook tuning, Ch 8 taught connection health, Ch 9 taught pipeline bottlenecks. This chapter handles what breaks DESPITE those practices. The maintenance practices are preventive. Debugging is diagnostic. Make the distinction clear.
- **Don't teach the reader to fear failure.** Tone should be: "Everything breaks. The difference between a broken system and a broken prompt is that the system tells you WHERE it broke. That's the whole point of building with components instead of one giant prompt."
- **The quality gate has no file creation requirement.** The reader proves mastery by diagnosing and fixing, not by building. This is the only chapter where the quality gate is entirely about process.
- **Forward teaser**: "Your four systems work and you can fix them when they don't. But right now they're strangers — the Study System doesn't know the Content System exists. Your job research doesn't feed your blog posts. Your study progress doesn't show up in your cover letters. Chapter 11 introduces them to each other."
- **Voice**: Confident and practical. The reader might feel anxious about things breaking — this chapter should feel like a mechanic showing them the engine, not a doctor giving bad news. "Here's how it works under the hood. Here's where things go wrong. Here's how to fix them. It's not hard once you know where to look."

---
---

# Chapter 11: Composing Systems — Your Personal AI Operating System

**Title**: Composing Systems — Your Personal AI Operating System
**Word target**: 3,500–4,500 words
**Component introduced**: None — this chapter teaches composition, not construction
**Primary system**: All four systems, wired together
**Universal concept**: All four, applied across system boundaries
**Claude Code feature**: Master index files, shared skill loading, cross-system state references

---

## Bridge from Chapter 10

The reader finished Ch 10 with:
- All four systems at v6, debugged, and maintained
- The debugging protocol: symptom → component → isolate → fix → check
- Confidence that they can fix what breaks without adding complexity
- A nagging realization: their four systems don't talk to each other

The Study System doesn't know the Content System exists. When the reader masters a topic deeply enough to write about it, they manually carry the knowledge from one system to the other — copying notes, re-explaining context. The Job Hunting System doesn't know the reader published 3 blog posts on data infrastructure — posts that could be cited in cover letters. The PM System generates lessons-learned insights that would make great content, but the Content System never sees them.

Ch 11 connects them. Not by merging them into one monolith, but by building lightweight bridges — shared references, cross-system state, shared skills — so each system can see what the others have done.

---

## Chapter Goals

By the end of this chapter, the reader can:

1. **Build cross-system connections** where one system's output feeds another system's input — without merging the systems
2. **Create a master index file** that provides cross-system visibility without combining all state into one file
3. **Apply the four composition patterns**: Chain, Shared State, Shared Skills, Cross-system Hooks
4. **Pass the independence test**: remove any cross-system connection and both systems still work on their own
5. **Run composed systems for a full work week** with at least 2 cross-system interactions working correctly

---

## Section-by-Section Breakdown

### Section 1: The Problem — Four Strangers (~300 words)

**Narrative beat**: Show the waste of four independent systems that could be cooperating.

**Content**:

You spent 3 weeks studying distributed systems for a certification. Your Study System tracked every session — 14 quiz scores, concept maps, 8 topics at mastery level. You know this material cold.

Tuesday, your Content System asks you what to write about. You tell it "distributed systems for non-technical managers." Claude researches the topic from scratch — web search, source gathering, outline from zero. It doesn't know you just spent 3 weeks building deep expertise on this exact subject. That expertise is sitting in your study-state.md. Claude never sees it because the Content System and the Study System don't know each other exist.

Meanwhile, your Job Hunting System is tailoring a cover letter for a distributed systems role. It cites your certification progress — "currently studying for [cert]." It doesn't mention the 3 blog posts you published about distributed systems through the Content System, because it doesn't know about them. Those published posts are stronger evidence than "currently studying."

Four systems. Four separate worlds. You're the integration layer — manually carrying information between them. That's the problem you built systems to solve in the first place.

---

### Section 2: The Composition Principles (~300 words)

**Narrative beat**: Set the rules before building. Composition has constraints — violate them and you get a fragile monolith.

**Content**:

**Rule 1: Independence first.** Every system must work alone. If you unplug every cross-system connection, each system functions exactly as it did in Ch 9. The connections are a bonus, not a dependency. This is the test you'll run at the end of this chapter.

**Rule 2: Reference, don't merge.** You're not combining four state files into one mega-state. You're building an index that tells each system where to look for relevant context from the other systems. Think of it like a card catalog, not a single giant book.

**Rule 3: Loose coupling.** System A can USE information from System B. System A cannot DEPEND on System B running first, running correctly, or running at all. If System B's state file is empty, System A works fine — it just doesn't have the bonus context.

**Rule 4: Start with two.** Don't wire all four systems together at once. Connect the two with the most obvious value. Prove it works. Then add the next connection. The urge to build the "personal AI operating system" all at once is the "build it all at once" anti-pattern from Ch 3.

**Writer guidance**: These rules prevent over-engineering. The reader just finished building 4 complex systems. The temptation is to build an equally complex integration layer. These rules keep the composition lightweight. Emphasize: "The elegance isn't in the connections. It's in the fact that removing them changes nothing. Each system is still whole on its own."

---

### Section 3: The Four Composition Patterns (~500 words)

**Narrative beat**: Name the patterns so the reader can choose the right one for each connection.

**Content**:

**Pattern 1: Chain** — one system's output becomes another system's input.

Study System produces a mastery summary → Content System uses it as research input for a blog post. The chain is explicit: the reader tells the Content System "use my study notes on [topic] as the research base for this post." The study-state.md becomes a source, just like a web search result.

When to use: when one system produces something another system needs as raw material.

**Pattern 2: Shared State** — multiple systems read from a cross-system index.

A master index file lists what each system has produced recently. The Content System checks the index and sees "Study System: mastered distributed systems, 14 sessions." The Job Hunting System checks it and sees "Content System: published 3 posts on distributed systems."

When to use: when systems need awareness of each other's output without directly consuming it.

**Pattern 3: Shared Skills** — the same skill loads into multiple systems.

The editorial-voice skill already loads for Content. But it could also load when the Job Hunting System writes cover letters — same voice, same word choice, same tone. The career-profile skill could load when the Content System writes about professional topics — citing the reader's real experience.

When to use: when expertise is domain-general, not system-specific. Voice is voice everywhere. Career facts are career facts everywhere.

**Pattern 4: Cross-system Hooks** — a check in one system references another system's data.

The Content System's fact-check hook already verifies sources. Add a check: if the post claims the reader has expertise in X, cross-reference the study-state.md — did they actually study X? If the Job Hunting System's cover letter cites a published post, cross-reference content-state.md — does that post actually exist?

When to use: when one system makes claims about what another system produced.

**Writer guidance**: Each pattern gets one clear example. Don't over-explain — the reader has been building with these components for 6 chapters. They'll recognize the patterns immediately. The new thing is applying them ACROSS systems instead of within one system.

---

### Section 4: Build It — The Master Index (~600 words)

**Narrative beat**: The foundation of composition — a lightweight file that gives every system visibility into the others.

**Content**:

Create `my-ai-systems/system-index.md`:

```markdown
# System Index

Last updated: [Claude updates this automatically]

## Study System
- **Active topics**: [pulled from study-state.md]
- **Mastered topics**: [topics at mastery level]
- **Current focus**: [this week's study priority]
- **Recent sessions**: [last 3 session dates and topics]

## Job Hunting System
- **Active applications**: [count of non-archived applications]
- **Recent callbacks**: [companies that responded positively]
- **Current resume version**: [which version is active]
- **Skills emphasized**: [what's working in applications]

## Project Management System
- **Active projects**: [project names and status]
- **Completed milestones**: [recent completions]
- **Blocked items**: [what's stuck and why]
- **Lessons learned**: [insights from recent project work]

## Content System
- **Published pieces**: [titles, dates, topics]
- **Upcoming topics**: [editorial calendar]
- **What's resonating**: [audience response data]
- **Drafts in progress**: [what's being worked on]

## Cross-System Opportunities
(Claude updates this section when it notices connections)
- [e.g., "Study System has mastery on 'distributed systems' — Content System could draft a post"]
- [e.g., "Content System published 3 posts on data infrastructure — Job Hunting System could cite these"]
```

**How to keep the index current**: Update the root CLAUDE.md:

```markdown
## System Index

Read `system-index.md` at the start of every session, regardless of which
system you're working in. Before ending any session, update the relevant
section of system-index.md with what changed.

The Cross-System Opportunities section: if you notice that one system's
output could benefit another system, note it there. I'll decide whether
to act on it.
```

**Writer guidance**: The index is intentionally lightweight — summaries, not data. It points the reader (and Claude) toward connections without duplicating state data. Emphasize: "This is 30 lines of markdown. It's not a database. It's a quick-reference that says 'here's what's happening across your four systems.' Claude reads it in 2 seconds and knows whether System A has something useful for System B."

Show what happens: the reader starts a Content session. Claude reads the index, sees that the Study System mastered "API design patterns" last week, and suggests: "Your study notes on API design patterns could be the basis for a blog post. Want me to pull from study-state.md?" The reader didn't ask for this. The system noticed the opportunity because the index made it visible.

---

### Section 5: Build It — Cross-System Connections (Deep Build) (~1,200 words)

**Narrative beat**: Wire two specific system pairs with real files and real examples.

**Content**:

**Connection 1: Study × Content (Chain pattern)**

The most natural connection: deep studying produces expertise that becomes content.

*How it works*:
1. Reader finishes a study session on "event-driven architecture"
2. Study System updates study-state.md: topic at mastery level, 3 sessions, key concepts listed
3. Study System updates system-index.md: "Mastered: event-driven architecture"
4. Next Content session, Claude reads the index, sees the mastery entry
5. Claude suggests: "You've completed in-depth study of event-driven architecture. Ready to draft a post? I can use your study notes as the research foundation."
6. Reader agrees. Claude reads study-state.md for the concept summaries, key takeaways, and connections the reader made during study
7. Content pipeline runs — but the RESEARCH stage already has material from the study state. It supplements with web search for current examples, but the core expertise is from the reader's actual learning, not generic research
8. The resulting post has depth that a web-search-only draft wouldn't — because it's built on 3 weeks of structured learning

*File changes*:
- Update `content/CLAUDE.md` to include: "When drafting on a topic I've studied, check study-state.md for my notes, mastery level, and key concepts. Use these as the research foundation. Supplement with web search for current examples and external validation, but ground the piece in what I actually learned."

**Connection 2: Job Hunting × Content (Shared State pattern)**

Published content strengthens job applications. Job research reveals content opportunities.

*How it works*:
1. Content System publishes a post about data infrastructure. content-state.md logs it: title, date, topic, URL.
2. System index updates: "Published: 'Why Your Data Pipeline Is Lying to You' — data infrastructure, May 2026"
3. Next Job Hunting session, Claude reads the index. The reader is applying for a data engineering role.
4. Claude drafts the cover letter and includes: "I've written publicly about data infrastructure challenges — my recent piece '[title]' explores [relevant angle]." The citation is real because it came from content-state.md.
5. Going the other direction: the reader is researching companies for applications. Claude finds that Company X is investing heavily in observability. Claude updates the index: "Content opportunity: observability is a hot topic in the companies you're targeting. A blog post on observability would strengthen applications to [Company X, Company Y]."

*File changes*:
- Update `job-hunting/CLAUDE.md` to include: "When writing cover letters, check system-index.md for published content relevant to the role. If I've written about a topic related to this job, cite the specific piece."
- Update `content/CLAUDE.md` to include: "When planning content topics, check system-index.md for job hunting insights. Topics that align with my target roles are higher priority."

**Writer guidance**: These two connections demonstrate the two most common composition patterns. Don't build all four connections in the deep build — pick the two that produce the clearest value. The other connections (PM × Content, Study × Job Hunting) go in the extensions section.

Each connection should show: what triggers it, what data flows, what the reader sees that's different from before the connection existed. The reader should be able to point at a specific output — a blog post grounded in study notes, a cover letter citing a published piece — and say "that wouldn't have happened without the connection."

---

### Section 6: Extend It — Two More Connections (~400 words)

**Content**:

**Connection 3: Project Management × Content (Chain pattern)**

PM work produces insights that become content. Project milestones, lessons learned, and methodology decisions are all content material.

*How it works*: The PM System completes a project milestone. project-state.md logs the milestone with a lessons-learned note. The system index updates. Next Content session, Claude sees the milestone and suggests: "Your Q2 migration project completed ahead of schedule. The approach you used — [specific methodology from PM skill] — would make a strong case study post."

*File changes*: Update content/CLAUDE.md to reference system-index.md for PM-derived content opportunities. Update project-mgmt/CLAUDE.md to flag completed milestones with a "content potential" tag.

**Connection 4: Study × Job Hunting (Shared State pattern)**

Certification progress strengthens job applications. Job requirements reveal study priorities.

*How it works*: Study-state.md tracks certification progress. When the Job Hunting System generates a cover letter for a role requiring that certification, it references the study state: "Currently completing [cert] with 14/20 topics at mastery level, expected completion [date]." Going the other direction: when the reader researches a role that requires a skill they haven't studied, the system flags it in the index: "Study gap: [Role at Company X] requires Kubernetes experience — not in study-state.md."

*File changes*: Update job-hunting/CLAUDE.md to check study-state.md for certifications and skills in progress. Update study-system/CLAUDE.md to check the index for skill gaps identified during job hunting.

---

### Section 7: The Independence Test (~300 words)

**Narrative beat**: The reader proves that composition didn't create fragility.

**Content**:

This is the most important test in the chapter. It's not "do the connections work?" — you already verified that. It's "do the systems still work WITHOUT the connections?"

**Test 1: Remove the index.** Rename `system-index.md` to `system-index-backup.md`. Start a Content session. Ask Claude to draft a blog post on a topic you studied. Claude won't see the study notes automatically — it'll research from scratch, like Ch 9. The post is fine. It's just not as deep. The system works. The connection was a bonus, not a crutch.

**Test 2: Remove a shared skill reference.** Take the career-profile skill out of the Content System's CLAUDE.md. Draft a professional blog post. Claude doesn't cite your work history. The post is fine — just missing the personal authority. Restore the reference.

**Test 3: Remove a cross-system hook.** Disable the hook that cross-references content claims against study-state.md. Draft a post claiming expertise on a topic. The hook doesn't fire. The post might claim expertise you don't have. That's a risk, but the system still runs. Restore the hook.

"Each test proves the same thing: the connection adds value, but removing it doesn't crash the system. That's loose coupling — and it's the whole point. Your systems cooperate when connected. They function when separated. A monolith can't say that."

**Writer guidance**: This section should feel like a stress test, not an exercise. The reader is deliberately pulling wires to see what holds. Frame it confidently: "If any test reveals a hard dependency — if removing a connection breaks a system — that's a bug. The system shouldn't need the connection. Fix it before moving on."

---

### Section 8: System Diagram — The Personal AI Operating System (~150 words)

**Content**:

```
                    ┌─────────────────────────┐
                    │    system-index.md       │
                    │  (cross-system context)  │
                    └──────┬──────┬──────┬─────┘
                           │      │      │
              ┌────────────┼──────┼──────┼────────────┐
              │            │      │      │            │
      ┌───────▼──┐  ┌─────▼───┐  │  ┌───▼──────┐  ┌─▼──────────┐
      │  Study   │  │   Job   │  │  │ Project  │  │  Content   │
      │  System  │  │ Hunting │  │  │  Mgmt    │  │  System    │
      │  (v6)    │  │  (v6)   │  │  │  (v6)    │  │  (v6)      │
      └──────────┘  └─────────┘  │  └──────────┘  └────────────┘
                                 │
                          Shared Skills
                     (.claude/skills/*.md)
```

"Four independent systems. One index for visibility. Shared skills for common expertise. Each system reads the index for cross-system context. Each system updates the index after sessions. Remove any line — every system still works. That's composition."

This is the simplest diagram in Part V. The complexity is in the systems themselves (built in Ch 4–9). The composition layer is deliberately lightweight.

---

### Section 9: Quality Gate (~200 words)

**Five checks**:

1. **The master index exists and is current.** `system-index.md` has entries for all four systems. The entries were updated within the last 3 sessions.

2. **At least 2 cross-system interactions worked.** You can point to a specific output — a blog post grounded in study notes, a cover letter citing published content, a study priority informed by job research — that used data from another system.

3. **The independence test passes.** You removed the index and ran each system. All four produced output. None crashed. The connections are a bonus, not a requirement.

4. **Shared skills load across systems.** The editorial-voice skill loaded during a Job Hunting session (for cover letter voice). The career-profile skill loaded during a Content session (for professional authority). Skills cross system boundaries.

5. **You can explain the architecture.** "I have four systems. Each has 6 components and works independently. A master index gives each system visibility into the others. Shared skills carry expertise across systems. Cross-system hooks verify claims that reference other systems' data. Removing any connection changes nothing — each system is whole on its own."

---

## Files the Reader Creates

| File | Location | Purpose |
|------|----------|---------|
| `system-index.md` | `my-ai-systems/` (root) | Cross-system visibility — summaries of each system's current state and opportunities |

Plus CLAUDE.md updates in all 4 system folders (adding cross-system references to the index and to each other's state files where appropriate) and a root CLAUDE.md update (instructions for reading/updating the index every session).

## Complete Folder Structure After Chapter 11

```
my-ai-systems/
├── CLAUDE.md                          ← root shared rules (updated Ch 11)
├── system-index.md                    ← cross-system visibility (NEW Ch 11)
├── .claude/
│   ├── settings.json                  ← hook registration (Ch 7, may update Ch 11)
│   ├── skills/
│   │   ├── editorial-voice.md         ← shared across Content + Job Hunting
│   │   ├── content-standards.md       ← Content System
│   │   ├── study-method.md            ← Study System
│   │   ├── career-profile.md          ← shared across Job Hunting + Content
│   │   └── pm-methodology.md          ← Project Management System
│   └── hooks/
│       ├── verify-cover-letter.sh     ← (may add cross-system checks Ch 11)
│       ├── check-duplicate-application.sh
│       ├── verify-quiz-answers.sh
│       ├── check-weak-area-focus.sh
│       ├── verify-status-consistency.sh
│       ├── check-audience-format.sh
│       └── verify-content-quality.sh
├── study-system/
│   ├── CLAUDE.md                      ← (updated Ch 11 — index reference)
│   └── study-state.md
├── job-hunting/
│   ├── CLAUDE.md                      ← (updated Ch 11 — index + content refs)
│   └── job-state.md
├── project-mgmt/
│   ├── CLAUDE.md                      ← (updated Ch 11 — index reference)
│   └── project-state.md
└── content/
    ├── CLAUDE.md                      ← (updated Ch 11 — index + study refs)
    └── content-state.md
```

## Technical Notes for the Writer

- **The master index is the key design decision.** Explain why it's NOT a combined state file. A combined state file would be 500+ lines and Claude would lose focus. The index is 30 lines of summaries — pointers, not data. When a system needs details, it reads the actual state file from the other system. The index tells it WHICH state file to check and WHETHER there's something worth checking.
- **The independence test is non-negotiable.** If the reader skips it, they won't know whether they've built a network or a monolith. Frame the test as a badge of honor: "If your systems pass the independence test, you've built something most AI power users never achieve — a composed system where every part is whole on its own."
- **Don't overload on connections.** Four systems with all-to-all connections = 6 possible pairs. The deep build covers 2. The extensions cover 2 more. That's enough. Not every pair needs an active connection. If Study and PM have nothing to say to each other right now, don't force it.
- **The Cross-System Opportunities section in the index is the magic.** This is where Claude proactively surfaces connections the reader didn't think of. "You mastered X in studying, and Company Y cares about X" — that's Claude reading the index and making a connection the reader might have missed. This is the payoff of composition: the systems see things together that they can't see apart.
- **Shared skills should already feel natural.** The reader built shared skills in Ch 6 — they live at the root `.claude/skills/`, not in system folders. This chapter explicitly loads them across more systems. The concept isn't new; the application is wider.
- **Don't introduce new hook scripts unless necessary.** The existing hooks can be updated to cross-reference other state files. A new "cross-system verification" hook is overkill — just add a check to the existing cover-letter hook that greps content-state.md for cited posts. Keep composition lightweight.
- **Forward teaser**: "Your four systems work independently and together. You can debug them when they break. But here's the real question: can you build a fifth? Not by following a book — by starting from a blank folder with a problem you want to solve. That's Chapter 12."
- **Voice**: Slightly celebratory — the reader has built something substantial. But don't linger on it. "You've built a personal AI operating system. Now let's see if you can build the next one without a book telling you what to type."

---
---

# Chapter 12: Designing New Systems — From Problem to Blueprint

**Title**: Designing New Systems — From Problem to Blueprint
**Word target**: 3,500–4,500 words
**Component introduced**: None — the reader designs and builds a new system using everything they've learned
**Primary system**: Reader's choice (not one from the book)
**Universal concept**: All four, applied from scratch
**Claude Code feature**: No new features — the reader applies the full toolkit

---

## Bridge from Chapter 11

The reader finished Ch 11 with:
- Four composed systems running as a personal AI operating system
- Cross-system connections that add value without creating dependencies
- The debugging protocol for when things break
- Eleven chapters of guided building behind them

And a question: can they do it without the book?

Every chapter so far said "build this file, type this content, run this command." The reader followed along and it worked. But following instructions is not the same as designing. A cook who follows 11 recipes can prepare 11 meals. A cook who understands WHY each recipe works can create meal #12 from an empty kitchen.

Ch 12 is the empty kitchen. The reader picks a problem the book never covered, designs a system from scratch, and builds it. The chapter provides the process, not the answer.

---

## Chapter Goals

By the end of this chapter, the reader can:

1. **Identify a problem suitable for a system** (vs. one that's fine as a one-off prompt)
2. **Follow the 8-step design process** from frustration to working system
3. **Avoid the four anti-patterns** that kill new systems before they work
4. **Start minimal and add components only when they can name the failure each prevents**
5. **Have a working system** for a problem not covered in this book — with a documented architecture, at least 3 components, and a maintenance plan

---

## Section-by-Section Breakdown

### Section 1: When to Build a System vs. When a Prompt Is Fine (~300 words)

**Narrative beat**: Not everything needs a system. Teach the reader to recognize the difference before they start.

**Content**:

A system is worth building when three things are true:
1. **You do the task repeatedly.** Weekly, daily, or at least monthly. If it's quarterly, a prompt is fine.
2. **Context carries between sessions.** What happened last time matters this time. If every instance is independent (translating a paragraph, summarizing a one-off article), a prompt is fine.
3. **Mistakes cost something.** If bad output means you redo 10 minutes of work, a prompt is fine. If bad output means a fabricated credential on a cover letter or an unsourced claim in a published post, build a system.

Test: "Would I benefit from this task remembering what happened last time?" If yes, you need at least state. That's the start of a system.

Examples of tasks that DON'T need systems:
- Translating a paragraph (one-shot, no context carries)
- Brainstorming names for a project (creative, disposable, no stakes)
- Summarizing a single article (independent, low-cost if wrong)

Examples of tasks that DO:
- Managing a client relationship over months (context carries, mistakes cost trust)
- Planning and cooking meals for a week (recurring, context carries — what you bought, what you ate, allergies)
- Running a side business's finances (recurring, high-stakes, patterns matter)

"The four systems in this book were chosen because all three conditions are obviously true. For your new system, verify all three before you start building. A system for a task that doesn't need one is worse than no system — it's overhead with no payoff."

---

### Section 2: The 8-Step Design Process (~1,200 words)

**Narrative beat**: Walk through each step with decision points. The reader makes choices at each step for THEIR system. Use a running example to illustrate (a domain that's relatable but not one of the four book systems — client management, personal finance, or meal planning).

**Content**:

**Step 1: Start with frustration.**

What task do you do repeatedly that AI helps with inconsistently? Write it down. Not "I want to use AI for [thing]" — that's a solution looking for a problem. Start with the frustration: "I spend 30 minutes every Sunday planning meals for the week, and every time I ask AI for help, I re-explain my dietary restrictions, what's in my fridge, and what we ate last week."

The frustration tells you what's broken. "I re-explain" = no memory. "Inconsistent results" = no expertise loaded. "I have to check everything" = no guard rails. The frustration IS the diagnosis.

*Decision point for the reader*: Write down your frustration in one sentence. If you can't articulate it, you don't have a system problem — you have a vague desire. Come back when the frustration is specific.

**Step 2: Map current state.**

How are you doing this task right now? What do you paste into the AI? What do you re-explain? What do you check manually after?

Draw it: `[What you type] → [AI] → [What you get] → [What you check/fix by hand]`

Everything after the arrow on the right side is the system you're building by hand. The goal is to make the AI do it.

*Running example*: "I paste my dietary restrictions, what's in my fridge, what we ate this week, and ask for meal plans. I check that it doesn't suggest things I'm allergic to, that it uses what's in the fridge before suggesting new purchases, and that it doesn't repeat Monday's dinner on Thursday."

*Decision point*: Map your current workflow. What do you paste? What do you check? What do you wish it remembered?

**Step 3: Identify the constraint.**

Of everything that breaks, what breaks MOST or costs the MOST time? That's the constraint. Fix that first. Ignore everything else until the constraint is resolved.

*Running example*: "The allergy check is the constraint. If the meal plan includes something I'm allergic to and I don't catch it, that's a health risk. Everything else is inconvenience. This is a safety issue."

*Decision point*: What's your constraint? What's the one failure that matters most?

**Step 4: Choose a pattern.**

Loop, Gate, or Router from Chapter 3.

- If your task improves iteratively (draft → check → improve), it's a **Loop**.
- If your task has a quality bar that output must pass, it's a **Gate**.
- If different inputs need different handling, it's a **Router**.
- Most systems combine 2-3 patterns. Pick the primary one.

*Running example*: Gate. The meal plan must pass allergy and dietary checks before I use it. It's not a loop (I don't revise meal plans iteratively) or a router (all weeks get the same treatment).

*Decision point*: Which pattern fits your task? Draw it with boxes and arrows on a napkin.

**Step 5: Start minimal — Prompt only.**

Build v1: just a CLAUDE.md and a structured prompt. No state file. No skills. No hooks. No connections. No pipeline.

Run it. Use it for real. See what breaks.

*Running example*: Create `meal-planning/CLAUDE.md` with dietary restrictions, household size, cooking skill level, and the 4-part prompt formula: "Given what's in my fridge and our schedule this week, generate a 7-day meal plan with a grocery list."

Run it. It works for one week. Next week, it re-plans Monday's excellent dinner because it doesn't remember last week. It suggests a recipe with walnuts because it doesn't have the allergy list loaded reliably. Two failures, two components needed.

*Decision point*: Run your v1. What broke? Name the failure. Which component prevents it?

**Step 6: Add one component at a time.**

For each failure, add the component that prevents it. Only one at a time. Run the system after each addition to verify the fix works before adding the next.

The order depends on your constraint (Step 3):

- If the biggest problem is "it forgets" → add State
- If the biggest problem is "the output quality is inconsistent" → add Skill
- If the biggest problem is "it makes dangerous errors" → add Hook
- If the biggest problem is "it needs information I don't have" → add Connection
- If the biggest problem is "it tries to do everything at once" → add Pipeline

*Running example*: Constraint is allergy safety → add a Hook first (check every recipe against the allergy list). Then add State (so it remembers what was planned and eaten). Then add Skill (cooking methodology, preferred cuisines, complexity levels).

*Decision point*: Which component does your system need FIRST? Add it. Run the system. Verify. Then identify the next component.

**Step 7: Test by breaking.**

Feed your system bad input. Skip steps. See what fails. For each failure that matters, add a check.

*Running example*: Tell the system "I have no dietary restrictions" when you actually do. Does the hook still catch allergens? It shouldn't — the hook should reference a fixed allergy file, not the session input. If the hook relies on what you SAY instead of what's in the skill file, it's brittle. Fix it.

*Decision point*: What's the worst thing your system could do? Test that scenario deliberately.

**Step 8: Document.**

Create the system diagram. List each component, what it does, and what failure it prevents. Write a one-paragraph maintenance plan: what to check monthly, what might drift, what to update when circumstances change.

*Running example*:

```
[Fridge contents + schedule] + [CLAUDE.md + meal-planning skill + meal-state.md]
                                        ↓
                                    [Claude]
                                        ↓
                              [ALLERGY HOOK CHECK]
                                   ↓         ↓
                              [PASS]     [FAIL → flag unsafe recipe]
                                 ↓
                    [Meal plan + grocery list + state updated]
```

Components: CLAUDE.md (preferences, household), meal-planning skill (cuisines, cooking level, preferred formats), meal-state.md (what was eaten, what's in the fridge, what worked), allergy-check hook (hard stop on unsafe recipes).

Monthly maintenance: update fridge inventory, review whether preferred cuisines have shifted, verify allergy list is current.

---

### Section 3: The Four Anti-Patterns (~400 words)

**Narrative beat**: Teach the reader what NOT to do. These are the traps that kill new systems.

**Content**:

**Anti-pattern 1: "Just add more to the prompt."**

Symptom: your CLAUDE.md is 2,000 words and growing. Every time something goes wrong, you add another paragraph of instructions.

What's actually happening: you need a skill (for expertise), a state file (for memory), or a hook (for quality checks). The prompt is becoming a dumping ground for things that belong in other components.

The tell: if you've added to your CLAUDE.md 3+ times for the same kind of problem, it's not a prompt issue. Identify the component.

**Anti-pattern 2: "Build it all at once."**

Symptom: you design the perfect 6-component system on paper before running anything. Day one: CLAUDE.md, state file, 3 skills, 4 hooks, 2 connections, and a 5-stage pipeline.

What actually happens: you spend 3 hours building and 0 minutes using. The first session reveals that 2 of your hooks fire on good output, your state file tracks things you don't need, and one of your pipeline stages is redundant. You've debugged 6 components instead of validating 1.

Start with prompt only. Add one component when you can NAME the failure it prevents. If you can't name the failure, you don't need the component.

**Anti-pattern 3: "Automate everything."**

Symptom: you build a system for a task you do quarterly that takes 10 minutes.

The test: will the time spent building and maintaining the system EVER be recovered by the time it saves? If the task is quick, infrequent, and low-stakes, a prompt is fine. Building a system takes hours. Maintaining it takes minutes per month, indefinitely. The math has to work.

Rule of thumb: if you'll use the system less than once a week, think twice. Once a month? A prompt is almost certainly better.

**Anti-pattern 4: "Set it and forget it."**

Symptom: you built the system 3 months ago. It works fine — or so you think. You haven't checked the state file (it has 200 rows of stale data), the skill (it describes your situation 3 months ago), or the hooks (one of them hasn't fired since you improved the skill).

Systems decay. Circumstances change. A system that worked in January may be actively misleading in April. Schedule maintenance. 30 minutes a month. Review state, skills, hooks, connections, and pipeline performance.

---

### Section 4: The Reader Builds Their System (~500 words)

**Narrative beat**: This is the reader's solo flight. The chapter provides guardrails but not answers.

**Content**:

This section is structured as a guided exercise, not a walkthrough. The reader follows the 8 steps for their own problem.

**Choosing a domain**: Offer a list of domains that naturally benefit from systems (the reader picks one or brings their own):
- Personal finance tracking and budget planning
- Fitness and health tracking
- Client or freelance project management
- Travel planning (recurring trips or complex itineraries)
- Home maintenance scheduling and tracking
- Language learning
- Team management and 1:1s
- Side business operations
- Event planning
- Research projects (academic, market, competitive)

"Pick the one where you feel the frustration from Step 1 most strongly. If none of these match, use your own. The process works for any domain where all three conditions from Section 1 are true."

**The guided exercise** (one paragraph per step, with a prompt for the reader to pause and do the work):

- Step 1: Write your frustration sentence. What's broken?
- Step 2: Draw your current workflow. What do you paste, check, re-explain?
- Step 3: What's the constraint? What breaks most or costs most?
- Step 4: Which pattern? Sketch it.
- Step 5: Build v1. Just CLAUDE.md and a structured prompt. Run it.
- Step 6: What broke? Add one component. Run again. What broke? Add the next. Keep going until the system handles your top 3 failures.
- Step 7: Break it on purpose. Feed it the worst-case input. Does it fail safely?
- Step 8: Draw the system diagram. List your components. Write the maintenance plan.

**Writer guidance**: This section should be SHORT on the page but LONG in the reader's time. The reader is doing 90% of the work. The book provides the framework and checkpoints. Don't fill space with hypothetical examples — the reader is building a real system. Give them space to build.

Include one callout: "If you're stuck at any step, go back to the system in this book that's closest to yours. How did we handle this step for the Study System? For the Job Hunting System? The patterns transfer. That's the whole point of patterns."

---

### Section 5: Evaluating Your Design (~300 words)

**Narrative beat**: The reader checks their own work against design principles from the book.

**Content**:

Five questions to evaluate your new system:

**1. Can you name what each component prevents?** For every file in your system, say: "If I removed this, [specific bad thing] would happen." If you can't name the failure, you might not need the component. Remove it and see.

**2. Does the system start simple and grow?** Run the system with only the CLAUDE.md. Then add state. Then skill. At each stage, the system should produce better output. If adding a component doesn't measurably improve things, it's not earning its place.

**3. Is the prompt under control?** Your CLAUDE.md should be under 500 words. If it's longer, expertise probably belongs in a skill, session data probably belongs in state, and quality checks probably belong in hooks. The prompt orchestrates. Other components do the heavy lifting.

**4. Can you break it safely?** Feed the system its worst-case input. Does it fail loudly (hook catches it) or quietly (bad output ships)? If it fails quietly, you need a hook for that failure mode.

**5. Is there a maintenance plan?** What will you check monthly? What might drift? When would you update the skill? When would you archive state? A system without maintenance is a system with an expiration date.

---

### Section 6: Quality Gate (~200 words)

**Five checks**:

1. **You built a system for a new problem.** It's not a copy of one of the four book systems. It's a different domain with different requirements.

2. **The system has at least 3 components.** At minimum: CLAUDE.md, a state file, and either a skill or a hook. More is fine if each component prevents a named failure.

3. **You followed the process, not your instinct.** You started with prompt-only v1, ran it, identified what broke, and added components one at a time. You didn't design the full system on paper and build it all at once.

4. **You can articulate the architecture.** You can draw the system diagram on a napkin and explain each component's role in one sentence.

5. **The system works for real.** Not a thought experiment — you ran it. It produced output. The output was better with each component addition. The hooks caught at least one bad input.

And: "You just designed and built a system the book never taught you. That's the transfer. The four book systems were training. This one is yours. Chapter 13 looks forward — where these systems go as AI evolves, and how to stay current without drowning."

---

## Files the Reader Creates

| File | Location | Purpose |
|------|----------|---------|
| `[new-system]/CLAUDE.md` | Reader's choice | Instructions for the new system |
| `[new-system]/[system]-state.md` | Reader's choice | State tracking for the new domain |
| `[skill-name].md` | `.claude/skills/` | Domain expertise for the new system |
| Hook script(s) | `.claude/hooks/` | Guard rails for the new system's highest-risk failures |

The exact files depend on what the reader builds. The chapter provides the process for deciding which files to create, not the files themselves.

## Technical Notes for the Writer

- **This chapter is the transfer test.** Everything in the book has been building to this moment: can the reader design from scratch? The chapter should feel like a graduation exercise, not another lesson. The reader does the work. The book holds the guardrails.
- **The running example (meal planning) is illustrative, not prescriptive.** Use it to show how each step works, but make it clear the reader is building something ELSE. The meal planning example should feel disposable — "here's how someone else would do it. Now you do yours."
- **The anti-patterns section is as important as the design process.** The reader WILL be tempted to build it all at once (they've seen 6 chapters of complex systems) or add more to the prompt (their pre-book habit). Name the traps explicitly so they can catch themselves.
- **Step 5 (Start minimal) is the hardest step psychologically.** The reader just finished building systems with 6 components each. Starting with prompt-only feels like going backward. Frame it clearly: "You know what all six components do. You've built them all. But for YOUR system, you don't know which ones you need yet. The only way to find out is to start with the prompt and let the failures tell you what to add."
- **Don't provide a template for the new system.** The temptation is to give the reader a blank CLAUDE.md template, a state file template, etc. Resist. The reader should create these from scratch using the patterns they learned. If they need to look back at Ch 5's state file for inspiration, that's fine — that's reference, not hand-holding.
- **The evaluation questions in Section 5 echo the design principles from the whole book.** Each question maps to a principle taught in an earlier chapter. The reader should recognize them without being told.
- **Forward teaser**: Keep it brief — one sentence at most. "Chapter 13 looks forward: where these systems go as AI evolves, and how to bring others along."
- **Voice**: Confident and slightly celebratory. The reader just proved they can design from scratch. Don't be sentimental about it — be matter-of-fact. "You built a system the book never taught you. That's the skill. Everything else was training for this."

---
---

# Chapter 13: What's Next — Systems That Grow With You

**Title**: What's Next — Systems That Grow With You
**Word target**: 2,500–3,500 words
**Component introduced**: None
**Primary system**: None (all four referenced)
**Universal concept**: All four, in the context of evolution
**Claude Code feature**: None new — forward-looking discussion of how the toolkit adapts

---

## Bridge from Chapter 12

The reader finished Ch 12 with:
- Five working systems (the four book systems + their own)
- A design process they can apply to any new problem
- The debugging protocol for when things break
- A composed personal AI operating system

They don't need another chapter teaching them to build. They need to know how this holds up when the ground shifts — when AI tools change, when their life changes, when they want to help someone else build systems.

Ch 13 is short and forward-looking. Not a recap. Not a victory lap. A practical guide to what happens after the book.

---

## Chapter Goals

By the end of this chapter, the reader can:

1. **Anticipate how their systems will evolve** as AI capabilities change — without rebuilding from scratch
2. **Stay current on AI developments** without drowning in noise — using the 3 sources rule
3. **Evaluate a new AI tool in 30 minutes** by mapping it to the four universal concepts
4. **Teach someone else** the systems-thinking approach in 15 minutes
5. **Know what's in their toolkit** and trust it to work regardless of what ships next

---

## Section-by-Section Breakdown

### Section 1: Your Systems Will Change — Here's How (~500 words)

**Narrative beat**: Ground the reader in the reality that AI improves, constraints shift, and systems must adapt. This isn't anxiety-inducing — it's the natural evolution of any system.

**Content**:

Six months from now, the AI will be better. It will hallucinate less. It will follow instructions more precisely. It will handle longer context without losing focus.

That's great. It also means your constraint moves.

Right now, your systems need hooks to catch fabricated credentials, state files to compensate for session-to-session memory loss, and skills to teach the AI what "your voice" sounds like. Some of those problems will shrink as AI improves. A model that hallucinates 90% less might not need the fabrication-check hook. A model with perfect memory might not need a state file at all.

Your response should not be: "Great, I'll remove all my hooks." Your response should be: "The fabrication-check hook hasn't fired in 2 months. Let me verify it still works on test input. If it does, I'll keep it as a safety net. If the risk has genuinely dropped below my threshold, I'll remove it."

That's the maintenance mindset, applied to evolution.

**Three ways systems evolve**:

**Component removal.** If AI gets better at remembering context, your state files might shrink. If it gets better at matching voice, your skill files might get shorter. Removing a component is a good thing — it means the problem it solved is solved upstream. But VERIFY before removing. "It seems better" is not the same as "it's reliably better."

**Component migration.** Today, you check facts with a shell-script hook. Tomorrow, the AI tool might have built-in fact-checking. Your hook becomes a setting toggle instead of a script. The CONCEPT (Control) stays. The IMPLEMENTATION changes. That's fine — you understand the concept. You can find the new implementation.

**New constraints appear.** Today's bottleneck is output quality. Tomorrow's might be input quality (the AI is so capable that the limiting factor is how well you describe what you want). Or integration complexity (the AI can talk to 50 tools — but choosing the right 3 is the real challenge). Or trust calibration (the AI's output is good enough that you stop checking it — and miss the rare but costly error).

"The framework you learned — Instruction, Memory, Control, Flow — doesn't expire when the tools change. It's a map of the territory. The territory evolves. The map still works."

**Writer guidance**: This section should feel like a conversation about the future, not a prediction. Don't promise what AI will do. Describe the PATTERNS of evolution. The reader should finish this section thinking: "I know how to adapt when things change" — not "I need to stay on top of every AI release."

---

### Section 2: Staying Current Without Drowning (~400 words)

**Narrative beat**: The reader is going to encounter an overwhelming flood of AI news, tools, and advice. Give them a filter.

**Content**:

**The 3 sources rule.** Pick 3 sources of AI information that are relevant to your actual workflows. Ignore everything else.

- **One official source**: The blog or changelog for the tool you use most (Claude's blog, Warp's changelog, OpenAI's release notes). This is where you learn about new features that might affect your systems.
- **One practitioner source**: Someone who builds with AI the way you do — not an AI researcher, not a hype account. Someone who shows their actual workflows and talks about what works and what doesn't.
- **One community source**: A forum, subreddit, or Discord where people discuss the same tools you use. This is where you learn about bugs, workarounds, and real-world use cases.

Three sources. Not 30. Not a newsletter that aggregates 50 AI stories a day. Three.

**When to update your systems for new capabilities.** Not every time a new feature ships. Only when:
1. The feature addresses a SPECIFIC constraint you currently experience
2. You can test it in 30 minutes against your existing system
3. The improvement is measurable — not "it seems better" but "the hook hasn't fired in 2 months" or "the state file grew half as fast"

**When to wait**: When a feature is "interesting" but doesn't address a constraint you have. When the feature is in beta and might change. When adopting it would require rebuilding a component that already works.

"New feature" and "useful for my workflow" are different categories. Most new features are interesting and irrelevant. A few are interesting and essential. The three conditions above sort them.

**The anti-drowning rule**: If you spent more than 30 minutes this week reading about AI tools instead of USING your AI systems, you're drowning. Close the tabs. Open your terminal. Run a system. The system teaches you more about AI than any article.

---

### Section 3: Evaluating New Tools — The 30-Minute Assessment (~400 words)

**Narrative beat**: Give the reader a practical framework for evaluating any new AI tool that crosses their path.

**Content**:

A new tool appears. Everyone's excited about it. "It changes everything." Here's how to evaluate it in 30 minutes without getting swept up:

**Minute 0-5: Map to the four concepts.** Open the tool's marketing page or docs. For each of the four universal concepts, answer: does this tool support it?

| Concept | Question | What to Look For |
|---------|----------|-----------------|
| Instruction | Can I give it persistent, structured instructions? | Settings files, system prompts, project configs |
| Memory | Does it remember across sessions? | File persistence, state management, conversation history |
| Control | Can I add automated checks on output? | Hooks, plugins, guard rails, review stages |
| Flow | Can I build multi-stage workflows? | Pipelines, chained actions, conditional logic |

Any tool that supports all four is worth a deeper look. Any tool that supports only Instruction is a chat interface with extra steps.

**Minute 5-15: Run your simplest system.** Take your Study System (or whichever is simplest) and try to rebuild v1 in the new tool. Just the prompt. Can you give it structured instructions? Does the output match what you got in your current tool?

**Minute 15-25: Add state.** Can you create a file the tool reads at session start and writes at session end? If the tool doesn't support persistent files, it can't do Memory — and that means every session starts from zero. That's a dealbreaker for system builders.

**Minute 25-30: Verdict.** Score the tool on 3 dimensions:
- **Component support**: How many of the 6 components can it handle? (Prompt, State, Skill, Hook, Connection, Pipeline)
- **File transparency**: Can you see and edit the system's files directly? Or is everything hidden behind a GUI?
- **Migration effort**: How much work to move your existing systems here? If it uses the same file formats (markdown, JSON, shell scripts), migration is low. If it requires proprietary formats, migration is high and lock-in is real.

"You're not evaluating whether the tool is good. You're evaluating whether it can run your SYSTEMS. That's a different question. A great tool that can't handle state files is useless for what you've built."

**Writer guidance**: This framework should feel like a superpower. Before this book, the reader would evaluate AI tools by trying prompts and seeing if the output was good. Now they evaluate by checking whether the tool supports the SYSTEM they've built. That's a fundamentally different — and more useful — evaluation.

---

### Section 4: Teaching Others (~400 words)

**Narrative beat**: The reader has a skill that most people don't. Here's how to share it.

**Content**:

**The 15-minute demo.** When someone asks "how do you use AI?" — don't show them a prompt. Show them a system.

Open your Content System (or whichever is most impressive). Show them:
1. The CLAUDE.md — "This is my instruction file. Claude reads it automatically every session."
2. The state file — "This tracks what's happened. Claude knows what I've already written without me re-explaining."
3. The skill file — "This is my voice loaded into a file. Claude reads it before writing. That's why it sounds like me."
4. The hook — "This catches mistakes automatically. Watch." (Feed it a deliberately bad input. Watch the hook flag it.)
5. The output — "This is what the system produces. Not one prompt. A system with memory, expertise, and quality checks."

That's 15 minutes. The person goes from "AI is a chat tool" to "AI can be a system." They don't need to understand every component. They need to see the difference between a prompt and a system.

**Building shared systems.** If you work with a team, systems scale:
- Shared skills: team voice guides, methodology documents, domain expertise that everyone uses
- Shared state: project tracking that multiple people update through AI
- Common hooks: quality checks that enforce team standards
- Individual customization: each person's CLAUDE.md reflects their role and preferences, but shared components keep the team aligned

"A team where everyone writes their own prompts is a team where quality is random. A team that shares skills and hooks is a team where the floor is high."

**The systems-thinking conversation.** When you're talking to someone who uses AI casually, ask two questions:
1. "What do you re-explain every time?" — that's missing Memory
2. "How do you know the output is right?" — that's missing Control

Those two questions open the door. The person sees the gap without you lecturing. They ask "how do I fix that?" and you show them the system.

---

### Section 5: Your Toolkit — What You Walk Away With (~300 words)

**Narrative beat**: Not a recap — a reference card. The reader should feel equipped, not nostalgic.

**Content**:

What you have now that you didn't have 13 chapters ago:

**4 universal concepts** that work in any AI tool, on any platform, in any year:
- Instruction — what you tell the AI to do
- Memory — what persists between sessions
- Control — what catches mistakes
- Flow — how stages connect

**6 implementation components** you can build in a terminal:
- Prompt (CLAUDE.md) — persistent instructions
- State — session memory in a file
- Skill — loaded expertise
- Hook — automated guard rail
- Connection — external data access
- Pipeline — multi-stage workflow with quality gates

**3 design patterns** for structuring any system:
- Loop — process → check → improve → repeat
- Gate — stage → quality check → pass or rework
- Router — decision → path A or path B

**1 debugging protocol**: symptom → component → isolate → fix → add a check

**1 design process**: frustration → map → constraint → pattern → start minimal → add components → break it → document

**5+ working systems** that do real work in your life

**1 evaluation framework** that lets you assess any new AI tool in 30 minutes

"This toolkit doesn't expire when the next AI model ships. It doesn't become obsolete when a new tool launches. The concepts are permanent. The implementations adapt. That's the difference between learning prompts (which change every 6 months) and learning systems (which transfer across everything)."

---

### Section 6: Quality Gate (~150 words)

**Three checks**:

1. **You can evaluate a new AI tool in 30 minutes.** Open a tool you haven't used before. Map it to the four concepts. Identify which components it supports. Score it on component support, file transparency, and migration effort. You have a verdict in 30 minutes — not an opinion based on the marketing page, an evaluation based on your framework.

2. **You can explain the systems approach in under 5 minutes.** To someone who has never opened a terminal. Without jargon. Using their workflow as the example, not yours.

3. **You feel equipped, not dependent.** You don't need this book to build the next system. You don't need a new course when a new tool ships. You have the concepts, the components, the patterns, and the process. The next system is yours.

---

## Files the Reader Creates

No new files. This chapter is about perspective, evaluation, and teaching — not construction.

## Technical Notes for the Writer

- **This chapter should be the shortest in the book.** Target the low end of the word count range (2,500–3,000 words). The reader doesn't need more instruction. They need a brief, forward-looking frame and then they're done.
- **No recap.** Do not summarize the book. Do not re-teach concepts. Do not walk through "what we covered in each chapter." The reader was there. They built the systems. A recap is padding, and this chapter should be lean.
- **The 3 sources rule is the most actionable takeaway.** If the reader remembers nothing else from this chapter, this keeps them sane in the AI hype cycle. Be specific: "three sources, not thirty." The reader who follows this rule will be better informed than the reader who subscribes to every AI newsletter.
- **The 30-minute evaluation framework is the chapter's power tool.** It transforms the reader from someone who passively adopts whatever's popular to someone who evaluates tools against their own requirements. The table in Section 3 should be something the reader can photograph and use next week.
- **The 15-minute demo in Section 4 is a specific formula.** Don't say "show them your system." Say "show them these 5 things in this order." The specificity makes it actionable. A reader who does this demo will convert more people to systems thinking than any amount of explaining.
- **The toolkit section is NOT a summary.** It's a reference card — like the back of a textbook that lists formulas. The reader should feel like they're looking at a toolkit they OWN, not a list of things they were taught. The framing is: "this is yours now."
- **End with confidence, not sentimentality.** The last paragraph should feel like a firm handshake, not a tearful goodbye. "The next system is yours." Full stop. Don't linger.
- **Voice**: The most conversational chapter in the book. Less teaching, more talking. The reader is a peer now — they've built 5 systems. Address them as someone who knows what they're doing, not someone who needs to be guided. Slightly less formal than the build chapters. More like the opening of Ch 1 — direct, warm, a person talking to a person.

---

# Cross-Chapter Summary: Part V (Mastery)

| Chapter | What It Teaches | Reader's System After |
|---------|----------------|----------------------|
| Ch 10 | Debugging — diagnosing and fixing failures by component | All four systems debugged, failure taxonomy internalized, protocol habitualized |
| Ch 11 | Composition — wiring systems together with loose coupling | Personal AI operating system: 4 systems + master index + shared skills + cross-system hooks |
| Ch 12 | Independent design — building a new system from scratch | 5th system built for a problem the book never covered, design process internalized |
| Ch 13 | Forward-looking — evolution, evaluation, teaching | Complete toolkit: 4 concepts, 6 components, 3 patterns, 1 protocol, 1 design process, 5+ systems |

**The Part V arc**: The reader enters as someone who has built systems by following instructions. They leave as someone who can diagnose failures, compose systems, design from scratch, evaluate new tools, and teach others. The book taught them to build. Part V taught them to think.
