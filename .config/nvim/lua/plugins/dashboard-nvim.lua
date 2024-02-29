return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            -- config
            theme = 'hyper',
            shortcut_type = 'number'       
        }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
