#!/bin/bash
# Claude Code notification script with task identification

# Read JSON input from stdin
input=$(cat)

# Extract fields using jq
session_id=$(echo "$input" | jq -r '.session_id // empty' | cut -c1-8)
cwd=$(echo "$input" | jq -r '.cwd // empty' | xargs basename)
notification_type=$(echo "$input" | jq -r '.notification_type // empty')
message=$(echo "$input" | jq -r '.message // empty')

# Build notification message based on type
case "$notification_type" in
    "idle_prompt")
        if [ -n "$session_id" ] && [ -n "$cwd" ]; then
            msg="[$session_id] 等待输入 ($cwd)"
        elif [ -n "$cwd" ]; then
            msg="等待输入 ($cwd)"
        else
            msg="等待输入"
        fi
        ;;
    "permission_prompt")
        # Extract tool name from message like "Claude needs your permission to use Bash"
        tool=$(echo "$message" | grep -oE "use [A-Za-z]+" | cut -d' ' -f2)
        if [ -n "$session_id" ] && [ -n "$cwd" ]; then
            msg="[$session_id] 需要 ${tool} 权限 ($cwd)"
        elif [ -n "$cwd" ]; then
            msg="需要 ${tool} 权限 ($cwd)"
        else
            msg="需要 ${tool} 权限"
        fi
        ;;
    *)
        msg="$message"
        ;;
esac

# Send macOS notification
osascript -e "display notification \"$msg\" with title \"Claude Code\""
