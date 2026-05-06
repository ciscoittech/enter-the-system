# Book Diagrams

Mermaid source files rendered to SVG (web/ebook) and PNG (print/GitHub preview).

## Rendering

```bash
bash book/diagrams/render.sh
```

Requires `mmdc` (mermaid CLI): `npm install -g @mermaid-js/mermaid-cli puppeteer`

## Chapter 1 — You're Already Building Systems

| Diagram | What It Shows |
|---------|--------------|
| ![Prompt Only](png/ch01-prompt-only.png) | The one-shot: input → prompt → AI → output. No feedback loop. |
| ![Four Concepts](png/ch01-four-concepts.png) | After Session 2: Instruction is present, Memory/Control/Flow are missing. |

## Chapter 2 — Going Deeper

| Diagram | What It Shows |
|---------|--------------|
| ![Session Progression](png/ch02-session-progression.png) | Sessions 1→5: each adds a concept manually. Warning icons show manual effort. |
| ![Manual Overhead](png/ch02-manual-overhead.png) | The core tension: YOU provide all 4 concepts by hand. AI just generates. |
| ![Eval Comparison](png/ch02-eval-comparison.png) | Research data: basic prompt 11/20 vs structured prompt 20/20. |

## Chapter 3 — Design Patterns

| Diagram | What It Shows |
|---------|--------------|
| ![The Loop](png/ch03-loop.png) | Pattern 1: Process → Check → Improve → Repeat |
| ![The Gate](png/ch03-gate.png) | Pattern 2: Stage → Quality Check → Pass or Rework |
| ![The Router](png/ch03-router.png) | Pattern 3: Decision Point → Path A / B / C |
| ![Napkin Sketch](png/ch03-napkin-sketch.png) | The full Study System — all 3 patterns combined with Memory and Control labeled. |

## File Structure

```
diagrams/
├── src/          # Mermaid source files (.mmd)
├── svg/          # Rendered SVGs (scalable, web/ebook)
├── png/          # Rendered PNGs (print, GitHub preview)
├── render.sh     # Render all diagrams
└── README.md     # This file
```
