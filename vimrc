syntax on
set showcmd
set showmatch
set smartcase

set expandtab
set autowrite
set mouse=a
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set vb t_vb=
set ruler
set incsearch
set nocompatible
set number

set fencs=utf-8,chinese,latin1 fenc=utf-8 enc=utf-8
set clipboard+=unnamed
autocmd! bufwritepost .vimrc source ~/.vimrc
imap { {}<ESC>i<CR><ESC>V<O 
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File=1
let Tlist_Exit_Only_Window=1
let Tlist_Use_Right_Window=1
nnoremap <F8> :TlistToggle<CR>
filetype on
