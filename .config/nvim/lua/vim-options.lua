vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set mouse=")
vim.g.mapleader = " "

vim.keymap.set("n", "<Tab>", "<C-w>w", { desc = "Move to next window" }) -- vim.cmd("nnoremap <tab> <c-w>w")
vim.keymap.set("n", "<S-Tab>", "<C-w>W", { desc = "Move to previous window" }) -- vim.cmd("nnoremap <s-tab> <c-w>W")

-- Test with a lua function
--[[
local n = 0
local runlua = function()
	n = n + 1
    print("n = ", n)
end
vim.keymap.set("n", "<Leader>t", runlua, { desc = "my lua script" })
]]--

-- add window zoom-in and zoom-out keys, TODO it doesn't keep original layout!
vim.keymap.set("n", "Zz", "<C-w>|<C-w>_", { desc = "Expand current window to full screen" })
vim.keymap.set("n", "ZZ", "<C-w>=", { desc = "Resize all windows evenly" })

-- I tried these, but doesn't seem too useful
--vim.keymap.set("n", "<Leader>w", ":w<CR>", { silent = true })
--vim.keymap.set("n", "<Leader>q", ":q<CR>", { silent = true })
