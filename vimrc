set nocompatible
set backupdir=~/tmp,.
set verbosefile=$HOME/vimessages

source $HOME/.vim/bundle_specific.vimrc

let mapleader = ','
set confirm
set mouse=a
set notimeout ttimeout ttimeoutlen=200
" crontab -e
set backupcopy=yes
set pastetoggle=<F6>
set lazyredraw
set scrolloff=8
syntax sync minlines=200
set wildmenu
set completeopt=longest,menuone
" so the tilde works like yes!
set tildeop
set cursorline
set showcmd
set backspace=indent,eol,start
"set nomodeline " security?
" Space
set shiftwidth=4 tabstop=4 softtabstop=4 shiftround
set expandtab smarttab
set copyindent preserveindent autoindent
set textwidth=80 ruler
" highlight search results
set showmatch hlsearch incsearch
set ignorecase smartcase

if has("persistent_undo") || exists("+undofile")
    set undodir=~/tmp
    set undofile
endif
if exists("+relativenumber")
    set relativenumber
else
    set number
endif

" hack: are we on a mac?
if (stridx($HOME, "/Users/") == 0)
    nnoremap <c-c> :!pbcopy < %<cr>
else
    nnoremap <c-c> :echo 'How do you copy and paste?'<CR>
endif

" Better regexes?
nnoremap / /\v
vnoremap / /\v
inoremap jk <esc>:w<CR>
inoremap jj <esc>:w<CR>
inoremap jf <esc>:w<CR>
" these might be confusing mappings to a new USER just change lastname
" to something that is a substring of the environment variable USER, or
" remove the conditional altogether.
let lastname = "crowell"
if ( stridx(tolower($USER), lastname) != -1 )
    " Be kind to your hands
    inoremap j; <esc>:
    inoremap j/ <esc>/\v
    inoremap ;w <esc>:w
endif

" movement
noremap H g^
noremap L g_
noremap Y y$
noremap j gj
noremap k gk
noremap gj j
noremap gk k
nnoremap <silent> <c-j> :wincmd j<cr>
nnoremap <silent> <c-k> :wincmd k<cr>
nnoremap <silent> <c-h> :wincmd h<cr>
nnoremap <silent> <c-l> :wincmd l<cr>
" fold inside of braces
nnoremap @k zfa{
nnoremap <space> :
nnoremap . mm.`m
" sjl
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>tv :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>eb :tabedit $HOME/.vim/bundle_specific.vimrc<cr>
nnoremap <leader>sb :source $HOME/.vim/bundle_specific.vimrc<cr>

" lchdir to containing folder of this buffer
noremap <leader>ts :lcd %:p:h<esc>
" stay in visual after inserting new line
vnoremap o <esc>o<esc>v
vnoremap O <esc>O<esc>v
" jump back after pasting
nnoremap P mm[p==`m
nnoremap p mm]p==`m
" vimtips: highlight something in visual, hit c-x, highlight something
" else, hit c-x, text swapped.
vnoremap <C-X> <Esc>`.``gvP``P
" Replace the default <c-l> mapping (to redraw the screen)
" and add the removal of search highlighting
nnoremap <leader>v :nohlsearch<CR><C-L>:sign unplace *<CR>

" vim wiki: display the syntax highlighting groups
" underneath the cursor
function! GetCurrentSyntaxGroup()
    let l:transName = synID(line('.'), col('.'), 0)
    let l:hiName    = synID(line("."), col("."), 1)
    let l:loName    = synIDtrans(l:hiName)

    let l:hiName    = 'hi<'    . synIDattr(l:hiName,    'name' ) . '> ' 
    let l:transName = 'trans<' . synIDattr(l:transName, 'name' ) . '> ' 
    let l:loName    = 'lo<'    . synIDattr(l:loName,    'name' ) . '>' 

    return l:hiName . l:transName . l:loName
endfunction

nnoremap <F7> :echo GetCurrentSyntaxGroup()<CR>

augroup AUTOCOMMANDS
    autocmd!
    " Save folds across file open/close
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent loadview

    " Save when losing focus
    autocmd FocusLost * :silent! wall
    " Resize splits when the window is resized
    autocmd VimResized * :wincmd =
augroup END

if  exists("+colorcolumn")
    let &colorcolumn = &textwidth
    " I don't this autocommand works the way I think it should ...
    augroup column_setting_color
        autocmd!
        autocmd BufNewFile,BufReadPost,Syntax let &colorcolumn = &textwidth 
    augroup END
endif
