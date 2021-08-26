" ████████╗██╗░░██╗███████╗████████╗███████╗░█████╗░░█████╗░██╗░░██╗██████╗░
" ╚══██╔══╝██║░░██║██╔════╝╚══██╔══╝██╔════╝██╔══██╗██╔══██╗██║░░██║██╔══██╗
" ░░░██║░░░███████║█████╗░░░░░██║░░░█████╗░░███████║██║░░╚═╝███████║██████╔╝
" ░░░██║░░░██╔══██║██╔══╝░░░░░██║░░░██╔══╝░░██╔══██║██║░░██╗██╔══██║██╔══██╗
" ░░░██║░░░██║░░██║███████╗░░░██║░░░███████╗██║░░██║╚█████╔╝██║░░██║██║░░██║
" ░░░╚═╝░░░╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝

" initialize plugins
call plug#begin()

" quality of life
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'

" syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" language specific
Plug 'rust-lang/rust.vim'

" colorschemes
Plug 'ajh17/spacegray.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim'
Plug 'nanotech/jellybeans.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/everforest'
Plug 'sainnhe/edge'
Plug 'sainnhe/sonokai'
Plug 'ghifarit53/tokyonight-vim'

call plug#end()

set showcmd
set incsearch
set ruler
set tabstop=4
set shiftwidth=4
set smarttab
set noexpandtab
set nohlsearch
set number
set autoindent
set autoread
set hidden
set nowrap
set shortmess+=IFT
set termguicolors
set inccommand=split
set laststatus=0
set splitright
set splitbelow
set scrolloff=2
set noswapfile
set nobackup
set nowritebackup

filetype plugin indent on
syntax on

" rust
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'

nnoremap <silent> <leader>s :set hlsearch!<CR>
nnoremap <silent> <leader>n :set relativenumber!<CR>

" split window
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" buffer navigation
nnoremap <silent> <leader>. :bn<CR>
nnoremap <silent> <leader>, :bp<CR>

" copy to system clip
vnoremap <silent> <leader>y "*y<CR>

map K k
map Y y$

map <Space> :

" custom text object: `e` for everyting
omap ae :<C-U>silent! normal! ggVG<CR>
vnoremap ae :<C-U>silent! normal! ggVG<CR>

" plugin specific mappings
map <silent> <C-n> :NERDTreeToggle<CR>

" everforest
let g:everforest_background = 'hard'

" ayu
let ayucolor = "mirage"

colorscheme everforest

" transparency
highlight Normal ctermbg=none guibg=none
highlight CursorLineNr ctermbg=none guibg=none
highlight EndOfBuffer ctermbg=none guibg=none

" ignore TS Errors
highlight link TSError Normal

lua require 'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" normal escape in terminal
tnoremap <Esc> <C-\><C-n>

augroup CSNIPPET
	autocmd!
	autocmd BufNewFile *.c :0r ~/.config/nvim/snippets/c/boiler.c
augroup END

augroup Terminal
	autocmd!
	autocmd BufWinEnter,WinEnter term://* startinsert
augroup END
