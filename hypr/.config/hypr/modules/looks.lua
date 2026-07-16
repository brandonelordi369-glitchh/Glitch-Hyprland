-- LOOK AND FEEL
hl.config({
    general = {
        gaps_in     = 3,
        gaps_out    = 10,
        border_size = 2,
        col = {
            active_border   = { colors = {"rgba(00d2d3ee)", "rgba(00a8ffee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
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
            size            = 6,
            passes          = 3,
            ignore_opacity  = true,
            contrast        = 1.3,
            xray            = false,
            new_optimizations = true,
        },
    },
})
