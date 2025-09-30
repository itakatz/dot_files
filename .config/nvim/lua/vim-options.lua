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
]]
--

-- add window zoom-in and zoom-out keys, TODO it doesn't keep original layout!
vim.keymap.set("n", "Zz", "<C-w>|<C-w>_", { desc = "Expand current window to full screen" })
vim.keymap.set("n", "ZZ", "<C-w>=", { desc = "Resize all windows evenly" })

-- I tried these, but doesn't seem too useful
--vim.keymap.set("n", "<Leader>w", ":w<CR>", { silent = true })
--vim.keymap.set("n", "<Leader>q", ":q<CR>", { silent = true })

-- keymap to run current python script (in current buffer) in a floating tmux window
-- TODO currently I assume we run in a uv-managed project, so "uv run" is available. consider treating other cases as well
vim.api.nvim_set_keymap("n", "<leader>r", "", {
	noremap = true,
	silent = false,
	callback = function()
		local current_file_path = vim.fn.expand("%:t")
		if current_file_path:sub(-3) == ".py" then
			local args = vim.fn.input("Enter input args: ")
			local command = "silent !tmux display-popup -w '80\\%' -h '60\\%' -d '\\#{pane_current_path}' uv run "
				.. current_file_path
				.. " "
				.. args
			-- local command = "silent !tmux display-popup -w '80\\%' -h '60\\%' -d '\\#{pane_current_path}' python "
			-- print(command)
			vim.cmd(command)
		elseif current_file_path:sub(-3) == ".sh" then
			local command = "silent !tmux display-popup -w '80\\%' -h '60\\%' -d '\\#{pane_current_path}' bash "
				.. current_file_path
				.. " "
			vim.cmd(command)
		end
	end,
})

vim.api.nvim_set_keymap("n", "<leader>R", "", {
	noremap = true,
	silent = false,
	callback = function()
		local command = "silent !tmux display-popup -w '90\\%' -h '80\\%' -d '\\#{pane_current_path}'"
		-- print(command)
		vim.cmd(command)
	end,
})
