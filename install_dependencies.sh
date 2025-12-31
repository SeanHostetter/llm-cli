#!/usr/bin/env bash

# install_dependencies.sh - Install dependencies for llm CLI tool

set -e

echo "Installing dependencies for llm CLI..."
echo "────────────────────────────────────"

# Detect package manager
if command -v pacman &>/dev/null; then
  PKG_MGR="pacman"
  INSTALL_CMD="sudo pacman -S --noconfirm"
elif command -v apt &>/dev/null; then
  PKG_MGR="apt"
  INSTALL_CMD="sudo apt install -y"
elif command -v dnf &>/dev/null; then
  PKG_MGR="dnf"
  INSTALL_CMD="sudo dnf install -y"
elif command -v brew &>/dev/null; then
  PKG_MGR="brew"
  INSTALL_CMD="brew install"
else
  echo "Error: No supported package manager found (pacman, apt, dnf, brew)"
  exit 1
fi

echo "Detected package manager: $PKG_MGR"

# Install core dependencies
echo ""
echo "Installing curl, jq..."
$INSTALL_CMD curl jq

# Install ddgr for web search
echo ""
echo "Installing ddgr (DuckDuckGo CLI for web search)..."
if [ "$PKG_MGR" = "apt" ]; then
  # ddgr not in default apt repos, use pip
  pip install ddgr || pip3 install ddgr
else
  $INSTALL_CMD ddgr
fi

# Install bat for syntax highlighting (optional but recommended)
echo ""
echo "Installing bat (for syntax highlighting)..."
$INSTALL_CMD bat || echo "Note: bat installation failed, syntax highlighting will be limited"

echo ""
echo "────────────────────────────────────"
echo "Dependencies installed!"
echo ""
echo "You also need LM Studio with the CLI enabled:"
echo "  1. Download LM Studio from: https://lmstudio.ai/"
echo "  2. Enable CLI: LM Studio → Settings → Enable CLI"
echo "  3. Verify with: lms --version"
echo ""
echo "To install llm to your PATH:"
echo "  sudo cp llm /usr/local/bin/"
echo "  # or"
echo "  ln -s \$(pwd)/llm ~/.local/bin/llm"
