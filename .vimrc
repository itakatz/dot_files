" **** code copied from vundle website (https://github.com/gmarik/Vundle.vim) ***
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
 Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

 Plugin 'Valloric/YouCompleteMe'
 Plugin 'mhinz/vim-startify'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" **** End of code copied from vundle website (https://github.com/gmarik/Vundle.vim) ***


set t_Co=256
colo molokai
syntax on
set ts=4
set backspace=2
set nu
" set mouse=a
let g:netrw_liststyle= 3 " default to tree view
set tabstop=4       " The width of a TAB is set to 4. Still it is a \t. 
					" It is just that Vim will interpret it to be having a width of 4.
					"
set shiftwidth=4	" Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" close preview (useful when youcompleteme auto-opens review)
inoremap <C-b> <Esc>:pc<CR>i

" line highlight, for debugging
"set cul
"hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"
" YCM stuff                                                                                                                                 
" Goto definition                                                                                                                           
let g:ycm_goto_buffer_command='new-or-existing-tab'
nnoremap <silent> <C-D> :YcmCompleter GoTo<CR>
