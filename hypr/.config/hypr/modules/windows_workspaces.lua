-- WINDOW RULES

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- Agar kabhi disable karna ho toh:
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "jetbrains-no-focus",
    match = { class = "^jetbrains-.*", title = "^win.*" },
    no_initial_focus = true,
})

hl.window_rule({
    name  = "network-manager-float",
    match = { title = "^(.*Network Manager.*)$" },
    float = true,
})

-- Hyprland official run launcher positioning (optional)
hl.window_rule({
    name  = "hyprland-run-position",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",   -- 20px right, 120px up from bottom
    float = true,
})
