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
Bundle 'tpope/vim-pathogen.git' 

" disable auto completion popup for python, b/c it was sucking
let g:acp_behaviorPythonOmniLength = -1
Bundle 'vim-scripts/AutoComplPop.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'vim-scripts/Markdown.git'
Bundle 'vim-scripts/VimOrganizer.git'
Bundle 'vim-scripts/ctags.vim.git'
Bundle 'vim-scripts/surround.vim.git'
Bundle 'vim-scripts/a.vim.git'
Bundle 'vim-scripts/The-NERD-tree.git'
" Automatic commenting!
Bundle 'vim-scripts/The-NERD-Commenter.git'
Bundle 'vim-scripts/ack.vim.git'
Bundle 'vim-scripts/SuperTab.git'
Bundle 'vim-scripts/SuperTab-continued..git'
" Colourful braces for easy recognition
Bundle 'vim-scripts/rainbow_parentheses.vim'
" Automatic closing of parentheses/braces/square brackets
Bundle 'vim-scripts/AutoClose.git'
" vim status bar
Bundle 'https://github.com/Lokaltog/vim-powerline.git'
" powerline configuration
set laststatus=2
let g:Powerline_symbols = 'fancy'
set t_Co=256
" git
Bundle 'tpope/vim-fugitive.git'
" align statements in parentheses?
"Bundle 'git://github.com/vim-scripts/Align.vim.git'
" aligning statements on a specific character, ie. equals sign
"Bundle 'git://github.com/vim-scripts/Align.git'
" COLOR SCHEMES
Bundle 'vim-scripts/badwolf.git'
Bundle 'altercation/vim-colors-solarized.git'

" needs python
if has("python")
    Bundle 'vim-scripts/Conque-Shell.git'
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
"set cmdheight=2
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

let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

"colorscheme desert
"colorscheme badwolf
"solarized options
syntax enable
set background=dark
let g:solarized_termcolors = 16
colorscheme solarized

" turn on the features of the rainbow_parentheses plugin *after* syntax
" highlighting commands are entered - otherwise, it won't work. At
" least, it didn't when I was using it for the first time, editing an
" Octave .m file.

