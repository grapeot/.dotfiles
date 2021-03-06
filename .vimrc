set nocompatible " must be the first line

if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

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
set scrolloff=3 
colorscheme wombat
set cursorline
set autochdir autoread autowrite
set autoread
set incsearch ignorecase smartcase
set nobackup
set bs=indent,eol,start
set ek ru sc 
set nocp
" Relative line number in normal mode
autocmd InsertEnter * :set norelativenumber nu
autocmd InsertLeave * :set rnu
 
" gui related settings
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
    set guifont=Droid\ Sans\ Mono\ for\ Powerline:h15
  endif
else
    set guifont=Consolas:h16
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
let g:indentLine_char = '|'
filetype plugin indent on
let g:tex_conceal= ''  " disable the newly released conceal mode of Vim 7.3
map <F2> :NERDTreeToggle<CR>
map <Leader>a :Ack<CR>
map <Leader>g :TlistToggle<CR>
map <Leader>h :GundoToggle<CR>

set laststatus=2	" for airline
let g:airline#extensions#tabline#enabled = 1  " for airline
let g:airline_powerline_fonts = 1  " for airline
set hidden 	" for lusty
"let g:SuperTabDefaultCompletionType = "context"  " for supertab
"set completeopt=menuone,longest,preview  " for supertab
let g:pep8_map='<leader>8' " for pep8
set grepprg=grep\ -nH\ $* " for vim-latex
let g:tex_flavor='latex' " for vim-latex
command GS Gstatus
command GC Gcommit
au BufRead,BufNewFile *.md set filetype=markdown

""""""""""""""""""""""""""""""""""""""""
" neocomplete configuration
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
""""""""""""""""""""""""""""""""""""""""

" Enable neosnippet
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" python bindings
set foldmethod=indent
set foldlevel=99

" views
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

" some robustness tricks 
command W w
command Q q
command WQ wq
