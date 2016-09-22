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

Plugin 'vim-airline/vim-airline-themes'

Plugin 'gosukiwi/vim-atom-dark'
Plugin 'terryma/vim-expand-region'
"vnoremap v <Plug>(expand_region_expand)
"vnoremap <C-v> <Plug>(expand_region_shrink)

Plugin 'kien/ctrlp.vim'
" Look at the most-recently-used files by default.
let g:ctrlp_cmd = 'CtrlPMRU'

" Faster ctrlp match

Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'tpope/vim-abolish'
Plugin 'flazz/vim-colorschemes'
Plugin 'benekastah/neomake'

filetype plugin indent on
