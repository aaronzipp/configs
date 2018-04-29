" vim: fdm=marker foldenable sw=4 ts=4 sts=4
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nocompatible
filetype off
set encoding=utf-8

" Plugins {{{
command! PU PlugUpdate | PlugUpgrade
call plug#begin('C:\Program Files (x86)\Vim\vim80\plugged')

Plug 'junegunn/vim-plug'

"  NerdTree {{{
Plug 'scrooloose/nerdtree'

let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store', '\.DAT*', '.gitconfig', '\.exe', '_viminfo', 'ntuser.ini']

let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>
" }}}

" tpope {{{
Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-vividchalk'
" }}}

" vim-sort-motion {{{
Plug 'christoomey/vim-sort-motion'

let g:sort_motion_flags="ui"
" }}}

Plug 'nvie/vim-flake8'

Plug 'lilydjwg/colorizer'

Plug 'junegunn/goyo.vim'
let g:goyo_width=130
let g:goyo_height=55

Plug 'tomasiser/vim-code-dark'

Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

filetype plugin indent on

" }}}

" Colors and other basic settings {{{
set guifont=Consolas:h11:b:cANSI:qDRAFT
set fillchars+=vert:\$
colorscheme vividchalk
set background=dark

set ruler laststatus=2
set hidden

set splitbelow
set splitright

set number
set relativenumber

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab autoindent
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
:set lines=999 columns=999
" }}}

" Backup and swap {{{
set noswapfile
set undofile
set undodir=$HOME/vim/undo
set backupdir=$HOME/vim/backup
" }}}

" vimrc file {{{
function Vimrc()
   find $VIMRUNTIME\..\_vimrc
endfunction
" }}}

set path+=**
set wildmenu

set updatetime=500
autocmd CursorHold * if @% != "" | update | endif
autocmd BufLeave * if &modifiable | %s/\s\+$//e | endif

set foldmethod=marker

syntax enable
set spelllang=en,de
autocmd Filetype txt,tex set spell

" mappings {{{
let mapleader=","

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <C-Y> :sh<CR><CR>

nnoremap <F11> :Goyo<CR>

nnoremap <Space><Space> /<++><CR>"_c4l

" CSS
autocmd FileType css inoremap { {<CR><CR><BS>}<ESC>ki<TAB>

" }}}

" diffexpr (default by Windows) {{{
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
" }}}
