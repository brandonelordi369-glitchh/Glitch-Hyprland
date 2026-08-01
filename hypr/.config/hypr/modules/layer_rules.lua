-- LAYER RULES
hl.layer_rule({
    name  = "waybar",
    match = { namespace = "waybar" },
    animation = "slide 80%",
    blur         = true,
    blur_popups  = true,
    ignore_alpha = 0,
})

hl.layer_rule({
    name  = "logout-menu",
    match = { namespace = "logout_dialog" },
    blur = true,
})

hl.layer_rule({
    name  = "rofi",
    match = { namespace = "rofi" },
    blur         = true,
    ignore_alpha = 0,
    animation    = "popin 80%",
})

hl.layer_rule({
    name  = "swaync-center",
    match = { namespace = "swaync-control-center" },
    animation    = "slide right",
    blur         = true,
    ignore_alpha = 0,
})

hl.layer_rule({
    name  = "swaync-window",
    match = { namespace = "swaync-notification-window" },
    blur         = true,
    ignore_alpha = 0,
})
