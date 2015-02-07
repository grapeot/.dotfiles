set nocompatible " must be the first line

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
set ek ru sc 
set nocp
 
" gui related settings
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
    set guifont=Droid\ Sans\ Mono\ for\ Powerline:h15
  endif
else
    set guifont=Consolas:h14
endif
set guioptions-=T
set guioptions-=R
set guioptions-=L
set guioptions-=r
set guioptions-=l
 
" key binding about window movement
set wmh=0
map <c-h> <c-w>h
map <c-l> <c-w>l
" and makefile (we make a more niubility make here)
function NBMake()
    if filereadable('Makefile')
        make
    else
        SCCompile
    endif
endfunction
map <F6> :call NBMake()<CR>
map <F5> :!`echo ./% \| sed 's/.cpp//'`<CR>

" Settings about plugins
map <Leader> <Plug>(easymotion-prefix)
let g:neocomplcache_enable_at_startup = 1
let g:indentLine_char = 'c'
filetype plugin indent on
map <F2> :NERDTreeToggle<CR>
map <Leader>a :Ack<CR>
map <Leader>g :TlistToggle<CR>
map <Leader>h :GundoToggle<CR>

let g:jedi#completions_command = "<C-N>"  " for jedi-vim
let g:jedi#use_tabs_not_buffers = 0   " for jedi-vim
set laststatus=2	" for airline
let g:airline#extensions#tabline#enabled = 1  " for airline
let g:airline_powerline_fonts = 1  " for airline
set hidden 	" for lusty
let g:SuperTabDefaultCompletionType = "context"  " for supertab
set completeopt=menuone,longest,preview  " for supertab
" au FileType python set omnifunc=jedi#complete " for supertab and jedi
let g:pep8_map='<leader>8' " for pep8
set grepprg=grep\ -nH\ $* " for vim-latex
let g:tex_flavor='latex' " for vim-latex
command GS Gstatus
command GC Gcommit
au BufRead,BufNewFile *.md set filetype=markdown

" python bindings
set foldmethod=indent
set foldlevel=99

" some robustness tricks 
command W w
command Q q
command WQ wq
