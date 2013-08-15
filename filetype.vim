augroup filetypedetect
    autocmd BufNewFile,BufReadPost .tmux.conf*,tmux.conf* setf tmux
    autocmd BufNewFile,BufReadPost *.coffee set ft=coffee
augroup END
