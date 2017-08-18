set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

"Plugins=========================================================
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'

call vundle#end()
"================================================================
"================================================================
"Java compiler
autocmd filetype java command! Run execute 'w | !runj ' . @%
"C++ Compiler
autocmd filetype cpp command! Run execute 'w | !runcpp ' . @%
"File Browser
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3

filetype plugin indent on
set encoding=utf-8

set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

set list
set listchars=tab:>\ 

syntax on
set wildmenu
set path+=**
set number

autocmd FocusLost * set number 
autocmd FocusGained * set relativenumber 
autocmd InsertEnter * set number
autocmd InsertLeave * set relativenumber

"mappings

command! MakeTags !ctags -R .
let mapleader = ","

"Saving files
nnoremap <C-Y> :w<CR>
inoremap <C-Y> <ESC>:w<CR>i
vnoremap <C-Y> <ESC>:w<CR>v

"Tabs
nnoremap <Leader>q :tabnew<CR>
inoremap <Leader>q <ESC>:tabnew<CR>
vnoremap <Leader>q <ESC>:tabnew<CR>

nnoremap <Leader>n :tabprevious<CR>
inoremap <Leader>n <ESC>:tabprevious<CR>
vnoremap <Leader>n <ESC>:tabprevious<CR>

nnoremap <Leader>m :tabnext<CR>
inoremap <Leader>m <ESC>:tabnext<CR>
vnoremap <Leader>m <ESC>:tabnext<CR>

"Moving with windows
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
nnoremap <Space><Space> /<++><CR>"_c4l

autocmd FileType html nnoremap ,html i<html><CR><TAB><head><CR><TAB><TAB><title><++></title><CR><TAB></head><CR><TAB><body><CR><TAB><TAB><++><CR><TAB></body><CR></html><ESC>gg
autocmd FileType html inoremap ,p <p><p><CR><CR><++><ESC>2ki
autocmd FileType cpp nnoremap <Leader>main i#include<iostream><CR>int main(){<CR><CR>return 0;<CR>}<ESC>2ki<TAB>
