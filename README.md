# Installing

### 1. `git clone --depth=1 https://github.com/ncrowell/.vim.git ~/.vim`

### 2. `bash ~/.vim/README.md` will run all the commands as they are listed below.

### Checkout vundle package manager, and install plugins (takes a few minutes of downloading):

    cd ~/.vim
    git submodule update --init bundle/vundle
    vim +PluginInstall

### Make nvim work.

    mkdir -p ~/.config
    ln -s ~/.vim ~/.config/nvim
    ln -s ~/.vimrc ~/.config/nvim/init.vim

### Updating plugins is just `vim +PluginUpdate`
