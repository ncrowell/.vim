" Nicolas Crowell
" 
" Last modified: 3/18/2014
"
" get this file at tiny.cc/ncrowellvimrc

set nocompatible
set backupdir=~/tmp/vim,.
set directory=~/tmp/vim,.

" setup logging
let message_log     = $HOME . "/.vim/messages"
let message_log_esc = shellescape(message_log)
let mesglog_dir     = shellescape(fnamemodify(message_log, ":p:h"))
let _               = system("mkdir " . mesglog_dir)
let _               = system("touch " . message_log_esc)
"let &verbosefile    = message_log

" TODO make up your mind...
let &directory = join(["./.backup", &directory], ",")

let $MYVIMDIR     = $HOME . "/.vim"
let $MYVIMPLUGINS = $MYVIMDIR . "/bundle_specific.vimrc"
let $LOCALVIMRC   = $MYVIMDIR . "/vimrc.local"

if filereadable($MYVIMPLUGINS)
    source $MYVIMPLUGINS
endif

filetype plugin indent on

let mapleader = ','
set confirm
set mouse=i
set notimeout ttimeout ttimeoutlen=200
" crontab -e
set backupcopy=yes
set pastetoggle=<F6>
"set lazyredraw
set scrolloff=8
syntax sync minlines=300
set wildmenu
set completeopt=longest,menuone
" so the tilde works like yes!
set tildeop
"set cursorline
"set showcmd
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
    "set relativenumber
    set number
else
    set number
endif

" hack: are we on a mac?
if (stridx($HOME, "/Users/") == 0)
    nnoremap <c-c> :!pbcopy <cr>
    " i'm proud of this
    vnoremap <c-c> "+y
else
    nnoremap <c-c> :echo 'How do you copy and paste?'<CR>
endif

nnoremap K :q<cr>
nnoremap M K

" Better regexes?
nnoremap / /\v
vnoremap / /\v
inoremap jk <esc>
"inoremap jj <esc>:w<CR>
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

"this allows you to use %% in a path and it means "directory of this buffer"
"so similar to :A you can do stuff like
":e %%/OtherFile.cc
"or
":e %%
"and just look at the pwd and then select a file
:cabbr %% <C-R>=expand('%:p:h')<CR>

" movement
noremap H g^
noremap L g_
noremap Y y$
" windows
nnoremap <silent> <c-j> :wincmd j<cr>
nnoremap <silent> <c-k> :wincmd k<cr>
nnoremap <silent> <c-h> :wincmd h<cr>
nnoremap <silent> <c-l> :wincmd l<cr>
nnoremap <c-m> <c-w>_<c-w>\|
nnoremap <silent> <c-=> :wincmd =<cr>

" fold inside of braces
nnoremap @k zfa{
nnoremap <space> :
" go back after repeating
nnoremap . mm.`m
" sjl

nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>tv :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>eb :tabedit $MYVIMPLUGINS<cr>
nnoremap <leader>sb :source $MYVIMPLUGINS<cr>

" lchdir to containing folder of this buffer
noremap <leader>ts :lchdir %:p:h<esc>
" stay in visual after inserting new line
vnoremap o <esc>o<esc>v
vnoremap O <esc>O<esc>v
" jump back after pasting
nnoremap p mm]p==`m
nnoremap P mm[P==`m
" vimtips: highlight something in visual, hit c-x, highlight something
" else, hit c-x, text swapped.
vnoremap <C-X> <Esc>`.``gvP``P
" Replace the default <c-l> mapping (to redraw the screen)
" and add the removal of search highlighting
nnoremap <leader>v :nohlsearch<CR><C-L>:sign unplace *<CR>

"let g:matchparen_insert_timeout=5

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

function! FormatProfile()
    " Open profile.log file in vim first
    let timings=[]
    g/^FUNCTION/call add(timings, [getline('.')[len('FUNCTION  '):], matchstr(getline(line('.')+1), '^Sourced \zs\d\+')]+map(getline(line('.')+2, line('.')+3), 'matchstr(v:val, ''\d\+\.\d\+$'')'))
    enew
    call setline('.', ['count total (s)   self (s)  function'] + map(copy(timings), 'printf("%5u %9s   %8s  %s", v:val[1], v:val[2], v:val[3], v:val[0])'))
endfunction
"nnoremap <F8> :call FormatProfile()<CR>

"colorscheme monokai
colorscheme solarized
set background=dark

if filereadable($LOCALVIMRC)
    source $LOCALVIMRC
endif
set background=dark
colorscheme monokai

