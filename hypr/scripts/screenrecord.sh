#!/bin/bash

# Start and stop a screenrecording, which will be saved to ~/Videos by default.
# Alternative location can be set via SCREENRECORD_DIR or XDG_VIDEOS_DIR ENVs.
# Resolution is capped to 4K for monitors above 4K, native otherwise.
# Override via --resolution= (e.g. --resolution=1920x1080, --resolution=0x0 for native).

[[ -f ~/.config/user-dirs.dirs ]] && source ~/.config/user-dirs.dirs
OUTPUT_DIR="${XDG_VIDEOS_DIR:-$HOME/Videos}/Recordings"

if [[ ! -d $OUTPUT_DIR ]]; then
  notify-send "Screen recording directory does not exist: $OUTPUT_DIR" -u critical -t 3000
  exit 1
fi

DESKTOP_AUDIO="false"
MICROPHONE_AUDIO="false"
RESOLUTION=""
STOP_RECORDING="false"
RECORDING_FILE="/tmp/screenrecord-filename"

for arg in "$@"; do
  case "$arg" in
  --with-desktop-audio) DESKTOP_AUDIO="true" ;;
  --with-microphone-audio) MICROPHONE_AUDIO="true" ;;
  --resolution=*) RESOLUTION="${arg#*=}" ;;
  --stop-recording) STOP_RECORDING="true" ;;
  esac
done

default_resolution() {
  local width height
  read -r width height < <(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | "\(.width) \(.height)"')
  if ((width > 3840 || height > 2160)); then
    echo "3840x2160"
  else
    echo "0x0"
  fi
}

start_screenrecording() {
  local filename="$OUTPUT_DIR/screenrecording-$(date +'%Y-%m-%d_%H-%M-%S').mp4"
  local audio_devices=""
  local audio_args=()

  [[ $DESKTOP_AUDIO == "true" ]] && audio_devices+="default_output"

  if [[ $MICROPHONE_AUDIO == "true" ]]; then
    # Merge audio tracks into one - separate tracks only play one at a time in most players
    [[ -n $audio_devices ]] && audio_devices+="|"
    audio_devices+="default_input"
  fi

  [[ -n $audio_devices ]] && audio_args+=(-a "$audio_devices" -ac aac)

  local resolution="${RESOLUTION:-$(default_resolution)}"

  gpu-screen-recorder -w portal -k auto -s "$resolution" -f 60 -fm cfr -fallback-cpu-encoding yes -o "$filename" "${audio_args[@]}" &
  local pid=$!

  # Wait for recording to actually start (file appears after portal selection)
  while kill -0 $pid 2>/dev/null && [[ ! -f $filename ]]; do
    sleep 0.2
  done

  if kill -0 $pid 2>/dev/null; then
    echo "$filename" >"$RECORDING_FILE"
    toggle_screenrecording_indicator
  fi
}

stop_screenrecording() {
  pkill -SIGINT -f "^gpu-screen-recorder" # SIGINT required to save video properly

  # Wait a maximum of 5 seconds to finish before hard killing
  local count=0
  while pgrep -f "^gpu-screen-recorder" >/dev/null && ((count < 50)); do
    sleep 0.1
    count=$((count + 1))
  done

  toggle_screenrecording_indicator
  
  if pgrep -f "^gpu-screen-recorder" >/dev/null; then
    pkill -9 -f "^gpu-screen-recorder"
    notify-send "Screen recording error" "Recording process had to be force-killed. Video may be corrupted." -u critical -t 5000
  else
    trim_first_frame
    notify-send "Screen recording saved to $OUTPUT_DIR" -t 2000
  fi

  rm -f "$RECORDING_FILE"
}

toggle_screenrecording_indicator() {
  pkill -RTMIN+8 waybar
}

screenrecording_active() {
  pgrep -f "^gpu-screen-recorder" >/dev/null
}

trim_first_frame() {
  local latest
  latest=$(cat "$RECORDING_FILE" 2>/dev/null)

  if [[ -n $latest && -f $latest ]]; then
    local trimmed="${latest%.mp4}-trimmed.mp4"
    if ffmpeg -y -ss 0.1 -i "$latest" -c copy "$trimmed" -loglevel quiet 2>/dev/null; then
      mv "$trimmed" "$latest"
    else
      rm -f "$trimmed"
    fi
  fi
}

if screenrecording_active; then
  stop_screenrecording
elif [[ $STOP_RECORDING == "true" ]]; then
  exit 1
else
  start_screenrecording
fi
