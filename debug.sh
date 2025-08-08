#!/bin/bash

# Development Environment Launcher
# This script starts Zellij with the project's development layout

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 Starting development environment with Zellij...${NC}"

# Check if zellij is installed
if ! command -v zellij &> /dev/null; then
    echo "❌ Zellij is not installed. Please install it first:"
    echo "   cargo install zellij"
    echo "   or"
    echo "   brew install zellij"
    exit 1
fi

# Look for the layout file in platform-docs
LAYOUT_FILE="platform-docs/dev-layout.kdl"

if [ ! -f "$LAYOUT_FILE" ]; then
    echo "❌ Layout file not found: $LAYOUT_FILE"
    echo "   Please ensure you're running this from the project root"
    exit 1
fi

echo -e "${YELLOW}📝 Using layout: $LAYOUT_FILE${NC}"
echo ""

# Start Zellij with the layout
zellij --layout "$LAYOUT_FILE" --session dev

# If Zellij exits, show a message
echo -e "${GREEN}✅ Development session ended${NC}"