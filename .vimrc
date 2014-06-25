"Initialize pathogen
filetype off
call pathogen#incubate()
call pathogen#helptags()

" regular settings
syntax on
set si ai nu et
set shiftwidth=4
set tabstop=4
set bs=2
colorscheme wombat
set cursorline
set autochdir autoread autowrite
set autoread
set incsearch ignorecase smartcase
set nobackup
set bs=indent,eol,start
set nocp
set ek ru sc 
 
" gui related settings
set guifont=consolas:h16
set guioptions-=T
set guioptions-=R
set guioptions-=L
set guioptions-=r
set guioptions-=l
 
" key binding about window movement
set wmh=0
map <c-j> <c-w>j<c-w>_
map <c-k> <c-w>k<c-w>_
map <c-h> <c-w>h
map <c-l> <c-w>l

" Settings about plugins
filetype plugin indent on
map <F2> :NERDTreeToggle<CR>
map <Leader>h :GundoToggle<CR>

set laststatus=2	" for airline
let g:airline_powerline_fonts = 1  " for airline
set hidden 	" for lusty
let g:SuperTabDefaultCompletionType = "context"  " for supertab
set completeopt=menuone,longest,preview  " for supertab
au FileType python set omnifunc=pythoncomplete#Complete	" for supertab
let g:pep8_map='<leader>8' " for pep8

au BufRead,BufNewFile *.md set filetype=markdown

" latex-related settings
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" python bindings
set foldmethod=indent
set foldlevel=99

" some robustness tricks 
command W w
command Q q
command WQ wq
