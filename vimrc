filetype on
filetype off
set nocompatible
filetype plugin indent on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let vundle handle itself
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-pathogen'
Bundle 'vim-scripts/OmniCppComplete'
Bundle 'vim-scripts/flymaker'
Bundle 'vim-scripts/Markdown-syntax'
Bundle 'vim-scripts/VimOrganizer'
Bundle 'vim-scripts/pwdstatus.vim'
" Doesn't work without python 2.6 Bundle 'vim-scripts/Headlights'
Bundle 'vim-scripts/ctags.vim'
Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/surround.vim'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-script/The-NERD-Commenter'
Bundle 'vim-script/The-NERD-Tree'
Bundle 'vim-script/ack.vim'
" Don't Use pathogen
" call pathogen#infect()
" call pathogen#helptags()

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
