return {
    "mhinz/vim-startify",
    config = function()
    end
}

-- I tried "alpha-nvim" before I knew startify just works as in vim...
--[[ 
return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local alpha = require("alpha")
        -- local dashboard = require("alpha.themes.startify")
        local dashboard = require("alpha.themes.startify_sess")
        alpha.setup(dashboard.opts)
    end,
}
]]--
