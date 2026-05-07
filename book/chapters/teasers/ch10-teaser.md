# Chapter 10: How Deep the Rabbit Hole Goes

You just built four systems. Each one has all six components: prompts, state, skills, hooks, connections, pipelines. They work. You can verify they work because you broke them on purpose and watched the validation layer catch the failure.

But you've been building at personal scale. A study system tracking 30 topics. A job search managing 50 applications. A content pipeline producing one piece at a time.

Here's what's happening right now: people with deep domain knowledge (the person who knows their market, their customers, their supply chain) are working at a scale they never could before. Not because they learned machine learning. Because they learned to build systems like the ones you just built, and they pointed those systems at problems they already understood better than anyone.

This chapter shows you what that looks like. Every piece of it maps back to something you already know how to build.

---

## The Business

A specialty food importer runs a small operation in an emerging market where supply chains aren't transparent. They buy high-end ingredients (saffron, vanilla beans, high-grade spices, specialty oils) from trade markets and regional distributors. They package, grade, and resell to restaurants, caterers, and independent retailers.

The problem: this market has layers. Importers sell to distributors. Distributors sell to resellers. Resellers sell to sub-resellers. Everyone claims to be "direct from source." Nobody publishes real prices. The same supplier operates under three different names across different trade channels. And the founder needs to answer one question every week: **what should I buy, from whom, and at what price?**

They built a system to answer it. An AI agent backed by a database of 22,000+ price quotes, 180+ social media vendor profiles, 274 computer-vision-analyzed competitor posts, and 96 customer survey responses. The agent has 37 tools. It can tell you, in under ten seconds, where any supplier sits in the supply chain, what margin you'd make buying from them, and whether customer demand actually supports the purchase.

This isn't a team of engineers at a well-funded startup. It's one person with the same six components you just learned, pointed at a real market with real money on the line.

---

*This is a preview. The full chapter continues with a complete teardown of how this system works — state files at database scale, supply chain forensics that map who buys from whom using price data, and an agent layer with 37 tools that answers any market question in seconds.*

**[Read the full book →](https://frontierengineering.dev/book)**

---

**What you'll build in this chapter:**
- A mental model for scaling personal systems to production — same six components, bigger data
- Understanding of how supply chain forensics work using price analysis and language signals
- The confidence that the framework you just learned works at scales you haven't tried yet

**Free preview:** [Act 1 (Chapters 1-3)](../ch01-draft.md) is free — start there.
