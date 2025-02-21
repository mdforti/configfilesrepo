autocmd BufRead,BufNewFile *.tex,*.cls,*.tikz set filetype=tex
autocmd BufRead,BufNewFile *.tex,*.cls,*.tikz set syn=tex
autocmd BufRead,BufNewFile,BufEnter set commentstring+='%'
autocmd FileType tex,md inoremap ,sec \section{}<Esc>i
autocmd FileType tex,md inoremap ,ssec \subsection{}<Esc>i
autocmd FileType tex,md inoremap ,sssec \subsubsection{}<Esc>i
autocmd FileType tex,md inoremap ,fr \begin{frame}<presentation>[label=FrameNew]<CR>\frametitle{New Frame}<CR><CR>\end{frame}<Esc>?=<CR>lcw
autocmd FileType tex,md inoremap ,cols \begin{columns}<CR><CR>\end{columns}<Esc>ki
autocmd FileType tex,md inoremap ,cl \column{\textwidth}<Esc>T{i
autocmd FileType tex,md inoremap ,env \begin{}<CR><CR>\end{}<Esc>Tgt}i
autocmd FileType tex,md inoremap ,fig \begin{figure}<CR><CR>\end{figure}<Esc>O
autocmd FileType tex,md inoremap ,u \url{ }<Esc>hi
autocmd FileType tex,md inoremap ,eqn \begin{equation}<Enter><Enter>\end{equation}<Esc>ki
autocmd FileType tex,md inoremap ,gr \includegraphics[width=\textwidth]{}<Esc>hha
autocmd FileType tex,md inoremap ,sl \includeslide[width=\textwidth]{}<esc>i
autocmd FileType tex,md inoremap ,_  \textsubscript{}<Esc>i
autocmd FileType tex,md inoremap ,^  \textsuperscript{}<Esc>i
autocmd FileType tex,md inoremap ,b  \textbf{}<Esc>i
autocmd FileType tex,md inoremap ,t  \texttt{}<Esc>i
autocmd FileType tex,md inoremap ,it  \textit{}<Esc>i
autocmd FileType tex,md inoremap ,em  \emph{}<Esc>i
autocmd FileType tex set textwidth=120
autocmd FileType tex map ,pdf :pdflatex %

