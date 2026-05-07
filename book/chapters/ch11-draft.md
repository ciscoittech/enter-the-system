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

These numbers are as of mid-2026. By the time you're reading this, they're probably lower. The pattern matters more than the specific cents: simple lookups are cheap, multi-stage workflows with web search are expensive, and everything in between scales with how much text the model reads and writes.

Notice the Content pipeline is 25-100x more expensive than a study quiz. That's not because content is harder. It's because the pipeline has more stages, each stage reads and writes text, and some stages pull in web search results that add thousands of tokens to the context. When you built that pipeline in Chapter 9, you built something powerful. Power has a meter running.

The subagent model matters here too. Remember the n8n analogy from Chapter 4? In n8n, spawning a sub-workflow has overhead: setup time, data transfer, teardown. Same here. If your pipeline spawns subagents (separate AI sessions that handle individual stages), each one loads its own context from scratch. Three subagents in a pipeline means three loads of your CLAUDE.md, three loads of relevant state. It's more organized (each stage gets focused context, better output), but it's not free. The cost trade-off: better output quality per stage vs. higher total token spend. For most personal systems, single-session pipelines are the right default. Split into subagents only when quality demands it.

![Token cost breakdown: startup cost versus per-action cost for quiz, cover letter, and pipeline operations](../diagrams/png/ch11-token-cost.png)

*Token cost breakdown — startup costs (CLAUDE.md + state + skills) versus per-action costs across different system operations.*

---

## The Model Ladder

Not every question needs the smartest model. This is the single biggest cost decision you'll make.

AI models come in tiers. Think of it like hiring: you don't bring in a senior consultant to photocopy documents. Different levels of thinking cost different amounts.

**Fast tier**: models like Haiku, GPT-4o-mini, DeepSeek V4 Flash. These cost fractions of a cent per thousand tokens. They handle lookups, formatting, simple classification. "What status is Task 7?" doesn't need a genius.

**Standard tier**: models like Sonnet, GPT-4o. A few dollars per million tokens. Good for most tasks: writing, analysis, cover letters, study quizzes. This is where 70% of your work happens.

**Reasoning tier**: models like Opus, o3, GPT-5.5. The heavy hitters. Ten to twenty-five dollars per million tokens on the flagship models. You use these for complex strategy, multi-step reasoning, nuanced writing where quality genuinely matters.

How wide is the gap? The cheapest major model (DeepSeek V4 Flash) costs $0.14 per million input tokens. Claude Opus costs $5.00. That's 36 times more for input alone. And both give you the same answer when you ask "What day is it?" or "Format this as a table."

For the truly extreme end: GPT-5.5 Pro charges $30 per million input tokens and $180 per million output tokens. Compared to the cheapest models, that's a spread of over 4,500 times on output. You will never need GPT-5.5 Pro to check a word count.

The production system from Chapter 10 uses this principle. When someone asks a factual question ("What's in our inventory?"), the system routes it to a fast, cheap model. An analytical question like "What should we reorder?" goes to a standard model. Strategic questions ("What happens if a competitor undercuts us by 20%?") go to the reasoning tier. The system decides which brain to use before it starts thinking. That's not a feature. It's a cost control.

How this maps to your four systems:

- **Study System**: Quiz generation needs a standard model. It's writing questions and evaluating answers. But scoring a quiz against an answer key? A fast model handles that fine.
- **Job Hunting**: Cover letter drafting is standard-tier work. Checking whether you already applied to this company? That's a lookup. Fast tier, or better yet, a hook (which is free; more on that shortly).
- **Content System**: Research and drafting need standard models. But the review stage (checking word count, banned phrases, source citations) could run on the cheapest model available.
- **Project Management**: Status report generation is standard. Date math and dependency checks are fast-tier tasks.

The rule of thumb: if the task is following rules (formatting, checking, classifying), use the cheapest model. If the task requires judgment (writing, strategy, synthesis), use the model that's good at judgment.

![Model ladder: fast, standard, and reasoning tiers with example tasks and relative cost ratios](../diagrams/png/ch11-model-ladder.png)

*The model ladder — three tiers with example tasks at each level and the cost spread between them.*

Here's what model routing looks like in practice. Say your Content System runs a five-stage pipeline: research, outline, draft, review, publish. Without routing, every stage uses the same standard-tier model. With routing:

- Research stage: standard model (needs to synthesize search results), $0.15
- Outline stage: standard model (needs judgment about structure), $0.08
- Draft stage: standard model (writing quality matters), $0.25
- Review stage: fast model (checking rules, not generating), $0.01
- Publish stage: fast model (formatting and file operations), $0.005

The review and publish stages dropped to almost nothing. Same pipeline, same output quality, roughly 20% cheaper. And that's conservative. If your review stage was previously doing heavy model-based evaluation, the savings could be 40% or more.

Prices are falling fast. Models that cost $15 per million tokens in 2024 cost $2-3 today. The same quality, dramatically cheaper. Any specific price in this chapter will likely be lower by the time you use it. But the pattern holds: tiered models exist, cheaper models handle simple tasks just as well, and picking the right tier per task is where the real savings live.

---

## Five Ways to Spend Less

These are practical. You can apply each one to your systems today.

### 1. Keep state files lean.

Your state file loads every session through the `@` import. Every row costs tokens. The 50-row guideline from Chapter 5 isn't just about keeping Claude focused. It's about cost.

A 20-row state file might be 300 tokens. A 200-row state file is 2,000-3,000 tokens. That difference repeats every single session. If you run 100 sessions a month, that's 200,000 extra tokens you're paying for. Tokens that load context Claude mostly ignores anyway, because the relevant rows are buried under archived noise.

Archive aggressively. Applications marked "Rejected" from three months ago don't need to be in your active state. Move them to an `## Archive` section. Keep the working table tight.

### 2. Use hooks instead of model judgment for rule-based checks.

A hook script runs on your computer. It costs nothing. Zero tokens. Zero dollars.

Asking the model "Does this cover letter mention the company name?" costs tokens. Writing a hook that greps for the company name costs nothing, runs in milliseconds, and never gets it wrong.

Chapter 7's verify-cover-letter hook catches fabrication for $0.00. Asking the model to self-check that same output would cost $0.02-0.05 every time. Over 100 cover letters, that's $2-5 saved on a single check. Stack several hook-based checks and the savings compound.

The principle: if the check can be written as a grep, a word count, or a pattern match, make it a hook. Save the model for things that require understanding, not things that require counting.

### 3. Load skills selectively.

If your editorial-voice skill is 400 lines, that's roughly 400 tokens every time it loads. If your career-profile skill is 300 lines, that's another 300 tokens.

Don't load the editorial-voice skill when you're running a study quiz. Don't load the career-profile skill when you're generating a project status report.

Your CLAUDE.md controls this. Instead of importing every skill file at the top, add conditional notes: "Load editorial-voice only when drafting content." Claude reads those instructions and pulls in what it needs. Skills that sit in a folder but aren't imported don't cost anything. They're just files on disk until something triggers them.

### 4. Cache connection results.

Web search results don't change every hour. If you searched for a company's recent news yesterday for a cover letter, that information is still accurate today.

Save connection results to a file. Load the file instead of re-searching.

A web search might cost $0.05-0.15 in tokens (the search itself, processing the results, incorporating them into context). Reading that same information from a cached file costs a fraction of a cent. If your Content System researches the same topic across multiple drafts, search once and cache the results.

This is especially true for connections that pull large amounts of text. An API call that returns 2,000 tokens of data costs 2,000 input tokens every time you repeat it. Cache the response and you load it for pennies.

In practice, this looks simple. After your Job Hunting System searches for company news, tell Claude: "Save those search results to `research/acme-corp-2026-06.md`." Next session, instead of searching again, your system reads the cached file. A $0.10 web search becomes a $0.001 file read. If your system searches for the same company info three times across different cover letters, you just saved $0.30. Small numbers, but they're the kind of small numbers that add up across months of daily use.

### 5. Break pipelines into separate sessions.

Running your Content pipeline interactively (approving each stage, waiting, approving the next) keeps the context window open the whole time. That means Stage 1's research text is still loaded during Stage 5's final review. You're paying for context you no longer need.

The alternative: run stages as separate sessions. Your state file tracks which stage you're on. Each stage loads a clean context with only what it needs. Stage 3 (drafting) doesn't carry the full text of Stage 1's research. It carries the summary that Stage 2 produced.

This is how the production system in Chapter 10 works. Each stage starts fresh, reads the state file to know where things stand, does its job, updates state, and exits. The next stage picks up where the last one left off. No bloated context windows. No paying for text that's already been processed.

---

## Monitoring What You Spend

You can't reduce what you can't see.

### The quick check

Claude Code shows token usage during your session. Look for the token counter. It tells you how many tokens went in and came out. After a few sessions, you'll develop intuition: "This study quiz session used about 3,000 tokens total. That feels right." When a session suddenly uses 15,000 tokens, you'll know something loaded that shouldn't have, or the model generated way more output than expected.

Your monthly billing dashboard (on your Anthropic or OpenAI account) shows the total. If you're on a Pro subscription at $20/month, you won't see per-session costs. You'll just know when you're hitting usage limits more often. If you're on API pricing, you'll see exact costs per day.

### The state file approach

Low-tech but effective. Add a `## Cost Log` section to one of your state files, or create a dedicated `cost-log.md`:

```markdown
## Cost Log

| Date | System | Action | Tokens Used | Notes |
|------|--------|--------|-------------|-------|
| 2026-06-01 | Content | Full pipeline | ~12,000 | Web search + 5 stages |
| 2026-06-01 | Study | Quiz session | ~3,000 | Just quiz + score |
| 2026-06-02 | Job Hunting | 3 applications | ~8,500 | Cover letters + state update |
```

After ten sessions, patterns emerge. You'll see that your Content pipeline costs 4x what everything else costs. You'll see that Tuesday sessions are heavier because that's when you do research-heavy work. You'll have the data to make decisions instead of guessing.

### Production-grade monitoring

For reference (and this connects back to Chapter 10's production system), tools like Langfuse trace every API call with cost, latency, and token count. Per-tool breakdowns. Monthly budgets with alerts. That's enterprise-grade visibility.

You don't need Langfuse for your Study System. But if you're running 50 pipeline executions a month on your Content System and the bill creeps up, knowing which stage is eating your budget matters. The state file cost log gets you 80% of the way there. The rest is for when your systems grow past personal use into something that runs daily without you watching.

The key insight across all three approaches: tracking isn't about guilt. It's about spotting the outlier. When one session costs 5x what similar sessions cost, something changed. A state file got bloated, a skill loaded that shouldn't have, a connection returned an unusually large result. The cost spike points you straight to the problem.

---

## When Free Is Good Enough

Some parts of your system cost nothing. Use that.

**Your validation layer is always free.** Every shell script in your hooks folder runs on your machine. No tokens, no API calls, no cost. Every check you move from "ask the model" to "run a script" saves money. The verify-cover-letter hook from Chapter 7. The word-count check on content drafts. The duplicate-application detector. All free.

If you could replace every rule-based model call with a hook, you'd cut costs by 10-20% on most systems. Some checks need understanding (did this cover letter strike the right tone?). Those stay with the model. But anything that's counting, matching, or looking up a value belongs in a hook.

**Local models exist.** Tools like Ollama run AI models directly on your laptop. No API, no cost per token. They're slower and less capable than cloud models, but for specific tasks they work fine:

- Formatting checks
- Simple classification ("Is this a technical role or a management role?")
- Template-based text generation
- Processing data you don't want leaving your machine

This isn't a local model setup guide. That's a different book. But know that the option exists. Your Content System's review stage could run entirely on a local model. It's checking word count, banned phrases, and structure, not generating creative prose. A local model handles that.

**The hybrid approach**: Draft with a cloud model (quality matters for writing). Review with hooks and local models (checking rules, not generating). Your best work comes from the expensive model. Your verification comes from the cheap or free options.

### Subscriptions vs. pay-per-use

If you're using Claude Code regularly, a Pro subscription at $20/month is almost always better than API pricing for personal use. You get access to all models, and the flat rate removes the mental overhead of worrying about each session's cost.

If you're running automated pipelines (systems that execute without you watching), API pricing is the only option. Subscriptions are for interactive use.

For heavy daily users, Max plans at $100-200/month provide 5-20x the usage of Pro. A heavy Opus user on Max would spend $300-500/month at equivalent API rates. The subscription saves 40-60%.

The honest math: if your personal AI systems cost $5-20/month total, you're spending wisely. If you're north of $50/month on personal systems, something is loading too much context or you're routing simple tasks to expensive models. This chapter's five strategies will bring that number down.

---

## The Cost Mindset

Cost isn't a reason not to build. It's a design constraint, like word count on a cover letter or due dates on a project.

The production system from Chapter 10 processes thousands of data points and costs $50-100/month. That system informs purchasing decisions worth many times that amount. Your personal systems cost $5-20/month and save you hours every week. The return is obvious once you look at it honestly.

The question isn't "how do I make it free?" It's "am I spending in the right places?"

Expensive model on a strategic decision: good spend. Expensive model on checking word count: waste. That's the entire framework. Every technique in this chapter (lean state files, hooks over model judgment, selective skill loading, cached connections, staged pipelines) serves that one idea. Put the expensive thinking where it matters. Automate everything else with cheap or free tools.

Prices will keep falling. Models that cost $5 per million tokens today will cost $1 or less within a couple of years. The patterns in this chapter (tiered models, caching, hooks, lean context) will still apply. Because no matter how cheap the models get, spending smart will always beat spending blindly.

One more thing. The people who worry most about AI costs are usually the ones spending the least. If you've read this far and built the systems in this book, you're spending $5-20/month on tools that save you hours. That's a good deal. The people who should worry are the ones running expensive models on tasks a hook could handle, or loading 500-row state files every session, or searching the web for information they cached last week. Those aren't spending problems. Those are design problems. And now you know how to fix them.

Your systems work. You understand what they cost. Next question: what do you do when they break?

---

## How to Know It's Clicking

Five checks:

**You can estimate a session's cost before running it.** Before starting your Content pipeline, you can say: "This will cost roughly $0.50-1.00 because it loads two skills, runs web search, and processes five stages." You're not guessing. You're reading the system.

**Your state files are lean.** Open each state file. Count the active rows. If they're under 50, you're in the zone. If any are over 100, you know to archive.

**You've moved at least one check from model to hook.** Something the AI used to judge (word count, banned words, company name placeholder) is now a shell script that costs nothing. You can name which check and why.

**You know your model tier per system.** You can say: "Study quizzes use the standard model, content drafting uses standard, but the review stage could use fast." You're not defaulting to the most expensive option for everything.

**You've logged costs for a week.** Your state file (or a separate cost log) has at least 5 entries showing what you spent and on what. You can spot the outlier (the session that cost 3x more than usual) and explain why.
