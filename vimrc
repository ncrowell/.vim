filetype on    " this is some
filetype off   " weird bug fix.
set nocompatible
filetype plugin indent on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let vundle handle itself
Bundle 'gmarik/vundle'

Bundle 'git://github.com/tpope/vim-pathogen.git' " why need this? (vundle needs it)

" doesn't work with vim 700
Bundle 'git://github.com/vim-scripts/AutoComplPop.git'
Bundle 'git://github.com/vim-scripts/OmniCppComplete.git'

" meh doesn't work
"    Bundle 'git://github.com/vim-scripts/AsyncCommand.git'
"    Bundle 'git://github.com/vim-scripts/flymaker.git'

Bundle 'git://github.com/vim-scripts/Markdown.git'
Bundle 'git://github.com/vim-scripts/pwdstatus.vim.git'
Bundle 'git://github.com/vim-scripts/VimOrganizer.git'
Bundle 'git://github.com/vim-scripts/ctags.vim.git'
Bundle 'git://github.com/vim-scripts/surround.vim.git'
Bundle 'git://github.com/vim-scripts/a.vim.git'
Bundle 'git://github.com/vim-scripts/The-NERD-tree.git'
Bundle 'git://github.com/vim-scripts/The-NERD-Commenter.git' " Automatic commenting!
Bundle 'git://github.com/vim-scripts/ack.vim.git'
Bundle 'git://github.com/vim-scripts/SuperTab.git'
Bundle 'git://github.com/vim-scripts/SuperTab-continued..git'
Bundle 'vim-scripts/rainbow_parentheses.vim'
"
" Bundle 'git://github.com/vim-scripts/taglist.vim.git' " Taglists!

" align statements in parentheses?
"Bundle 'git://github.com/vim-scripts/Align.vim.git'
" aligning statements on a specific character, ie. equals sign
"Bundle 'git://github.com/vim-scripts/Align.git'

" needs python
if has("python")
    Bundle 'git://github.com/vim-scripts/Conque-Shell.git'
endif

" Don't Use pathogen
" call pathogen#infect()
" call pathogen#helptags()

" Save folds across file open/close
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview

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
