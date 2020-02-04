"set shell=/bin/zsh

syntax on
set nocompatible

"activate backspace for mac
:set backspace=2

"tabToSpace
:set tabstop=4 shiftwidth=4 "expandtab

"up and down
:nmap j gj
:nmap k gk

"search things
:set incsearch
:set ignorecase
:set smartcase
:set hlsearch
:nmap \q :nohlsearch<CR>

"\l for line toggle
:nmap \l :setlocal number!<CR>

"\o for paste window
:nmap \o :set paste!<CR>

"\f for tags
nmap \f :TagbarToggle<CR>

"highlighting
set t_ZH=[3m
set t_ZR=[23m
highlight Comment cterm=italic gui=italic
highlight ExtraWhitespace cterm=bold ctermbg=darkgreen guibg=darkgreen
hi LineTooLong cterm=bold ctermbg=red guibg=LightYellow
match ExtraWhitespace  /\s\+$/
match LineTooLong /\%>80v.\+/

"------------- Vundle Plugins ----------------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'
Plugin 'rust-lang/rust.vim'
Plugin 'majutsushi/tagbar'
Plugin 'easymotion/vim-easymotion'

"solarized colors
let g:solarized_termcolors=256
set background=light

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

"Supertab
let g:SuperTabDefaultCompletionType = '<C-n>'

" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

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
map <Leader>k <Plug>(easymotion-k)

" nerdtree
"nerdToggle
:nmap \e :NERDTreeToggle<CR>

call vundle#end()            " required
filetype plugin indent on    " required
:colorscheme solarized

packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
