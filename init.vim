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

"set leader
let mapleader=","

"\l for line toggle
:nmap \l :setlocal number!<CR>

"\o for paste window
:nmap \o :set paste!<CR>

"set list chars
set list listchars=tab:->\ ,trail:-,eol:⮠
"Plugin Section
call plug#begin()
  Plug 'dracula/vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  "Plug 'scrooloose/nerdtree'
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
  Plug 'luochen1990/rainbow', {'for': 'clojure'}
  Plug 'guns/vim-sexp',    {'for': 'clojure'}
  Plug 'liquidz/vim-iced', {'for': 'clojure'}
  Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}
call plug#end()

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
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
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

--nvim-navic
local navic = require("nvim-navic")

--nvim-lspconfig
require("lspconfig").clojure_lsp.setup{
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}
--require("lspconfig").pyright.setup{
--    on_attach = function(client, bufnr)
--        navic.attach(client, bufnr)
--   end
--}

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
