# Diagram Style Brief — From Prompts to Pipelines

Use this document as the design system for all diagrams in the book. Every diagram must follow these rules so they look like one illustrator made them all.

---

## Brand Identity

This is a technical book for non-technical readers. The visual style should feel **clean, confident, and approachable** — like a well-designed textbook, not a software tool's auto-generated output. Think O'Reilly or Pragmatic Bookshelf interior art, not Mermaid or draw.io defaults.

### Cover Reference

The book cover uses a blueprint-style aesthetic on cream paper:
- Blueprint grid lines (very subtle, decorative)
- Registration corner marks
- Clean outlined boxes with generous padding
- The cover SVG is the north star for diagram style (see `build/cover.html`)

---

## Color Palette (strict — no other colors)

| Role | Hex | Usage |
|------|-----|-------|
| **Slate Blue** | `#2B4C6F` | Primary — node outlines, arrows, labels, connector lines |
| **Amber** | `#C8873D` | Accent — highlighted nodes, call-to-action elements, "new in this chapter" indicators |
| **Cream** | `#F7F3ED` | Background fill for nodes (matches book page color) |
| **Warm Gray** | `#8B7D6B` | Secondary text — sublabels, annotations, subtle details |
| **Muted Tan** | `#D4C9B8` | Grid lines, decorative elements (very low opacity) |
| **Soft Red** | `#C45B4A` | Error/failure states only — "what breaks" diagrams |
| **Soft Green** | `#5A8F6A` | Success/pass states only — quality gate "pass" paths |

**Never use**: bright primary colors, gradients, drop shadows, or glow effects.

---

## Typography

| Element | Font | Weight | Size (relative) |
|---------|------|--------|-----------------|
| Node labels | Source Sans 3 (or Inter) | 600 (semibold) | Primary — largest text in diagram |
| Sublabels / descriptions | Source Sans 3 (or Inter) | 400 (regular) | ~75% of label size |
| Annotations | Source Sans 3 (or Inter) | 400 italic | ~65% of label size |
| Edge labels (Yes/No/arrows) | Source Sans 3 (or Inter) | 500 (medium) | ~70% of label size |

**All text must be legible at the printed size.** Interior trim is 7.5" × 9.25" with ~5.25" usable width for diagrams. Assume diagrams print at 4–5 inches wide. No text smaller than ~8pt at print size.

**Letter spacing**: Use 1–2px tracking on uppercase labels (like the cover does).

**No emojis.** Ever. Use the color system to convey status instead.

---

## Node Styles

### Standard Node (most common)
- Rounded rectangle, corner radius ~6-8px
- Stroke: 1.5–2px, Slate Blue `#2B4C6F`
- Fill: Cream `#F7F3ED`
- Label centered, Slate Blue
- Generous internal padding (don't crowd the text)

### Highlighted Node (new concept, call-to-action)
- Same shape as standard
- Stroke: 2px, Amber `#C8873D`
- Fill: Cream `#F7F3ED`
- Label in Amber

### Active/Current Node (showing "you are here")
- Stroke: 2px, Slate Blue
- Fill: Slate Blue `#2B4C6F`
- Label in white `#FFFFFF`

### Error/Failure Node
- Stroke: 1.5px, Soft Red `#C45B4A`
- Fill: Cream
- Label in Soft Red

### Success/Pass Node
- Stroke: 1.5px, Soft Green `#5A8F6A`
- Fill: Cream
- Label in Soft Green

### Decision Diamond
- Diamond shape
- Stroke: 2px, Amber `#C8873D`
- Fill: Cream
- Label in Slate Blue

---

## Connectors & Arrows

- Stroke: 1.2–1.5px, Slate Blue `#2B4C6F`
- Arrowheads: Simple filled triangles, small (not chunky)
- Curved paths preferred over sharp right-angles (use quadratic beziers)
- Edge labels placed along the path, not inside boxes
- Dashed lines for "optional" or "inherited" relationships

---

## Layout Rules

1. **Generous whitespace.** Nodes should breathe. More space between elements than you think you need.
2. **Consistent spacing.** Equal gaps between nodes at the same level.
3. **Top-to-bottom or left-to-right flow.** Never diagonal. Pick one direction per diagram and stick to it.
4. **Grouped elements** use a light dashed border (Muted Tan `#D4C9B8`, 1px dashed) with a small group label in Warm Gray.
5. **No decorative clutter.** No background grids in interior diagrams (that's a cover-only element). No corner marks. Clean white/cream background.
6. **Max width: ~5 inches at print.** Design for this constraint. If a diagram needs to be wider, it's too complex — split it.

---

## Diagram Categories

### A. System Evolution Diagrams (Ch 4–9)
These show the system growing chapter by chapter. Each adds one component.
- **Pattern**: Show all components present so far. The NEW component is Amber-highlighted. Previous components are standard Slate Blue.
- **Consistency**: Same basic layout across all 6 versions so the reader sees the system literally growing. Don't rearrange — add to the existing structure.
- File naming: `ch04-system-v1`, `ch05-system-v2`, ... `ch09-complete-system`

### B. Design Pattern Diagrams (Ch 3)
Loop, Gate, Router — three fundamental patterns.
- **Pattern**: Minimal nodes, clean arrows, the pattern shape is the point.
- **Loop**: Circular flow with a decision diamond
- **Gate**: Linear flow with a pass/fail gate
- **Router**: Branch point with multiple output paths
- Keep these simple. 3–5 nodes max.

### C. Concept Diagrams (Ch 1–2)
Introduce the four universal concepts.
- **Pattern**: 2×2 or hub-and-spoke layout. Instruction, Memory, Control, Flow as equal peers.
- Show present vs. missing with filled (active) vs. outlined (missing) treatment — NOT red/green color coding.

### D. Architecture / Flow Diagrams (Ch 10)
Production system walkthroughs.
- **Pattern**: More complex, multiple layers. Use grouping boxes.
- These can be taller (half-page or more).
- Use consistent left-to-right data flow.

### E. Process Diagrams (Ch 12, 14)
Step-by-step processes (debugging protocol, design process).
- **Pattern**: Numbered steps in a linear flow. Gates/decision points where applicable.
- These are reference diagrams — they should be clean enough to photocopy.

### F. Placeholder Diagrams (Ch 11–15)
10 new diagrams to create from scratch. See the `<!-- DIAGRAM NEEDED -->` comments in each chapter file for descriptions.

---

## The 32 Diagrams — Complete List

### Existing (22 — convert from Mermaid)

| # | File | Chapter | Title | Category |
|---|------|---------|-------|----------|
| 1 | `ch01-four-concepts` | 1 | The Four Concepts — What's Missing | C |
| 2 | `ch01-prompt-only` | 1 | The Prompt (No System) | C |
| 3 | `ch02-eval-comparison` | 2 | Eval: Basic Prompt vs Structured Prompt | C |
| 4 | `ch02-manual-overhead` | 2 | The Core Tension — Manual Overhead Compounds | C |
| 5 | `ch02-session-progression` | 2 | Sessions 1–5: Each Concept Added Manually | C |
| 6 | `ch03-loop` | 3 | Pattern 1: The Loop | B |
| 7 | `ch03-gate` | 3 | Pattern 2: The Gate | B |
| 8 | `ch03-router` | 3 | Pattern 3: The Router | B |
| 9 | `ch03-napkin-sketch` | 3 | Study System — Napkin Sketch (All 3 Patterns) | B |
| 10 | `ch04-system-v1` | 4 | v1: Prompt Only — No Memory, No Feedback | A |
| 11 | `ch05-system-v2` | 5 | v2: The Feedback Loop Appears | A |
| 12 | `ch06-system-v3` | 6 | v3: Expertise Loaded On Demand | A |
| 13 | `ch07-system-v4` | 7 | v4: Automated Guard Rails | A |
| 14 | `ch08-system-v5` | 8 | v5: Connected to the Outside World | A |
| 15 | `ch09-complete-system` | 9 | Complete System: All 6 Components | A |
| 16 | `ch10-data-flow` | 10 | Data Flow: Raw Sources to Business Decisions | D |
| 17 | `ch10-supply-chain-tiers` | 10 | Supply Chain Tier Classification | D |
| 18 | `ch10-agent-decision` | 10 | Agent Decision Flow | D |
| 19 | `ch10-component-map` | 10 | Your Components vs Production | D |
| 20 | `pii-redactor-flow` | (appendix) | PII Redactor: Complete Data Flow | D |
| 21 | `pii-redactor-decision` | (appendix) | PII Redactor: Three-Tier Decision Logic | D |
| 22 | `pii-redactor-context` | (appendix) | Context Injection: Regex vs. Systems Thinking | D |

### New (10 — create from placeholder descriptions)

| # | Chapter | Description | Category |
|---|---------|-------------|----------|
| 23 | 11 | Token cost breakdown: startup cost vs. per-action cost | C |
| 24 | 11 | Model ladder: fast/standard/reasoning tiers with example tasks | C |
| 25 | 12 | Failure taxonomy flowchart: symptom → component → file/check | E |
| 26 | 12 | 5-step debugging protocol: Symptom → Map → Isolate → Fix → Add Check | E |
| 27 | 13 | Four composition patterns side by side (Chain, Shared State, Shared Skills, Cross-system Hooks) | A |
| 28 | 13 | Full architecture: all four systems connected through master index | D |
| 29 | 14 | "Before" workflow: linear [Type] → [AI] → [Get] → [Fix by hand] | E |
| 30 | 14 | 8-step design process flow with loops and gates | E |
| 31 | 15 | System evolution: removal, migration, and new constraints paths | C |
| 32 | 15 | Complete toolkit summary: 4 concepts, 6 components, 3 patterns, 1 protocol, 1 process | C |

---

## Export Requirements

- **Primary format**: SVG (vector, scalable)
- **Secondary**: PNG at 300 DPI, sized for 5" wide at print
- **Background**: Transparent or Cream `#F7F3ED` (match the page)
- **File naming**: `chXX-diagram-name.svg` and `.png`
- **Save to**: `book/diagrams/svg/` and `book/diagrams/png/`

---

## Proof of Concept

Start with diagram #1: **ch01-four-concepts** — "The Four Concepts: What's Missing"

**What it shows**: Four boxes representing the four universal concepts (Instruction, Memory, Control, Flow). Instruction is PRESENT (active/filled node). Memory, Control, and Flow are MISSING (standard outline, with a subtle visual indicator they're absent — perhaps dashed outlines or lower opacity).

**Current Mermaid version** uses bright red/green colored boxes with emoji icons. The redesign should:
- Use the Slate Blue / Cream palette
- Show "present" as a filled Slate Blue node (white text)
- Show "missing" as dashed-outline nodes (Warm Gray text)
- Hub-and-spoke or 2×2 layout
- Caption below: "The four universal concepts and the specific failure each one prevents"
- Include the failure text as sublabels: "It didn't do what I wanted", "I have to re-explain everything", "It gave me confident garbage", "It tried to do everything at once"

After this one is approved, use the same system for all 32.
