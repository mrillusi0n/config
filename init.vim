set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set laststatus=0 ruler
" let g:airline_power_line_fonts = 1

set inccommand=split

" making onedark have a transparent bg
if (has("autocmd"))
  augroup colorset
      autocmd!
      let s:back = { "gui": "none", "cterm": "none", "cterm16" : "none" }
      autocmd ColorScheme * call onedark#set_highlight("Normal", { "bg": s:back })
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

" weird snippets

autocmd FileType c nnoremap <C-c> :r !cat ~/.config/nvim/boiler_c.c<CR>3-vg_<C-g>

