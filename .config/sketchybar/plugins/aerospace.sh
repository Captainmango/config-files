#!/bin/bash

# Updates every workspace item in one pass: app icons as the label, highlight the
# focused workspace, hide empty unfocused ones. FOCUSED_WORKSPACE comes from the
# aerospace_workspace_change trigger; other events ask aerospace directly.

source "$CONFIG_DIR/plugins/icon_map.sh"

FOCUSED="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}"

# "workspace|icon" lines, one per app per workspace
PAIRS="$(aerospace list-windows --all --format '%{workspace}|%{app-name}' | sort -u |
  while IFS='|' read -r ws app; do
    __icon_map "$app"
    echo "$ws|$icon_result"
  done)"

args=()
for ws in $(aerospace list-workspaces --all); do
  label="$(echo "$PAIRS" | awk -F'|' -v w="$ws" '$1 == w { printf "%s%s", sep, $2; sep = " " }')"
  if [ "$ws" = "$FOCUSED" ]; then
    args+=(--set space."$ws" drawing=on background.drawing=on label="$label" label.drawing=$([ -n "$label" ] && echo on || echo off))
  elif [ -n "$label" ]; then
    args+=(--set space."$ws" drawing=on background.drawing=off label="$label" label.drawing=on)
  else
    args+=(--set space."$ws" drawing=off)
  fi
done

sketchybar "${args[@]}"
