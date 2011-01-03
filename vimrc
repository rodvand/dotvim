" For pathogen plugin
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set bg=dark
set number
set vb

filetype plugin indent on
syntax on
colorscheme desert

" Change leader from \ to ,
let mapleader=","

" Shortcut for showing invisibles (tabs and newline)
nmap <leader>l :set list!<CR>

" Tab shortcuts 
nmap <leader>p :tabp<CR>
nmap <leader>n :tabn<CR>
nmap <leader>q :q<CR>
nmap <leader>t :tabnew<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Fast-opener for editing my .vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

" Set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

" Function to load templates
function! LoadTemplate()
   silent 0r ~/.vim/skel/tmpl.%:e
   " Highlight %VAR% with todo colour
   syn match Todo "%\u\+%" containedIn=ALL 
endfunction

" Gather all autocommands in one block
if has("autocmd")
    " Different make settings depending one the filtype

    " Python
    autocmd BufRead,BufNewFile *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
    autocmd BufRead,BufNewFile *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    autocmd BufRead,BufNewFile *.py nmap <F5> :!clear && python %<CR>
    " Tex-files
    autocmd BufRead,BufNewFile *.tex nmap <F5> :!clear && pdflatex \"$(pwd)/%\" &> /dev/null && evince "$(echo % \| sed 's/tex/pdf/')" &<CR> 
    " Php
    autocmd BufRead,BufNewFile *.php nmap <F5> :!php %<CR>
    " Java
    autocmd BufRead,BufNewFile *.java nmap <F5> :!javac % && clear && java "$(echo % \| sed 's/\.java//')" <CR>
    " C
    autocmd BufRead,BufNewFile *.c nmap <F5> :!clear && gcc % -o "$(echo % \| sed 's/\.c/.out/')"<CR>

    " Auto-source our .vimrc when writing to it
    autocmd bufwritepost .vimrc source $MYVIMRC

    " Template loading
    autocmd BufNewFile * call LoadTemplate()

endif

" Sudo write
cmap w!! %!sudo tee > /dev/null %

"Jump between %VAR% placeholders in Normal mode with
" <Ctrl-p>
nnoremap <c-p> /%\u.\{-1,}%<cr>c/%/e<cr>
"Jump between %VAR% placeholders in Insert mode with
" <Ctrl-p>
inoremap <c-p> <ESC>/%\u.\{-1,}%<cr>c/%/e<cr>
