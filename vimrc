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
" counting is for computers
if exists("+relativenumber")
    set relativenumber
endif
" fold inside of braces
nnoremap @k zfa{

" duh
nnoremap ; :
" this won't work with leader=,
" and I don't use it
"nnoremap , ;

" repeat and go back
nnoremap . mm.`m
nnoremap ,. .

set scrolloff=80

" so much stolen from sjl
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" hack: are we on a mac?
if ( stridx($HOME, "/Users/") == 0 )
    nnoremap <c-c> :!pbcopy < %<cr>
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
    inoremap kl <esc>
    inoremap df <esc>
    " this is good for learning, but it gets dangerous...
    "inoremap <esc> <nop>

    " I think these are my favorites
    inoremap j; <esc>:
    inoremap j/ <esc>/\v
    inoremap ;w <esc>:w
endif

""""""""""" MOVEMENT """"""""""""""
" useful for markdown headings
noremap - YpVr-
noremap <c-=> YpVr=

" TODO WHY DON'T THESE WORK
" Move lines downwards or upwards: I haven't really used this.
"noremap <c--> ddp
"noremap <c-_> ddP

" better
noremap H g^
noremap L g_

augroup c_java_line_endings
    autocmd!
    autocmd FileType java,c noremap <buffer> ,a A;<esc>
augroup END

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
set textwidth=72 ruler

" TODO set cindent when FileType is set for anything except for txt and
" gitcommit and I guess some others
set cindent

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

augroup ruby_indenting
    autocmd!
    autocmd FileType rb setlocal shiftwidth=2 tabstop=2
augroup END

augroup text_indenting
    autocmd!
    autocmd BufNewFile,BufRead *.txt setlocal ft=txt
    autocmd FileType txt,gitcommit setlocal nocindent
    autocmd Filetype txt iabbrev i I
augroup END

augroup java
    autocmd!
    autocmd FileType java setlocal textwidth=80 colorcolumn=80
    " from stackoverflow
    " TODO FIXME figure out how to make this a local setting
    autocmd FileType java setlocal makeprg=javac\ %
    autocmd Filetype java setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
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

""""""""" JAVA """"""""""""""""""
let java_highlight_all=1
let java_highlight_functions="style"
" why?
let java_allow_cpp_keywords=1

" possible vulnerability?
set nomodeline
