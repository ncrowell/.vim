if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    autocmd!
    autocmd BufNewFile,BufReadPost .tmux.conf*,tmux.conf* setfiletype tmux
    autocmd BufNewFile,BufReadPost *.coffee setfiletype coffee
augroup END
