#!/bin/bash

# If already recording, stop it
if pgrep -f "^gpu-screen-recorder" >/dev/null; then
  ~/.config/hypr/scripts/screenrecord.sh --stop-recording
  exit 0
fi

choice=$(printf "  With no audio\n  With desktop audio\n  With desktop audio + microphone audio" \
  | walker --dmenu --width 295 --minheight 1 --maxheight 630 -p "Screenrecord" 2>/dev/null)

[[ -z $choice ]] && exit 0

case "$choice" in
  *"With no audio")                              ~/.config/hypr/scripts/screenrecord.sh ;;
  *"With desktop audio")                         ~/.config/hypr/scripts/screenrecord.sh --with-desktop-audio ;;
  *"With desktop audio + microphone audio")            ~/.config/hypr/scripts/screenrecord.sh --with-desktop-audio --with-microphone-audio ;;
esac
