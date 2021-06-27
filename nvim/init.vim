
 " ████████╗██╗░░██╗███████╗████████╗███████╗░█████╗░░█████╗░██╗░░██╗██████╗░
 " ╚══██╔══╝██║░░██║██╔════╝╚══██╔══╝██╔════╝██╔══██╗██╔══██╗██║░░██║██╔══██╗
 " ░░░██║░░░███████║█████╗░░░░░██║░░░█████╗░░███████║██║░░╚═╝███████║██████╔╝
 " ░░░██║░░░██╔══██║██╔══╝░░░░░██║░░░██╔══╝░░██╔══██║██║░░██╗██╔══██║██╔══██╗
 " ░░░██║░░░██║░░██║███████╗░░░██║░░░███████╗██║░░██║╚█████╔╝██║░░██║██║░░██║
 " ░░░╚═╝░░░╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝

" PLUGINS

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" language specific
Plug 'rust-lang/rust.vim'

" colorschemes
Plug 'ajh17/spacegray.vim'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim'
Plug 'nanotech/jellybeans.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/everforest'
Plug 'sainnhe/edge'
Plug 'sainnhe/sonokai'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'ghifarit53/tokyonight-vim'

call plug#end()

runtime macros/matchit.vim

set incsearch
set ruler
set tabstop=4 shiftwidth=4 smarttab noexpandtab
set nohlsearch
set relativenumber
set autoindent
set autoread
set hidden
set shortmess+=IFT
set termguicolors
set splitright
set splitbelow
set scrolloff=2
set noswapfile
set nobackup
set nowritebackup
set inccommand=split
set exrc secure
set mouse=a
set laststatus=0 ruler

filetype plugin indent on
syntax on

" PLUGIN SETTINGS

" everforest
let g:everforest_background = 'hard'

" ayu
let ayucolor="mirage"

" python syntax
let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

" rust
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'

" source config on write (causing slowness)
" autocmd BufWritePost init.vim :silent! source %

" KEYBINDS

map K k
map Y y$
map <Space> :
map <silent> <C-n> :NERDTreeToggle<CR>
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

" copy to system clipboard
vnoremap <silent> <leader>y "*y<CR>

" normal escape in terminal
tnoremap <Esc> <C-\><C-n>

" CUSTOM TEXT OBJECTS

" e => everything
omap ae :<C-U>silent! normal! ggVG<CR>
vnoremap ae :<C-U>silent! normal! ggVG<CR>

" AUTO COMMANDS

augroup CSNIPPET
	autocmd!
	autocmd BufNewFile *.c :0r ~/.config/nvim/snippets/c/boiler.c
augroup END

augroup TERMINAL
	autocmd!
	autocmd BufWinEnter,WinEnter term://* startinsert
augroup END

" COLORS & HIGHLIGHTS

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

colorscheme tokyonight

" transparency
highlight Normal ctermbg=none guibg=none
highlight CursorLineNr ctermbg=none guibg=none
highlight EndOfBuffer ctermbg=none guibg=none

" no bg for current line number
" highlight CursorLineNr guibg=none
