# vim configuration

Works for vim and [neovim](neovim.io)

    $ git clone --depth=1 https://github.com/ncrowell/.vim.git ~/.vim
    $ cd ~/.vim
    $ git submodule update --init bundle/vundle
    $ vim +PluginInstall

    # Make nvim work.
    $ mkdir -p ~/.config
    $ ln -s ~/.vim ~/.config/nvim
    $ ln -s ~/.vimrc ~/.config/nvim/init.vim

Updating plugin versions is `vim +PluginUpdate`.
