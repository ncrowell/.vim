set guifont=Inconsolata:h22

set guioptions-=r 
set guioptions-=L 

" stop cursor from blinking
set guicursor+=a:blinkon0

" powerline configuration
set laststatus=2
let g:Powerline_symbols = 'fancy'

colorscheme solarized

let $LOCALGVIMRC   = $MYVIMDIR . "/gvimrc.local"
if filereadable($LOCALGVIMRC)
    source $LOCALGVIMRC
endif
