# Installing. (just run `bash README.md` to run all the commands.

## Grab this repo with: git clone --depth=1 https://github.com/ncrowell/.vim.git ~/.vim

## Checkout vundle package manager, and install plugins (takes a few minutes of downloading):

    cd ~/.vim
    git submodule update --init bundle/vundle
    vim +PluginInstall

## Make nvim work

    mkdir -p ~/.config
    ln -s ~/.vim ~/.config/nvim
    ln -s ~/.vimrc ~/.config/nvim/init.vim

## Updating plugins

    vim +PluginUpdate
