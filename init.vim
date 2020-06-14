set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

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

autocmd FileType c nnoremap <C-c> :r !cat ~/.config/nvim/boiler_c.c<CR>3-vg_<C-g>

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
