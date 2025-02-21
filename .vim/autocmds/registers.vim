" el nombre de archivo actual"
autocmd BufEnter * let @f = expand("%:p")
" el directorio actual
autocmd BufEnter * let @d = expand("%:p:h")

