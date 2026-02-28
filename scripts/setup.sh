#!/bin/bash
# JiraDa Platform Setup — clone all repos and configure the environment
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
PARENT_DIR="$(dirname "$PROJECT_DIR")"

REPOS=(
  "aichat"
  "jiramntr"
  "johanna"
  "datagrid"
  "lookin"
  "mcp-forge"
)

echo "🚀 JiraDa Platform Setup"
echo "========================"
echo ""

for repo in "${REPOS[@]}"; do
  TARGET="$PARENT_DIR/$repo"
  if [ -d "$TARGET" ]; then
    echo "✅ $repo already exists"
  else
    echo "📦 Cloning $repo..."
    git clone "https://github.com/gnemet/$repo.git" "$TARGET"
    echo "✅ $repo cloned"
  fi
done

echo ""
echo "🎉 All repos ready!"
echo ""
echo "Open the workspace in VS Code:"
echo "  code $PROJECT_DIR/jira-da.code-workspace"
