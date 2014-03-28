let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1
let java_highlight_debug=1

setlocal shiftwidth=4 tabstop=4 softtabstop=4
setlocal textwidth=80 colorcolumn=80
setlocal makeprg=javac\ %
setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
" add line ending
noremap <buffer> ,a mmA;<esc>`m:w<cr>
