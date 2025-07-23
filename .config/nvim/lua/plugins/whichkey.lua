return {}

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
]]--
