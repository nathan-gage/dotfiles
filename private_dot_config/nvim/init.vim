
" init autocmd
autocmd!

scriptencoding utf-8
if !1 | finish | endif

set nocompatible
set number
syntax enable
set fileencodings=utf-8,latin
set encoding=utf-8
set title
set background=dark
set nobackup
set hlsearch
set showcmd
set scrolloff=5
set shell=fish
set cursorline
set cursorcolumn

if has('nvim')
  set inccommand=split
endif

set noru 
set ignorecase
set lazyredraw
" set smarttab

" indents
" filetype plugin indent on
"set shiftwidth=2
"set tabstop=2
" set ai 
" set si

" filetypes
au BufNewFile,BufRead *.fish set filetype=fish
set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.py,.md

"autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" plugins
runtime ./plug.vim

" os specific
if has("unix")
  let s:uname = system("uname -s")

  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif

" themeing
colorscheme PaperColor

