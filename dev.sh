#!/bin/bash

# Clean up dead sessions (but not active ones)
for session in $(zellij list-sessions 2>&1 | grep "EXITED" | sed 's/\x1b\[[0-9;]*m//g' | awk '{print $1}'); do
    zellij delete-session "$session" 2>&1 >/dev/null
done

zellij  --layout platform-docs/dev-layout.kdl
