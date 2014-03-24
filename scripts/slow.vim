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

Bundle 'jnwhiteh/vim-golang'

Bundle 'tpope/vim-fugitive'
Bundle 'ctags.vim'
Bundle 'surround.vim'
Bundle 'a.vim'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'Align.git'

let g:indent_guides_auto_colors = 0

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
augroup Rainbow_On
    autocmd!
    autocmd VimEnter * RainbowParenthesesLoadBraces
    autocmd VimEnter * RainbowParenthesesLoadRound
    autocmd VimEnter * RainbowParenthesesLoadSquare
    autocmd VimEnter * RainbowParenthesesLoadChevrons
augroup END

"set laststatus=2

Bundle 'sjl/gundo.vim'

Bundle 'Glench/Vim-Jinja2-Syntax'
""""""""" COLOR """""""""""""""""
"colorscheme zenburn

call togglebg#map("<F5>")

" TODO what
syntax enable
"colorscheme Monokai | set t_Co=256
set t_Co=16 | colorscheme solarized
set background=dark
"set background=light

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

"set statusline=%F\ %M%R%Y\ %l:%c\ of\ %L.\ %P%#Identifier#
set laststatus=2
"highlight StatusLine  ctermfg=0 ctermbg=3
"highlight link StatusLine StatusLineNC

Bundle 'bling/vim-airline'
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''

"let $AIRLINE_PROFILE = $HOME . "/.vim/airline.profile"
"profile start /Users/nicolascrowell/.vim/airline.profile
"profile func *

"Bundle 'bling/vim-airline'
let g:airline_enable_syntastic=1
"let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tagbar#enabled = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"unicode symbols
let g:airline_symbols.paste = 'ρ'

let g:airline_left_sep = '⮀'
let g:airline_right_sep = '⮂'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'


