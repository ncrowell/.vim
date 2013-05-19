source $HOME/.vim/bundle_specific.vimrc

let mapleader = ','
set confirm
set mouse=a
set notimeout ttimeout ttimeoutlen=200

" crontab -e
set backupcopy=yes

set pastetoggle=<F6>
set lazyredraw
" syntax highlighting seems to break on long comments and docstrings otherwise
syntax sync minlines=200

set wildmenu
" Better completion - where is this from? is it true?
set completeopt=longest,menuone

set showcmd

set backupdir=~/tmp,.
if has("persistent_undo") || exists("+undofile")
    set undodir=~/tmp,.
    set undofile
endif

if exists("+relativenumber")
    set relativenumber
"else
    "set number
endif

" fold inside of braces
nnoremap @k zfa{

" so the tilde works like yes!
set tildeop

" duh; MAYBE NOT
"nnoremap ; :
nnoremap <space> :

" repeat and go back - yess. uses register m.
nnoremap . mm.`m
"nnoremap ,. .

set scrolloff=8

" so much stolen from sjl
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>tv :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>eb :tabedit $HOME/.vim/bundle_specific.vimrc<cr>
nnoremap <leader>sb :source $HOME/.vim/bundle_specific.vimrc<cr>

" hack: are we on a mac?
if (stridx($HOME, "/Users/") == 0)
    nnoremap <c-c> :!pbcopy < %<cr>
else
    nnoremap <c-c> :echo "UnsupportedOperationException: How do you copy and paste?"<cr>
endif

" Better regexes?
nnoremap / /\v
vnoremap / /\v

"""""""""" MODES """"""""""""""""
inoremap jk <esc>:w<CR>
inoremap jj <esc>:w<CR>
inoremap jf <esc>:w<CR>

" these might be confusing mappings to a new USER just change lastname
" to something that is a substring of the environment variable USER, or
" remove the conditional altogether.
let lastname = "crowell"
if ( stridx(tolower($USER), lastname) != -1 )
    " Be kind to your hands
    " UPDATE maybe keyboard remappings obsoletize these they could be
    " completely unnecessary like eveything that is already useless this will
    " be revolutionary be useuless

    " I think these are my favorites
    "inoremap j; <esc>:
    "inoremap j/ <esc>/\v
    "inoremap ;w <esc>:w
endif

""""""""""" MOVEMENT """"""""""""""

" better
noremap H g^
noremap L g_
noremap Y y$

" lchdir to containing folder of this buffer
noremap <leader>ts :lcd %:p:h<esc>

" Moving across wrapped lines
noremap j gj
noremap k gk
noremap gj j
noremap gk k

"nnoremap <leader>o o<esc>:w<cr>
" stay in visual after inserting new line
vnoremap o <esc>o<esc>v
vnoremap O <esc>O<esc>v

" jump back after pasting
nnoremap P mm[p==`m
nnoremap p mm]p==`m

" vimtips: highlight something in visual, hit c-x, highlight something
" else, hit c-x, they should be swapped
vnoremap <C-X> <Esc>`.``gvP``P

" moving between split windows
nnoremap <silent> <c-j> :wincmd j<cr>
nnoremap <silent> <c-k> :wincmd k<cr>
nnoremap <silent> <c-h> :wincmd h<cr>
nnoremap <silent> <c-l> :wincmd l<cr>

" Replace the default <c-l> mapping (to redraw the screen)
" and add the removal of search highlighting
nnoremap <leader>v :nohlsearch<CR><C-L>:sign unplace *<CR>

"""""""""""""""""""""""""""""""""""

" vim wiki: display the syntax highlighting groups
" underneath the cursor
noremap <F7> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" rabid backspace
set backspace=indent,eol,start

"""""""" SPACE """"""""""""""""""""
set shiftwidth=4 tabstop=4 softtabstop=4 shiftround
set expandtab smarttab
set copyindent preserveindent autoindent
set textwidth=80 ruler


""""""" AUTO COMMANDS """""""""""""""""""""""""""""""""""""""""""""

augroup savefolds
    autocmd!
    " Save folds across file open/close
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent loadview
augroup END

" Save when losing focus
augroup save_my_files
    autocmd!
    autocmd FocusLost * :silent! wall
augroup END

" Resize splits when the window is resized
augroup resize_splits
    autocmd!
    autocmd VimResized * :wincmd =
augroup END

if  exists("+colorcolumn")
    let &colorcolumn = &textwidth
    " I don't this autocommand works the way I think it should ...
    augroup column_setting_color
        autocmd!
        autocmd BufNewFile,BufReadPost let &colorcolumn = &textwidth 
    augroup END
endif

""""""" AUTO COMMANDS """""""""""""""""""""""""""""""""""""""""""""

"""""""" SEARCHING """"""""""""""""
" highlight search results
set showmatch hlsearch incsearch
set ignorecase smartcase

set cursorline

" security?
set nomodeline

set verbosefile=$HOME/vimessages
