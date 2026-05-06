# Book PDF Formatting Research

Research compiled 2026-05-06 for "From Prompts to Pipelines" — 15 chapters, ~50K words, markdown source with Mermaid diagrams rendered as PNGs.

---

## Tool Comparison

### Pandoc + LaTeX (The Standard)

**What it is:** Pandoc converts markdown to LaTeX, then LaTeX compiles to PDF. The most mature and flexible pipeline.

**Pros:**
- Battle-tested — most self-published technical books use this
- Eisvogel template (Wandmalfarbe/pandoc-latex-template) is the most popular starting point: clean design, code highlighting via `listings`, configurable margins/fonts/headers
- pandoc-book-template (wikiti) adds cross-references, multi-chapter builds, and Make-based workflows
- Full control over typography — any LaTeX font package works
- Produces both PDF and EPUB from same source
- pandoc-novel template specifically targets Amazon KDP print-ready PDF
- Syntax highlighting built in (`--listings` flag or `--highlight-style`)
- Massive ecosystem of LaTeX packages for any edge case

**Cons:**
- LaTeX is painful to debug when things break
- Template customization requires LaTeX knowledge
- Slow compilation (seconds per build, not milliseconds)
- Installing a full TeX distribution is heavy (~4GB for texlive-full)

**Effort for our book:** Medium. Markdown is already the source format. Main work is picking/customizing a template and handling diagram placement.

**Key templates:**
- **Eisvogel** — best for technical documents, supports `book: true` mode, configurable fonts/margins/code blocks
- **pandoc-novel** — targets KDP print dimensions, handles ISBN pages, front/back matter
- **learnbyexample/customizing-pandoc** — detailed guide for technical books with code snippets

### Typst (Modern Alternative)

**What it is:** A Rust-based typesetting system that reached v1.0 in 2024. Designed as a LaTeX replacement with markdown-friendly syntax.

**Pros:**
- Compilation in milliseconds (27x faster than LaTeX in benchmarks) — instant preview
- Much cleaner error messages than LaTeX
- Pandoc supports Typst output (`pandoc -t typst`) — can use existing markdown
- Simpler syntax for customization than LaTeX
- Growing ecosystem of templates (typst.app/universe)
- Active development, regular releases
- Used for doctoral theses and book-length documents already

**Cons:**
- Younger ecosystem — fewer specialized packages than LaTeX
- Some edge cases (complex tables, unusual layouts) may lack solutions
- Fewer ready-made book templates compared to Pandoc+LaTeX
- Community smaller (though growing fast)

**Effort for our book:** Medium-low. Pandoc handles the markdown-to-Typst conversion. Main risk is hitting an edge case with no existing solution.

### Quarto (Academic/Technical Publishing)

**What it is:** Open-source publishing system from Posit (RStudio makers), built on Pandoc. Designed for books, articles, and websites from markdown.

**Pros:**
- First-class book support: `quarto create project book` scaffolds everything
- Outputs PDF, HTML website, and EPUB from the same source files
- Built-in Typst backend (`format: typst`) with an "orange-book" template for textbooks
- Cross-references, figure numbering, callout blocks built in
- Nicole Tietz-Sokolskaya used Quarto for her self-published technical book (ntietz.com)
- Active community, good documentation
- Handles code blocks, syntax highlighting, and callouts natively

**Cons:**
- Another layer of abstraction over Pandoc — when it works, great; when it doesn't, debugging goes through Quarto AND Pandoc AND LaTeX/Typst
- Heavier install (Node.js + Pandoc + LaTeX or Typst)
- Opinionated about project structure (may require reorganizing chapters)
- Some PDF customization requires dropping into raw LaTeX/Typst

**Effort for our book:** Medium. Would need to restructure chapter files into Quarto's expected format. Good if we also want a companion website.

### Leanpub (Markdown-Native Platform)

**What it is:** A publishing platform that takes Markua (enhanced Markdown) and generates PDF, EPUB, and MOBI automatically. Also a sales platform.

**Pros:**
- Write in Markua (basically Markdown with book extensions) — closest to our current format
- One-click generation of PDF + EPUB + MOBI
- Print-ready PDF output available
- Built-in sales platform with 80% royalty (minus $0.50 per sale under $7.99)
- "Publish early, publish often" model — great for iterative release
- Handles code blocks, tables, images natively
- Can sync from GitHub repo

**Cons:**
- Limited typography control — you get Leanpub's PDF styling, with minimal customization
- The generated PDF looks "Leanpub" — recognizable, decent but not distinctive
- Vendor lock-in concern: Markua is Leanpub-specific (though close to standard Markdown)
- Can't independently generate from Markua outside Leanpub (no open-source Markua renderer)
- Platform takes a cut of sales

**Effort for our book:** Low. Minimal conversion needed from standard markdown to Markua. But limited design control.

### AsciiDoc + Asciidoctor-PDF

**What it is:** AsciiDoc is a plain-text format (richer than Markdown) used by O'Reilly Media. Asciidoctor-PDF renders directly to PDF without LaTeX.

**Pros:**
- O'Reilly uses AsciiDoc for their entire catalog — proven for technical books
- Better code block support than Markdown (callouts, line highlighting, includes)
- Asciidoctor-PDF generates PDF directly (no LaTeX dependency)
- Cross-references, admonitions, sidebars built into the format

**Cons:**
- Requires converting all markdown to AsciiDoc (non-trivial for 15 chapters)
- Asciidoctor-PDF typography is decent but not as refined as LaTeX
- Smaller community than Pandoc
- Different syntax to learn and maintain

**Effort for our book:** High. Would need full format conversion. Not recommended given our existing markdown source.

---

## Typography Recommendations

### Body Text Fonts (Serif — Required for Sustained Reading)

| Font | Character | Best For | Notes |
|------|-----------|----------|-------|
| **Source Serif Pro** | Clean, modern, readable | Screen + print dual use | Free (Google Fonts). Excellent at small sizes. Good default choice. |
| **Palatino** | Wide, generous, distinctive | Print-first books | Wider letterforms = higher page count but exceptional readability. Classic technical book choice. |
| **Charter** | Robust, clear on any paper | POD printing | Designed to look good on bad printers. Perfect for print-on-demand where paper quality varies. |
| **Garamond** | Elegant, compact | Lower page counts | Narrower = fewer pages = lower printing costs. Excellent for 300+ page books. |
| **Minion Pro** | Professional, warm | Premium feel | Adobe font. Used in many O'Reilly books. Not free. |

**Recommendation for our book:** Source Serif Pro (free, excellent screen+print, pairs well with modern monospace fonts) or Palatino (classic technical book feel).

### Code/Monospace Fonts

| Font | Character | Notes |
|------|-----------|-------|
| **Fira Code** | Clean, ligature support | Popular in dev community. Ligatures optional for print. |
| **JetBrains Mono** | Tall x-height, very legible | Designed for code readability. Free. |
| **Cascadia Code** | Microsoft's modern mono | Good at small sizes. Free. |
| **Source Code Pro** | Matches Source Serif Pro | Natural pairing if using Source Serif for body. Free. |
| **Inconsolata** | Classic, clean | Long-time favorite for technical books. Free. |

**Recommendation:** Source Code Pro (if using Source Serif body) or JetBrains Mono (if using Palatino body).

### Heading Fonts

Use the same serif as body (bold/larger) OR a clean sans-serif for contrast:
- **Source Sans Pro** — pairs with Source Serif + Source Code for a unified family
- **Inter** — modern, highly readable sans-serif for headings
- **Fira Sans** — pairs with Fira Code for a unified technical feel

### Page Layout Specifications

| Element | Recommendation | Notes |
|---------|---------------|-------|
| **Trim size** | 7.5" x 9.25" or 7" x 10" | Standard for technical books. Wider than novels to accommodate code. |
| **Margins** | 1" outside, 1.25" inside (gutter), 0.75" top, 1" bottom | Mirror margins for print. Gutter prevents text disappearing into binding. |
| **Body text size** | 10-11pt | Standard for technical books |
| **Line spacing** | 1.3x body size (13pt for 10pt text) | 1.0 is too tight, 1.5 is too loose |
| **Code block text** | 8-9pt monospace | Smaller than body to fit longer lines |
| **Code background** | Light gray (#f5f5f5 or similar) | Subtle distinction from body text |
| **Chapter starts** | Recto (right-hand page) only | Professional convention — adds blank pages but looks right |
| **Running headers** | Chapter title (left), section title (right) | Standard for technical non-fiction |
| **Page numbers** | Centered bottom or outside bottom corner | |
| **Widows/orphans** | Minimum 2 lines | LaTeX handles this with `\widowpenalty` and `\clubpenalty` |

### What Makes Self-Published PDF Look Professional vs. Amateur

**Professional:**
- Consistent margins with proper gutter for binding
- Mirror margins (inside margin larger than outside)
- Embedded fonts (never rely on system fonts)
- Proper widow/orphan control
- Chapter openings on recto pages
- Running headers with chapter/section info
- Hyphenation enabled (LaTeX does this well)
- Consistent code block styling with background shading
- Professional front matter (half-title, title page, copyright, TOC)

**Amateur:**
- Identical margins all around (no gutter)
- Text too close to spine
- Default system fonts (Times New Roman body, Courier code)
- No running headers
- Chapters starting on any page
- Code blocks that overflow margins
- No hyphenation (ragged right edges)
- Missing front matter or poorly formatted TOC

---

## Illustration Strategy

### Mermaid Diagram Quality for Print

Mermaid can produce print-quality output, but with caveats:

**SVG export (recommended):**
- Mermaid diagrams can be exported as SVG — vector format that scales infinitely
- SVG is the correct format for print (resolution-independent)
- Tools: mermaid-cli (`mmdc`), Mermaid Editor (mermaideditor.io), or mermaid2img.com
- SVGs can be further edited in Figma, Illustrator, or Inkscape for style consistency

**PNG export (current approach):**
- Current PNGs may be insufficient for print unless rendered at high resolution
- Mermaid Editor supports up to 8x scale (768 DPI) — sufficient for print
- Standard mermaid-cli renders at 1x by default — need `--scale 4` or higher for print
- **Minimum 300 DPI required for print.** A diagram that appears 4" wide in the book needs to be at least 1200px wide in the PNG.

**Assessment of current PNGs:** Likely need re-rendering at higher resolution OR conversion to SVG. The Mermaid source (.mmd files) should be preserved — they're the "source of truth" for regeneration.

### SVG vs PNG for Print

| Format | Print Quality | File Size | Editability | Recommendation |
|--------|--------------|-----------|-------------|----------------|
| **SVG** | Perfect (vector) | Small | Fully editable | Use for all diagrams |
| **PNG @300DPI** | Good | Large | Not editable | Acceptable fallback |
| **PNG @72DPI** | Terrible | Small | Not editable | Never for print |

**Decision:** Convert all Mermaid diagrams to SVG. Keep PNGs only as fallback for tools that don't support SVG embedding.

### Diagram Tools for Professional Technical Books

| Tool | Style | Print Quality | Effort | Best For |
|------|-------|--------------|--------|----------|
| **Mermaid (SVG)** | Clean, minimal | Good | Low (already have source) | Flowcharts, sequence diagrams |
| **Excalidraw** | Hand-drawn/sketchy | Medium | Medium | Conceptual diagrams, brainstorming visuals |
| **draw.io** | Professional/corporate | Good | Medium | Complex architecture diagrams |
| **TikZ** | LaTeX-native, precise | Excellent | High (LaTeX required) | Publication-quality, matches body typography |
| **Figma** | Custom, any style | Excellent | High (manual design) | Cover art, hero illustrations |
| **D2** | Code-defined diagrams | Good | Medium | Declarative diagrams from text |

**Recommendation for our book:** Keep Mermaid as primary tool but export as SVG instead of PNG. For the handful of "hero" diagrams (the system growth visuals at the end of each Act 2 chapter), consider recreating in a consistent visual style using Excalidraw or Figma. The hand-drawn Excalidraw style could actually match the book's accessible, non-intimidating voice.

### Should Diagrams Be Recreated?

For a **professional self-published book**, yes — but strategically:

1. **Keep Mermaid for functional diagrams** (flowcharts, sequences, pipelines) — export as SVG, apply consistent theming via Mermaid config
2. **Recreate "concept" diagrams** in a consistent style (Excalidraw hand-drawn or Figma clean) — the ones that explain mental models, not code flow
3. **Apply consistent color palette** across all diagrams — pick 3-4 colors that match the book's design
4. **Consistent labeling font** — use the same sans-serif across all diagrams

---

## Publishing Platforms

### Leanpub

| Aspect | Details |
|--------|---------|
| **Format accepted** | Markua (Markdown variant) or upload your own PDF/EPUB |
| **What it generates** | PDF, EPUB, MOBI from Markua source |
| **Royalty** | 80% minus $0.50 per sale (under $7.99) |
| **Print** | Print-ready PDF available, but no POD fulfillment — you handle printing |
| **Strengths** | Iterative publishing ("publish early, publish often"), built-in audience, variable pricing (readers choose what to pay), coupon system |
| **Limitations** | Limited PDF typography control from Markua, platform-specific format |
| **Best for** | Early/iterative release, building audience during writing, ebook-first |

### Gumroad

| Aspect | Details |
|--------|---------|
| **Format accepted** | Any file you upload (PDF, EPUB, ZIP, etc.) |
| **What it generates** | Nothing — you bring finished files |
| **Royalty** | 90% minus credit card fees (2-3%) |
| **Print** | No — digital only |
| **Strengths** | Full control over product, highest royalty, simple setup, direct audience relationship, bundle products |
| **Limitations** | No discoverability — you drive all traffic, no format conversion |
| **Best for** | Direct sales to existing audience, maximum revenue per sale |

### Amazon KDP

| Aspect | Details |
|--------|---------|
| **Format accepted** | PDF (print/paperback), EPUB or KPF (Kindle ebook) |
| **What it generates** | Nothing — you bring finished files |
| **Royalty** | 35% or 70% for Kindle (70% only for $2.99-$9.99 — most technical books are above this), ~60% for print after printing costs |
| **Print** | Print-on-demand paperback/hardcover |
| **Strengths** | Massive reach, print-on-demand, global distribution, ISBN optional (free ASIN) |
| **Limitations** | 72h delay for changes, lower royalty above $9.99, KDP-exclusive for some programs, images must be 300 DPI, code lines must wrap within margins |
| **Print specs** | 6"x9" standard, all images 300 DPI minimum, PDF with embedded fonts, mirror margins required |
| **Best for** | Maximum reach, print copies, credibility |

### Apple Books

| Aspect | Details |
|--------|---------|
| **Format accepted** | EPUB only (no PDF) |
| **What it generates** | Nothing — you bring finished EPUB |
| **Royalty** | 70% |
| **Print** | No |
| **Strengths** | Large iOS/Mac audience, good for non-fiction |
| **Limitations** | EPUB only (must pass EPUBCheck validation), strict metadata requirements, Apple-specific publishing portal |
| **Best for** | Reaching Apple device users |

### IngramSpark

| Aspect | Details |
|--------|---------|
| **Format accepted** | PDF (print), EPUB (ebook) |
| **Royalty** | Variable (you set list price, Ingram takes printing cost + distribution cut) |
| **Print** | Print-on-demand, global distribution to bookstores, libraries |
| **Strengths** | Widest print distribution (Barnes & Noble, independent bookstores, libraries), professional quality, hardcover option |
| **Limitations** | Setup fees, more complex than KDP, slower to update |
| **Best for** | Bookstore/library distribution, professional print quality |

### Multi-Platform Strategy

You can sell on all platforms simultaneously (Leanpub confirms this explicitly). Recommended approach:
1. **Leanpub** — early/iterative release during writing, variable pricing
2. **Gumroad** — direct sales at launch, highest margin, bundles
3. **Amazon KDP** — print copies + Kindle for reach
4. **Apple Books** — EPUB for iOS audience (if worth the effort)

---

## Recommended Workflow

Given our specific situation (15 chapters in markdown, Mermaid diagrams as PNGs, non-technical audience, self-published):

### Phase 1: Finish Writing (Current Phase)
- Continue writing in markdown — don't change the authoring format
- Keep Mermaid source files (.mmd) alongside rendered images
- Don't worry about PDF formatting yet

### Phase 2: Production Setup (When Writing is ~80% Done)

**Tool choice: Pandoc + LaTeX** (recommended) or **Pandoc + Typst** (if LaTeX frustrations are too high)

Rationale: Pandoc is the natural fit because the source is already markdown. LaTeX gives maximum typography control for a professional result. Typst is the escape hatch if LaTeX debugging becomes painful.

Steps:
1. **Pick a base template.** Start with Eisvogel (`book: true` mode) or the pandoc-novel template (if targeting KDP print). Customize from there.
2. **Configure typography:**
   - Body: Source Serif Pro 10.5pt
   - Code: Source Code Pro 8.5pt (or JetBrains Mono)
   - Headings: Source Sans Pro
   - Line spacing: 1.3
   - Trim: 7.5" x 9.25"
   - Margins: 1" outside, 1.25" gutter, 0.75" top, 1" bottom
3. **Re-render all Mermaid diagrams as SVG:**
   ```bash
   mmdc -i diagram.mmd -o diagram.svg -t neutral --backgroundColor transparent
   ```
   Apply consistent Mermaid theme config across all diagrams.
4. **Build the pipeline:**
   ```bash
   # Example Makefile target
   book.pdf: $(CHAPTERS) $(DIAGRAMS)
       pandoc $(CHAPTERS) \
         --template=eisvogel \
         --listings \
         --highlight-style=tango \
         --pdf-engine=xelatex \
         -V book \
         -V mainfont="Source Serif Pro" \
         -V monofont="Source Code Pro" \
         -V sansfont="Source Sans Pro" \
         -o book.pdf
   ```
5. **Add front matter:** Half-title, title page, copyright page, dedication, TOC (Pandoc generates TOC with `--toc`).
6. **Add back matter:** Appendices, glossary, index.

### Phase 3: Diagram Polish (Parallel with Phase 2)
1. Export all Mermaid diagrams as SVG with consistent theme
2. Identify 5-10 "hero" diagrams (system growth visuals, the Act 2 chapter-end system diagrams) for recreation in Excalidraw or Figma with a consistent visual style
3. Apply consistent color palette (3-4 colors matching book design)
4. Verify all diagrams render correctly in PDF at print size

### Phase 4: Multi-Format Output
1. **PDF** — Primary output from Pandoc+LaTeX pipeline (for Gumroad direct sales, KDP print)
2. **EPUB** — Generate with Pandoc (`pandoc -o book.epub`) for Apple Books
3. **Leanpub** — If using for early release, convert markdown to Markua (minimal changes) and let Leanpub generate its own PDF/EPUB
4. **KDP print PDF** — May need separate Pandoc config for KDP's 6"x9" trim with specific margin requirements

### Phase 5: Platform Publishing
1. **Gumroad** — Upload PDF + EPUB bundle. Highest margin. Direct audience.
2. **Leanpub** — Iterative release during writing. Variable pricing. Built-in technical audience.
3. **Amazon KDP** — Print-on-demand paperback. Kindle EPUB. Maximum reach.
4. **Apple Books** — EPUB only. Worth it if audience skews Apple.

### Estimated Timeline

| Phase | Duration | Can Start When |
|-------|----------|---------------|
| Phase 1 (finish writing) | Ongoing | Now |
| Phase 2 (production setup) | 1-2 weeks | Writing ~80% done |
| Phase 3 (diagram polish) | 1 week | Parallel with Phase 2 |
| Phase 4 (multi-format) | 2-3 days | After Phase 2+3 |
| Phase 5 (publish) | 1-2 days per platform | After Phase 4 |

---

## Sources

### Tools and Templates
- [Eisvogel Pandoc LaTeX Template](https://github.com/Wandmalfarbe/pandoc-latex-template)
- [Pandoc User's Guide](https://pandoc.org/MANUAL.html)
- [pandoc-book-template](https://github.com/wikiti/pandoc-book-template)
- [pandoc-novel (KDP-ready)](https://github.com/jp-fosterson/pandoc-novel)
- [Customizing Pandoc for Beautiful PDF/EPUB](https://learnbyexample.github.io/customizing-pandoc/)
- [pandoc-templates.org](https://pandoc-templates.org/)
- [StefanoCecere/markdown_pandoc_book_template](https://github.com/StefanoCecere/markdown_pandoc_book_template)
- [My Pandoc Setup for My Technical Book (Shi's blog)](https://shi-yan.github.io/my_pandoc_setup_for_technical_book/)

### Typst
- [Typst Official](https://typst.app/)
- [Typst with Pandoc: Modern Alternative to XeLaTeX](https://slhck.info/software/2025/10/25/typst-pdf-generation-xelatex-alternative.html)
- [Using Pandoc and Typst to Produce PDFs](https://imaginarytext.ca/posts/2024/pandoc-typst-tutorial/)
- [Typst: A Possible LaTeX Replacement (LWN)](https://lwn.net/Articles/1037577/)
- [What is Typst? Complete Guide (TypeTeX)](https://www.typetex.app/what-is-typst)

### Quarto
- [Quarto — Creating a Book](https://quarto.org/docs/books/)
- [Quarto Book Output Customization](https://quarto.org/docs/books/book-output)
- [Using Quarto to Write a Book (R-bloggers)](https://www.r-bloggers.com/2026/03/using-quarto-to-write-a-book/)

### Typography
- [Best Fonts for Self-Published Books 2026 (Cambric)](https://cambric.pub/guides/best-fonts/)
- [Best Fonts for Books (IngramSpark)](https://www.ingramspark.com/blog/best-fonts-for-books)
- [Best Typefaces for Technical Books (Quora)](https://www.quora.com/What-are-the-best-typefaces-for-technical-books-Why)
- [Font Pairings for Print (TechnicallyWeWrite)](https://technicallywewrite.com/2024/04/15/fontpairings)
- [10 Typesetting Rules for Books](https://selfpublishingadvice.org/10-typesetting-rules-for-indie-authors/)
- [Book Formatting Complete Guide 2026](https://blog.chapter.pub/book-formatting/)
- [Book Layouts and Page Margins (The Book Designer)](https://www.thebookdesigner.com/book-layouts-page-margins/)

### Diagrams
- [Mermaid Editor — Export High-Res PNG/SVG/PDF](https://www.mermaideditor.io/export)
- [TikZ vs Matplotlib vs AI for Academic Figures](https://paperbanana.online/blog/best-tools-for-academic-paper-figures)
- [Excalidraw vs Draw.io Comparison](https://gadgetmates.com/excalidraw-vs-draw-io)

### Publishing Platforms
- [Leanpub Print-Ready PDF Guidance](https://help.leanpub.com/en/articles/5375371-some-print-ready-pdf-guidance-from-leanpub)
- [Gumroad vs Amazon KDP](https://www.writerontheside.com/gumroad-vs-amazon-kdp/)
- [Amazon KDP Paperback Submission Guidelines](https://kdp.amazon.com/en_US/help/topic/G201857950)
- [Apple Books Formatting Guidelines](https://help.apple.com/itc/applebooksstoreformatting/en.lproj/static.html)
- [Apple Books EPUB Requirements](https://blog.bookautoai.com/apple-books-epub-requirements-guide/)
- [Leanpub + Amazon Simultaneous Publishing](https://help.leanpub.com/en/articles/117414-can-i-sell-my-book-on-leanpub-and-on-amazon-or-on-other-self-publishing-platforms-at-the-same-time)
- [The Economics of Writing Technical Books](https://architectelevator.com/strategy/book-author-economics/)

### Self-Publishing Workflows
- [Start to Finish on Self-Publishing a Technical Book (ntietz)](https://ntietz.com/blog/start-to-finish-on-selfpublishing-a-technical-book/)
- [So You Want to Self-Publish a Technical Book (Andrew Brookins)](https://andrewbrookins.com/technology/so-you-want-to-self-publish-a-technical-book/)
- [Self-Publishing a Technical Book (DEV Community)](https://dev.to/getaclue/writing-a-self-published-technical-book-2gim)
- [How I Self-Published a Technical Book (Daniel Godoy)](https://dvgodoy.medium.com/how-i-self-published-a-technical-book-945597877b8a)
- [Leanpub + Amazon via Quarto (R-bloggers)](https://www.r-bloggers.com/2023/06/how-to-self-publish-a-technical-book-on-leanpub-and-amazon-using-quarto/)
- [AsciiDoc Book Starter (Liran Tal)](https://github.com/lirantal/asciidoc-book-starter)
- [Markua Manual (Leanpub)](https://leanpub.com/markua/read)
