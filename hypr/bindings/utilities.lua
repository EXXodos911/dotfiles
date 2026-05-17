-- Menus
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("uwsm-app -- walker --width 644 --maxheight 300 --minheight 300"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenrecord-menu.sh"))

-- Captures (Something weird with PRINT input, also the VIA config is broken)
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -z -m region -o ~/Pictures/Screenshots"))
hl.bind("ALT + PRINT", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenrecord-menu.sh"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -z -m region -o ~/Pictures/Screenshots"))

-- Control panels
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd("uwsm-app -- xdg-terminal-exec --app-id=TUI.float wiremix"))
hl.bind("SUPER + CTRL + A", hl.dsp.exec_cmd("uwsm-app -- xdg-terminal-exec --app-id=TUI.float btop"))

-- Lock system
hl.bind("SUPER + CTRL + L", hl.dsp.exec_cmd("hyprctl switchxkblayout all 0 & (pidof hyprlock || hyprlock &)"))

-- Clipboard
hl.bind("SUPER + CTRL + V", hl.dsp.exec_cmd("walker --width 644 --maxheight 300 --minheight 300 -m clipboard"))