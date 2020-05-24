set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set laststatus=0 ruler

set inccommand=split

" set colors
colorscheme jellybeans

" no bg for current line number
highlight CursorLineNr guibg=none

vnoremap <silent> <leader>c "*y<CR>
nnoremap <silent> <leader>g :Goyo 50%<CR>

" transparency
" highlight Normal ctermbg=none guibg=none
" highlight CursorLineNr ctermbg=none guibg=none

nnoremap <silent> <Space> @q

