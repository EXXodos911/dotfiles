-- https://wiki.hypr.land/Configuring/Basics/Monitors/
-- hyprctl monitors

hl.monitor({ 
    output = "HDMI-A-1",
    mode = "1920x1080",
    position = "0x0",
    scale = 1,
})

hl.monitor({
    output = "DP-2",
    mode = "2560x1080",
    position = "1920x0",
    scale = 1
})

hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-2" })
