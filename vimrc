set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set bg=dark
set number
set vb
set hlsearch
set title

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

" Fast-opener for editing my .vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

" Set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

" Sudo write
cmap w!! %!sudo tee > /dev/null %

" Code folding
set foldmethod=indent
set foldlevel=99

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
