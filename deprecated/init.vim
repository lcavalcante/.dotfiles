set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive

set hlsearch                " highlight search 
set incsearch               " incremental search

set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents

set autoindent              " indent a new line the same amount as the line just typed
"set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
"set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
"set spell                 " enable spell check (may need to download language package)
"set noswapfile            " disable creating swap file
set backupdir=~/.cache/vim " Directory to store backup files.

"open new split panes to right and below
set splitright
set splitbelow

"modeline
set modeline
"set leader
let mapleader=","

"\l for line toggle
:nmap \l :setlocal number!<CR>

"\o for paste window
:nmap \o :set paste!<CR>

"set list chars
set list listchars=tab:->\ ,trail:-,eol:⮠,space:·,extends:⟩,precedes:⟨
"Plugin Section
call plug#begin()
  Plug 'dracula/vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'quangnguyen30192/cmp-nvim-ultisnips'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'preservim/nerdcommenter'
  Plug 'mhinz/vim-startify'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'easymotion/vim-easymotion'
  Plug 'kien/ctrlp.vim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'SmiteshP/nvim-gps'
  Plug 'camspiers/animate.vim'
  Plug 'camspiers/lens.vim'
  Plug 'romgrk/barbar.nvim'
  Plug 'SmiteshP/nvim-navic'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'williamboman/mason.nvim'
  Plug 'luochen1990/rainbow'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'ray-x/go.nvim', {'for': 'go'}
  Plug 'ray-x/guihua.lua', {'for': 'go'}
  Plug 'guns/vim-sexp',    {'for': 'clojure'}
  Plug 'liquidz/vim-iced', {'for': 'clojure'}
  Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}
call plug#end()

"autocomplete
set completeopt=menu,menuone,noselect

"theme
"color schemes
 if (has("termguicolors"))
 set termguicolors
 endif
 syntax enable
 "colorscheme evening
colorscheme dracula
set t_ZH=[3m
set t_ZR=23m
highlight Comment cterm=italic gui=italic


" Move to previous/next
nmap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nmap <silent>    <A-.> <Cmd>BufferNext<CR>
" Re-order to previous/next
nmap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nmap <silent>    <A->> <Cmd>BufferMoveNext<CR>
" Goto buffer in position...
nmap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nmap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nmap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nmap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nmap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nmap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nmap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nmap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nmap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nmap <silent>    <A-0> <Cmd>BufferLast<CR>
" Pin/unpin buffer
nmap <silent>    <A-p> <Cmd>BufferPin<CR>
" Close buffer
nmap <silent>    <A-c> <Cmd>BufferClose<CR>
" Sort automatically by...
nmap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
nmap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
nmap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
nmap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>

" nerdtree
"nerdToggle
nmap \e :NvimTreeToggle<CR>

"lens window resizing
let g:lens#disabled_filetypes = ['NvimTree', 'fzf']
nmap <silent> \<Up>    :call animate#window_delta_height(10)<CR>
nmap <silent> \<Down>  :call animate#window_delta_height(-10)<CR>
nmap <silent> \<Left>  :call animate#window_delta_width(10)<CR>
nmap <silent> \<Right> :call animate#window_delta_width(-10)<CR>

"rainbow parenthesis
let g:rainbow_active = 1

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

"ctrlp
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -c --exclude-standard --recurse-submodules | grep -x -v "$( git ls-files -d --exclude-standard )" ; git ls-files -o --exclude-standard', 'find %s -type f' ]
nmap \f :CtrlPTag<cr>

"vim-iced
map <Leader>s <Plug>(iced_slurp)
map <Leader>b <Plug>(iced_barf)
aug VimIcedAutoFormatOnWriting
  au!
  " Format whole buffer on writing files
  au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSyncAll'

  " Format only current form on writing files
  " au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSync'
aug END

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Enable vim-iced's default key mapping
" This is recommended for newbies
let g:iced_enable_default_key_mappings = v:true

"configure LUA plugins
lua << END
--nvim-gps
---require("nvim-gps").setup()
---local gps = require("nvim-gps")

--go-nvim
require('go').setup()

--nvim-navic
local navic = require("nvim-navic")

--nvim-cmp
local cmp = require('cmp')

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

--nvim-lspconfig
require("mason").setup()

local configs = require('lspconfig/configs')
configs.zk = {
  default_config = {
    cmd = {'zk', 'lsp'},
    filetypes = {'markdown'},
    root_dir = function()
      return vim.loop.cwd()
    end,
    settings = {}
  };
}

require("lspconfig").zk.setup({ on_attach = function(client, buffer) 
    capabilities = capabilities
    end 
})

require("lspconfig").clojure_lsp.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}
require("lspconfig").pyright.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
   end
}
require("lspconfig").gopls.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
   end
}

--nvim-tree
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {{ navic.get_location, cond = navic.is_available }},
    lualine_y = {'encoding', 'fileformat', 'filetype'},
    lualine_z = {'progress', 'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

END
