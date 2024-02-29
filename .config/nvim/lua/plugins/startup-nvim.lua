return {}
--[[
return {
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
        require("startup").setup({
            theme = "dashboard" -- default is dashboard (other: "startify")
        })
    end
}
]]--
