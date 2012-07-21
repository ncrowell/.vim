filetype on    " this is some
filetype off   " weird bug fix. FOR WHAT???
set nocompatible
filetype plugin indent on

let mapleader = ','

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"vundle handles itself
Bundle 'gmarik/vundle'

" why need this? (vundle needs it)
Bundle 'git://github.com/tpope/vim-pathogen.git' 

" disable auto completion popup for python, b/c it was sucking
let g:acp_behaviorPythonOmniLength = -1
Bundle 'git://github.com/vim-scripts/AutoComplPop.git'
Bundle 'https://github.com/scrooloose/syntastic.git'
Bundle 'git://github.com/vim-scripts/Markdown.git'
Bundle 'git://github.com/vim-scripts/VimOrganizer.git'
Bundle 'git://github.com/vim-scripts/ctags.vim.git'
Bundle 'git://github.com/vim-scripts/surround.vim.git'
Bundle 'git://github.com/vim-scripts/a.vim.git'
Bundle 'git://github.com/vim-scripts/The-NERD-tree.git'
" Automatic commenting!
Bundle 'git://github.com/vim-scripts/The-NERD-Commenter.git'
Bundle 'git://github.com/vim-scripts/ack.vim.git'
Bundle 'git://github.com/vim-scripts/SuperTab.git'
Bundle 'git://github.com/vim-scripts/SuperTab-continued..git'
" Colourful braces for easy recognition
Bundle 'vim-scripts/rainbow_parentheses.vim'
" Automatic closing of parentheses/braces/square brackets
Bundle 'https://github.com/vim-scripts/AutoClose.git'
" vim status bar
Bundle 'https://github.com/Lokaltog/vim-powerline.git'
" powerline configuration
set laststatus=2
let g:Powerline_symbols = 'fancy'
set t_Co=256
" git
Bundle 'git://github.com/tpope/vim-fugitive.git'
" align statements in parentheses?
"Bundle 'git://github.com/vim-scripts/Align.vim.git'
" aligning statements on a specific character, ie. equals sign
"Bundle 'git://github.com/vim-scripts/Align.git'
" COLOR SCHEMES
Bundle 'git://github.com/vim-scripts/badwolf.git'
Bundle 'https://github.com/vim-scripts/Solarized.git'

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

" Better completion
:set completeopt=longest,menuone
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Basically this entire block of stuff is courtesy of Steve Losh
" Oh no, I really need to edit my ~/.vimrc RIGHT NOW
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" Move lines downwards or upwards
noremap - ddp
noremap _ ddP
" I hate pressing 0 and $ to move to beginning and ends of lines
nnoremap H ^
nnoremap L $
" Be kind to your hands
inoremap jk <esc>
inoremap fj <esc>
inoremap <esc> <nop>
inoremap <esc>: <nop>
" Moving on long lines makes more sense this way
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" Easer moving in split windows
nnoremap <c-j> :wincmd j<cr>
nnoremap <c-k> :wincmd k<cr>
nnoremap <c-h> :wincmd h<cr>
nnoremap <c-l> :wincmd l<cr>
" Replace the default <c-l> mapping (to redraw the screen) and add the removal of search highlighting
nnoremap <leader>r :nohl<CR><C-L>

" Save when losing focus
augroup save_my_files
    autocmd!
    au FocusLost * :silent! wall
augroup END
" Resize splits when the window is resized
augroup resize_automatically
    autocmd!
    au VimResized * :wincmd =
augroup END

" This is different behavior, but I prefer it.
nnoremap o o<esc>
nnoremap O O<esc>
" yank line and paste
nnoremap yp yyp

" courtesy of the vim wiki: display the syntax highlighting groups
" underneath the cursor
map <F7> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set ai
set nostartofline
" display column number in status bar
set ruler
" always show the status line
set laststatus=2

set confirm
set mouse=a
set cmdheight=2
set ignorecase
set notimeout ttimeout ttimeoutlen=200
set number

nnoremap ; :
nnoremap , ;

" fold inside of braces
nore @k zfa{

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

"colorscheme desert
"colorscheme badwolf
" solarized options
syntax enable
set t_Co=16
set background=dark
if (!has("gui_running"))
    " disable italics, because they were coming out incorrectly for some
    " reason, only when using vim in the console.
    let g:solarized_italic = 0
endif
colorscheme solarized

" turn on the features of the rainbow_parentheses plugin *after* syntax
" highlighting commands are entered - otherwise, it won't work. At
" least, it didn't when I was using it for the first time, editing an
" Octave .m file.

