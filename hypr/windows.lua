-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.window_rule({
    match = { class = ".*" },
    suppress_event = "maximize" 
})

-- Fix some dragging issues with XWayland.
hl.window_rule({
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },
  no_focus = true,
})

-- App-specific tweaks
require("hypr.apps")