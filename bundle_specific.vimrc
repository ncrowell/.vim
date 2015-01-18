filetype on    " this is some weird bug fix for something  
filetype off   " to do with vundle or pathogen
" AKA it's a vim bug.

set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"vundle handles itself
let g:vundle_default_git_proto = 'git'
Plugin 'gmarik/vundle'
" why need this? (vundle needs it)
Plugin 'tpope/vim-pathogen'

source $MYVIMDIR/scripts/color.vim
source $MYVIMDIR/scripts/slow.vim
source $MYVIMDIR/scripts/fast.vim

Plugin 'gosukiwi/vim-atom-dark'
Plugin 'terryma/vim-expand-region'
"vnoremap v <Plug>(expand_region_expand)
"vnoremap <C-v> <Plug>(expand_region_shrink)

filetype plugin indent on
