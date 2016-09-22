let g:syntastic_c_compiler_options = ' -ansi -Wall'
"let g:syntastic_python_checker_args = "--ignore=E111"
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['java','cpp','python', 'tex'] }
Plugin 'scrooloose/syntastic'

"Languages
Plugin 'Markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'guns/vim-clojure-static'

Plugin 'jnwhiteh/vim-golang'

Plugin 'tpope/vim-fugitive'
Plugin 'ctags.vim'
Plugin 'surround.vim'
Plugin 'a.vim'
Plugin 'The-NERD-tree'
Plugin 'The-NERD-Commenter'

let g:indent_guides_auto_colors = 0

Plugin 'ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'

" NOTE This feature requires that 'backspace' is either set to 2 or
" has "eol" and "start" as part of its value.
"let delimitMate_expand_cr = 1

Plugin 'Raimondi/delimitMate'

let g:delimitMate_expand_cr = 1

"let g:ctrlp_max_files = 300
"let g:ctrlp_clear_cache_on_exit = 1
"let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
"Bundle 'kien/ctrlp.vim'

Plugin 'kien/rainbow_parentheses.vim'
augroup Rainbow_On
    autocmd!
    autocmd VimEnter * RainbowParenthesesLoadBraces
    autocmd VimEnter * RainbowParenthesesLoadRound
    autocmd VimEnter * RainbowParenthesesLoadSquare
    "autocmd VimEnter * RainbowParenthesesLoadChevrons
augroup END

"set laststatus=2

Plugin 'sjl/gundo.vim'

Plugin 'Glench/Vim-Jinja2-Syntax'
""""""""" COLOR """""""""""""""""
"colorscheme zenburn

call togglebg#map("<F5>")

" TODO what
syntax enable
"colorscheme Monokai | set t_Co=256
set t_Co=16 | colorscheme solarized
set background=dark
"set background=light

Plugin 'dhruvasagar/vim-markify'
Plugin 'majutsushi/tagbar'
augroup tagbaropen
    autocmd!
    " Breaks vimdiff, and I can't figure out how to fix it.
    "autocmd BufReadPost * if !&diff | :TagbarOpen | endif
augroup END

Plugin 'mips.vim'
"let g:startify_files_number = 20
"Plugin 'mhinz/vim-startify'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

"set statusline=%F\ %M%R%Y\ %l:%c\ of\ %L.\ %P%#Identifier#
set laststatus=2
"highlight StatusLine  ctermfg=0 ctermbg=3
"highlight link StatusLine StatusLineNC

Plugin 'bling/vim-airline'
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''

"let $AIRLINE_PROFILE = $HOME . "/.vim/airline.profile"
"profile start /Users/nicolascrowell/.vim/airline.profile
"profile func *

"Bundle 'bling/vim-airline'
let g:airline#extensions#syntastic#enabled = 1
"let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tagbar#enabled = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"unicode symbols
let g:airline_symbols.paste = 'ρ'

"let g:airline_left_sep = '⮀'
"let g:airline_right_sep = '⮂'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'


