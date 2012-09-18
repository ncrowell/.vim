source $HOME/.vim/bundle_specific.vimrc

let mapleader = ','
set confirm
set mouse=i
set notimeout ttimeout ttimeoutlen=300
" crontab -e
set backupcopy=yes
set pastetoggle=<F6>
set lazyredraw
set wildmenu
set showcmd
if has("persistent_undo") || exists("+undofile")
    set undofile
endif
" always on
set laststatus=2

" vim wiki: insert mode times out to normal mode
autocmd CursorHoldI * stopinsert
autocmd InsertEnter * let  l:updaterestore = &l:updatetime | set l:updatetime=15000
autocmd InsertLeave * let &l:updatetime    = l:updaterestore

" duh
nnoremap ; :
nnoremap , ;

" cursor in the middle
set scrolloff=20

" Save folds across file open/close
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview

" Better completion - where is this from? is it true?
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" so much stolen from sjl
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Better regexes?
nnoremap / /\v
vnoremap / /\v

"""""""""" MODES """"""""""""""""

" Be kind to your hands
inoremap jk <esc>
inoremap <esc> <nop>

" I think these are my favorites
inoremap j; <esc>:
inoremap j/ <esc>/\v

inoremap ;w <esc>:w<cr>

""""""""""" MOVEMENT """"""""""""""
" Move lines downwards or upwards
noremap - ddp
noremap _ ddP

" line ends
noremap H g^
noremap L g_

" Moving across wrapped lines
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" moving between split windows
nnoremap <silent> <c-j> :wincmd j<cr>
nnoremap <silent> <c-k> :wincmd k<cr>
nnoremap <silent> <c-h> :wincmd h<cr>
nnoremap <silent> <c-l> :wincmd l<cr>

" Replace the default <c-l> mapping (to redraw the screen)
" and add the removal of search highlighting
nnoremap <leader><space> :nohlsearch<CR><C-L>

"""""""""""""""""""""""""""""""""""

" Save when losing focus
augroup save_my_files
    autocmd!
    autocmd FocusLost * :silent! wall
augroup END

" Resize splits when the window is resized
augroup resize_automatically
    autocmd!
    autocmd VimResized * :wincmd =
augroup END

" courtesy of the vim wiki: display the syntax highlighting groups
" underneath the cursor
map <F7> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" rabid backspace
set backspace=indent,eol,start

" counting is for computers
if exists("+relativenumber")
    set relativenumber
endif

" fold inside of braces
nnoremap @k zfa{

"""""""" SPACE """"""""""""""""""""
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set cindent

" Line width settings
set textwidth=72
set ruler

augroup column_setting
    autocmd!
    autocmd BufNewFile,BufRead *.java set textwidth=80   
augroup END

if  exists("+colorcolumn")
    let &colorcolumn = &textwidth
    augroup column_setting_color
        autocmd!
        autocmd BufNewFile,BufReadPost let &colorcolumn = &textwidth 
    augroup END
endif

augroup ruby_indenting
    autocmd!
    autocmd BufNewFile,BufReadPost *.rb set shiftwidth=2 tabstop=2
augroup END

"""""""" SEARCHING """"""""""""""""
" highlight search results
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

""""""""" JAVA """"""""""""""""""
let java_highlight_all=1
let java_highlight_functions="style"
" why?
let java_allow_cpp_keywords=1

" possible vulnerability?
set nomodeline
