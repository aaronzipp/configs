set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

set nobackup
set nowritebackup
set noswapfile

"Plugins=========================================================
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'


call vundle#end()
"================================================================
"================================================================


"File Browser
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3

filetype plugin indent on
set encoding=utf-8

set relativenumber
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

set list
set listchars=tab:>\ 

syntax on
set wildmenu
set path+=**
set number

"mappings

command! MakeTags !ctags -R .
let mapleader = ","

"Saving files
nnoremap <C-Y> :w<CR>
inoremap <C-Y> <ESC>:w<CR>li
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
inoremap " ""<ESC>i
"nnoremap <Space><Space> /<++><CR>"_c4l

autocmd FileType html nnoremap ,html i<html><CR><TAB><head><CR><TAB><TAB><title><++></title><CR><TAB></head><CR><TAB><body><CR><TAB><TAB><++><CR><TAB></body><CR></html><ESC>gg
autocmd FileType html inoremap ,p <p><p><CR><CR><++><ESC>2ki
autocmd FileType cpp nnoremap <Leader>main i#include<iostream><CR><CR>int main(){<CR><CR>return 0;<CR>}<ESC>2ki<TAB>

"LaTeX"

autocmd FileType tex inoremap <Leader>fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap <Leader>mat \begin{matrix}<Enter><Enter><Enter><++><Enter><Enter>\end{matrix}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap <Leader>fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap <Leader>exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap <Leader>em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap <Leader>bf \textbf{}<++><Esc>T{i
autocmd FileType tex inoremap <Leader>it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap <Leader>ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap <Leader>cp \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap <Leader>glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap <Leader>x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap <Leader>ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap <Leader>ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap <Leader>li <Enter>\item<Space>
autocmd FileType tex inoremap <Leader>ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap <Leader>tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap <Leader>ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap <Leader>can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap <Leader>con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap <Leader>v \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap <Leader>a \href{}{<++>}<Space><++><Esc>2T{iautocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap <Leader>fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap <Leader>exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap <Leader>em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap <Leader>bf \textbf{}<++><Esc>T{i
autocmd FileType tex inoremap <Leader>it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap <Leader>ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap <Leader>cp \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap <Leader>glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap <Leader>x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap <Leader>ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap <Leader>ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap <Leader>li <Enter>\item<Space>
autocmd FileType tex inoremap <Leader>ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap <Leader>tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap <Leader>ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap <Leader>can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap <Leader>con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap <Leader>v \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap <Leader>a \href{}{<++>}<Space><++><Esc>2T{i
