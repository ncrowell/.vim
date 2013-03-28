" append period to EOL
noremap <buffer> ,a mmA.<esc>`m:w<cr>

" recommended by latex-suite documentation
set shiftwidth=2
set iskeyword+=:

" this might be obsolete with formatoptions+= a
nnoremap gqj gq}

" automatically wrap text when inserting in the middle of the line
nnoremap <leader>gq :set formatoptions+=a<cr>
nnoremap <leader>gg :set formatoptions=tcq<cr>

" google latex makefile
set makeprg=make\ -j\ 2\ -f\ $HOME/bin/latex-makefile

"!launchctl submit -l watch_latex_ . f -- $HOME/bin/pset_mod_make.rb %:p:h

" background call latex makefile
"augroup tex_bg_make
    "autocmd BufWritePost *.tex
                "\ silent execute ":!make -j2 -f $HOME/bin/latex-makefile > ~/.vim/.texerrors 2>&1 &" |
                "\ redraw! |
                "\ cgetfile ~/.vim/.texerrors
"augroup END
