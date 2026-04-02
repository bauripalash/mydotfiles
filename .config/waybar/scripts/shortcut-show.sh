#!/bin/bash
# Path to your text file
FILE_PATH="/home/palash/.config/hypr/shortcuts.txt"

# Read file, escape quotes for JSON compatibility
CONTENT=$(cat "$FILE_PATH" | sed 's/"/\\"/g')
# Output JSON with 'text' for the bar and 'tooltip' for the hover
jq -nc --arg tooltip "$CONTENT" '{"text": "", "tooltip": $tooltip}'
