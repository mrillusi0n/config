" initialize plugins
call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/NERDTree'

" syntax
Plug 'sheerun/vim-polyglot'
Plug 'vim-python/python-syntax'

Plug 'rust-lang/rust.vim'

Plug 'nathanaelkane/vim-indent-guides'

" colorschemes
Plug 'ajh17/spacegray.vim'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim'
Plug 'nanotech/jellybeans.vim'
Plug 'branwright1/salvation-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/forest-night'

Plug 'chrisbra/Colorizer'

call plug#end()

" display what's being pressed
set showcmd

" searching
set incsearch
set ignorecase

set ruler
set tabstop=4 shiftwidth=4 smarttab

set nohlsearch
set relativenumber
set autoindent
set autoread

filetype plugin indent on
syntax on

set shortmess=I

" setting colorscheme specifics
set termguicolors

" ayu
let ayucolor="mirage"

set splitright
set splitbelow

set scrolloff=2

set noswapfile
set nobackup
set nowritebackup

" restore cursor position when opening a file
autocmd BufReadPost *
			\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
			\ |   exe "normal! g`\""
			\ | endif

map <silent> <C-n> :NERDTreeToggle<CR>

let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

" rust
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'

" source config on write (causing slowness)
" autocmd BufWritePost init.vim :silent! source %

nnoremap <silent> <leader>s :set hlsearch!<CR>
nnoremap <silent> <leader>n :set relativenumber!<CR>

" split window
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

inoremap <C-z> <Esc>zta

" buffer navigation
nnoremap <silent> <leader>. :bn<CR>
nnoremap <silent> <leader>, :bp<CR>

" enable mouse in all modes
set mouse=a

" enable project specific vimrc
set exrc secure

map K k

set inccommand=split

set laststatus=0 ruler

colorscheme forest-night

" no bg for current line number
highlight CursorLineNr guibg=none

nnoremap <Space> :

vnoremap <silent> <leader>c "*y<CR>
nnoremap <silent> <leader>g :Goyo 50%<CR>

" transparency
highlight Normal ctermbg=none guibg=none
highlight CursorLineNr ctermbg=none guibg=none

" weird snippets
" autocmd FileType c nnoremap <C-c> :r !cat ~/.config/nvim/boiler_c.c<CR>3-vg_<C-g>

nnoremap <silent> <leader>C :ColorToggle<CR>

" e => everything
omap ae :<C-U>silent! normal! ggVG<CR>
vnoremap ae :<C-U>silent! normal! ggVG<CR>

" parens
onoremap inb :<C-u>normal! f(vib<Cr>
