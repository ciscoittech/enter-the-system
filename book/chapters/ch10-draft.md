# Chapter 10: What a Real System Looks Like

You just built four systems. Each one has all six components — prompts, state, skills, hooks, connections, pipelines. They work. You can verify they work because you broke them on purpose and watched the guardrails catch the failure.

But they're personal-scale. A study system tracking 30 topics. A job search managing 50 applications. A content pipeline producing one piece at a time.

What happens when someone takes these same patterns and points them at a real business?

This chapter answers that question. Not to intimidate you — the components are identical to what you built. But the scale, the data, and the decisions riding on the output are different. This is the ceiling. And every piece of it maps back to something you already know how to build.

---

## The Business

A specialty food importer runs a small operation in an emerging market where supply chains aren't transparent. They buy high-end ingredients — saffron, vanilla beans, high-grade spices, specialty oils — from trade markets and regional distributors. They package, grade, and resell to restaurants, caterers, and independent retailers.

The problem: this market has layers. Importers sell to distributors. Distributors sell to resellers. Resellers sell to sub-resellers. Everyone claims to be "direct from source." Nobody publishes real prices. The same supplier operates under three different names across different trade channels. And the founder needs to answer one question every week: **what should I buy, from whom, and at what price?**

They built a system to answer it. An AI agent backed by a database of 22,000+ price quotes, 180+ social media vendor profiles, 274 computer-vision-analyzed competitor posts, and 96 customer survey responses. The agent has 37 tools. It can tell you, in under ten seconds, where any supplier sits in the supply chain, what margin you'd make buying from them, and whether customer demand actually supports the purchase.

Every component in this system is something you've already built. Just bigger.

---

## The Data Layer: MongoDB Aggregation as Intelligence

Your state files are markdown tables. They work. But when you're tracking thousands of price quotes across dozens of suppliers, markdown tables stop scaling. This system uses MongoDB — a database that stores documents instead of rows — and aggregation pipelines that transform raw data into intelligence.

You don't need to learn MongoDB to understand what's happening here. Think of an aggregation pipeline as a multi-stage assembly line for data. Raw quotes go in one end. Cleaned, grouped, compared, and scored intelligence comes out the other. Same idea as your content pipeline from Chapter 9, but running against a database instead of files on disk.

### The $facet Pattern: Six Analyses in One Query

When the founder asks "Tell me about Supplier A," the system doesn't run six separate queries. It runs one query with six parallel branches using a pattern called `$facet`. Each branch answers a different question about the same supplier, simultaneously:

**Branch 1 — Pricing**: Average price, minimum, maximum, median across all their quotes. How many total quotes are in the system.

**Branch 2 — Product breadth**: Which product categories and grades they carry. How many quotes per category. Their average price in each.

**Branch 3 — Activity**: When they were first seen and last seen in the data. Which trade channels they post in.

**Branch 4 — Size distribution**: For products sold by weight or volume — the distribution of sizes they offer, with pricing at each tier.

**Branch 5 — Price positioning**: Where their prices fall relative to the market. Percentile ranking.

**Branch 6 — Vision intelligence**: What their social media posts reveal — product quality tiers, packaging, branding, presentation standards.

One query. Six dimensions. The result is a competitor battlecard assembled in under a second.

This is the same shape as your hooks from Chapter 8 — multiple checks running against the same input. The difference is scale: instead of three checks on a cover letter, it's six analyses across thousands of data points. But the pattern — parallel evaluation branches feeding into a combined result — is identical.

### Supply Chain Forensics: Who Supplies Whom

Here's where the system gets genuinely interesting.

In a market where nobody admits their supply chain, how do you figure out who buys from whom? You look at prices. If Supplier A is consistently 30% cheaper than Supplier B across three or more overlapping products, A probably supplies B. The reasoning: B can't consistently price 30% higher on the same products unless they're adding a markup to A's base price.

The algorithm works like this:

For every pair of suppliers in the database, the system finds products they both sell. If they share fewer than two products, skip them — not enough data to draw conclusions. For shared products, it compares median prices. If one supplier is cheaper on at least two overlapping products, it calculates the average price ratio between them.

The threshold is 15%. If the cheaper supplier's prices average less than 85% of the other's, that's a meaningful and consistent discount — not just a sale or a loss-leader on one item.

Confidence scores track how strong the signal is. Five or more products where A beats B? That's 0.8 confidence — strong evidence of a supply relationship. Three products? 0.6 — plausible but not proven. Two products? 0.4 — worth noting but don't bet on it.

The output looks like this:

```
Importer Co        →  Regional Foods       discount=38.2%  overlaps=7   conf=0.8
Importer Co        →  Metro Spices         discount=29.1%  overlaps=4   conf=0.6
Regional Foods     →  Quality Ingredients  discount=22.4%  overlaps=3   conf=0.6
```

The system discovered that Regional Foods — who markets themselves as a "direct importer" — is actually buying from Importer Co and marking up 38%. That's not a guess. That's a conclusion drawn from seven overlapping products where the price ratio is consistent.

### Tier Classification: Mapping the Whole Chain

Individual pair comparisons are useful. But the system goes further — it classifies every supplier into a tier: importer, distributor, reseller, or sub-reseller.

The classification uses two signals combined:

**Price percentiles** tell you where a supplier sits on the price ladder. The system calculates market-wide price percentiles — the 20th, 40th, and 70th. If a supplier's average price is below the 20th percentile, they're priced like an importer. Below the 40th, like a distributor. Above the 70th with low volume, like a sub-reseller.

**Language signals** from trade channels add a second dimension. The system scans supplier messages for patterns: "we import," "direct from factory," "minimum order quantity" signals a supplier. "Bulk price," "wholesale only," "strictly wholesale" signals a distributor. "Looking for supplier," "where to buy," "need vendor" signals a reseller.

When the price data and the language signals agree, confidence is high. A supplier with 20th-percentile pricing AND messages full of "we import from Vietnam" and "factory direct" — that's an importer. A supplier with 70th-percentile pricing who's asking "where do you get your stock?" in trade channels — that's a sub-reseller pretending to be higher up the chain.

The result is a supply chain map the founder couldn't have assembled manually. Not because the logic is complex — each individual check is simple. But running it across 22,000 quotes and thousands of messages, for every supplier pair, in every combination? That's where automation earns its keep.

---

## The Agent Layer: 37 Tools and Three Thinking Modes

The data layer produces intelligence. The agent layer makes it conversational. The founder doesn't write database queries. They send a text message: "What should I buy with $5,000?" and the agent reasons its way to an answer.

### Mode Detection: Matching the Response to the Question

Not every question needs the same kind of thinking. "How many cases do we have in stock?" is a data lookup — fast model, quick answer. "What if we started importing directly instead of buying from distributors?" is strategic exploration — slower model, deeper reasoning, pushback on assumptions.

The agent detects which mode a question calls for using keyword signals:

**Factual mode** triggers on phrases like "how many," "what's in stock," "show me the numbers," "what did we spend." Quick data retrieval. The default model handles it — fast and cheap.

**Analyst mode** triggers on "what should we buy," "market snapshot," "supply chain," "where's the margin," "what's trending." These questions need the agent to call multiple data tools, cross-reference results, and synthesize a recommendation. A reasoning-capable model takes over.

**Sparring mode** triggers on "what if," "hear me out," "play devil's advocate," "poke holes in this," or any multi-sentence message that reads like thinking out loud. The agent switches to a model optimized for strategic reasoning and stops being a reporter — it starts pushing back, asking follow-up questions, connecting dots the founder might miss.

The mode is *sticky*. Once you're in sparring mode, the agent stays there until you explicitly say "back to data" or ask a clearly factual question. This prevents jarring switches mid-conversation.

Your CLAUDE.md from Chapter 4 set a consistent personality. This system does the same thing — but with three personalities, each tuned for a different kind of work. The system prompt stays the same. The overlay changes. Same component, scaled up.

### Tool Composition: How the Agent Thinks Through a Buy Decision

When the founder asks "What should I buy with $5,000?", the agent doesn't guess. It calls tools in sequence, each one feeding context to the next:

**Step 1 — market_snapshot()**: Returns supply chain tiers, social media competition density, and top-margin products. The agent now knows WHO to buy from (distributors, not resellers) and WHICH products have the best spread between cost and sell price.

**Step 2 — margin_map()**: Shows the actual cost at each tier versus the packaged/retail sell price. Distributor cost for saffron: $12/gram. Reseller cost: $18/gram. Our packaged sell price: $32/gram. The margin at distributor tier is 166%. At reseller tier, 78%. The data says buy from distributors.

**Step 3 — buy_optimizer($5,000)**: Takes the budget, pulls live cost data from the cheapest tier, scores every product by margin multiplied by demand, and allocates the budget. Maximum 30% per product for diversification — don't put everything into saffron even if the margin is highest. The optimizer factors in demand signals: if nobody's asking for high-grade cardamom, a 200% margin doesn't matter.

**Step 4 — demand_check("saffron")**: Counts demand signals across all data sources — customer surveys, social media mentions, buyer inquiries in trade channels, and trend data. Returns an assessment: HIGH, GROWING, MODERATE, or LOW.

The agent synthesizes all four results into a single recommendation:

"Buy from Importer Co (distributor tier, $12/gram saffron vs $18 at Metro Spices). Allocate $1,500 to saffron (HIGH demand, 166% margin), $1,200 to vanilla ($8 cost, $28 sell, 250% margin, GROWING demand), $800 to specialty chili oils (trending on social, 200% margin)... Total: 47 units across 5 products. Projected revenue: $14,200. Break-even: sell 18 of 47 units."

Every number came from a tool. Every tool queried the database. The agent's job wasn't to know the answer — it was to know which questions to ask, in which order, and how to combine the results.

Your skills from Chapter 7 gave Claude expertise in one domain at a time. This system's 37 tools give the agent expertise across finance, market intelligence, competitive analysis, field operations, inventory, social media trends, demand scoring, supply chain mapping, shipping logistics, and task management. Same concept — externalized knowledge loaded on demand. Different scale.

---

## The Forensics Model: Finding What No One Could Track Manually

The supply chain mapping is impressive. But the system's real advantage is what it discovers when multiple data sources converge.

### Multi-Signal Demand Scoring

The founder doesn't just want to know what's popular. They want to know what will SELL — and how confidently they can make that bet. The system scores every product across four weighted dimensions:

**Demand (35% weight)**: How many people actually asked for this product? Survey responses get weighted by urgency — someone buying "this week" counts 3x more than someone "just browsing." Purchase frequency matters too — a monthly buyer is 3x more valuable than a yearly buyer. Social media signals add another layer: how many posts, how many views, any restock signals? And direct buyer inquiries from trade channels get their own weight.

**Margin (30% weight)**: What's the spread between what it costs and what people will pay? The system calculates cost basis from scouted field prices (best signal) or wholesale estimates (fallback). It calculates willingness-to-pay from survey budget data or social media price signals. If the spread is negative — the product costs more than customers will pay — the margin score is zero. No amount of demand saves a product customers can't afford.

**Supply (20% weight)**: Can you actually source this product reliably? Recent wholesale quotes, scouted supplier prices, and quote freshness (data from last two weeks scores higher than two-month-old data) all factor in.

**Confidence (15% weight)**: How much do you trust the other three scores? A product with 40 survey responses, 30 wholesale quotes, and scouted field prices has HIGH confidence. A product with 2 survey responses and no price data has LOW confidence — the recommendation might be right, but the evidence is thin.

The output ranks every product with a composite score out of 100:

```
#1: Saffron (Persian) — Score: 78/100
    Demand: 22 survey + 47 social + 8 trade inquiries [82/100]
    Supply: $11.50/gram (field scouted), 31 wholesale quotes [85/100]
    Margin: budget $32 vs cost $11.50 → $20.50 spread (178%) [100/100]
    Confidence: HIGH

#2: Vanilla (Madagascar) — Score: 71/100
    Demand: 15 survey + 38 social [68/100]
    Supply: $7.80/gram (wholesale estimate), 18 quotes [60/100]
    Margin: budget $28 vs cost $7.80 → $20.20 spread (259%) [100/100]
    Confidence: MEDIUM
```

Every number traces back to a specific data source. The founder can interrogate any score: "Why is vanilla's supply score only 60?" Because there are only 18 wholesale quotes and no field-scouted price. The system knows what it knows AND what it doesn't know.

### Entity Resolution: Same Supplier, Five Names

One of the nastiest problems in this market is figuring out that "Premium Spice Co," "PremiumSpices_Official," "Manager - Premium Spice Wholesale Group," and "Aisha (Premium)" are all the same supplier. Different handles in different trade channels. Different staff members posting under personal names.

The system maintains an alias map — a lookup table that normalizes every known handle to a canonical supplier name. When the price correlation algorithm runs, it merges aliases first. Without this, the system would compare "Premium Spice Co" against "PremiumSpices_Official" and conclude they have identical pricing on every product — technically true, but useless. They're the same entity.

This is a form of the same problem your state files handle. In Chapter 5, you tracked applications and made sure the system didn't generate duplicate cover letters for the same company. The alias map is duplicate detection at a larger scale — resolving identities across thousands of data points instead of dozens of rows.

### Vision Intelligence

The system doesn't just read prices. It sees competitor posts. An automated vision pipeline analyzes images from competitor social media accounts — identifying products, estimating quality tiers, reading visible price tags, noting packaging standards and branding.

Cross-referencing vision data with pricing data produces insights neither source could deliver alone. A competitor's social media shows premium packaging, but their prices in trade channels are bottom-tier. That means they're reselling cheap product in expensive packaging — and their customers are paying for the perception, not the quality. That's a vulnerability the founder can exploit by offering equivalent quality with transparent sourcing.

---

## Map It Back: Every Component You Recognize

Here's the production system, mapped to what you built:

**CLAUDE.md → Agent system prompt with mode detection.** Your CLAUDE.md told Claude who you are, how you work, and what to reference. This system's prompt is 400+ lines. It includes business context, strategic direction, competitive intelligence, and decision frameworks. Same purpose — persistent instruction that shapes every response — at a different scale.

**State files → MongoDB collections.** Your `job-state.md` tracked 50 applications in a markdown table. This system tracks 22,000+ price quotes, 8 competitor profiles, 274 vision analyses, and 96 survey responses across multiple database collections. Same idea: structured data that persists between sessions and grows over time. The feedback loop you built in Chapter 5 — output updates state, next session reads updated state — runs here on every query.

**Skills → 37 specialized tools.** Your skill files gave Claude expertise in one domain. This system's tools give the agent expertise across market intelligence, financial analysis, supply chain mapping, demand scoring, competitive profiling, content planning, and inventory management. Each tool is a focused capability the agent calls when it needs that specific knowledge. Same pattern, more tools.

**Hooks → Quality gates on data.** Your hooks caught bad output before it shipped. This system has quality gates on the data itself: minimum two overlapping products before claiming a supply chain relationship. Minimum 85% price ratio before flagging a supplier-reseller pair. A validation gate that checks the agent's strategic analysis through a separate model before delivering it. Same principle — automated checks that catch errors — applied to data integrity instead of document formatting.

**Connections → Multiple data sources.** Your connections in Chapter 9 pulled data from one or two external sources. This system ingests from trade channel messages, social media APIs, field notes from market visits, customer surveys, vision-analyzed images, and web search results. Each source feeds a different dimension of the intelligence picture.

**Pipeline → Data ingestion through agent reasoning.** Your content pipeline moved a draft through research, writing, review, and publishing stages. This system's pipeline runs: data ingestion → entity normalization → aggregation → agent reasoning → validated recommendation. Different domain. Same shape. Stages that feed each other, with quality gates between them.

---

## What Makes It Production

The patterns are familiar. But production systems differ from personal ones in ways that matter:

**Scale changes the game.** Your state files track dozens of items. This database tracks tens of thousands. The supply chain algorithm compares every supplier pair — with 15 suppliers, that's 105 comparisons. Each comparison checks multiple overlapping products. A human couldn't do this weekly. The system does it in seconds.

**Observability is non-negotiable.** Every agent decision is traced through an observability platform. What model was used, what tools were called, how long each took, what the token cost was. When the agent gives a bad recommendation, the founder can trace the exact chain of tool calls that produced it and find where the reasoning broke. Your systems work well enough that you can debug by re-reading the state file. Production systems need structured logs.

**Session management prevents context collapse.** The agent uses Redis-backed sessions with a one-hour TTL and a 30-message cap. If the founder has a long conversation, older messages drop off. This prevents the context window from overflowing and producing incoherent responses. Your systems manage context through file size — keeping state lean, archiving old rows. Same problem, different solution.

**Multiple models for different thinking.** The system uses a fast, cheap model for factual lookups and a reasoning-capable model for strategic analysis. A validation gate runs a third model to check the output before delivering it. Your systems use one model for everything — and that's fine at personal scale. When decisions carry real financial weight, matching the model's capability to the question's complexity is worth the extra cost.

**The system gets smarter.** Every new price quote, every new survey response, every field note from a market visit makes the supply chain map more accurate. The price correlation algorithm runs against an ever-growing dataset. Three months of data produces tentative supplier-reseller guesses. Six months produces confident maps. A year produces an intelligence asset no competitor has. Your state files get smarter with each session too — that's the feedback loop from Chapter 5. This system runs the same loop, continuously, across a larger dataset.

---

## Your Systems Will Grow

Your Study System could become this. Imagine it tracking not 30 topics but 3,000 exam questions across 50 study sessions. Imagine it scoring your mastery with multi-signal confidence (quiz performance, spaced repetition decay, topic interconnection mapping) and recommending what to study next with the same weighted-scoring approach this system uses for buy decisions.

Your Content System could become this. Imagine it tracking not 20 published pieces but 500 — with engagement data flowing back into the state, informing the pipeline's topic selection, calibrating the voice skill based on what resonates.

The components are the same. The patterns are the same. The scale is different. And the scale comes not from learning new concepts, but from feeding more data into the concepts you already know.

That's the path. You're on it.
