hl.on("hyprland.start", function ()
    -- Slow app launch fix, set systemd vars
    hl.exec_cmd("systemctl --user import-environment $(env | cut -d'=' -f 1)")
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")

    hl.exec_cmd("uwsm-app -- walker --gapplication-service")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("uwsm-app -- waybar")
    hl.exec_cmd("uwsm-app -- mako")
end)

hl.on("config.reload", function ()
    hl.exec_cmd("uwsm-app -- swaybg -i ~/.config/wallpapers/1-pawel-czerwinski.jpg -m fill")
end)
