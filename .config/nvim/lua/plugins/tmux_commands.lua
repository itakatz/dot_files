return {
    -- dir = "~/code/itamar/lua/myplugins/tmux_commands.nvim",
    "itakatz/tmux_commands.nvim",
    -- Note: when 'opts' var is defined, the plugin's setup() is called by the plugin manager (lazy)
    -- in that case, no need to define `config` below
    -- opts = {}
    config = function()
        require('tmux_commands').setup({
            culopt = 'both' -- cursorline highlight mode: line, number, or both
        })
    end
}
