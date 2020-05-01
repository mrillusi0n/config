" initialize pugins

call plug#begin()

    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/NERDTree'

    " airline
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'

    Plug 'nathanaelkane/vim-indent-guides'
     
    Plug 'mattn/webapi-vim'
    Plug 'JamshedVesuna/vim-markdown-preview'

    " colorschemes
    Plug 'ajh17/spacegray.vim'
    Plug 'joshdick/onedark.vim'
    Plug 'morhetz/gruvbox'
    Plug 'ayu-theme/ayu-vim'
    Plug 'junegunn/seoul256.vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'nanotech/jellybeans.vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'drewtempelmeyer/palenight.vim'

    Plug 'gko/vim-coloresque'

    " 8.2
    " Plug 'vim/killersheep'

call plug#end()

" display what's being pressed
set showcmd

" searching
set incsearch
set ignorecase

set shortmess+=I

" airline settings
" set shortmess+=FWstTcAq
" set noshowmode
" let g:airline_powerline_fonts = 1
" let g:airline_section_error = ''
let g:airline_section_warning = ''
 
set ruler
set tabstop=4
set shiftwidth=4
set expandtab

" dynamic cursor for Alacritty
let &t_EI = "\<Esc>[2 q"
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"

set relativenumber

set autoindent
filetype plugin indent on
syntax on


" setting colorschemes
set termguicolors

" jellybeans
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}

if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif " use terminal background, set vim's bg to transparent


" gruvbox
let g:gruvbox_contrast_dark = 'soft'

" seoul256
let g:seoul256_background = 233

colorscheme jellybeans

set splitright
set splitbelow

set scrolloff=2

set noswapfile
set nobackup
set nowritebackup

" crt specific setting
" sets background to absolute black
" highlight Normal ctermbg=black

" restore cursor position when opening a file
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" key bindings
map <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <Space> @q

" markdown
autocmd FileType markdown colorscheme default

" python
autocmd FileType python nnoremap <silent> <leader>r :w !python3<CR>
autocmd FileType python vnoremap <silent> <leader>r :w !python3<CR>
autocmd FileType python nnoremap <silent> <leader>i :!clear && bpython -q -i %<CR>

" rust
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'
autocmd FileType rust nnoremap <silent> <leader>r :RustRun<CR>
autocmd FileType rust nnoremap <silent> <leader>b :!cargo build<CR>

" c
autocmd FileType c nnoremap <silent> <leader>r :w<CR>:!clear && ./%:r<CR>
autocmd FileType c nnoremap <silent> <leader>c :w<CR>:!clear && clang -o %:r %<CR>

nnoremap <silent> <leader>s :set hlsearch!<CR>
nnoremap <silent> <leader>n :set relativenumber!<CR>
vnoremap <silent> <leader>c :w !pbcopy<CR><CR>
vnoremap <silent> <leader>p :r !pbpaste<CR><CR>

" moving blocks of text
" vnoremap <S-j> :m +2<CR>gv
" vnoremap <S-k> :m -2<CR>gv

" split window
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" buffer navigation
nnoremap <silent> <leader>. :bn<CR>
nnoremap <silent> <leader>, :bp<CR>

" open terminal at the bottom
set splitright
nnoremap <silent> <leader>5 :bel term<CR>

" enable project specific vimrc
set exrc
set secure

