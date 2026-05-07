# Chapter 11: The Cost of Intelligence — Managing What You Spend

Every time you run your Study System, your Content pipeline, your Job Hunting cover letter generator, money moves. Not a lot. Maybe two cents for a quiz. Maybe a dollar for a full content pipeline run. But it moves, and if you don't know where it's going, you can't make smart decisions about it.

This chapter isn't about making AI cheap. It's about making your spending intentional. You'll learn where the money goes, how to spend less without gutting your systems, and how to track what you're actually paying. No anxiety, no guilt. Just clear math and practical choices.

---

## Where the Money Goes

AI models charge by the token. A token is roughly a word (sometimes a bit less, sometimes a bit more). Everything Claude reads is an input token. Everything Claude writes back is an output token. Output tokens cost more than input, roughly 3-5 times more depending on the model.

Here's the part most people miss: your system has a startup cost before you type anything.

When you open Claude Code in your `study-system/` folder, here's what loads automatically:

- Your CLAUDE.md: maybe 500 tokens
- Your state file (via the `@` import): another 300-800 tokens depending on how many rows you have
- Any skills that trigger: 400-1,000 tokens each

That's your system's idle cost. Tokens spent before you ask a question. A lean system might load 1,000 tokens of context. A bloated one might load 5,000. Over hundreds of sessions, that difference adds up.

Once you actually ask something, the costs depend on what the system does:

| Action | Approximate Cost |
|--------|-----------------|
| Study quiz (generate + score) | $0.01-0.03 |
| Cover letter + resume tailoring | $0.03-0.08 |
| Project status report | $0.02-0.05 |
| Full content pipeline (5 stages) | $0.50-2.00 |
| Web search + processing results | $0.05-0.15 per search |

Notice the Content pipeline is 25-100x more expensive than a study quiz. That's not because content is harder. It's because the pipeline has more stages, each stage reads and writes text, and some stages pull in web search results that add thousands of tokens to the context. When you built that pipeline in Chapter 9, you built something powerful. Power has a meter running.

---

*This is a preview. The full chapter continues with the model ladder (when to use cheap models vs. expensive ones), practical strategies for cutting costs without cutting quality, and how to track your actual spending so you always know where your money goes.*

**[Read the full book →](https://frontierengineering.dev/book)**

---

**What you'll build in this chapter:**
- A cost map of your systems showing exactly where tokens (and dollars) are spent
- A model selection strategy that matches task complexity to model tier — saving 10-36x on routine tasks
- Tracking habits that keep your spending intentional instead of invisible

**Free preview:** [Act 1 (Chapters 1-3)](../ch01-draft.md) is free — start there.
