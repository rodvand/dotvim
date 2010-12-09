set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set bg=dark
set number
filetype plugin indent on

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
    autocmd BufRead,BufNewFile *.c nmap <F5> :!clear && gcc %<CR>

    " Auto-source our .vimrc when writing to it
    autocmd bufwritepost .vimrc source $MYVIMRC

endif

" Sudo write
cmap w!! %!sudo tee > /dev/null %
