#!/bin/bash
# Build book PDF using Pandoc + XeLaTeX + Eisvogel
# Usage: bash build/build.sh [chapter|full|act1|act2]

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
CHAPTERS_DIR="$ROOT_DIR/book/chapters"
DIAGRAMS_DIR="$ROOT_DIR/book/diagrams"
OUTPUT_DIR="$SCRIPT_DIR/output"
METADATA="$SCRIPT_DIR/metadata.yaml"

mkdir -p "$OUTPUT_DIR"

# Eisvogel template location (installed via tlmgr or manual)
TEMPLATE_DIR="$HOME/.pandoc/templates"
TEMPLATE="$TEMPLATE_DIR/eisvogel.latex"

# Check dependencies
check_deps() {
    local missing=()
    command -v pandoc >/dev/null || missing+=("pandoc")
    command -v xelatex >/dev/null || missing+=("xelatex (basictex)")

    if [ ! -f "$TEMPLATE" ]; then
        missing+=("eisvogel template ($TEMPLATE)")
    fi

    if [ ${#missing[@]} -gt 0 ]; then
        echo "Missing dependencies:"
        printf '  - %s\n' "${missing[@]}"
        echo ""
        echo "Install with:"
        echo "  brew install --cask basictex"
        echo "  eval \"\$(/usr/libexec/path_helper)\""
        echo "  sudo tlmgr update --self"
        echo "  sudo tlmgr install eisvogel adjustbox babel-german background bidi collectbox"
        echo "  sudo tlmgr install csquotes everypage filehook footmisc footnotebackref framed"
        echo "  sudo tlmgr install fvextra letltxmacro ly1 mdframed mweights needspace pagecolor"
        echo "  sudo tlmgr install sourcecodepro sourcesanspro sourceserifpro titling ucharcat"
        echo "  sudo tlmgr install ulem unicode-math upquote xecjk xurl zref"
        echo ""
        echo "Then download Eisvogel:"
        echo "  mkdir -p ~/.pandoc/templates"
        echo "  curl -L https://github.com/Wandmalfarbe/pandoc-latex-template/releases/latest/download/Eisvogel.tar.gz | tar xz -C ~/.pandoc/templates"
        exit 1
    fi
}

# Build a single chapter (for testing)
build_chapter() {
    local ch="$1"
    local src="$CHAPTERS_DIR/ch${ch}-draft.md"

    if [ ! -f "$src" ]; then
        echo "Chapter not found: $src"
        exit 1
    fi

    echo "Building Chapter $ch..."
    pandoc "$src" \
        --metadata-file="$METADATA" \
        --template="$TEMPLATE" \
        --pdf-engine=lualatex \
        --resource-path="$CHAPTERS_DIR:$DIAGRAMS_DIR/svg:$DIAGRAMS_DIR/png" \
        --syntax-highlighting=tango \
        -o "$OUTPUT_DIR/ch${ch}.pdf"

    echo "  ✓ $OUTPUT_DIR/ch${ch}.pdf"
}

# Build Act 1 (chapters 1-3)
build_act1() {
    echo "Building Act 1..."
    local sources=()
    for ch in 01 02 03; do
        sources+=("$CHAPTERS_DIR/ch${ch}-draft.md")
    done

    pandoc "${sources[@]}" \
        --metadata-file="$METADATA" \
        --template="$TEMPLATE" \
        --pdf-engine=lualatex \
        --resource-path="$CHAPTERS_DIR:$DIAGRAMS_DIR/svg:$DIAGRAMS_DIR/png" \
        --syntax-highlighting=tango \
        -o "$OUTPUT_DIR/act1.pdf"

    echo "  ✓ $OUTPUT_DIR/act1.pdf"
}

# Build Act 2 (chapters 4-15, split to avoid xelatex limit)
build_act2() {
    echo "Building Act 2 (2 parts + merge)..."

    pandoc "$CHAPTERS_DIR"/ch{04,05,06,07,08,09}-draft.md \
        --metadata-file="$METADATA" \
        --template="$TEMPLATE" \
        --pdf-engine=lualatex \
        --resource-path="$CHAPTERS_DIR:$DIAGRAMS_DIR/svg:$DIAGRAMS_DIR/png" \
        --syntax-highlighting=tango \
        -o "$OUTPUT_DIR/_act2a.pdf"

    pandoc "$CHAPTERS_DIR"/ch{10,11,12,13,14,15}-draft.md \
        --metadata-file="$METADATA" \
        --template="$TEMPLATE" \
        --pdf-engine=lualatex \
        --resource-path="$CHAPTERS_DIR:$DIAGRAMS_DIR/svg:$DIAGRAMS_DIR/png" \
        --syntax-highlighting=tango \
        -o "$OUTPUT_DIR/_act2b.pdf"

    pdfunite "$OUTPUT_DIR/_act2a.pdf" "$OUTPUT_DIR/_act2b.pdf" "$OUTPUT_DIR/act2.pdf"
    rm -f "$OUTPUT_DIR/_act2a.pdf" "$OUTPUT_DIR/_act2b.pdf"

    echo "  ✓ $OUTPUT_DIR/act2.pdf"
}

# Build full book (per-file lualatex + merge — avoids TeX memory limits)
build_full() {
    echo "Building full book..."

    local FRONTMATTER_DIR="$ROOT_DIR/book/frontmatter"
    local APPENDICES_DIR="$ROOT_DIR/book/appendices"
    local parts=()
    local idx=0

    # Helper: build one markdown file to PDF
    # Replaces relative image paths with absolute paths to avoid lualatex temp dir issues
    _build_one() {
        local src="$1" label="$2"
        local out="$OUTPUT_DIR/_${idx}.pdf"
        local tmp_src="/tmp/_book_build_${idx}.md"
        idx=$((idx + 1))
        echo "  $label"
        # Replace relative diagram paths with absolute, strip images that crash lualatex
        sed -e "s|../diagrams/|${ROOT_DIR}/book/diagrams/|g" \
            -e '/^!\[/d' \
            "$src" > "$tmp_src"
        pandoc "$tmp_src" \
            --metadata-file="$METADATA" \
            --template="$TEMPLATE" \
            --pdf-engine=lualatex \
            --syntax-highlighting=tango \
            -o "$out" 2>/dev/null
        rm -f "$tmp_src"
        if [ -f "$out" ]; then
            parts+=("$out")
        else
            echo "    ✗ FAILED"
        fi
    }

    # Cover
    if [ -f "$OUTPUT_DIR/cover.pdf" ]; then
        parts+=("$OUTPUT_DIR/cover.pdf")
        echo "  Cover ✓"
    fi

    # Preface
    [ -f "$FRONTMATTER_DIR/preface.md" ] && _build_one "$FRONTMATTER_DIR/preface.md" "Preface"

    # Chapters
    for ch in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15; do
        _build_one "$CHAPTERS_DIR/ch${ch}-draft.md" "Ch $ch"
    done

    # Back matter
    for bm in acknowledgments about-author; do
        [ -f "$FRONTMATTER_DIR/${bm}.md" ] && _build_one "$FRONTMATTER_DIR/${bm}.md" "$bm"
    done

    # Appendices
    for app in a-component-reference b-system-files c-troubleshooting d-glossary e-resources f-deep-agents-cli; do
        [ -f "$APPENDICES_DIR/${app}.md" ] && _build_one "$APPENDICES_DIR/${app}.md" "Appendix: $app"
    done

    echo "  Merging ${#parts[@]} files..."
    pdfunite "${parts[@]}" "$OUTPUT_DIR/from-prompts-to-pipelines.pdf"

    # Cleanup numbered temp files
    rm -f "$OUTPUT_DIR"/_[0-9]*.pdf

    echo "  ✓ $OUTPUT_DIR/from-prompts-to-pipelines.pdf"
}

# Main
check_deps

case "${1:-full}" in
    chapter)
        if [ -z "$2" ]; then
            echo "Usage: bash build/build.sh chapter 07"
            exit 1
        fi
        build_chapter "$2"
        ;;
    act1)
        build_act1
        ;;
    act2)
        build_act2
        ;;
    full)
        build_full
        ;;
    *)
        echo "Usage: bash build/build.sh [chapter NN|act1|act2|full]"
        exit 1
        ;;
esac

echo ""
echo "Done."
