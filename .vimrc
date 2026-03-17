set nocompatible
syntax on
filetype plugin indent on

set shiftwidth=4 tabstop=4 expandtab
set smartindent autoindent
set number relativenumber
set scrolloff=3
set cursorline
set incsearch ignorecase smartcase
set nobackup
set backspace=indent,eol,start
set autoread autowrite
set laststatus=2
set hidden

silent! colorscheme wombat

set wmh=0
map <c-h> <c-w>h
map <c-l> <c-w>l

set foldmethod=indent
set foldlevel=99

au BufRead,BufNewFile *.md set filetype=markdown

command W w
command Q q
command WQ wq
