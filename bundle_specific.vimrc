filetype on    " this is some weird bug fix for something  
filetype off   " to do with vundle or pathogen

set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"vundle handles itself
Bundle 'gmarik/vundle'
" why need this? (vundle needs it)
Bundle 'tpope/vim-pathogen'

let g:syntastic_c_compiler_options = ' -ansi -Wall'
"let g:syntastic_python_checker_args = "--ignore=E111"
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['java','cpp','python', 'tex'] }
Bundle 'scrooloose/syntastic'

"Languages
Bundle 'Markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'guns/vim-clojure-static'
Bundle 'mitsuhiko/vim-python-combined'
Bundle 'jnwhiteh/vim-golang'

Bundle 'tpope/vim-fugitive'
Bundle 'ctags.vim'
Bundle 'surround.vim'
Bundle 'a.vim'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'Align.git'

let g:indent_guides_auto_colors = 0
Bundle 'nathanaelkane/vim-indent-guides'

Bundle 'ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'

" NOTE This feature requires that 'backspace' is either set to 2 or
" has "eol" and "start" as part of its value.
"let delimitMate_expand_cr = 1
Bundle "Raimondi/delimitMate"
let g:delimitMate_expand_cr = 1

"let g:ctrlp_max_files = 300
"let g:ctrlp_clear_cache_on_exit = 1
"let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
"Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
"source /Users/nicolascrowell/.vim/mypairs.vim
augroup Rainbow_On
    autocmd!
    autocmd VimEnter * RainbowParenthesesToggle
    autocmd VimEnter * RainbowParenthesesLoadBraces
    autocmd VimEnter * RainbowParenthesesLoadRound
    autocmd VimEnter * RainbowParenthesesLoadSquare
    "autocmd VimEnter * RainbowParenthesesLoadChevrons
augroup END

"Bundle 'Lokaltog/vim-easymotion'
" change EasyMotion shading to be readable with Solarized:
" http://stackoverflow.com/questions/6126871/easymotion-coloring-in-vim-with-solarized-theme
"hi link EasyMotionTarget ErrorMsg
"hi link EasyMotionShade  Comment
"nnoremap <leader><space> <nop>
"let g:EasyMotion_leader_key = '<Leader><space>'

set laststatus=2
if $HAVE_VIM_POWERLINE_FONT == "TRUE" || has("gui_running")
    "set laststatus=2
    let g:Powerline_symbols = 'fancy'
    "Bundle 'Lokaltog/vim-powerline'
endif

Bundle 'Glench/Vim-Jinja2-Syntax'
""""""""" COLOR """""""""""""""""
Bundle 'cloudhead/shady.vim'
Bundle 'sjl/badwolf'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-vividchalk'
Bundle 'altercation/vim-colors-solarized'
Bundle 'DAddYE/soda.vim'
Bundle 'chriskempson/base16-vim'
Bundle 'sickill/vim-monokai'
Bundle 'Sorcerer'
Bundle 'Mustang2'

call togglebg#map("<F5>")

"colorscheme desert
"colorscheme badwolf
"colorscheme molokai
"colorscheme soda

" TODO what
syntax enable
"colorscheme Monokai | set t_Co=256
set t_Co=16 | colorscheme solarized
set background=dark
"set background=light

let g:tex_flavor='latex'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
let g:tex_flavor='latex'
Bundle 'dhruvasagar/vim-markify'
Bundle 'majutsushi/tagbar'
Bundle 'mips.vim'
let g:startify_files_number = 20
Bundle 'mhinz/vim-startify'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'noahfrederick/Hemisu'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate'

Bundle 'bling/vim-airline'
let g:airline_enable_syntastic=1
"let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'


Bundle 'vim-pandoc/vim-pandoc'
Bundle 'tpope/vim-sleuth'
Bundle 'krisajenkins/vim-pipe'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-repeat'
Bundle 'tfnico/vim-gradle'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/neocomplete.vim'
"let g:neocomplete#enable_at_startup = 1
Bundle 'Shougo/unite-outline'
Bundle 'tpope/vim-dispatch.git'
Bundle 'tpope/vim-classpath'
Bundle 'hsanson/vim-android'
Bundle 'jnurmine/Zenburn'
"colorscheme zenburn

let g:haddock_browser = "/usr/bin/open"
"Bundle 'bitc/vim-hdevtools'
Bundle 'dag/vim2hs'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'eagletmt/neco-ghc'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'gibiansky/vim-latex-objects'
Bundle 'wting/rust.vim'

source $HOME/.vim/unite-ctrlp.vim

" Vundle wants this
filetype plugin indent on
