" initialize pugins

call plug#begin()

    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/NERDTree'

    " syntax
    Plug 'sheerun/vim-polyglot'
    Plug 'vim-python/python-syntax'

    Plug 'nathanaelkane/vim-indent-guides'

    " distraction free writing
    Plug 'junegunn/goyo.vim'

    " colorschemes
    Plug 'ajh17/spacegray.vim'
    Plug 'joshdick/onedark.vim'
    Plug 'morhetz/gruvbox'
    Plug 'ayu-theme/ayu-vim'
    Plug 'dracula/vim'
    Plug 'nanotech/jellybeans.vim'
	Plug 'branwright1/salvation-vim'

    Plug 'chrisbra/Colorizer'

call plug#end()

" display what's being pressed
" set showcmd

" searching
set incsearch
set ignorecase

set ruler
set tabstop=4
set shiftwidth=4
set smarttab

set nohlsearch

set relativenumber

set autoindent
filetype plugin indent on
filetype plugin on
syntax on


" setting colorscheme specifics
set termguicolors

" onedark
"if (has("autocmd"))
"  augroup colorset
"      autocmd!
"      let s:back = { "gui": "none", "cterm": "none", "cterm16" : "none" }
"      autocmd ColorScheme * call onedark#set_highlight("Normal", { "bg": s:back })
"  augroup END
"endif



" jellybeans
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}

if has('termguicolors') && &termguicolors
  let g:jellybeans_overrides['background']['guibg'] = 'none'
endif " use terminal background, set vim's bg to transparent


" gruvbox
let g:gruvbox_contrast_dark = 'hard'

" seoul256
let g:seoul256_background = 233

" ayu
let ayucolor="mirage"

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

map <silent> <C-n> :NERDTreeToggle<CR>

"perl
autocmd FileType perl nnoremap <silent> <leader>r :w !perl<CR>

" python
autocmd FileType python nnoremap <silent> <leader>r :w !python3.8<CR>
autocmd FileType python vnoremap <silent> <leader>r :w !python3.8<CR>
autocmd FileType python nnoremap <silent> <leader>i :!bpython -q -i %<CR>
" autocmd FileType python silent !python3.8 % < input.txt > output.txt 2>&1 

let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

" rust
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'
autocmd FileType rust nnoremap <silent> <leader>r :RustRun<CR>
autocmd FileType rust nnoremap <silent> <leader>b :!cargo run<CR>

" c
autocmd FileType c nnoremap <silent> <leader>r :w<CR>:!./%:r<CR>
autocmd FileType c nnoremap <silent> <leader>c :w<CR>:!clang -o %:r %<CR>

" md
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

autocmd BufWritePost init.vim :silent! source %

nnoremap <silent> <leader>s :set hlsearch!<CR>
nnoremap <silent> <leader>n :set relativenumber!<CR>

" moving blocks of text
" vnoremap <S-j> :m +2<CR>gv
" vnoremap <S-k> :m -2<CR>gv

" split window
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

inoremap <C-z> <Esc>zta

" buffer navigation
nnoremap <silent> <leader>. :bn<CR>
nnoremap <silent> <leader>, :bp<CR>

" open terminal at the bottom
set splitright
nnoremap <silent> <leader>5 :bel term<CR>

" enable project specific vimrc
set exrc
set secure

map K k

set inccommand=split

set laststatus=0 ruler

colorscheme ayu

" no bg for current line number
highlight CursorLineNr guibg=none

vnoremap <silent> <leader>c "*y<CR>
nnoremap <silent> <leader>g :Goyo 50%<CR>

" transparency
" highlight Normal ctermbg=none guibg=none
" highlight CursorLineNr ctermbg=none guibg=none

nnoremap <silent> <Space> @q

" weird snippets
" autocmd FileType c nnoremap <C-c> :r !cat ~/.config/nvim/boiler_c.c<CR>3-vg_<C-g>

nnoremap <silent> <leader>C :ColorToggle<CR>

" e => everything
omap ae :<C-U>silent! normal! ggVG<CR>
vnoremap ae :<C-U>silent! normal! ggVG<CR>

" parens
onoremap inb :<C-u>normal! f(vib<Cr>
