" initialize pugins

call plug#begin()

    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/NERDTree'

    " airline
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
    
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

call plug#end()

" display what's being pressed
set showcmd

" searching
set incsearch
set ignorecase

" airline
" set shortmess+=IFWstTcAq
" markdown
let vim_markdown_preview_github=1

" airline settings
" set noshowmode
" let g:airline_powerline_fonts = 1
" let g:airline_section_error = ''
" let g:airline_section_warning = ''
" let g:airline_section_y = ''
" let g:airline_section_c = ''
 
set ruler
set tabstop=4
set shiftwidth=4
set expandtab

" relative numbering
set relativenumber

set autoindent
filetype plugin indent on
syntax on


" setting colorschemes
set termguicolors
set t_Co=256

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

colorscheme jellybeans

" crt specific setting
" sets background to absolute black
highlight Normal ctermbg=black


" restore cursor position when opening a file
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" key bindings
map <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <Space> @q

" python
autocmd FileType python nnoremap <silent> <leader>r :w<CR>:!clear && python3 %<CR>
autocmd FileType python nnoremap <silent> <leader>i :w<CR>:!clear && bpython -q -i %<CR>

" rust
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'
autocmd FileType rust nnoremap <silent> <leader>r :RustRun<CR>
autocmd FileType rust nnoremap <silent> <leader>b :!cargo build<CR>

" c
autocmd FileType c nnoremap <silent> <leader>r :w<CR>:!clear && clang -o %:r % && ./%:r<CR>
autocmd FileType c nnoremap <silent> <leader>c :w<CR>:!clear && clang -o %:r %<CR>

nnoremap <silent> <leader>s :set hlsearch!<CR>
nnoremap <silent> <leader>n :set relativenumber!<CR>
vnoremap <silent> <leader>c :w !pbcopy<CR><CR>
vnoremap <silent> <leader>p :r !pbpaste<CR><CR>

" moving blocks of text
vnoremap <S-j> :m +1<CR>gv
vnoremap <S-k> :m -2<CR>gv

" split window
nnoremap <silent> <leader>h <C-w>h
nnoremap <silent> <leader>j <C-w>j
nnoremap <silent> <leader>k <C-w>k
nnoremap <silent> <leader>l <C-w>l

" open terminal at the bottom
set termwinsize=8x0
nnoremap <silent> <leader>5 :bel term<CR>

" enable project specific vimrc
set exrc
set secure
