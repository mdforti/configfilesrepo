autocmd BufRead,BufNewFile *.py set filetype=python
autocmd BufRead,BufNewFile *.py set syn=python
autocmd BufRead,BufNewFile,BufEnter set commentstring+='#'
autocmd FileType python inoremap def<Space> def ():<Esc>hhi
autocmd FileType python inoremap class<Space><space> class ():<Esc>hhi
