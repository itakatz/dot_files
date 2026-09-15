return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                  hide_gitignored = false
                }
            },
            window = {
                mappings = {
                    -- Re-assign Neo-tree's Tab key, since I use it to move between split windows
                    ["<Tab>"] = "none",
                    ["<C-t>"] = "select",
                }
            }
        })
    end
}

