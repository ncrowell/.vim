# Installing

### First, get this repo with: `git clone --depth=1 https://github.com/ncrowell/.vim.git ~/.vim`

### Now, just run `bash ~/.vim/README.md` to run all the commands as they are listed below.

### Checkout vundle package manager, and install plugins (takes a few minutes of downloading):

    cd ~/.vim
    git submodule update --init bundle/vundle
    vim +PluginInstall

### Finally, make nvim work.

    mkdir -p ~/.config
    ln -s ~/.vim ~/.config/nvim
    ln -s ~/.vimrc ~/.config/nvim/init.vim

### Updating plugins is just `vim +PluginUpdate`
