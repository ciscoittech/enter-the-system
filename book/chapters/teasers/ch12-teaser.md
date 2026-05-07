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

| What You See | What's Actually Wrong | Component |
|---|---|---|
| "It didn't do what I asked" | Instructions unclear or conflicting | Instruction (Prompt/Skill) |
| "It forgot what we did last time" | State not reading or writing | Memory (State) |
| "Output sounds generic, not like me" | Skill not loading or too diluted | Instruction (Skill) |
| "It gave me confident garbage" | Hook missing or not firing | Control (Hook) |
| "It tried to do everything at once" | Missing pipeline stages | Flow (Pipeline) |
| "It used to work and now it doesn't" | Something changed — find what | Any |

Notice what's NOT in this table: "The AI is broken." In six months of building these systems, you will never fix a problem by blaming the AI. Every failure maps to a component YOU built. That's not an insult — it's freedom. If you built it, you can fix it.

---

*This is a preview. The full chapter continues with a five-step debugging protocol, hands-on exercises where you deliberately break each component and trace the failure back to its source, and the maintenance habits that prevent most breakdowns before they happen.*

**[Read the full book →](https://frontierengineering.dev/book)**

---

**What you'll build in this chapter:**
- A failure taxonomy that maps every symptom to the exact component and file to inspect
- A five-step debugging protocol that takes 5 minutes when you follow it (and 45 when you skip to guessing)
- The habit of adding a check after every fix, so the same failure never surprises you twice

**Free preview:** [Act 1 (Chapters 1-3)](../ch01-draft.md) is free — start there.
