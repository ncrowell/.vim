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
                           \ 'passive_filetypes': ['java','cpp','python'] }

Bundle 'scrooloose/syntastic'

Bundle 'vim-scripts/Markdown'
Bundle 'kchmck/vim-coffee-script'
" some kind of bug with vundle, maybe?
augroup coffee_ft
    autocmd!
    autocmd BufNewFile,BufReadPost *.coffee set ft=coffee
augroup END

" Tab completion
"Bundle 'ervandew/supertab'
" git
Bundle 'tpope/vim-fugitive'
"Bundle 'vim-scripts/VimOrganizer'
Bundle 'vim-scripts/ctags.vim'
Bundle 'vim-scripts/surround.vim'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'vim-scripts/The-NERD-Commenter'


Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'trotter/autojump.vim'
Bundle 'vim-scripts/ack.vim'
" ag is faster
let g:ackprg = 'ag --nogroup --nocolor --column'

" NOTE This feature requires that 'backspace' is either set to 2 or
" has "eol" and "start" as part of its value.
"let delimitMate_expand_cr = 1
let b:delimitMate_expand_cr = 1
let g:delimitMate_expand_cr = 1
Bundle "Raimondi/delimitMate"
let b:delimitMate_expand_cr = 1
let g:delimitMate_expand_cr = 1


let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
"source /Users/nicolascrowell/.vim/mypairs.vim

" forever rainbow
augroup Rainbow_On
    autocmd!
    autocmd VimEnter * RainbowParenthesesToggle
    autocmd VimEnter * RainbowParenthesesLoadBraces
    autocmd VimEnter * RainbowParenthesesLoadRound
    autocmd VimEnter * RainbowParenthesesLoadSquare
    "autocmd VimEnter * RainbowParenthesesLoadChevrons
augroup END

Bundle 'Lokaltog/vim-easymotion'
" vim status bar; environment variable detects custom font
if $HAVE_VIM_POWERLINE_FONT == "TRUE" || has("gui_running")
    " powerline configuration
    set laststatus=2
    let g:Powerline_symbols = 'fancy'
    Bundle 'Lokaltog/vim-powerline'
else
    Bundle 'millermedeiros/vim-statline'
    let g:statline_fugitive = 1
    let g:statline_filename_relative = 1
endif


Bundle 'Glench/Vim-Jinja2-Syntax'
""""""""" COLOR """""""""""""""""
Bundle 'cloudhead/shady.vim'
Bundle 'sjl/badwolf'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'

"colorscheme desert
"colorscheme badwolf
"colorscheme molokai
"
"solarized options
" change the default EasyMotion shading to something more readable with
" Solarized: courtesy of
" http://stackoverflow.com/questions/6126871/easymotion-coloring-in-vim-with-solarized-theme
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" TOLEARN
syntax enable

" toggle background color
call togglebg#map("<F5>")
set background=dark

set t_Co=16
colorscheme solarized

"""""""""""""""""""""""""""""""""

" maybe I'll use this someday
Bundle 'sjl/gundo.vim'

" align statements in parentheses?
"Bundle 'git://github.com/vim-scripts/Align.vim.git'
" aligning statements on a specific character, ie. equals sign
Bundle 'git://github.com/vim-scripts/Align.git'
"
" Vundle wants this
filetype plugin indent on
