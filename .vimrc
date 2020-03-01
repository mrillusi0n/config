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

" set noshowmode
" let g:airline_powerline_fonts = 1
" let g:airline_section_error = ''
" let g:airline_section_warning = ''
" let g:airline_section_y = ''
" let g:airline_section_c = ''
" 
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

" gruvbox
let g:gruvbox_contrast_dark = 'hard'

" seoul256
let g:seoul256_background = 233

colorscheme onedark

" crt specific setting
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
autocmd FileType python nnoremap <silent> <F9> :w<CR>:!clear && python3 %<CR>
autocmd FileType python nnoremap <silent> <C-z> :w<CR>:!clear && bpython -i %<CR>

" rust
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'


nnoremap <silent> <leader>g :set hlsearch!<CR>
nnoremap <silent> <leader>r :set relativenumber!<CR>
vnoremap <silent> <leader>c :w !pbcopy<CR><CR>
vnoremap <silent> <leader>p :r !pbpaste<CR><CR>

" split window
nnoremap <silent> <leader>h <C-w>h
nnoremap <silent> <leader>j <C-w>j
nnoremap <silent> <leader>k <C-w>k
nnoremap <silent> <leader>l <C-w>l
