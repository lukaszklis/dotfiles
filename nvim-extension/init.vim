" Minimal Neovim config for VS Code/Cursor extension
" This config is optimized for use within the editor extension
" and avoids plugins/settings that conflict with editor features

" General
set encoding=utf-8
set clipboard=unnamedplus
set termguicolors

" Fix for Cursor/VSCode Neovim extension: handle focus events when switching tabs
if exists('##FocusGained')
  autocmd FocusGained * if mode() != 'n' | stopinsert | endif
endif
autocmd WinEnter * if mode() != 'n' | stopinsert | endif

" Disable features that conflict with VS Code/Cursor
set noshowmode " VS Code/Cursor shows mode in status bar
set noruler " VS Code/Cursor has its own ruler
set noshowcmd " VS Code/Cursor handles command display

" Backups
set nobackup
set nowritebackup
set noswapfile

" Whitespace
autocmd BufWritePre * :%s/\s\+$//e " strip trailing whitespace
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autoindent
set copyindent
set smartindent
set nowrap
set colorcolumn=120

" Search
set incsearch
set ignorecase
set smartcase
set hlsearch

" Minimal plugins - only essential ones that work well with extension
call plug#begin('~/.local/share/nvim/plugged')

" Essential plugins that don't conflict with VS Code/Cursor
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()

" Color scheme
syntax on
colorscheme catppuccin_mocha

" Remaps
nnoremap ; :
vnoremap ; :
nnoremap j gj
nnoremap k gk

" Disable statusline since VS Code/Cursor has its own
set laststatus=0

" Extension-specific optimizations
" Disable lazyredraw and ttyfast in extension context
set nolazyredraw
set nottyfast

" Ensure proper filetype detection
filetype plugin indent on

