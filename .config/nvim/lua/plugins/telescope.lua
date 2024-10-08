--[[
local function filenameFirst(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)
  if parent == "." then return tail end
  return string.format("%s\t\t%s", tail, parent)
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})
]]--

return {
    {
        'nvim-telescope/telescope.nvim',
        --tag = '0.1.6', -- uncomment the tag to get latest (I did it to include the "filename_first" option used below)
        dependencies = {'nvim-lua/plenary.nvim'},
        --[[pickers = {
            git_status = { path_display = filenameFirst, },
            find_files = { path_display = filenameFirst, },
        },]]--
        config = function()
            require("telescope").setup({
                defaults = {
                    -- see ":h telescope.defaults.path_display"
                    path_display = {"filename_first"} --{"smart"} --{"tail"}
                }
            })
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<C-p>', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fs', function() builtin.lsp_document_symbols({ignore_symbols = 'variable'}) end, {})
            vim.keymap.set('n', '<leader>ff', function() builtin.lsp_document_symbols({symbols = 'function'}) end, {})
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    }
}
