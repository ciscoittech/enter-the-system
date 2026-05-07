# Chapter 6: Skills. Loading Expertise On Demand

You've drafted three blog posts with your Content System. The state file works. Claude knows what you've already covered, avoids repetition, picks complementary topics. But read those three drafts side by side.

They sound like AI.

Not terrible AI. They follow your CLAUDE.md constraints. No "leverage" or "delve." The word count is right. The structure is fine. But the voice is... flat. Generic. If someone who reads your real writing saw these, they'd say "this doesn't sound like you."

Your CLAUDE.md says "my tone is conversational, like explaining to a smart friend over coffee." That's a rule. But it's not expertise. Claude follows the rule (avoids formal language, keeps sentences short) but it can't reproduce YOUR specific voice because it's never seen your voice. It's guessing at "conversational" based on a one-sentence description.

You could paste samples of your writing into the prompt every session. But that's manual. It clogs the conversation with 2,000 words of examples before you even ask for anything. And you'd paste the same examples every single time.

The state file tells Claude what happened. But it doesn't tell Claude how to do the work well: your voice, your methodology, your standards. You need a file that carries your expertise and loads automatically when the system does content work. Not instructions ("be conversational"). Evidence ("here's what conversational looks like when I write it").

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

The skill sits alongside the CLAUDE.md, but notice WHERE it loads. Here's the actual sequence when you start a session:

```
1. You type: claude (or open your AI tool in the content/ folder)
2. Claude Code reads CLAUDE.md → knows your rules, your constraints
3. Claude Code scans .claude/skills/ → reads skill names + descriptions
4. You type your prompt: "Write a blog post about remote work burnout"
5. Claude matches your request to a skill description → loads editorial-voice
6. Claude reads content-state.md (via @import) → knows what you've written before
7. Claude drafts — with your voice loaded from the start, not guessing
```

The skill doesn't load at startup like CLAUDE.md does. It loads on demand, when Claude decides (or you tell it) the skill matches the current task. That's the difference between instructions (always on) and expertise (loaded when relevant).

---

*This is a preview. The full chapter continues with building an editorial-voice skill from your own writing samples, creating a career-profile skill for the Job Hunting System, and learning the difference between rules that constrain and evidence that teaches.*

**[Read the full book →](https://frontierengineering.dev/book)**

---

**What you'll build in this chapter:**
- An editorial-voice skill that makes your Content System sound like you, not like AI
- A career-profile skill that anchors your Job Hunting System to real achievements
- The mental model for when to use instructions (always-on rules) vs. skills (on-demand expertise)

**Free preview:** [Act 1 (Chapters 1-3)](../ch01-draft.md) is free — start there.
