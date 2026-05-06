# Chapter 10: A Real System — Production Case Study

**Title**: A Real System — From Market Data to Business Decisions
**Word target**: 3,500–4,000 words
**No new component** — this is a production-scale example using all 6 components
**Abstraction domain**: Specialty food import/distribution (real system is abstracted to protect competitive advantage)
**Purpose**: Show the reader the ceiling. Every pattern maps back to components they already know.

---

## Why This Chapter Exists

The reader just finished Ch 9 with all 6 components working across 4 personal systems. Those systems are real — but they're personal-scale. This chapter answers the question: "What happens when someone builds a system like this for a real business?"

Not to intimidate. To show the path.

---

## Abstraction Layer

The real system operates in a specific market with specific products. The abstraction preserves ALL technical patterns while hiding the business:

| Real | Abstracted |
|------|-----------|
| Specific product category | Specialty food ingredients (saffron, vanilla, oils) |
| Specific city market | "An emerging market where supply chains aren't transparent" |
| Chat platform rooms | "Supplier trade channels" |
| Social media platform | "Social media" (generic) |
| Specific product units | Specialty ingredient SKUs |
| Local currency | USD (proportional) |
| Product styling/finishing | "Prepared/packaged" pricing tier |
| Named vendors | Supplier A, Distributor B, Retailer C |

**NEVER mention**: The actual industry, city, platform names, product names, currency, company name.

**ALWAYS preserve**: The algorithms, aggregation patterns, agent architecture, scoring logic, margin chains.

---

## Section-by-Section Breakdown

### Section 1: The Setup (~300 words)

**Narrative beat**: Bridge from Ch 9. "Your 4 systems work. Here's what production looks like."

**Content**:
- Introduce the scenario: a specialty food importer using AI to make purchasing decisions
- The business problem: supply chains are opaque, pricing is inconsistent, demand signals are scattered across 5+ channels
- The operator asks their AI system one question: "What should I buy with $5,000?" — and gets a sourced, data-backed answer
- That answer required: data collection from multiple channels, price normalization, supply chain forensics, demand weighting, margin calculation, and strategic reasoning
- "Every piece of this system uses patterns you already know."

### Section 2: The Data Layer — MongoDB Aggregation (~800 words)

**Narrative beat**: Raw data → structured intelligence. This is the state file concept at production scale.

**Content**:

**Supply chain forensics via price correlation:**
- The algorithm: if Supplier A is consistently 30%+ cheaper than Supplier B across 3+ overlapping products, A likely supplies B
- Show the logic (pseudocode/simplified Python):
  - Find shared products between two vendors
  - Compare median prices
  - If A is cheaper on 2+ overlapping products with >15% discount → supply relationship detected
  - Confidence scoring: 5+ overlaps = high, 3-4 = medium, 2 = low
- Real (abstracted) example: "Supplier A sells saffron at $18/gram. Distributor B sells the same grade at $47/gram. Across 6 overlapping products, A is 40-60% cheaper. A supplies B."

**$facet for multi-dimensional profiling:**
- One query, six analyses in parallel: pricing stats, product breadth, activity timeline, geographic reach, quality signals, length/grade distribution
- "Six questions answered in one database round trip. In SQL, this would be six separate queries."
- Show the pattern (simplified):
  ```
  aggregate([
    {match: vendor},
    {facet: {
      pricing: [...avg, median, range...],
      products: [...unique combos, counts...],
      activity: [...first seen, last seen, channels...],
      quality: [...tier distribution...],
    }}
  ])
  ```

**Supply chain tier classification:**
- Rules: price percentile position + keyword signals (wholesale language, importer language, reseller language) + volume
- Four tiers: Importer → Distributor → Reseller → Sub-reseller
- "The system figured out the supply chain nobody publishes."

**Entity resolution:**
- Same supplier, 4 different handles across 3 platforms
- Alias mapping → canonical names → unified profiles
- "Without this, Supplier A looks like 4 different vendors. With it, you see they're one operation with $180K in monthly volume."

### Section 3: The Agent Layer — 30+ Tools (~800 words)

**Narrative beat**: Data is useless without reasoning. The agent sits on top of the data and thinks.

**Content**:

**Agent architecture:**
- System prompt with role, context, constraints (this is their CLAUDE.md — at production scale)
- 37 tools organized into 6 categories: Financial, Market Intelligence, Analytics, Price Intel, Operations, Strategic Thinking
- Session management: Redis-backed, 1-hour TTL, 30-message cap

**Mode detection (the smart part):**
- Three modes: Factual ("what's our burn rate?"), Analyst ("what should we buy?"), Strategic ("what if a competitor enters?")
- Mode detected from keywords in the user's message
- Different AI models for different modes: fast model for factual lookups, reasoning model for strategic thinking
- "The system doesn't just answer questions. It decides HOW to think about them first."

**Tool composition — a real decision flow:**
- User: "What should I buy with $5,000?"
- Agent detects: Analyst mode
- Agent calls: `buy_optimizer(5000)` → top SKUs by margin × demand
- Agent calls: `market_snapshot()` → supply chain tiers, trending products
- Agent calls: `demand_check("saffron")` → signal count from all sources
- Agent synthesizes: "Buy 40 units of Grade A saffron from Supplier A at $18/unit. Package at $65/unit. Margin: 260%. Demand: HIGH (47 mentions across trade channels + 1.2M social views on saffron recipes this month)."

**Map to reader's components:**
- The agent's system prompt = their CLAUDE.md
- The 37 tools = their skills (specialized knowledge, loaded on demand)
- Mode detection = a Router pattern from Ch 3
- Session management = their state files (but in Redis instead of markdown)

### Section 4: The Forensics Model (~600 words)

**Narrative beat**: The crown jewel. The system discovers things no human could track.

**Content**:

**Multi-signal demand weighting:**
- The scoring formula: demand_score = signal_count × urgency_weight × frequency_weight
- Urgency: "buying this week" = 3×, "browsing" = 1×
- Frequency: "monthly buyer" = 3×, "yearly" = 1×
- "A monthly buyer who needs saffron this week is worth 9× more than a yearly buyer who's browsing."

**Vision intelligence cross-referencing:**
- AI analyzes competitor photos: product types, quality tiers, presentation style, branding
- Cross-reference with price data: "Retailer C's posts show the same Brand X packaging as Distributor B's stock. C sources from B."
- "The system saw something in the photos that took the human operator weeks to figure out."

**The compounding insight:**
- Week 1: system has 200 data points. Recommendations are okay.
- Month 3: 5,000 data points. Supply chain map emerges. Recommendations cite specific evidence.
- Month 6: 10,000+ data points. The system knows seasonal patterns, price cycles, which suppliers discount before holidays.
- "Every query makes the next query smarter. That's the feedback loop from Ch 5 — but with 10,000 rows instead of 10."

### Section 5: Map It Back (~400 words)

**Narrative beat**: "You already know how to build this."

**Content — component mapping table:**

| Your System (Ch 4-9) | Production System |
|----------------------|-------------------|
| CLAUDE.md (instructions) | Agent system prompt with mode detection |
| State file (what happened) | MongoDB collections (thousands of records) |
| Skills (loaded expertise) | 37 specialized tools the agent calls |
| Hooks (automated checks) | Data quality gates (min 2 overlapping products for supply claims) |
| Connections (external data) | 5 data sources: trade channels, social media, surveys, field notes, price feeds |
| Pipeline (multi-stage flow) | Ingestion → Normalization → Aggregation → Agent Reasoning → Decision |

"The difference isn't the components. It's the scale. Your Study System tracks 20 quiz scores. This system tracks 10,000 price quotes. Same pattern. Same feedback loop. Different magnitude."

### Section 6: What Makes It Production (~300 words)

**Content — the gaps between toy and production:**

- **Scale**: Thousands of data points, not dozens. MongoDB instead of markdown files.
- **Observability**: Every agent decision traced through Langfuse. Token costs tracked. Decision quality auditable.
- **Session management**: Redis-backed conversation memory with TTL and message caps. Not unlimited context.
- **Model selection**: Different models for different thinking. Fast models for lookups, reasoning models for strategy.
- **Entity resolution**: Same entity across platforms. Your state file tracks one person. This tracks 50+ vendors across 3+ channels each.
- **The system gets smarter**: More data = better forensics. Your Study System's state file grows with quiz scores. This grows with market intelligence.

### Section 7: Your Systems Will Grow (~200 words)

**Narrative beat**: Bridge back to the reader. Not "you should build this" but "you could, and now you'd know how."

**Content**:
- Your Study System's quiz scores → a curriculum engine tracking 1,000 students
- Your Job Hunting System's application tracker → a recruiting pipeline scoring 500 candidates
- Your Content System's editorial pipeline → a newsroom producing 50 pieces/week
- Your Project Management System → a multi-team operations center
- "The components are the same. The scale is different. And you now know both."
- Bridge to Ch 11 (debugging): "Production systems break in ways toy systems don't. Ch 11 teaches you to diagnose failures — at any scale."

---

## Quality Gate

Five checks:

1. **Abstraction holds.** Someone reading this chapter cannot identify the real business, industry, products, or location.
2. **Technical patterns preserved.** The price correlation algorithm, $facet pattern, demand scoring, and agent architecture are accurate to the real system.
3. **Every production pattern maps to a reader component.** The mapping table is explicit and complete.
4. **Not intimidating.** The reader feels "I could build toward this" not "I could never do this."
5. **Honest about complexity.** Production is harder. The chapter doesn't pretend otherwise. But it shows the path is the same path the reader is already on.

---

## Technical Notes for the Writer

- **The abstraction is load-bearing.** Every detail must be checked: no currency symbols, product names, city names, platform names, or company names from the real system. Use the translation table above for every reference.
- **Show real algorithms.** The price correlation logic, demand scoring formula, and tier classification rules should be shown in simplified pseudocode. These are the "wow" moments — the reader sees actual forensic logic, not hand-waving.
- **The $facet pattern is the MongoDB highlight.** Non-technical readers won't know MongoDB, but they'll understand "6 questions answered in one database trip." Frame it as efficiency, not technical elegance.
- **The agent decision flow is the centerpiece.** Walk through the full "What should I buy?" chain. The reader should see: question → mode detection → tool calls → data retrieval → synthesis → actionable answer. This is their pipeline pattern from Ch 9 — but with real stakes.
- **Don't over-explain MongoDB.** The reader doesn't need to learn MongoDB. They need to see: "your state file pattern, but at scale, with a real database." The aggregation stages are interesting; the MongoDB API is not.
- **The "humble brag" tone is specific.** Not "look how smart we are." More: "this system took months. It started as a prompt. It grew. Every piece of it uses what you just learned." The author is showing their work, not flexing.
