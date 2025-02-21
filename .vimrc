" Vundle stuff

set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
""""""" Plugins
Plugin 'jamessan/vim-gnupg'
Plugin 'tpope/vim-surround'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
"set ruler 
"set laststatus=2
"Plugin 'vim-syntastic/syntastic'
Plugin 'lambdalisue/vim-findent'
Plugin 'vim-scripts/bash-support.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'dracula/vim'
Plugin 'joshdick/onedark.vim'
Plugin 'vim-python/python-syntax'
"Plugin 'jiangmiao/auto-pairs'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'lervag/vimtex'
Plugin 'rdnetto/YCM-Generator'
" React devel
Plugin 'pangloss/vim-javascript' 
Plugin 'mxw/vim-jsx'
Plugin 'mattn/emmet-vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'
Plugin 'github/copilot.vim'

"taken from https://pythonawesome.com/a-two-way-integration-between-vim-and-jupyter/
set pyxversion=3

let g:python_highlight_all = 1
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let g:syntastic_quiet_messages = {
    \ "type":    "style",
    \ }

let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

" some basics
set encoding=utf-8
set term=xterm-256color
set autoread
set ignorecase smartcase
set ai
set si
set nowrap
"set tw=100
"set linebreak
set showcmd
syn on
set backspace=2
set noautochdir
filetype plugin on
filetype on
set expandtab

"colors
set number norelativenumber
let g:onedark_color_overrides = {
      \"visual_grey": { "gui": "#3E4452", "cterm": "59", "cterm16": "8" },
      \"comment_grey": { "gui": "#5C6368", "cterm": "248", "cterm16": "7" },
      \"gutter_fg_grey": { "gui": "#4B5263", "cterm": "242", "cterm16": "8" },
      \"foreground": { "gui": "#ABB2BF", "cterm": "255", "cterm16": "NONE" },
      \"cursor_grey": { "gui": "#2C323C", "cterm": "237", "cterm16": "0" }
      \}
colorscheme onedark
let g:airline_theme='onedark'

"nerdtree
let NERDTreeWinSize=50
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

"highlights:
hi SpellBad ctermbg=124 ctermfg=016
set cursorline

let mapleader=" "
" folds
set foldenable
set foldmethod=manual
set shiftwidth=2
" some usefull remaps from lukesmith
" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" some usefull remaps: move block of text up or down
vnoremap m} d}pV}
vnoremap m{ d{PV}

" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"set formatoptions=

"guardar y cargar folds.
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
autocmd BufLeave *.* mkview
autocmd BufEnter *.* silent loadview 

" set bash to be the default shell

let g:is_bash = 1
"(default, no syntax folding) 
""(enable function folding)
"(enable heredoc folding)
"(enable if/do/for folding)
let g:sh_fold_enabled= 3     " function heredoc folding
" Bash support personalization
let g:BASH_AuthorName   = 'Mariano Forti'     
let g:BASH_AuthorRef    = 'MF'                         
let g:BASH_Email        = 'mfotri@cnea.gov.ar'
let g:BASH_Company      = 'Comisión Nacional de Energía Atómica'    
"let g:BASH_AlsoBash = [ '*.SlackBuild' , 'rc.*','/tmp/*','*config/*','*.conf','.retrieve','.send','send','retrieve'] 
let g:BASH_MapLeader = ","

" Fortran specific commands
let fortran_fold=1
let fortran_fold_conditionals=1
let fortran_fold_multilinecomments=1
au! BufRead,BufNewFile *.f90 let b:fortran_do_enddo=1
au! BufRead,BufNewFile *.f90 set expandtab
au! BufRead,BufNewFile *.py set expandtab

" completion for ycm:
let g:ycm_filepath_completion_use_working_dir = 0

" set big font
set gfn=Monospace\ 12

" set vim syntax for vimrc
autocmd BufEnter,BufNewFile,BufRead ~/.vimrc  set syntax=vim
"source vimrc whenever modified
autocmd Bufleave ~/.vimrc source ~/.vimrc 

"Some maps obtained from lukesmith
" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>en :setlocal spell! spelllang=en_us<CR>|:syntax spell toplevel
map <leader>es :setlocal spell! spelllang=es<CR>|: syntax spell toplevel
" otros maps convenientes
map <leader>pdf  :w\| !okular %<.pdf &<CR>
map <leader>w :w<CR>
map <leader>q :q<CR>
" comando para abrir y redimensionar lista de tareas
map <leader>tdl :vsplit ~/Bitacoras/2021/ListaDeTareas2022.md <CR>
autocmd BufRead,BufWinEnter,BufWrite ListaDeTareas*.md :resize 50 <CR>
" buffers
set wildchar=<tab> wildmenu wildmode=longest:full,full
set wildoptions=pum
set wildcharm=<C-z>

nnoremap <tab> :b <C-z>
nnoremap <F10> :bd<CR>

"Filetypes
autocmd BufRead,BufNewFile,BufWrite *.md set filetype=md
autocmd BufRead,BufNewFile,BufWrite *.md set syntax=markdown
autocmd BufEnter,BufRead,BufNewFile,BufWrite ~/.config/vifm/vifmrc set filetype=vim
autocmd BufEnter,BufRead,BufNewFile,BufWrite ~/.config/vifm/vifmrc set syntax=vim
autocmd BufEnter,BufRead,BufNewFile,BufWrite ~/.config/vifmrc set filetype=vim
autocmd BufEnter,BufRead,BufNewFile,BufWrite ~/.config/vifmrc set syntax=vim
autocmd BufEnter,BufNewFile TODAY.md,report_*.md  map <leader>w  :w\| !pandoc --template=../template.tex -V fancytitle=yes -V geometry="margin=1cm" "%:p" -f gfm -t latex -o "%:p:r".pdf --pdf-engine=xelatex 2> log<CR><CR> 
"autocmd BufEnter,BufNewFile ListaDeTareas*.md map <leader>w  :w\| !pandoc --template=../ListaTemplate.tex -V fancytitle=yes "%:p" -f gfm -t latex -o "%:p:r".pdf --pdf-engine=xelatex <CR><CR>
autocmd BufEnter,BufNewFile ListaDeTareas*.md map <leader>w  :w\| !pandoc -V fancytitle=yes "%:p" -f gfm -t latex -o "%:p:r".pdf <CR><CR>
autocmd BufEnter,BufWrite,BufNewFile *.c set filetype=c

" for javascript development
"source ~/.vim/autocmds/javascript.vim

" snippets de ejecucion externa.
source ~/.vim/autocmds/exec.vim 

"some snippets of my own for vim 
source ~/.vim/autocmds/latex.vim 

" algunos registros predefinidos
source ~/.vim/autocmds/registers.vim 

" mappings para escribir mas rapido, abreviaturas. 
source ~/.vim/autocmds/abbrev.vim 

" python mappings
source ~/.vim/autocmds/pythons.vim 

" youCompleteMe configs
source ~/.vim/autocmds/ycm.vim

" vim jedi configs
" let g:jedi#completions_enabled = 0


" "jupyter vim
" autocmd BufRead,BufNewFile,BufWrite *.py nnoremap <buffer> <silent> <leader>r :JupyterRunFile<CR>
" 
" " Run current file
" autocmd BufRead,BufNewFile,BufWrite nnoremap <buffer> <silent> <leader>R :JupyterRunFile<CR>
" autocmd BufRead,BufNewFile,BufWrite nnoremap nnoremap <buffer> <silent> <leader>I :PythonImportThisFile<CR>
" 
" " Change to directory of current file
" autocmd BufRead,BufNewFile,BufWrite nnoremap nnoremap <buffer> <silent> <leader>d :JupyterCd %:p:h<CR>
" 
" " Send a selection of lines
" autocmd BufRead,BufNewFile,BufWrite nnoremap nnoremap <buffer> <silent> <leader>X :JupyterSendCell<CR>
" autocmd BufRead,BufNewFile,BufWrite nnoremap nnoremap <buffer> <silent> <leader>E :JupyterSendRange<CR>
" autocmd BufRead,BufNewFile,BufWrite nnoremap nmap     <buffer> <silent> <leader>e <Plug>JupyterRunTextObj
" autocmd BufRead,BufNewFile,BufWrite nnoremap vmap     <buffer> <silent> <leader>e <Plug>JupyterRunVisual
" 
" " Debugging maps
" autocmd BufRead,BufNewFile,BufWrite nnoremap nnoremap <buffer> <silent> <leader>b :PythonSetBreak<CR>
