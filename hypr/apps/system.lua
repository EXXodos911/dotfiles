-- Floating windows

hl.window_rule({ match = { tag = "floating-window" }, float = true })
hl.window_rule({ match = { tag = "floating-window" }, center = true })
hl.window_rule({ match = { tag = "floating-window" }, size = { 875, 600 } })

hl.window_rule({ match = { class = "(com.gabm.satty|TUI.float|imv|mpv)" }, tag = "+floating-window" })
hl.window_rule({ match = { class = "(xdg-desktop-portal-gtk|DesktopEditors|org.gnome.Nautilus)", title = "^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*)" }, tag = "+floating-window" })
hl.window_rule({ match = { class = "org.gnome.Calculator" }, float = true })