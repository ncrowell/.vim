filetype on
filetype off
set nocompatible
filetype plugin indent on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let vundle handle itself
Bundle 'gmarik/vundle'

Bundle 'git://github.com/tpope/vim-pathogen.git'
" Bundle 'git://github.com/vim-scripts/AutoComplPop.git' doesn't work
" with vim 700
Bundle 'git://github.com/vim-scripts/OmniCppComplete.git'
Bundle 'git://github.com/vim-scripts/flymaker.git'
Bundle 'git://github.com/vim-scripts/Markdown.git'
Bundle 'git://github.com/vim-scripts/pwdstatus.vim.git'
Bundle 'git://github.com/vim-scripts/VimOrganizer.git'
" Doesn't work without python 2.6 Bundle 'vim-scripts/Headlights'
Bundle 'git://github.com/vim-scripts/ctags.vim.git'
Bundle 'git://github.com/vim-scripts/surround.vim.git'
Bundle 'git://github.com/vim-scripts/a.vim.git'
Bundle 'git://github.com/vim-scripts/The-NERD-tree.git'
Bundle 'git://github.com/vim-scripts/The-NERD-Commenter.git'
Bundle 'git://github.com/vim-scripts/ack.vim.git'
" Don't Use pathogen
" call pathogen#infect()
" call pathogen#helptags()

" Save folds across file open/close
au BufWinLeave * mkview
au BufWinEnter * silent loadview

set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set ai
set nostartofline
set ruler
set laststatus=2
set confirm
set mouse=a
set cmdheight=2
syntax on
set ignorecase
set notimeout ttimeout ttimeoutlen=200
set number

nore ; :
nore , ;

nore @k zfa{

autocmd FileType text setlocal textwidth=72

set textwidth=72
set shiftwidth=4
set tabstop=4
set softtabstop=2
set expandtab
set laststatus=2
set showmatch
set incsearch
set cindent shiftwidth=4
set cinoptions={0
set cot=menuone

let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

colorscheme desert
