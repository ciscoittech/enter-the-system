# Chapter 11: The Cost of Intelligence — Managing What You Spend

**Title**: The Cost of Intelligence — Managing What You Spend
**Word target**: 3,000–3,500 words
**No new component** — this is a practical operations chapter
**Purpose**: AI systems cost real money. This chapter teaches the reader to understand, monitor, and reduce what they spend without gutting their systems.

---

## Why This Chapter Exists

Nobody tells you this upfront: every time Claude reads your state file, loads your skills, runs your hooks, and processes your prompt — that's tokens. Tokens cost money. A simple study quiz might cost $0.02. Running a 5-stage content pipeline with web search and skill loading might cost $0.50-2.00. Do that daily and you're spending $15-60/month.

That's not a lot — unless you don't know it's happening. And it gets expensive fast when systems scale.

The production system in Ch 10 manages costs by using cheap models for simple lookups and expensive models only for strategic thinking. That's not an accident. That's a design decision the reader needs to learn.

---

## Section-by-Section Breakdown

### Section 1: Where the Money Goes (~400 words)

**Narrative beat**: "You've been spending money every time you use your systems. Here's where."

**Content**:

**The token model explained simply:**
- Everything Claude reads = input tokens (your CLAUDE.md, state files, skills, the conversation)
- Everything Claude writes = output tokens (the response, state updates, file edits)
- Input tokens are cheaper than output tokens (roughly 3-5× cheaper)
- A "token" is roughly a word. Your 50-row state file ≈ 500 tokens. Your skill file ≈ 1,000 tokens. Your prompt ≈ 200 tokens. Claude's response ≈ 500-2,000 tokens.

**What costs what (real ballpark numbers):**

| Action | Approximate Cost |
|--------|-----------------|
| Simple quiz (Study System) | $0.01-0.03 |
| Cover letter + resume (Job Hunting) | $0.03-0.08 |
| Status report generation (PM) | $0.02-0.05 |
| Full content pipeline run (Content) | $0.50-2.00 |
| Web search + processing | $0.05-0.15 per search |
| Subagent execution | Each subagent = separate context window |

**The context window tax:**
- Your state file loads EVERY session (via @import). That's tokens spent before you type a word.
- Skills load when triggered. Each skill adds to the context.
- Connections (web search results) can return large amounts of text.
- "Your system's 'idle cost' is everything that loads before you ask a question."

### Section 2: The Model Ladder (~600 words)

**Narrative beat**: "Not every question needs the smartest (most expensive) model."

**Content**:

**Three tiers of AI models (as of 2026):**

| Tier | Examples | Cost | Good For |
|------|----------|------|----------|
| Fast/Cheap | Haiku, GPT-4o-mini, DeepSeek | $0.25-1/M tokens | Lookups, formatting, simple classification |
| Standard | Sonnet, GPT-4o | $3-15/M tokens | Most tasks, writing, analysis |
| Reasoning | Opus, o1/o3, Grok-4 | $15-75/M tokens | Complex strategy, multi-step reasoning |

**The production system's approach** (from Ch 10):
- Factual questions ("What's our inventory?") → Fast model
- Analytical questions ("What should we buy?") → Standard model
- Strategic questions ("What if a competitor enters?") → Reasoning model
- "The system decides which brain to use before it starts thinking. That's not a feature — it's a cost control."

**How the reader applies this:**
- Study System: quiz generation → Standard. Score checking → Fast.
- Job Hunting: cover letter drafting → Standard. Duplicate check → Fast (or a hook, which is free).
- Content System: research stage → Standard + web search. Draft stage → Standard. Review stage → could be Fast (just checking rules).
- Project Management: status generation → Standard. Date calculations → Fast.

**The rule of thumb**: "If the task is following rules (formatting, checking, classifying), use the cheapest model. If the task requires judgment (writing, strategy, synthesis), use the model that's good at judgment."

### Section 3: Five Ways to Spend Less (~800 words)

**Narrative beat**: Practical, actionable cost reduction without sacrificing quality.

**Content**:

**1. Keep state files lean.**
- Every row in your state file costs tokens every session (it loads via @import).
- The 50-row guideline from Ch 5 isn't just about quality — it's about cost.
- Archive aggressively. A 200-row state file costs 4× what a 50-row file costs, every single session.

**2. Use hooks instead of model judgment for rule-based checks.**
- A hook script (bash + jq) is free. It runs on your computer, not the AI.
- A model-based check ("does this cover letter mention the company name?") costs tokens.
- "If the check can be written as a grep or a word count, make it a hook. Save the model for things that require understanding."
- Reference Ch 7: the verify-cover-letter hook catches fabrication for $0.00. Asking the model to self-check costs $0.02-0.05 per check.

**3. Load skills selectively, not always.**
- If your editorial-voice skill is 400 lines, it costs ~400 tokens every time it loads.
- Only load skills when the task needs them. Don't load the career-profile skill when you're doing a study quiz.
- CLAUDE.md controls this: "Load editorial-voice only when drafting content."

**4. Cache connection results.**
- Web search results don't change every hour. If you searched for company info yesterday, you probably don't need to search again today.
- Save connection results to a file. Load the file instead of re-searching.
- "A $0.10 web search cached to a file costs $0.001 to re-read."

**5. Batch vs. interactive.**
- Running your content pipeline interactively (approving each stage) keeps the context window open the whole time.
- Running stages as separate sessions (state file tracks progress, pick up where you left off) resets the context between stages.
- "Each stage starts with a clean context that only loads what it needs. Stage 1's research doesn't bloat Stage 3's drafting context."

### Section 4: Monitoring What You Spend (~500 words)

**Narrative beat**: "You can't reduce what you can't see."

**Content**:

**Built-in tracking:**
- Claude Code shows token usage in the session (look for the token counter)
- `/cost` or similar command to check session cost
- Monthly billing on your Anthropic/OpenAI dashboard

**The state file approach (low-tech but effective):**
- Add a `## Cost Log` section to your state files
- After each session, note the approximate cost
- After 10 sessions, you'll see the pattern: which systems cost the most, which sessions are outliers

```markdown
## Cost Log

| Date | System | Action | Approx Cost | Notes |
|------|--------|--------|-------------|-------|
| 2025-06-01 | Content | Full pipeline | $1.20 | Web search + 5 stages |
| 2025-06-01 | Study | Quiz session | $0.03 | Just quiz + score |
| 2025-06-02 | Job Hunting | 3 applications | $0.18 | Cover letters + state |
```

**Production-grade monitoring** (reference Ch 10):
- Langfuse traces every API call with cost, latency, token count
- Per-tool cost breakdown: "market_snapshot costs $0.08 per call, buy_optimizer costs $0.15"
- Monthly budgets with alerts
- "You don't need Langfuse for your Study System. But if you're running 50 pipeline executions a month, you want to know which stage is eating your budget."

### Section 5: When Free Is Good Enough (~400 words)

**Narrative beat**: Not everything needs a paid model.

**Content**:

**Hooks are always free.** Shell scripts run locally. Every check you move from "ask the model" to "run a script" saves tokens.

**Local models exist.** Ollama runs models on your laptop for $0.00/token. They're slower and less capable, but for:
- Formatting checks
- Simple classification
- Template-based generation
- Privacy-sensitive data processing (nothing leaves your machine)

**The hybrid approach:**
- Draft with a standard cloud model (quality matters)
- Review with a local model or hooks (checking rules, not generating)
- "Your content pipeline's Review stage could run entirely locally. It's checking word count, banned words, and source citations — a local model handles that fine."

**Free tiers and pricing to know about:**
- Claude Pro: $20/month with generous limits
- Claude Max: for heavy usage
- API pricing: pay per token (cheaper per unit, no monthly cap)
- "If you're spending more than $20/month on your personal systems, you're probably loading too much context or running expensive models on simple tasks."

### Section 6: The Cost Mindset (~200 words)

**Narrative beat**: Wrap up with the right mental model.

**Content**:
- "Cost isn't a reason not to build. It's a design constraint — like word count or file size."
- The system from Ch 10 processes 10,000+ data points and costs ~$50-100/month. That system generates purchasing decisions worth thousands.
- Your systems cost $5-20/month and save you hours.
- "The question isn't 'how do I make it free?' It's 'am I spending in the right places?'"
- Expensive model on strategic decisions = good spend
- Expensive model on checking word count = waste
- Bridge to Ch 12 (debugging): "Now that your systems work and you understand what they cost, the next question is: what do you do when they break?"

---

## Quality Gate

Five checks:

1. **Costs are concrete.** Every cost claim has a specific dollar range, not "it depends."
2. **Five reduction strategies are actionable.** The reader can apply each one to their systems today.
3. **Not preachy.** The chapter doesn't guilt-trip about spending. It teaches smart spending.
4. **Maps to the reader's 4 systems.** Every cost example references Study, Job Hunting, PM, or Content.
5. **The model ladder is clear.** Reader can articulate when to use cheap vs. expensive models.

---

## Technical Notes for the Writer

- **Token costs change.** Use "as of mid-2026" for any specific pricing. Frame the PATTERNS (cheap for rules, expensive for judgment) as durable even when prices change.
- **Don't teach API pricing in detail.** The reader is using Claude Code (subscription), not the API directly. Mention API as an option for heavy users but don't derail into API setup.
- **The context window tax is the key insight.** Most readers won't realize their state files and skills cost tokens every session. This is the "aha moment" of the chapter.
- **Hooks as free alternatives is the most actionable advice.** Every rule-based check moved from model to hook = $0.00. Hammer this.
- **Local models: mention, don't teach.** Ollama exists. It's free. It works for simple tasks. Don't turn this into a local model setup guide.
- **Voice**: Matter-of-fact about money. Not anxious ("AI is so expensive!") or dismissive ("it's pennies"). Practical: "Here's what it costs. Here's how to spend smart."
