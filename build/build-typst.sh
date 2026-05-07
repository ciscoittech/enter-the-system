#!/bin/bash
# Build book PDF using Pandoc (markdown→typst) + Typst (typst→PDF)
# Usage: bash build/build-typst.sh [full|chapter NN]
#
# Single-pass compile: continuous page numbers, combined TOC, images, running headers.

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
CHAPTERS_DIR="$ROOT_DIR/book/chapters"
FRONTMATTER_DIR="$ROOT_DIR/book/frontmatter"
APPENDICES_DIR="$ROOT_DIR/book/appendices"
DIAGRAMS_DIR="$ROOT_DIR/book/diagrams"
TYPST_DIR="$SCRIPT_DIR/typst"
TYPST_CHAPTERS="$TYPST_DIR/chapters"
OUTPUT_DIR="$SCRIPT_DIR/output"

mkdir -p "$TYPST_CHAPTERS" "$OUTPUT_DIR"

# ─── Convert one markdown file to Typst ──────────────────────
convert_md() {
    local src="$1"
    local dest="$2"
    local name="$(basename "$src")"

    # Pandoc markdown → typst
    # Fix image paths: ../diagrams/ → /book/diagrams/ (relative to --root)
    # Prepend pandoc compatibility definitions (horizontalrule, etc.)
    {
        echo '#let horizontalrule = { v(1em); align(center, rect(width: 30%, height: 0.5pt, fill: rgb("#D4C9B8"), stroke: none)); v(1em) }'
        echo ''
        pandoc "$src" \
            --from=markdown-citations \
            --to=typst \
            --wrap=none \
            | sed 's|"../diagrams/|"/book/diagrams/|g' \
            | sed "s|\"${ROOT_DIR}/book/diagrams/|\"/book/diagrams/|g"
    } > "$dest"

    echo "  ✓ $name → $(basename "$dest")"
}

# ─── Convert all source files ────────────────────────────────
convert_all() {
    echo "Converting markdown → Typst..."

    # Preface
    if [ -f "$FRONTMATTER_DIR/preface.md" ]; then
        convert_md "$FRONTMATTER_DIR/preface.md" "$TYPST_CHAPTERS/preface.typ"
    fi

    # Chapters 01–15
    for ch in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15; do
        local src="$CHAPTERS_DIR/ch${ch}-draft.md"
        if [ -f "$src" ]; then
            convert_md "$src" "$TYPST_CHAPTERS/ch${ch}.typ"
        else
            echo "  ✗ ch${ch}-draft.md not found"
        fi
    done

    # Back matter
    for bm in acknowledgments about-author; do
        if [ -f "$FRONTMATTER_DIR/${bm}.md" ]; then
            convert_md "$FRONTMATTER_DIR/${bm}.md" "$TYPST_CHAPTERS/${bm}.typ"
        fi
    done

    # Appendices
    local app_map=(
        "a-component-reference:appendix-a"
        "b-system-files:appendix-b"
        "c-troubleshooting:appendix-c"
        "d-glossary:appendix-d"
        "e-resources:appendix-e"
        "f-deep-agents-cli:appendix-f"
    )
    for entry in "${app_map[@]}"; do
        local src_name="${entry%%:*}"
        local dest_name="${entry##*:}"
        if [ -f "$APPENDICES_DIR/${src_name}.md" ]; then
            convert_md "$APPENDICES_DIR/${src_name}.md" "$TYPST_CHAPTERS/${dest_name}.typ"
        fi
    done

    echo "  Done converting."
}

# ─── Compile Typst → PDF ─────────────────────────────────────
compile_full() {
    echo ""
    echo "Compiling Typst → PDF..."
    typst compile \
        --root "$ROOT_DIR" \
        "$TYPST_DIR/book.typ" \
        "$OUTPUT_DIR/from-prompts-to-pipelines.pdf"
    echo "  ✓ $OUTPUT_DIR/from-prompts-to-pipelines.pdf"
}

# ─── Single chapter (for testing) ────────────────────────────
build_chapter() {
    local ch="$1"
    local src="$CHAPTERS_DIR/ch${ch}-draft.md"

    if [ ! -f "$src" ]; then
        echo "Chapter not found: $src"
        exit 1
    fi

    echo "Building Chapter $ch (test build)..."

    # Convert just this chapter
    convert_md "$src" "$TYPST_CHAPTERS/ch${ch}.typ"

    # Create a minimal test wrapper
    cat > "$TYPST_DIR/_test.typ" << 'TEMPLATE'
#let horizontalrule = { v(1em); align(center, rect(width: 30%, height: 0.5pt, fill: rgb("#D4C9B8"), stroke: none)); v(1em) }
#set page(width: 7.5in, height: 9.25in, margin: (inside: 1.25in, outside: 1in, top: 0.85in, bottom: 1in))
#set text(font: "Source Serif 4", size: 11pt)
#set par(leading: 0.65em * 1.3, justify: true)
#show heading.where(level: 1): it => {
  v(2in)
  set text(font: "Source Sans 3", size: 24pt, weight: "bold", fill: rgb("#2B4C6F"))
  it
  v(0.5in)
}
#show heading.where(level: 2): it => {
  v(1.5em)
  set text(font: "Source Sans 3", size: 16pt, weight: "semibold", fill: rgb("#2B4C6F"))
  it
  v(0.75em)
}
#show heading.where(level: 3): it => {
  v(1em)
  set text(font: "Source Sans 3", size: 13pt, weight: "semibold", fill: rgb("#2B4C6F"))
  it
  v(0.5em)
}
#show raw.where(block: true): it => {
  set text(font: "Source Code Pro", size: 9pt)
  block(width: 100%, fill: rgb("#F7F3ED"), stroke: 0.5pt + rgb("#D4C9B8"), radius: 4pt, inset: 12pt, it)
}
#show raw.where(block: false): it => {
  set text(font: "Source Code Pro", size: 9.5pt)
  box(fill: rgb("#F7F3ED"), inset: (x: 3pt, y: 0pt), radius: 2pt, it)
}
#show quote.where(block: true): it => {
  block(width: 100%, inset: (left: 16pt, y: 8pt), stroke: (left: 2pt + rgb("#C8873D")), it)
}
TEMPLATE

    echo "#include \"chapters/ch${ch}.typ\"" >> "$TYPST_DIR/_test.typ"

    typst compile \
        --root "$ROOT_DIR" \
        "$TYPST_DIR/_test.typ" \
        "$OUTPUT_DIR/ch${ch}-typst.pdf"

    rm -f "$TYPST_DIR/_test.typ"
    echo "  ✓ $OUTPUT_DIR/ch${ch}-typst.pdf"
}

# ─── Main ─────────────────────────────────────────────────────
case "${1:-full}" in
    chapter)
        if [ -z "$2" ]; then
            echo "Usage: bash build/build-typst.sh chapter 01"
            exit 1
        fi
        build_chapter "$2"
        ;;
    full)
        convert_all
        compile_full
        ;;
    convert)
        convert_all
        ;;
    *)
        echo "Usage: bash build/build-typst.sh [full|chapter NN|convert]"
        exit 1
        ;;
esac

echo ""
echo "Done."
