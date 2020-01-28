" General
set ttyfast
set lazyredraw
set encoding=utf-8
set nocompatible
set ruler
set clipboard=unnamed
filetype off

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
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*.orig
set wildignore+=*.DS_Store,*/.sass-cache/,*/.vagrant/,*/tmp/*,*.pdf,*/node_modules/*,*/dist/*,*/bower_components/*
set hlsearch

" Bundles
call plug#begin('~/.vim/plugged')

Plug 'Townk/vim-autoclose'
Plug 'airblade/vim-gitgutter'
Plug 'bogado/file-line'
Plug 'grep.vim'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'haishanh/night-owl.vim'

call plug#end()

" Colorscheme
syntax on
colorscheme night-owl

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn|sass-cache|bundle)$|\v[\/]public|node_modules|bower_components|\v[\/]public\/system|log$|tmp$|bin$|coverage$',
  \ 'file': '\v\.(exe|so|dll|jpg|png|gif|jpeg|scssc|pdf)$'
  \ }
let g:ctrlp_match_window='order:ttb,max:20'

if executable('ag')
  " Use ag (the Silver Searcher) in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Emmet
let g:user_emmet_expandabbr_key='<c-e>'

" Multiple cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-n>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Airline config
set statusline=[%n]\ %<%f%m%r
set statusline+=\ %{exists('g:loaded_rvm')?rvm#statusline():''}
set statusline+=%{fugitive#statusline()}%=
set statusline+=%w\ <%{&fileformat}>%\=\ [%o]\ %l,%c%V\/%L\ \ %P
set laststatus=2
let g:airline#extensions#tabline#enabled=1

" Remaps
nnoremap ; :
nnoremap j gj
nnoremap k gk
noremap tt :tabnew<cr>
noremap ,v :vsp^<cr>
noremap ,h :split^<cr>
nmap <silent> <Up> :wincmd k<CR>
nmap <silent> <Down> :wincmd j<CR>
nmap <silent> <Left> :wincmd h<CR>
nmap <silent> <Right> :wincmd l<CR>
nnoremap <silent> ,b :CtrlPBuffer<cr>
nnoremap <silent> <C-b> :CtrlPBuffer<cr>
map ,s :Rgrep<CR>
nmap ,gs :Gstatus<cr>
nmap ,gd :Gdiff<cr>
nmap ,gb :Gblame<cr>
noremap ,f :NERDTreeFind<cr>
noremap ,d :NERDTreeToggle<cr>

" grep.vim
au FileType qf nmap <buffer> <cr> <cr><c-w><c-p>
let Grep_Skip_Files = '*.bak *~ *tags *.log *.orig'
let Grep_Skip_Dirs = '.git .svn .hg .tmp .sass-cache bower_components node_modules'

" Autoclose
let g:AutoClosePairs={'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

" Rainbow
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Syntastic
let g:syntastic_check_on_open=0
let g:syntastic_echo_current_error=0
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=0

if has("termguicolors")
  set termguicolors
end

" MacVim setup
if has("gui_macvim")
  set guifont=Fira\ Code\ Retina:h12
  set guioptions=A
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set go-=L
end
