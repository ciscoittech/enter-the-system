# Ch 11 Research: AI Model Pricing & Cost Management

*Compiled: May 6, 2026*

---

## Current Pricing (May 2026)

### Anthropic Claude

| Model | Input / 1M tokens | Output / 1M tokens | Context |
|-------|-------------------|---------------------|---------|
| Claude Haiku 4.5 | $1.00 | $5.00 | 200K |
| Claude Sonnet 4.6 | $3.00 | $15.00 | 200K |
| Claude Opus 4.6 | $5.00 | $25.00 | 200K |
| Claude Opus 4.7 | $5.00 | $25.00 | 200K |

Opus 4.7 launched April 16, 2026 at identical pricing to Opus 4.6. Anthropic has held flagship pricing steady at $5/$25 across two Opus generations.

### OpenAI

| Model | Input / 1M tokens | Output / 1M tokens | Context | Notes |
|-------|-------------------|---------------------|---------|-------|
| GPT-4o | $2.50 | $10.00 | 128K | Workhorse model |
| GPT-4o-mini | $0.15 | $0.60 | 128K | Budget option |
| GPT-4.1 | $2.00 | $8.00 | 1M | Long-context flagship |
| GPT-4.1 Mini | $0.40 | $1.60 | 1M | Long-context budget |
| GPT-4.1 Nano | $0.10 | $0.40 | 1M | Cheapest OpenAI |
| GPT-5.4 | $2.50 | $15.00 | 272K | Latest generation |
| GPT-5.4 Nano | $0.20 | $1.25 | — | Budget GPT-5 era |
| GPT-5.5 | $5.00 | $30.00 | — | Premium tier |
| GPT-5.5 Pro | $30.00 | $180.00 | — | Ultra-premium |
| o3 | $2.00 | $8.00 | — | Reasoning model |
| o4-mini | $1.10 | $4.40 | — | Budget reasoning |

### Google Gemini

| Model | Input / 1M tokens | Output / 1M tokens | Context | Notes |
|-------|-------------------|---------------------|---------|-------|
| Gemini 2.5 Flash | $0.30 | $2.50 | 1M | Best budget option with huge context |
| Gemini 2.5 Pro | $1.25 | $10.00 | 1M | 2x cost over 200K tokens |
| Gemini 3 Flash Preview | $0.50 | $3.00 | — | Next-gen budget |
| Gemini 3 Pro Preview | $2.00 | $12.00 | — | Next-gen flagship |

Google offers a free tier for Gemini API with rate limits. Batch API provides 50% discount. Cache reads cost 10% of base input price.

### DeepSeek

| Model | Input / 1M tokens | Output / 1M tokens | Cache Hit / 1M | Notes |
|-------|-------------------|---------------------|----------------|-------|
| DeepSeek V4 Flash | $0.14 | $0.28 | $0.014 | Cheapest major model |
| DeepSeek V4 Pro | $0.435 | $0.87 | $0.004 | 75% promo discount through May 31, 2026 |
| DeepSeek V3.2 (legacy) | $0.28 | $0.42 | $0.028 | Deprecating July 2026 |

DeepSeek is by far the cheapest option. V4 Flash at $0.14/1M input is 36x cheaper than Claude Opus ($5.00/1M).

### xAI Grok

| Model | Input / 1M tokens | Output / 1M tokens | Context | Notes |
|-------|-------------------|---------------------|---------|-------|
| Grok 4.1 Fast | $0.20 | $0.50 | 2M | Largest context window in industry |
| Grok 4 | $3.00 | $15.00 | 256K | Premium reasoning |

Tool invocations (web search, code execution) cost $2.50-$5.00 per 1,000 calls on top of token costs. New users get $25 free credits.

### Mistral

| Model | Input / 1M tokens | Output / 1M tokens | Notes |
|-------|-------------------|---------------------|-------|
| Ministral 3B | $0.04 | $0.04 | Cheapest in class |
| Ministral 8B | $0.10 | $0.10 | Budget |
| Mistral Small 3 | $0.10 | $0.30 | Mid-tier |
| Mistral Medium 3 | $0.40 | $2.00 | Mid-tier |
| Codestral | $0.30 | $0.90 | Code-specialized |
| Mistral Large 2 | $2.00 | $6.00 | Flagship |

### Quick Comparison: Flagship Models (Input / Output per 1M tokens)

| Provider | Flagship Model | Input | Output | Ratio to Cheapest |
|----------|---------------|-------|--------|-------------------|
| DeepSeek | V4 Flash | $0.14 | $0.28 | 1x (baseline) |
| Mistral | Ministral 3B | $0.04 | $0.04 | Even cheaper on input |
| Google | Gemini 2.5 Flash | $0.30 | $2.50 | 2x / 9x |
| OpenAI | GPT-4o-mini | $0.15 | $0.60 | 1x / 2x |
| Anthropic | Haiku 4.5 | $1.00 | $5.00 | 7x / 18x |
| OpenAI | GPT-5.4 | $2.50 | $15.00 | 18x / 54x |
| Anthropic | Opus 4.7 | $5.00 | $25.00 | 36x / 89x |
| OpenAI | GPT-5.5 Pro | $30.00 | $180.00 | 214x / 643x |

**Key takeaway for the book:** The cheapest and most expensive models differ by over 200x on input and 600x on output. For simple tasks, the cheap model gives the same answer. This is why model routing matters.

---

## Price Trends

### Direction: Sharply Down

AI model API prices have dropped **40-70% since 2024**, with some models showing **93% reductions** (GPT-4o equivalent pricing went from ~$30/1M to ~$2.50/1M in two years).

### Key Data Points

- **2022-2024:** Processing 1M tokens dropped from ~$12 to under $2 for comparable performance
- **2024-2025:** The "LLM price war" — OpenAI, Google, Anthropic, xAI, and Chinese providers (Alibaba, DeepSeek) aggressively undercutting each other
- **Alibaba:** Cut prices by up to 97%
- **DeepSeek:** Pushed the market into a "race to the bottom"
- **Epoch AI research:** LLM inference prices falling 9x annually for basic models, up to 900x for top-tier models (fastest declines after January 2024)
- **Anthropic held steady:** Opus pricing stayed at $5/$25 across two generations (4.6 and 4.7), but Anthropic improved performance at the same price rather than cutting cost
- **OpenAI cut aggressively:** GPT-4o at $2.50/1M vs GPT-4 at $30/1M two years earlier

### Trajectory

Prices are still falling. The pattern is:
1. New flagship launches at premium price
2. Previous generation gets cheaper or deprecated
3. "Mini/Flash/Nano" variants launch at 5-20x less than flagship
4. Competition forces further cuts

**For the book:** Tell readers that any specific price you quote will likely be lower by the time they read it. Teach the PATTERN (tiered models, cheaper small models, caching discounts) rather than memorizing exact numbers.

---

## Subscription vs API

### Anthropic Claude Subscriptions

| Plan | Cost | What You Get |
|------|------|-------------|
| Free | $0 | Limited messages, access to Sonnet |
| Pro | $20/mo ($17/mo annual) | ~45 messages/5 hours, all models, Claude Code access, priority access |
| Max 5x | $100/mo | 5x Pro usage, Claude Code, Cowork |
| Max 20x | $200/mo | 20x Pro usage, Claude Code, Cowork |

**Pro gotcha:** Claude Code is very token-intensive. Pro users hit limits much faster using Code than web chat. A single Code session reading a medium codebase can consume 10,000-100,000+ tokens.

**Max value calculation:** A heavy Opus user on Max 20x ($200/mo) would spend $300-$500/mo at equivalent API rates. The subscription saves 40-60% for heavy users.

### OpenAI ChatGPT Subscriptions

| Plan | Cost | What You Get |
|------|------|-------------|
| Free | $0 | Ads, limited |
| Go | $8/mo | Ads (US), basic access |
| Plus | $20/mo | Standard tier, most popular |
| Pro $100 | $100/mo | 5x Plus limits, GPT-5.5 Pro access |
| Pro $200 | $200/mo | 20x Plus, 250 Deep Research runs/mo, 1M context |
| Business | $25/user/mo (annual) | Team features |

### When Subscriptions Beat API

- **Light-to-moderate chat users:** Pro/Plus at $20/mo is almost always cheaper than API for conversational use
- **Heavy daily users:** Max 20x / Pro $200 saves 40-60% vs equivalent API spend
- **Code-heavy users:** Max plans are significantly better value than API for Claude Code

### When API Beats Subscriptions

- **Automated pipelines:** Only API works for programmatic access
- **Variable usage:** Pay only for what you use, no monthly commitment
- **Model routing:** API lets you choose cheap models for simple tasks
- **Batch processing:** 50% discount for non-real-time workloads

---

## Cost Optimization Techniques

### 1. Model Routing (Biggest Impact: 40-80% savings)

Use cheap models for simple tasks, expensive models only when needed.

- **70% of typical API traffic** is simple tasks that don't need a frontier model
- **62.5x cost difference** between cheapest and most expensive models for the same answer on simple tasks
- **Pattern:** Try smallest viable model first, escalate on low confidence or failure
- **Real example:** Three-tier routing keeps costs under $25/mo per developer vs $83-137/mo with a single flagship model

**For the book:** This is the single most important cost optimization. A system that routes "summarize this email" to Haiku ($1/1M) instead of Opus ($5/1M) saves 80% on that task with identical results.

### 2. Prompt Caching (Up to 90% savings on input)

Anthropic's prompt caching:
- **Cache write:** 1.25x base price (5-min cache) or 2x base price (1-hour cache)
- **Cache read:** 0.1x base price (90% discount)
- **Break-even:** One cache read for 5-min cache, two reads for 1-hour cache
- **Real example:** One developer went from $720/mo to $72/mo with prompt caching

OpenAI also offers prompt caching with similar discounts. Google Gemini cache reads cost 10% of base input price.

**For the book:** Any system prompt or reusable context that stays the same across requests should be cached. This is free money.

### 3. Batch API (50% savings)

Both Anthropic and OpenAI offer batch processing at 50% off:
- Trade real-time responses for a 24-hour completion window
- Works for classification, content generation, data processing, evaluation pipelines
- **Stacks with caching:** Batch + cache = up to 95% savings (Anthropic), 75% savings (OpenAI)

**For the book:** If your system doesn't need instant responses (content generation, nightly reports, data processing), batch API is the easiest 50% savings available.

### 4. Context Window Management

- Long context costs more: Gemini 2.5 Pro charges 2x for inputs over 200K tokens
- GPT-5.4 doubles input price beyond 272K tokens
- **Technique:** Summarize or chunk long documents instead of stuffing full text into context
- **Technique:** Use retrieval (RAG) to pull only relevant sections instead of entire documents

### 5. Combined Strategy

Strategic combination of routing + caching + batching realistically reduces costs by 70%+:
- Stanford's FrugalGPT research: up to 98% cost reduction
- Typical enterprise savings with model routing + caching: 40-60%

---

## Real-World Cost Examples

### Individual Developers

| Usage Level | Monthly Spend | How |
|------------|---------------|-----|
| Light chat user | $0-$20 | Free tier or Pro subscription |
| Moderate developer | $30-$100 | Pro or Max 5x subscription |
| Heavy Claude Code user | $150-$250 | Max 20x or API |
| Power user (Opus-heavy, daily) | $300-$500 | API equivalent of Max 20x usage |

### Claude Code Specifically

- **Average:** ~$13 per developer per active day
- **Monthly average:** $150-$250 per developer
- **90th percentile:** Below $30 per active day
- **Single session:** 10,000 to 100,000+ tokens depending on codebase size and iterations

### Enterprise / Business

| Use Case | Monthly API Cost |
|----------|-----------------|
| High-volume chatbot | $3,000-$20,000/mo |
| AI agent operations (full stack) | $3,200-$13,000/mo |
| Same workload on DeepSeek vs Claude Sonnet | $8/mo vs $150/mo |
| Three-tier routing vs single flagship | $25/dev/mo vs $83-137/dev/mo |

### Cost Comparison: Same Task, Different Models

Processing 1 million tokens of input with 100K tokens of output:

| Model | Input Cost | Output Cost | Total |
|-------|-----------|-------------|-------|
| DeepSeek V4 Flash | $0.14 | $0.028 | **$0.17** |
| Gemini 2.5 Flash | $0.30 | $0.25 | **$0.55** |
| GPT-4o-mini | $0.15 | $0.06 | **$0.21** |
| Claude Haiku 4.5 | $1.00 | $0.50 | **$1.50** |
| Claude Sonnet 4.6 | $3.00 | $1.50 | **$4.50** |
| GPT-5.4 | $2.50 | $1.50 | **$4.00** |
| Claude Opus 4.7 | $5.00 | $2.50 | **$7.50** |
| GPT-5.5 | $5.00 | $3.00 | **$8.00** |

**44x difference** between cheapest (DeepSeek V4 Flash) and most expensive standard model (GPT-5.5) for the same token volume.

---

## Implications for the Chapter

### Numbers to Use

1. **Lead with the range:** "The cheapest AI model costs $0.04 per million tokens. The most expensive costs $180. That's a 4,500x difference. Choosing the right model for each task is the single biggest cost decision you'll make."

2. **Use the $0.14 vs $5.00 comparison** (DeepSeek V4 Flash vs Claude Opus) as the concrete example of why routing matters.

3. **The $720 to $72 prompt caching story** is a perfect real-world example for the caching section.

4. **Claude Code at ~$13/day** is relatable for readers who use AI coding tools.

5. **Subscriptions vs API breakeven:** Pro at $20/mo is almost always better for chat users. API is better for automated systems and variable usage.

### Key Teaching Points

- **Prices are falling fast** — any number in the book will be outdated. Teach the PATTERN: tiered models exist, small models are 10-50x cheaper, and that gap is the optimization opportunity.
- **Model routing is the #1 lever** — not caching, not batching. Choosing the right model per task.
- **Caching is free money** — if your system prompt stays the same, cache it. 90% savings.
- **Batch for non-urgent work** — 50% off for accepting a delay.
- **Stack the discounts** — routing + caching + batching = 70-95% savings.
- **Subscriptions simplify** — for individuals, $20-$200/mo subscriptions remove the cognitive overhead of tracking API costs. For systems/pipelines, API is the only option.

### Caveat for the Book

All prices quoted as of May 2026. Prices have historically dropped 40-70% per year. By the time readers use this book, prices will likely be lower. The optimization PATTERNS (routing, caching, batching) remain valid regardless of the specific numbers.

---

## Sources

- [Anthropic Claude API Pricing (Official)](https://platform.claude.com/docs/en/about-claude/pricing)
- [Anthropic Prompt Caching Docs](https://platform.claude.com/docs/en/build-with-claude/prompt-caching)
- [Claude Plans & Pricing](https://claude.com/pricing)
- [Claude Code Cost Management](https://code.claude.com/docs/en/costs)
- [Claude Pro Plan Details](https://support.claude.com/en/articles/8325606-what-is-the-pro-plan)
- [Claude Max Plan Details](https://support.claude.com/en/articles/11049741-what-is-the-max-plan)
- [OpenAI API Pricing (Official)](https://openai.com/api/pricing/)
- [OpenAI Batch API Docs](https://developers.openai.com/api/docs/guides/batch)
- [ChatGPT Plans & Pricing](https://chatgpt.com/pricing/)
- [Google Gemini API Pricing](https://ai.google.dev/gemini-api/docs/pricing)
- [DeepSeek API Pricing (Official)](https://api-docs.deepseek.com/quick_start/pricing)
- [xAI Grok API](https://x.ai/api)
- [Mistral AI Pricing](https://mistral.ai/pricing)
- [Epoch AI: LLM Inference Price Trends](https://epoch.ai/data-insights/llm-inference-price-trends)
- [AI Pricing 2026: Costs Drop 40-70%](https://aiempiremedia.com/ai-pricing-2026-breakdown/)
- [LLM Trends 2026 - Pricing Over Time](https://pricepertoken.com/trends)
- [Finout: Anthropic API Pricing 2026](https://www.finout.io/blog/anthropic-api-pricing)
- [Finout: Claude Opus 4.7 Pricing Story](https://www.finout.io/blog/claude-opus-4.7-pricing-the-real-cost-story-behind-the-unchanged-price-tag)
- [Finout: OpenAI Pricing 2026](https://www.finout.io/blog/openai-pricing-in-2026)
- [Finout: Claude Code Pricing 2026](https://www.finout.io/blog/claude-code-pricing-2026)
- [Claude Code Pricing Guide (Verdent)](https://www.verdent.ai/guides/claude-code-pricing-2026)
- [Claude Code Pricing (SSD Nodes)](https://www.ssdnodes.com/blog/claude-code-pricing-in-2026-every-plan-explained-pro-max-api-teams/)
- [OpenAI Batch API Pricing (TokenMix)](https://tokenmix.ai/blog/openai-batch-api-pricing)
- [Paxrel: AI Agent Cost Optimization](https://paxrel.com/blog-ai-agent-cost-optimization)
- [MindStudio: AI Model Router](https://www.mindstudio.ai/blog/what-is-ai-model-router-optimize-cost-llm-providers)
- [Prompt Caching $720 to $72 Story](https://medium.com/@labeveryday/prompt-caching-is-a-must-how-i-went-from-spending-720-to-72-monthly-on-api-costs-3086f3635d63)
- [AI Coding Assistant Costs 2026](https://aicostcheck.com/blog/ai-coding-assistant-costs-2026)
- [DeepSeek V4 Pro 75% Price Cut](https://thenextweb.com/news/deepseek-v4-pro-price-cut-75-percent)
- [BenchLM: Claude API Pricing](https://benchlm.ai/blog/posts/claude-api-pricing)
- [PE Collective: OpenAI API Pricing](https://pecollective.com/tools/openai-api-pricing/)
- [PE Collective: LLM Pricing Comparison](https://pecollective.com/blog/llm-pricing-comparison-2026/)
