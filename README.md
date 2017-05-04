# vim configuration

Works for vim and [neovim](neovim.io). Here's how to get it working (just needs a few minutes of downloading for the plugins):

    $ git clone --depth=1 https://github.com/ncrowell/.vim.git ~/.vim
    $ cd ~/.vim
    $ git submodule update --init bundle/vundle
    $ vim +PluginInstall

    # Make nvim work.
    $ mkdir -p ~/.config
    $ ln -s ~/.vim ~/.config/nvim
    $ ln -s ~/.vimrc ~/.config/nvim/init.vim

Updating plugin versions is `vim +PluginUpdate`.
