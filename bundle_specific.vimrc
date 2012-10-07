filetype on    " this is some weird bug fix for something  
filetype off   " to do with vundle or pathogen

set nocompatible
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
"let g:syntastic_mode_map['active_filetypes'] = ['java']
Bundle 'vim-scripts/Markdown'
Bundle 'kchmck/vim-coffee-script'
" some kind of bug with vundle, maybe?
autocmd BufNewFile,BufReadPost *.coffee set ft=coffee

" Tab completion
Bundle 'ervandew/supertab'
" git
Bundle 'tpope/vim-fugitive'
"Bundle 'vim-scripts/VimOrganizer'
Bundle 'vim-scripts/ctags.vim'
Bundle 'vim-scripts/surround.vim'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'vim-scripts/The-NERD-Commenter'
Bundle 'vim-scripts/ack.vim'
Bundle "Raimondi/delimitMate"

Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
"source /Users/nicolascrowell/.vim/mypairs.vim

" forever rainbow
augroup Rainbow_set
    autocmd VimEnter * RainbowParenthesesToggle
    autocmd Syntax * RainbowParenthesesLoadBraces
    autocmd Syntax * RainbowParenthesesLoadRound
    autocmd Syntax * RainbowParenthesesLoadSquare
    autocmd Syntax * RainbowParenthesesLoadChevrons
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


""""""""" COLOR """""""""""""""""
Bundle 'vim-scripts/badwolf'
Bundle 'altercation/vim-colors-solarized'

"colorscheme desert
"colorscheme badwolf
"
"solarized options
" change the default EasyMotion shading to something more readable with
" Solarized: courtesy of
" http://stackoverflow.com/questions/6126871/easymotion-coloring-in-vim-with-solarized-theme
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" FIXME : why is this enable?
syntax enable

" toggle background color
call togglebg#map("<F5>")
" set background=light
set background=dark
" use custom colors
set t_Co=16
colorscheme solarized

"""""""""""""""""""""""""""""""""

" maybe I'll use this someday
Bundle 'sjl/gundo.vim'

" align statements in parentheses?
"Bundle 'git://github.com/vim-scripts/Align.vim.git'
" aligning statements on a specific character, ie. equals sign
"Bundle 'git://github.com/vim-scripts/Align.git'
"
" Vundle wants this
filetype plugin indent on
