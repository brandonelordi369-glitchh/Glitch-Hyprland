local colors = require("generated.hyprland-colors")

-- LOOK AND FEEL
hl.config({
    general = {
        gaps_in     = 3,
        gaps_out    = 10,
        border_size = 2,
        col = {
            active_border   = { colors = {colors.primary, colors.tertiary}, angle = 45 },
            inactive_border = colors.surface,
        },
        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled         = true,
            size            = 6, --6
            passes          = 2, --3
            ignore_opacity  = true,
            contrast        = 1.3,
            -- noise           = 0.03,
            xray            = false,
            new_optimizations = true,
        },
    },
})
