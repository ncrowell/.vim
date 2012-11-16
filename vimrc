source $HOME/.vim/bundle_specific.vimrc

let mapleader = ','
set confirm
set mouse=i
set notimeout ttimeout ttimeoutlen=200
" stop cursor from blinking in guivim
set guicursor+=a:blinkon0

" crontab -e
set backupcopy=yes

set pastetoggle=<F6>
set lazyredraw

set wildmenu
" Better completion - where is this from? is it true?
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

set showcmd
if has("persistent_undo") || exists("+undofile")
    set undofile
endif
set laststatus=2

if exists("+relativenumber")
    set relativenumber
else
    set number
endif

" fold inside of braces
nnoremap @k zfa{

" duh
nnoremap ; :

" repeat and go back - yess. uses register m.
nnoremap . mm.`m
nnoremap ,. .

set scrolloff=80

" so much stolen from sjl
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>tv :tabe $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

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

" these might be confusing mappings to a new USER just change lastname
" to something that is a substring of the environment variable USER, or
" remove the conditional altogether.
let lastname = "crowell"
if ( stridx(tolower($USER), lastname) != -1 )
    " Be kind to your hands
    inoremap jk <esc>
    inoremap Jk <esc>
    inoremap df <esc>
    " this is good for learning, but it gets dangerous...
    "inoremap <esc> <nop>

    " I think these are my favorites
    inoremap j; <esc>:
    inoremap j/ <esc>/\v
    inoremap ;w <esc>:w
endif

""""""""""" MOVEMENT """"""""""""""

" better
noremap H g^
noremap L g_

" lchdir to containing folder of this buffer
noremap <leader>ts :lcd %:p:h<esc>

" Moving across wrapped lines
noremap j gj
noremap k gk
noremap gj j
noremap gk k

"nnoremap <leader>o o<esc>:w<cr>
vnoremap o <esc>o<esc>v
vnoremap O <esc>O<esc>v

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
nnoremap <leader><space> :nohlsearch<CR><C-L>

"""""""""""""""""""""""""""""""""""

" vim wiki: display the syntax highlighting groups
" underneath the cursor
noremap <F7> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" rabid backspace
set backspace=indent,eol,start

"""""""" SPACE """"""""""""""""""""
set shiftwidth=4 tabstop=4
set expandtab smarttab
set copyindent preserveindent
set textwidth=79 ruler

""""""" AUTO COMMANDS """""""""""""""""""""""""""""""""""""""""""""

" vim wiki: insert mode times out to normal mode after 8 seconds
"augroup itimeout
    "autocmd!
    "autocmd CursorHoldI * stopinsert
    "autocmd InsertEnter * let updaterestore = &updatetime | set updatetime=12000
    "autocmd InsertLeave * let updatetime = updaterestore
"augroup END

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

" possible vulnerability?
set nomodeline
