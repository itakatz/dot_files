vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set mouse=")
vim.cmd("nnoremap <tab> <c-w>w")
vim.cmd("nnoremap <s-tab> <c-w>W")
--vim.cmd("hi CursorLine cterm=NONE ctermbg=24 ctermfg=white guibg=darkred guifg=white")
vim.g.mapleader = " "

-- Save file with Leader key
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })

-- Quit Neovim with Leader key
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
