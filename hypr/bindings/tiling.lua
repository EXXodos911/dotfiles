-- https://wiki.hypr.land/Configuring/Basics/Binds

hl.bind("SUPER + W", hl.dsp.window.close(), { description = "Close window" })

hl.bind("SUPER + J", hl.dsp.layout("togglesplit"), { description = "Toggle window split" })
hl.bind("SUPER + T", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle window floating/tiling" })
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }), { description = "Full screen" })
hl.bind("SUPER + ALT + F", hl.dsp.window.fullscreen({ mode = "maximized" }), { description = "Full width" })

hl.bind("SUPER + LEFT", hl.dsp.focus({ direction = "l" }), { description = "Focus on left window" })
hl.bind("SUPER + RIGHT", hl.dsp.focus({ direction = "r" }), { description = "Focus on right window" })
hl.bind("SUPER + UP", hl.dsp.focus({ direction = "u" }), { description = "Focus on above window" })
hl.bind("SUPER + DOWN", hl.dsp.focus({ direction = "d" }), { description = "Focus on below window" })

for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = tostring(workspace) }), { description = "Switch to workspace " .. workspace })
  hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = tostring(workspace) }), { description = "Move window to workspace " .. workspace })
end

hl.bind("SUPER + SHIFT + LEFT", hl.dsp.window.swap({ direction = "l" }), { description = "Swap window to the left" })
hl.bind("SUPER + SHIFT + RIGHT", hl.dsp.window.swap({ direction = "r" }), { description = "Swap window to the right" })
hl.bind("SUPER + SHIFT + UP", hl.dsp.window.swap({ direction = "u" }), { description = "Swap window up" })
hl.bind("SUPER + SHIFT + DOWN", hl.dsp.window.swap({ direction = "d" }), { description = "Swap window down" })

hl.bind("SUPER + code:20", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { description = "Expand window left" })
hl.bind("SUPER + code:21", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { description = "Shrink window left" })
hl.bind("SUPER + SHIFT + code:20", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { description = "Shrink window up" })
hl.bind("SUPER + SHIFT + code:21", hl.dsp.window.resize({ x = 0, y = 100, relative = true }), { description = "Expand window down" })

hl.bind("SUPER + ALT + code:20", hl.dsp.window.resize({ x = -25, y = 0, relative = true }), { description = "Expand window left a little" })
hl.bind("SUPER + ALT + code:21", hl.dsp.window.resize({ x = 25, y = 0, relative = true }), { description = "Shrink window left a little" })
hl.bind("SUPER + SHIFT + ALT + code:20", hl.dsp.window.resize({ x = 0, y = -25, relative = true }), { description = "Shrink window up a little" })
hl.bind("SUPER + SHIFT + ALT + code:21", hl.dsp.window.resize({ x = 0, y = 25, relative = true }), { description = "Expand window down a little" })

hl.bind("SUPER + CTRL + code:20", hl.dsp.window.resize({ x = -300, y = 0, relative = true }), { description = "Expand window left a lot" })
hl.bind("SUPER + CTRL + code:21", hl.dsp.window.resize({ x = 300, y = 0, relative = true }), { description = "Shrink window left a lot" })
hl.bind("SUPER + CTRL + SHIFT + code:20", hl.dsp.window.resize({ x = 0, y = -300, relative = true }), { description = "Shrink window up a lot" })
hl.bind("SUPER + CTRL + SHIFT + code:21", hl.dsp.window.resize({ x = 0, y = 300, relative = true }), { description = "Expand window down a lot" })

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move window" })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })