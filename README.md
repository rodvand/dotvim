## Installation:

    git clone git@github.com:rodvand/dotvim.git ~/.vim

## Vim
### Create symlink:

    ln -s ~/.vim/vimrc ~/.vimrc

## Neovim:
### Create folder and symlink

    mkdir -p ~/.config/nvim
    ln -s ~/.vim/init.vim ~/.config/nvim/init.vim
    
### Add to you shell profile

    alias vim=nvim
    alias vi=nvim
    export VISUAL=nvim
