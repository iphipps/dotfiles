#!/usr/bin/env bash
# Set the tmux status bar color for a session, and record that color in a
# per-session user option (@session_color) so other UI — e.g. the choose-tree
# session picker (prefix + s) — can render a matching swatch.
#
# Usage:
#   tmux-session-color.sh           Color the CURRENT session (from hooks).
#   tmux-session-color.sh --all     Set @session_color for EVERY session
#                                    (used before opening the session picker).
#
# status-style is a session-scoped option, so each session keeps its own
# color even though the global default is set in tmux.conf.

set -euo pipefail

# --- Explicit overrides (optional) -----------------------------------------
# Pin specific sessions to specific colors. Values are tmux colour names or
# hex (e.g. "colour33" or "#5fafff"). Anything not listed falls back to the
# deterministic hash below.
declare -A OVERRIDES=(
  [main]="colour4"     # blue
  [work]="colour4"     # blue
  [world]="colour4"    # blue
)

# --- Palette for the hashed fallback ---------------------------------------
# Use ANSI slots 1-6 so the colors come from the active terminal theme
# (Ghostty: TokyoNight Storm). These re-theme automatically if the theme
# changes. Slots 9-14 are identical to 1-6 in this theme, so we skip them.
PALETTE=(
  "colour1"   # red
  "colour2"   # green
  "colour3"   # yellow
  "colour4"   # blue
  "colour5"   # magenta
  "colour6"   # cyan
)

color_for() {
  local name="$1"
  if [[ -n "${OVERRIDES[$name]:-}" ]]; then
    printf '%s' "${OVERRIDES[$name]}"
    return
  fi
  local sum idx
  sum=$(printf '%s' "$name" | cksum | cut -d' ' -f1)
  idx=$(( sum % ${#PALETTE[@]} ))
  printf '%s' "${PALETTE[$idx]}"
}

fg="colour0"  # theme background (dark) -- readable on the light accent colors

if [[ "${1:-}" == "--all" ]]; then
  # Record the color for every session so the picker swatches are correct
  # even for sessions whose status bar hasn't been applied yet this run.
  while IFS= read -r name; do
    bg="$(color_for "$name")"
    tmux set-option -t "$name" @session_color "$bg"
  done < <(tmux list-sessions -F '#{session_name}')
  exit 0
fi

# Default: color the current session.
session="$(tmux display-message -p '#S')"
bg="$(color_for "$session")"

tmux set-option @session_color "$bg"
tmux set-option status-style "bg=${bg},fg=${fg}"
tmux set-option window-status-current-style "bg=${fg},fg=${bg},bold"
