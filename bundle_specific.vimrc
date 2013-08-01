filetype on    " this is some weird bug fix for something  
filetype off   " to do with vundle or pathogen

set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"vundle handles itself
Bundle 'gmarik/vundle'
" why need this? (vundle needs it)
Bundle 'tpope/vim-pathogen'

let g:syntastic_python_checker_args = "--ignore=E111"
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['java','cpp','python', 'tex'] }
Bundle 'scrooloose/syntastic'

Bundle 'Markdown'
Bundle 'kchmck/vim-coffee-script'
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

let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
Bundle 'kien/ctrlp.vim'
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

Bundle 'Lokaltog/vim-easymotion'
" change EasyMotion shading to be readable with Solarized:
" http://stackoverflow.com/questions/6126871/easymotion-coloring-in-vim-with-solarized-theme
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
nnoremap <leader><space> <nop>
let g:EasyMotion_leader_key = '<Leader><space>'

set laststatus=2
if $HAVE_VIM_POWERLINE_FONT == "TRUE" || has("gui_running")
    "set laststatus=2
    let g:Powerline_symbols = 'fancy'
    Bundle 'Lokaltog/vim-powerline'
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
"set background=dark
set background=light

let g:tex_flavor='latex'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
let g:tex_flavor='latex'
Bundle 'dhruvasagar/vim-markify'
Bundle 'majutsushi/tagbar'
Bundle 'mips.vim'
Bundle 'mhinz/vim-startify'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'noahfrederick/Hemisu'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate'
"Bundle 'bling/vim-airline'
Bundle 'vim-pandoc/vim-pandoc'

Bundle 'tpope/vim-sleuth'

" Vundle wants this
filetype plugin indent on
