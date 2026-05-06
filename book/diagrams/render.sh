#!/bin/bash
# Render all mermaid diagrams to SVG and PNG
# Usage: bash book/diagrams/render.sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC_DIR="$SCRIPT_DIR/src"
SVG_DIR="$SCRIPT_DIR/svg"
PNG_DIR="$SCRIPT_DIR/png"

mkdir -p "$SVG_DIR" "$PNG_DIR"

echo "Rendering diagrams..."
echo "====================="

for src in "$SRC_DIR"/*.mmd; do
    name=$(basename "$src" .mmd)
    echo "  $name"

    # SVG (for web, ebook, GitHub)
    mmdc -i "$src" -o "$SVG_DIR/$name.svg" -t neutral -b transparent 2>/dev/null

    # PNG (for print, preview)
    mmdc -i "$src" -o "$PNG_DIR/$name.png" -t neutral -b white -s 2 2>/dev/null

    if [ $? -eq 0 ]; then
        echo "    ✓ SVG + PNG"
    else
        echo "    ✗ FAILED"
    fi
done

echo ""
echo "Done. Files in:"
echo "  SVG: $SVG_DIR/"
echo "  PNG: $PNG_DIR/"
echo ""
ls -la "$SVG_DIR"/*.svg 2>/dev/null | wc -l | xargs -I{} echo "  {} SVG files"
ls -la "$PNG_DIR"/*.png 2>/dev/null | wc -l | xargs -I{} echo "  {} PNG files"
