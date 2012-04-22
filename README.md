## History

Followed the instructions at

  http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

which recommended a standalone repository for .vimrc and vim plugins.

QED

Installation:

    git clone git://github.com/nelstrom/dotvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update
