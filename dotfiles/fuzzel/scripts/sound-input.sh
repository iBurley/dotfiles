#!/usr/bin/env sh
set -eu

list=$(wpctl status | awk '
  /Sources:/ { in_sources=1; next }
  /Filters:/ || /Video:/ { in_sources=0 }

  in_sources && /[0-9]+\./ {
    if (match($0, /([0-9]+)\. (.*) \[vol:/, m)) {
      print " " m[2] "\t" m[1]
    }
  }
')

[ -n "$list" ] || exit 0

choice=$(printf '%s' "$list" | fuzzel --dmenu --prompt=' Input: ' --lines=8) || exit 0

id="${choice##*	}"

[ -n "$id" ] && wpctl set-default "$id"
