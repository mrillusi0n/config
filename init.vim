set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set laststatus=0 ruler

set inccommand=split

" custom onedark colors
if (has("autocmd"))
  augroup colorset
      autocmd!
      let s:back = { "gui": "none", "cterm": "145", "cterm16" : "7" }
      autocmd ColorScheme * call onedark#set_highlight("Normal", { "bg": s:back }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif


" set colors
colorscheme onedark

" no bg for current line number
highlight CursorLineNr guibg=none

vnoremap <silent> <leader>c "*y<CR>
nnoremap <silent> <leader>g :Goyo 50%<CR>

" transparency
" highlight Normal ctermbg=none guibg=none
" highlight CursorLineNr ctermbg=none guibg=none

nnoremap <silent> <Space> @q

