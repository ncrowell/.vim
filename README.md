## Maintaining

TODO: How do I update packages these days? I don't really remember. - 2016-09-21

## Installing

Grab:

    git clone git@github.com:ncrowell/.vim.git ~/.vim

Update plugin submodules, and install plugins:

    cd ~/.vim
    git submodule update --init
    vim +PluginInstall +qall
