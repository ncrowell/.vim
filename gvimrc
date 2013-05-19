set fuopt=maxvert,maxhorz
set guioptions-=r 
set guioptions-=L 
" stop cursor from blinking
set guicursor+=a:blinkon0

" powerline configuration
set laststatus=2
let g:Powerline_symbols = 'fancy'
Bundle 'Lokaltog/vim-powerline'
