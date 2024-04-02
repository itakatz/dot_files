return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        vim.cmd.colorscheme "catppuccin"
        require("catppuccin").setup({
            transparent_background = true,
            custom_highlights = function(colors)
                local u = require("catppuccin.utils.colors")
                return {
                    CursorLine = {
                        bg = u.vary_color(
                            { latte = u.lighten(colors.mantle, 0.70, colors.base) },
                            u.darken(colors.surface0, 0.64, colors.base)
                        ),
                    },
                }
            end,
        })
    end
}
