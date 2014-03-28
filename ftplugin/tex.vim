let g:tex_flavor='latex'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
let g:tex_flavor='latex'

" append period to EOL
noremap <buffer> ,a mmA.<esc>`m:w<cr>

" recommended by latex-suite documentation
setlocal shiftwidth=2
setlocal iskeyword+=:

" this might be obsolete with formatoptions+= a
nnoremap gqj gq}

" automatically wrap text when inserting in the middle of the line
nnoremap <leader>gq :set formatoptions+=a<cr>
nnoremap <leader>gg :set formatoptions=tcq<cr>

"google latex makefile
"set makeprg=make\ -j\ 2\ -f\ $HOME/bin/latex-makefile

function! MakeWithTarget(name, base)
    return a:base . " " . a:name 
endfunction

function! GSub(s, replace, with)
    return substitute(a:s, a:replace, a:with, "g")
endfunction

let makeorig = &makeprg
"let &makeprg = MakeWithTarget(GSub(expand("%"), ".tex", ".pdf"), makeorig)
let makeprg = "/usr/texbin/latexmk -pdf"

"!launchctl submit -l watch_latex_ . f -- $HOME/bin/pset_mod_make.rb %:p:h
