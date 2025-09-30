return {}
--[[
{
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
]]
--

--[[
return {
    'AckslD/nvim-whichkey-setup.lua',
    dependencies = {
        'liuchengxu/vim-which-key'
    },
    config = function()
        local whichkey = require("whichkey_setup")
        whichkey.config {
            hide_statusline = false,
            default_keymap_settings = {
                silent = true,
                noremap = true,
            },
            default_mode = 'n',
        }
    end
}
]]
--
