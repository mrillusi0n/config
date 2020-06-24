" initialize pugins

call plug#begin()

    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/NERDTree'

    " markdown
    Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

    " syntax
    Plug 'sheerun/vim-polyglot'
    Plug 'chrisbra/csv.vim'
    " Plug 'vim-python/python-syntax'

    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'

    " Plug 'itchyny/lightline.vim'

    Plug 'nathanaelkane/vim-indent-guides'

    " distraction free writing
    Plug 'junegunn/goyo.vim'
     
    " colorschemes
    Plug 'ajh17/spacegray.vim'
    Plug 'joshdick/onedark.vim'
    Plug 'morhetz/gruvbox'
    Plug 'ayu-theme/ayu-vim'
    Plug 'junegunn/seoul256.vim'
    Plug 'dracula/vim'
    Plug 'phanviet/vim-monokai-pro'
    Plug 'nanotech/jellybeans.vim'
    Plug 'arcticicestudio/nord-vim'

    Plug 'chrisbra/Colorizer'

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
" let g:airline_section_warning = ''
 
set ruler
set tabstop=4
set shiftwidth=4
set expandtab

" dynamic cursor for Alacritty
" let &t_EI = "\<Esc>[2 q"
" let &t_SI = "\<Esc>[6 q"
" let &t_SR = "\<Esc>[4 q"

set relativenumber

set autoindent
filetype plugin indent on
filetype plugin on
syntax on


" setting colorschemes
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

" monokai pro
let g:lightline = {
            \ 'colorscheme': 'monokai_pro',
            \ }

" seoul256
let g:seoul256_background = 233

" ayu
let ayucolor="dark"

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

let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

" rust
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'
autocmd FileType rust nnoremap <silent> <leader>r :RustRun<CR>
autocmd FileType rust nnoremap <silent> <leader>b :!cargo build<CR>

" c
autocmd FileType c nnoremap <silent> <leader>r :w<CR>:!./%:r<CR>
autocmd FileType c nnoremap <silent> <leader>c :w<CR>:!clang -o %:r %<CR>

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

set laststatus=0 ruler
" let g:airline_power_line_fonts = 1

set inccommand=split

" set colors
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

" markdown

let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1

let g:csv_delim=','

nnoremap <silent> <leader>C :ColorToggle<CR>
