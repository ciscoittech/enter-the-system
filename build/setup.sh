#!/bin/bash
# One-time setup: install LaTeX packages, Eisvogel template, and Source fonts
# Run AFTER: brew install --cask basictex && eval "$(/usr/libexec/path_helper)"
# Usage: bash build/setup.sh

set -e

echo "=== Book Build Setup ==="
echo ""

# 1. Verify xelatex exists
if ! command -v xelatex >/dev/null 2>&1; then
    echo "xelatex not found. Install BasicTeX first:"
    echo "  brew install --cask basictex"
    echo "  eval \"\$(/usr/libexec/path_helper)\""
    exit 1
fi

echo "✓ xelatex found: $(which xelatex)"

# 2. Update tlmgr and install required packages
echo ""
echo "Installing LaTeX packages (needs sudo)..."
sudo tlmgr update --self
sudo tlmgr install \
    adjustbox babel-german background bidi collectbox csquotes \
    everypage filehook footmisc footnotebackref framed fvextra \
    letltxmacro ly1 mdframed mweights needspace pagecolor \
    sourcecodepro sourcesans sourceserif titling ucharcat \
    ulem unicode-math upquote xecjk xurl zref \
    koma-script setspace bookmark

echo "✓ LaTeX packages installed"

# 3. Install Eisvogel template
echo ""
echo "Installing Eisvogel template..."
mkdir -p "$HOME/.pandoc/templates"
curl -sL https://github.com/Wandmalfarbe/pandoc-latex-template/releases/latest/download/Eisvogel.tar.gz \
    | tar xz -C "$HOME/.pandoc/templates" 2>/dev/null

if [ -f "$HOME/.pandoc/templates/eisvogel.latex" ]; then
    echo "✓ Eisvogel installed: $HOME/.pandoc/templates/eisvogel.latex"
else
    echo "✗ Eisvogel install failed. Download manually from:"
    echo "  https://github.com/Wandmalfarbe/pandoc-latex-template/releases"
    exit 1
fi

# 4. Check Source fonts (system fonts for XeLaTeX)
echo ""
echo "Checking Source fonts..."
MISSING_FONTS=()

fc-list | grep -qi "source serif" || MISSING_FONTS+=("Source Serif 4")
fc-list | grep -qi "source sans" || MISSING_FONTS+=("Source Sans 3")
fc-list | grep -qi "source code pro" || MISSING_FONTS+=("Source Code Pro")

if [ ${#MISSING_FONTS[@]} -gt 0 ]; then
    echo "Missing system fonts (install via Google Fonts or Homebrew):"
    printf '  - %s\n' "${MISSING_FONTS[@]}"
    echo ""
    echo "Quick install:"
    echo "  brew install --cask font-source-serif-4 font-source-sans-3 font-source-code-pro"
    echo ""
    echo "Or the LaTeX packages (sourceserifpro, sourcesanspro, sourcecodepro) are installed"
    echo "and may work with XeLaTeX — test with: bash build/build.sh chapter 01"
else
    echo "✓ All Source fonts found"
fi

# 5. Test build
echo ""
echo "=== Setup complete ==="
echo ""
echo "Test with:"
echo "  bash build/build.sh chapter 01"
echo ""
echo "Full build:"
echo "  bash build/build.sh full"
