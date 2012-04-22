" Use vim-update-bundles with pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
" Bundle: tpope/vim-pathogen
" Bundle: vim-scripts/OmniCppComplete
" Bundle: vim-scripts/flymaker
" Bundle: vim-scripts/Markdown-syntax
" Bundle: vim-scripts/VimOrganizer
" Bundle: vim-scripts/pwdstatus.vim
" Bundle: vim-scripts/Headlights
" Use pathogen
call pathogen#infect()
call pathogen#helptags()

set nocompatible
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
filetype plugin indent on

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
