filetype on    " this is some
filetype off   " weird bug fix. FOR WHAT??? something to do with pathogen?
set nocompatible
 " I think this is for pathogen
filetype plugin indent on

let mapleader = ','

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"vundle handles itself
Bundle 'gmarik/vundle'

" why need this? (vundle needs it)
Bundle 'tpope/vim-pathogen'

" disable auto completion popup for python, b/c it was sucking
let g:acp_behaviorPythonOmniLength = -1
Bundle 'vim-scripts/AutoComplPop'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/Markdown'

" Tab completion
Bundle 'ervandew/supertab'

" git
Bundle 'tpope/vim-fugitive'

"Bundle 'vim-scripts/VimOrganizer'
Bundle 'vim-scripts/ctags.vim'

Bundle 'vim-scripts/surround.vim'
Bundle 'vim-scripts/a.vim'

Bundle 'vim-scripts/The-NERD-tree'
" Automatic commenting!
Bundle 'vim-scripts/The-NERD-Commenter'

Bundle 'vim-scripts/ack.vim'

" Colourful braces
Bundle 'vim-scripts/rainbow_parentheses.vim'
" Automatic closing of parentheses/braces/square brackets
Bundle 'vim-scripts/AutoClose'

" vim status bar
if $HAVE_VIM_POWERLINE_FONT == "TRUE"
    Bundle 'Lokaltog/vim-powerline'
else
    Bundle 'millermedeiros/vim-statline'
    let g:statline_fugitive = 1
    let g:statline_filename_relative = 1
endif



" must go faster
Bundle 'Lokaltog/vim-easymotion'

" COLOR SCHEMES
Bundle 'vim-scripts/badwolf'
Bundle 'altercation/vim-colors-solarized'

" powerline configuration
set laststatus=2
let g:Powerline_symbols = 'unicode'
" align statements in parentheses?
"Bundle 'git://github.com/vim-scripts/Align.vim.git'
" aligning statements on a specific character, ie. equals sign
"Bundle 'git://github.com/vim-scripts/Align.git'

" maybe I'll use this someday
Bundle 'sjl/gundo.vim'

" Wait... is this right?
" needs python
if has("python")
    Bundle 'vim-scripts/Conque-Shell'
endif

" Don't use pathogen by itself
" call pathogen#infect()
" call pathogen#helptags()

" possible vulnerability
set nomodeline

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

" Be kind to your hands
inoremap jk <esc>
inoremap fj <esc>
inoremap <esc> <nop>
inoremap <esc>: <nop>
nnoremap H ^
nnoremap L $
" Moving across wrapped lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" moving between split windows
nnoremap <c-j> :wincmd j<cr>
nnoremap <c-k> :wincmd k<cr>
nnoremap <c-h> :wincmd h<cr>
nnoremap <c-l> :wincmd l<cr>
" Replace the default <c-l> mapping (to redraw the screen) and add the removal of search highlighting
nnoremap <leader>r :nohl<CR><C-L>
" Better regexes? maybe.
nnoremap / /\v
vnoremap / /\v
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

" backspace doesn't need to be on a diet
set backspace=indent,eol,start

set autoindent
"set nostartofline

" display column number in status bar
set ruler
" always show the status line
set laststatus=2
" cross-session undoing
if has("persistent_undo") || exists("+undofile")
    set undofile
endif

" important things require discussion
set confirm

set mouse=a
"set cmdheight=2
set ignorecase
set notimeout ttimeout ttimeoutlen=300

" counting is for computers
if exists("+relativenumber")
    set relativenumber
endif

" duh
nnoremap ; :
nnoremap , ;

" fold inside of braces
nore @k zfa{

"""""""" SPACE """"""""""""""""""""
set textwidth=72
set shiftwidth=4
set tabstop=4
set softtabstop=2
set expandtab
if  exists("+colorcolumn")
    set colorcolumn=72
endif

"""""""" SEARCHING """"""""""""""""
" highlight search results
set showmatch
set hlsearch
set incsearch
set cindent shiftwidth=4
" better case handling
set ignorecase
set smartcase

"""""""" JAVA """"""""""""""""""
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

"colorscheme desert
"colorscheme badwolf
"solarized options
" change the default EasyMotion shading to something more readable with
" Solarized: courtesy of
" http://stackoverflow.com/questions/6126871/easymotion-coloring-in-vim-with-solarized-theme
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
syntax enable
" toggle background color
call togglebg#map("<F5>")
set background=light
set t_Co=16
colorscheme solarized

" turn on the features of the rainbow_parentheses plugin *after* syntax
" highlighting commands are entered - otherwise, it won't work. At
" least, it didn't when I was using it for the first time, editing an
" Octave .m file. TODO maybe just change rainbow parens highlight
" targets for Solarized?
