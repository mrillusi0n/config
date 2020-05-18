set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set laststatus=0 ruler

set inccommand=split

" set colors
colorscheme jellybeans

" transparency
" highlight Normal ctermbg=none guibg=none
" highlight LineNr ctermbg=none guibg=none
" highlight CursorLineNr guibg=none

vnoremap <silent> <leader>c "*y<CR>

" set the leader key
let mapleader=" "

