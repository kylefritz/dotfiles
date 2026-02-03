#!/bin/bash
# Initialize jj in a git worktree if not already initialized

if [ -d ".jj" ]; then
    exit 0  # Already initialized
fi

if [ ! -d ".git" ] && [ ! -f ".git" ]; then
    exit 0  # Not in a git repo, nothing to do
fi

# Check if jj is installed
if ! command -v jj &> /dev/null; then
    echo "⚠️  jj not installed. Run: brew install jj"
    exit 0
fi

# Initialize silently
jj git init --colocate > /dev/null 2>&1
exit 0
