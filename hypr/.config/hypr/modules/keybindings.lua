local vars = require("modules.program_keywords")

-- KEYBINDINGS
hl.bind(vars.mainMod .. " + Q", hl.dsp.exec_cmd(vars.terminal))
hl.bind(vars.mainMod .. " + C", hl.dsp.window.close())
hl.bind(vars.mainMod .. " + M", hl.dsp.exec_cmd("loginctl terminate-user $USER"))
hl.bind(vars.mainMod .. " + N", hl.dsp.exec_cmd(vars.fileManager))
hl.bind(vars.mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(vars.mainMod .. " + A", hl.dsp.exec_cmd(vars.menu))
hl.bind(vars.mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(vars.mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(vars.mainMod .. " + H", hl.dsp.exec_cmd("/usr/bin/pycharm"))
hl.bind(vars.mainMod .. " + Z", hl.dsp.exec_cmd("zeditor"))
hl.bind(vars.mainMod .. " + O", hl.dsp.exec_cmd("env OZONE_PLATFORM=wayland code --ozone-platform-hint=auto --password-store=gnome-libsecret"))
hl.bind(vars.mainMod .. " + W", hl.dsp.exec_cmd("firefox"))
hl.bind(vars.mainMod .. " + E", hl.dsp.exec_cmd("chromium"))
hl.bind(vars.mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(vars.mainMod .. " + ESCAPE", hl.dsp.exec_cmd("wlogout -b 5"))
hl.bind(vars.mainMod .. " + K", hl.dsp.layout("swapsplit"))

-- Arrow keys focus
hl.bind(vars.mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(vars.mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(vars.mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(vars.mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Workspaces
for i = 1, 10 do
    local key = i % 10
    hl.bind(vars.mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(vars.mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace
hl.bind(vars.mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(vars.mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Mouse scroll workspaces
hl.bind(vars.mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(vars.mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Mouse drag
hl.bind(vars.mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(vars.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness (bindel → locked binds)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Custom binds
hl.bind(vars.mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -no-show-icons -theme-str 'element { padding: 1em; spacing: 1.5em; }' | cliphist decode | wl-copy"))
hl.bind(vars.mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("rofi -show calc -modi calc -no-show-match -no-sort"))
hl.bind(vars.mainMod .. " + period", hl.dsp.exec_cmd("rofi -modi emoji -show emoji"))
hl.bind(vars.mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("rofi -show window"))
hl.bind(vars.mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprpicker -a"))

hl.bind("PRINT", hl.dsp.exec_cmd("$HOME/.local/bin/screenshot_full.sh"), { locked = true })
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("$HOME/.local/bin/screenshot_select.sh"), { locked = true })
hl.bind("ALT + PRINT", hl.dsp.exec_cmd("$HOME/.local/bin/screenshot_clipboard.sh"), { locked = true })

hl.bind("SHIFT + SUPER + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(vars.mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("$HOME/.local/bin/waybar-theme-switcher.sh"))
