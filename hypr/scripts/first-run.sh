#!/bin/bash

# Finish the installation with items that can only be done after logging in.

set -e

ZEUS_PATH="${ZEUS_PATH:-$HOME/.local/share/zeus}"
FIRST_RUN_MODE=~/.local/state/zeus/first-run.mode

if [[ -f $FIRST_RUN_MODE ]]; then
  rm -f "$FIRST_RUN_MODE"

  bash "$ZEUS_PATH/install/first-run/cleanup-reboot-sudoers.sh"
  bash "$ZEUS_PATH/install/first-run/firewall.sh"
  bash "$ZEUS_PATH/install/first-run/dns-resolver.sh"
  bash "$ZEUS_PATH/install/first-run/elephant.sh"
  bash "$ZEUS_PATH/install/first-run/gnome-theme.sh"
  sudo rm -f /etc/sudoers.d/first-run
fi
