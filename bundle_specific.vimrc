filetype on    " this is some weird bug fix for something  
filetype off   " to do with vundle or pathogen
" it's probably a vim bug.

set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"vundle handles itself
let g:vundle_default_git_proto = 'git'
Bundle 'gmarik/vundle'
" why need this? (vundle needs it)
Bundle 'tpope/vim-pathogen'

source $MYVIMDIR/scripts/color.vim
source $MYVIMDIR/scripts/slow.vim
source $MYVIMDIR/scripts/fast.vim

Bundle 'terryma/vim-expand-region'
"vnoremap v <Plug>(expand_region_expand)
"vnoremap <C-v> <Plug>(expand_region_shrink)

filetype plugin indent on
