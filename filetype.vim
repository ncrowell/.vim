if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    autocmd!
    autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setfiletype tmux
    autocmd BufNewFile,BufRead *.coffee setfiletype coffee
    autocmd BUfNewFile,BufRead *.rs setfiletype rust
augroup END
