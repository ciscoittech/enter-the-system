# Chapter 12: When Systems Break

Your Content System has been running for three weeks. Nine blog posts drafted, seven published. The pipeline works. Then Post #10 comes out wrong. The voice is off. Formal, stiff, nothing like your writing. The hook didn't catch it because the hook checks for banned words and word count, not overall tone.

Your instinct: fix the prompt. You open your Content CLAUDE.md and add: "Remember to match my casual, conversational tone. Don't be formal. Sound like me." You run the pipeline again. Post #11 is slightly better. Post #12 drifts back to stiff. You add more words to the prompt. Post #13 is better. Post #14 is stiff again.

You're playing whack-a-mole with the prompt. That's the tell. When you keep adding words to the prompt and the problem keeps coming back, you're fixing the wrong thing.

The real problem: your editorial-voice skill file. You updated it two weeks ago, added 8 new "rules" about tone and structure. The file is now 2,800 words. Claude's attention is diluted. The examples that used to anchor your voice are buried under rules that contradict each other. The skill got too long and too noisy.

The fix isn't more prompt words. It's cutting the skill back to 1,500 words, keeping the 3 strongest writing examples, removing the rules that restate what the examples already show. One component change. Problem solved. No prompt bloat.

That's debugging. The symptom points one direction (bad output, must be the prompt), but the cause is somewhere else (overloaded skill). This chapter teaches you to follow the trail to the real problem.

---

## The Failure Taxonomy

Every system failure you'll ever see maps to a component you built. Here's the diagnostic map. Bookmark this page.

| What You See | What's Actually Wrong | Component | First Thing to Check |
|---|---|---|---|
| "It didn't do what I asked" | Instructions unclear or conflicting | Instruction (Prompt/Skill) | Is the CLAUDE.md specific? Are skill rules contradicting examples? |
| "It forgot what we did last time" | State not reading or writing | Memory (State) | Open the state file — is recent session data there? |
| "It remembers wrong things" | State file has stale or incorrect data | Memory (State) | When was the state file last cleaned? Are archived items polluting active data? |
| "Output sounds generic, not like me" | Skill not loading or too diluted | Instruction (Skill) | Is the skill under 2,000 words? Are the examples still representative? |
| "It gave me confident garbage" | Hook missing or not firing | Control (Hook / Validation Layer) | Test the hook manually — does it catch known-bad input? |
| "It caught everything, even good stuff" | Hook too strict | Control (Hook / Validation Layer) | Check false positive rate. Loosen thresholds. |
| "It tried to do everything at once" | Missing pipeline stages | Flow (Pipeline) | Does the task need staging? Where should the gates be? |
| "It couldn't get the data it needed" | Connection down or auth expired | Flow (Connection) | Test the connection independently — does a simple query return data? |
| "Pipeline gets stuck in a loop" | Quality gate too strict or feedback too vague | Flow (Pipeline) | What does the gate reject? Is the feedback specific enough for Claude to fix? |
| "It used to work and now it doesn't" | Something changed — find what | Any | What's different since it last worked? File edit, skill update, connection change? |

Notice what's NOT in this table: "The AI is broken." In six months of building these systems, you will never fix a problem by blaming the AI. Every failure maps to a component YOU built. That's not an insult — it's freedom. If you built it, you can fix it.

![Failure taxonomy: symptoms on the left flowing through component identification to the specific file to inspect](../diagrams/png/ch12-failure-taxonomy.png)

*Failure taxonomy flowchart — every symptom maps to a component, every component maps to a file you can check.*

---

## The Debugging Protocol

Five steps. Not a flowchart to memorize, a habit to build.

**Step 1: Name the symptom.** Not "it's broken." What SPECIFICALLY went wrong? "The cover letter mentioned a project I never worked on." "The quiz covered topics I already mastered." "The status update says 5 tasks are done but the state file shows 3." Specific symptoms point to specific components.

**Step 2: Map to a component.** Use the taxonomy table. The symptom tells you where to look. "Mentioned a project I never worked on": the career-profile skill doesn't list that project, so either the skill isn't loading or the hook isn't catching fabrications. That's Instruction or Control. Two suspects, not six.

**Step 3: Isolate.** Test the suspected component alone. Does the skill file load? Ask Claude: "What's in my career-profile skill?" If it can't answer, the skill isn't loading. Does the hook fire? Feed it known-bad input — a cover letter that mentions a fake company. If it doesn't flag it, the hook is the problem. Does the state file have the right data? Open it and read it yourself.

**Step 4: Fix the component.** Not the prompt. The component. If the skill isn't loading, check the frontmatter. If the hook isn't firing, check settings.json registration and `chmod +x`. If the state is wrong, correct the data and check the read/write instructions in CLAUDE.md.

**Step 5: Add a check.** Whatever just broke, make sure you'll know if it breaks again. If the skill wasn't loading, add a line to your CLAUDE.md: "At session start, confirm you've loaded the career-profile skill." If the hook wasn't firing, add a test to your monthly maintenance: "Feed a fake company name and verify the hook catches it." The fix stops the bleeding. The check prevents the recurrence.

The protocol takes 5 minutes when you follow it and 45 minutes when you skip to guessing.

![The 5-step debugging protocol: Symptom, Map to Component, Isolate, Fix, Add Check](../diagrams/png/ch12-debugging-protocol.png)

*The debugging protocol — five steps that take 5 minutes when you follow them and 45 minutes when you skip to guessing.*

---

## Debug Scenarios: Study System

**Scenario A: The quiz keeps covering mastered topics.**

*Symptom*: You've scored 90%+ on "subnet masks" three sessions in a row. Session 4 still quizzes you on subnet masks. The system isn't adapting.

*Map to component*: The system should know you've mastered this. That's Memory: the state file.

*Isolate*: Open `study-state.md`. Look at the topics table. Is "subnet masks" marked as strong or mastered? If not, the state isn't being written correctly. Claude isn't updating mastery levels after each quiz. If it IS marked as mastered, the problem shifts: Claude reads the state but ignores it. That's Instruction: the CLAUDE.md doesn't tell Claude to deprioritize mastered topics strongly enough.

*Fix*: If the state isn't updating, check the CLAUDE.md section that tells Claude to write to state. Is the instruction specific? "Update mastery level based on quiz score" is vague. "If I score 90%+ on a topic in 2 consecutive sessions, mark it as MASTERED and don't include it in future quizzes unless I ask" is actionable. If the state is correct but ignored, add to CLAUDE.md: "Before generating a quiz, read study-state.md. Do NOT quiz me on topics marked MASTERED. Spend 80% of questions on WEAK topics, 20% on MODERATE."

*Add a check*: The `check-weak-area-focus.sh` hook from Chapter 7 should catch this. If it's not, tighten it. Verify at least 60% of quiz questions target weak or moderate topics. If the hook exists and isn't firing, check registration in settings.json.

---

**Scenario B: Explanations use jargon above your level.**

*Symptom*: You set your level as "beginner, no networking background" in the study-method skill. Claude explains OSPF routing using terms like "link-state advertisement" and "Dijkstra's algorithm" without translation.

*Map to component*: Claude knows your level (it's in the skill) but isn't applying it. That's Instruction: the skill.

*Isolate*: Open `study-method.md`. Does it say "explain at beginner level"? That's too vague. Claude's version of "beginner" might include Dijkstra. Does it say "never use a technical term without immediately explaining it in one sentence of plain English"? That's specific.

*Fix*: Update the skill with a concrete rule and an example: "Every technical term gets a plain-language equivalent in the same sentence. Example: 'OSPF uses a link-state advertisement (basically, each router announces what it's directly connected to, and the network pieces together the full map).'"

*Add a check*: Consider a hook that scans generated explanations for uncommon technical terms and flags any that appear without a parenthetical or dash-delimited explanation nearby.

---

## Debug Scenarios: Job Hunting System

**Scenario A: Cover letter sounds generic despite the career-profile skill.**

*Symptom*: The letter says "I have extensive experience in project management and a track record of delivering results." That's resume filler, not your voice. Your career-profile skill has specific, quantified achievements.

*Map to component*: Instruction. The skill isn't doing its job. Either it's not loading or Claude isn't using the examples in it.

*Isolate*: Ask Claude mid-session: "What achievements from my career-profile skill are most relevant to this role?" If Claude lists them correctly, the skill is loading. Claude just isn't using the specifics in the letter. If Claude can't answer, the skill isn't loading.

*Fix*: If the skill isn't loading, check the frontmatter `description:` field. Does it match what you're doing? Check the CLAUDE.md "Skills" section. Does it tell Claude to load career-profile for job hunting work? If the skill loads but isn't applied, the CLAUDE.md needs a stronger instruction. Not "reference my career profile" but "Every cover letter must cite at least 2 specific achievements from career-profile.md, with numbers. No generic claims like 'extensive experience.' Replace with the specific achievement."

*Add a check*: Update `verify-cover-letter.sh` to grep for generic phrases: "extensive experience," "track record," "proven ability," "results-driven." If any appear, fail the check with: "Generic language detected. Replace with specific achievements from career-profile.md."

---

**Scenario B: Hook misses a fabricated credential.**

*Symptom*: Claude wrote "In my role at Meridian Analytics," a company you never worked at. The verify-cover-letter hook didn't catch it.

*Map to component*: Control. The validation layer, specifically the hook.

*Isolate*: Run the hook manually against the saved cover letter file. Does it fire? If not, check the company-name extraction logic. Maybe "Meridian Analytics" is two words and the regex only catches single-word company names. Feed it a test file with an obvious fake company. If it catches some fakes but not others, the pattern matching is too narrow.

*Fix*: Switch strategies. Instead of trying to catch every fake company, check that every "at [Company]" claim in the letter has a matching entry in career-profile.md. Positive matching (what's IN the profile) is more reliable than negative matching (what's NOT in the profile).

*Add a check*: After fixing the hook, keep 3 test cover letters with known fabrications. Run them through the hook quarterly to verify it still catches them. This is the "break it on purpose" maintenance practice from Chapter 7.

---

## Debug Scenarios: Project Management System

**Scenario A: Status update contradicts the task list.**

*Symptom*: The status report says "5 of 8 tasks complete" but the state file shows only 3 tasks marked "done." The report invented 2 completions.

*Map to component*: This could be Memory (state has wrong data) or Flow (the pipeline analyzed before gathering, using stale data). Two suspects.

*Isolate*: Open `project-state.md`. Count the "done" tasks yourself. If there are 3, the state is correct and Claude miscounted. That's a pipeline issue: the analysis stage isn't reading state accurately. If there are 5, the state was updated incorrectly. A previous session marked tasks done that aren't actually done. That's a Memory issue.

*Fix*: If Claude miscounted (Flow issue), add an explicit instruction to the pipeline's analysis stage: "Before generating any status numbers, count the rows in project-state.md by status. List the count per status. Use ONLY these counts in the report. Do not estimate or infer." If the state has wrong data (Memory issue), correct the state file manually, then check: does the CLAUDE.md clearly define what "done" means? If Claude is marking tasks done when they're merely "in progress," the definition-of-done in the PM methodology skill needs sharpening.

*Add a check*: The `verify-status-consistency.sh` hook should compare the status report's numbers against the state file. Parse the report for "X of Y tasks complete" and verify X matches the count of "done" rows in state.

---

**Scenario B: Connection returns stale data.**

*Symptom*: The PM system pulls team updates from an external source via a connection. The status report references messages from last week, not this week. The connection is working, but returning old data.

*Map to component*: Flow. Specifically, the Connection.

*Isolate*: Test the connection directly. Ask Claude: "What are the most recent 5 messages in [channel]?" Check the timestamps. If they're current, the connection works and the pipeline's data gathering stage is filtering incorrectly. If they're old, the connection has a caching issue or the query parameters are wrong.

*Fix*: Check the connection configuration. Is there a date filter? A "since" parameter? Connections may cache results, so check if there's a refresh or cache setting. If the connection returns current data when queried directly but old data in the pipeline, the pipeline's gather stage needs an explicit date range: "Pull messages from the last 7 days only."

*Add a check*: Add to the pipeline's gather stage: "After pulling data, verify the most recent item is from within the last 48 hours. If not, flag: 'Connection may be returning stale data — verify manually.'"

---

## Debug Scenarios: Content System

**Scenario A: Voice drifts to generic by paragraph 3.**

*Symptom*: The first two paragraphs sound like you. By paragraph 3, it's AI-speak: longer sentences, hedging phrases, generic structure. The voice skill is loaded. It just fades.

*Map to component*: Instruction, specifically the Skill. Claude's attention is finite. By paragraph 3, the influence of the writing examples weakens.

*Isolate*: Check the skill file length. Over 2,000 words? Claude loses focus on later content. Check the structure: are the writing examples at the top (where they get the most attention) or buried below rules?

*Fix*: Restructure the skill. Put the 3 strongest writing examples FIRST, before any rules. Cut rules that restate what the examples show. If you have an example of a punchy opening AND a rule that says "use punchy openings," cut the rule. The example does more work. Target under 1,500 words. Also add to the pipeline's draft stage: "After writing each section, re-read the voice examples in editorial-voice.md. Does this section match? If not, rewrite before continuing." This adds a mid-draft voice check instead of relying on end-of-draft review.

*Add a check*: Consider a post-draft hook that compares sentence length and word patterns in the first two paragraphs versus the last two. If the metrics diverge significantly (sentences get 50%+ longer, banned words appear), flag: "Voice drift detected in later paragraphs."

---

**Scenario B: Pipeline gets stuck in a revision loop.**

*Symptom*: The content pipeline hits the REVIEW stage, fails, goes back to DRAFT, revises, hits REVIEW again, fails again. Three cycles. The revision instruction says "Max 2 revisions" but the gate keeps rejecting.

*Map to component*: Flow, specifically the Pipeline. The quality gate between DRAFT and REVIEW.

*Isolate*: What is the gate rejecting? Read the hook output from the last 3 rejections. If it's the same issue every time (say, "no source for claim in paragraph 4"), Claude isn't fixing it in revision because the feedback isn't specific enough. If it's a different issue each time, the gate might be too strict (fixing one thing introduces another failure).

*Fix*: If the same issue persists, the revision feedback isn't actionable. Instead of "fact-check hook failed," the pipeline should pass the SPECIFIC failure to the draft stage: "Paragraph 4 claims 'AI adoption grew 340% in healthcare.' No source found. Either add a source URL, replace with a qualified statement, or flag as [VERIFY]." Specific feedback produces specific fixes. If a different issue breaks each time, the gate has too many checks firing at once. Prioritize: fact-checking passes first, then voice, then structure. Don't require all checks to pass simultaneously. Stage them. Or loosen the strictest check by one threshold.

*Add a check*: Track revision count in your state file. If any piece goes through 3+ revisions, flag it for manual review. The pipeline should escalate, not loop forever.

---

## The Debugging Mindset

**Fix the component, not the prompt.** This is the sentence to tattoo on the wall. When something breaks, the instinct is always to add words to the prompt. That instinct is wrong 80% of the time. If the prompt were the problem, the system would have been broken from the start. If it used to work and now it doesn't, something changed in a component — a skill update, a state file that got too long, a hook that stopped firing, a connection that expired. Find the component, fix the component.

**Isolate before you fix.** Don't guess. Test. "I think the skill isn't loading" is a hypothesis. "I asked Claude what's in my career-profile skill and it couldn't answer" is evidence. The gap between those two sentences is 40 minutes of wasted effort.

**Debugging isn't maintenance.** You learned maintenance practices for every component: state hygiene in Chapter 5 (archiving stale data, the 50-row guideline, monthly checks), skill versioning in Chapter 6 (changelogs, rollbacks, quarterly reviews), hook tuning in Chapter 7 (false positive calibration, the break-it-on-purpose test), connection health in Chapter 8 (monthly test queries, graceful degradation, cost monitoring), pipeline bottlenecks in Chapter 9 (constraint identification, stage-level monitoring, when to add or remove stages).

Those are preventive. This chapter is the emergency room. If maintenance is brushing your teeth, debugging is the dentist visit when something goes wrong anyway.

**Every fix adds a check.** Whatever broke, make it impossible to break silently again. A hook, a state tracker, a monthly test. The system gets more resilient with every failure. Not because you add complexity, but because you add visibility.

---

## How to Know It's Clicking

Five checks:

**You diagnosed a real failure.** At least one of your four systems has had a real problem. Not a test, an actual failure during use. You identified it, followed the protocol, and fixed it.

**You mapped symptom to component correctly.** The fix was in the component the taxonomy predicted, not in the prompt.

**Isolation confirmed the cause.** You tested the suspected component alone before changing it. You have evidence the component was the problem, not a guess.

**The fix didn't add complexity.** Your system has the same number of components (or fewer) after the fix. You didn't add a new hook to work around a broken skill. You fixed the skill.

**You added a check.** Whatever broke has a monitoring mechanism (a hook, a state tracker, or a monthly test item) that will flag the recurrence. The system is more visible now than before the failure.

---

Your four systems work. They break sometimes, and now you can fix them. But they're still four separate systems. The Study System doesn't know about the Content System. Your career research doesn't feed your blog posts. Your study progress doesn't show up in your cover letters. Chapter 13 introduces them to each other.
