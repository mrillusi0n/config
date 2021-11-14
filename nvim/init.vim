" Plugins {{{

call plug#begin()

" quality of life
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'neovim/nvim-lspconfig'

" completion framework
Plug 'hrsh7th/nvim-cmp'

" lsp completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'

" other useful completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" see hrsh7th's other plugins for more completion sources!

" to enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'

" Snippet engine
Plug 'hrsh7th/vim-vsnip'

" syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" language specific
Plug 'rust-lang/rust.vim'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" colorschemes
Plug 'ajh17/spacegray.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'
Plug 'bluz71/vim-nightfly-guicolors'

call plug#end()

" }}}

" Filetype Settings {{{

filetype plugin on
filetype indent on

" }}}

" Options {{{

set showcmd
set incsearch
set ruler
set tabstop=4
set shiftwidth=4
set smartcase
set smarttab
set ignorecase
set noexpandtab
set nohlsearch
set smartindent
set autoread
set hidden
set nowrap
set shortmess+=IFTc
set termguicolors
set inccommand=split
set laststatus=0
set splitright
set splitbelow
set noswapfile
set nobackup
set nowritebackup
set listchars=tab:→\ ,eol:¬,space:·,trail:•,extends:⟩,precedes:⟨

" }}}

" Rust Analyzer and LSP {{{

set completeopt=menuone,noinsert,noselect

" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
lua << EOF
local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        -- Automatically set inlay hints (type hints)
        autoSetHints = true,

        -- Whether to show hover actions inside the hover window
        -- This overrides the default hover handler 
        hover_with_actions = true,

        runnables = {
            -- whether to use telescope for selection menu or not
            use_telescope = true

            -- rest of the opts are forwarded to telescope
        },

        debuggables = {
            -- whether to use telescope for selection menu or not
            use_telescope = true

            -- rest of the opts are forwarded to telescope
        },

        -- These apply to the default RustSetInlayHints command
        inlay_hints = {

            -- Only show inlay hints for the current line
            only_current_line = false,

            -- Event which triggers a refersh of the inlay hints.
            -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
            -- not that this may cause  higher CPU usage.
            -- This option is only respected when only_current_line and
            -- autoSetHints both are true.
            only_current_line_autocmd = "CursorHold",

            -- wheter to show parameter hints with the inlay hints or not
            show_parameter_hints = true,

            -- prefix for parameter hints
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = "=> ",

            -- whether to align to the length of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7,

            -- The color of the hints
            highlight = "Comment",
        },

        hover_actions = {
            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
                {"╭", "FloatBorder"}, {"─", "FloatBorder"},
                {"╮", "FloatBorder"}, {"│", "FloatBorder"},
                {"╯", "FloatBorder"}, {"─", "FloatBorder"},
                {"╰", "FloatBorder"}, {"│", "FloatBorder"}
            },

            -- whether the hover action window gets automatically focused
            auto_focus = false
        },

        -- settings for showing the crate graph based on graphviz and the dot
        -- command
        crate_graph = {
            -- Backend used for displaying the graph
            -- see: https://graphviz.org/docs/outputs/
            -- default: x11
            backend = "x11",
            -- where to store the output, nil for no output stored (relative
            -- path from pwd)
            -- default: nil
            output = nil,
            -- true for all crates.io and external crates, false only the local
            -- crates
            -- default: true
            full = true,
        }
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {}, -- rust-analyer options

    -- debugging stuff
    dap = {
        adapter = {
            type = 'executable',
            command = 'lldb-vscode',
            name = "rt_lldb"
        }
    }
}

require('rust-tools').setup(opts)
EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF

" }}}

" Keymaps {{{

nnoremap <silent> <leader>s :set hlsearch!<CR>
nnoremap <silent> <leader>n :set relativenumber!<CR>

" split window
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" buffer navigation
nnoremap <silent> <leader>. :bn<CR>
nnoremap <silent> <leader>, :bp<CR>

" copy to system clip
vnoremap <silent> <leader>y "*y<CR>

map K k
map Y y$

map <Space> :

" telecope bindings
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>

" show list
nnoremap <silent> <Esc> :set list!<CR>

" normal escape in terminal
tnoremap <Esc> <C-\><C-n>

" }}}

" Custom Text Objects {{{

omap ae :<C-U>silent! normal! ggVG<CR>
vnoremap ae :<C-U>silent! normal! ggVG<CR>

" }}}

" Colorscheme Settings {{{

" everforest
let g:everforest_background = 'hard'
let g:everforest_disable_italic_comment = 1

" gruvbox
let g:gruvbox_background = 'hard'
let g:gruvbox_material_disable_italic_comment = 1

" ayu ['mirage'|'dark']
let ayucolor = 'dark'

" sonokai ['default'|'atlantis'|'andromeda'|'shusia'|'maia'|'espresso']
let g:sonokai_style = 'espresso'
let g:sonokai_disable_italic_comment = 1

colorscheme gruvbox-material

" }}}

" Transparency {{{

highlight Normal ctermbg=none guibg=none
highlight CursorLineNr ctermbg=none guibg=none
highlight EndOfBuffer ctermbg=none guibg=none

" }}}

" Treesitter Settings {{{

lua require 'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" ignore TS Errors
highlight link TSError Normal

" }}}

" Auto Commands {{{

augroup CSNIPPET
	autocmd!
	autocmd BufNewFile *.c :0r ~/.config/nvim/snippets/c/boiler.c
augroup END

augroup Terminal
	autocmd!
	autocmd BufWinEnter,WinEnter term://* startinsert
augroup END

" }}}

" vim:fileencoding=utf-8:foldmethod=marker
