" vimrc file {{{
function Vimrc()
   find $VIMRUNTIME\..\_vimrc
endfunction
" }}}

set nocompatible

" Plugins {{{
filetype off
command! PU PlugUpdate | PlugUpgrade
call plug#begin('~/.vim/plugged/')

Plug 'junegunn/vim-plug'

" UltiSnips {{{
if has('python3')
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltisnipsJumpBackwardTrigger="<s-tab>"
    let g:UltisnipsEditSplit="vertical"
    let g:UltisnipsSnippetDir= "C:/Users/aaron/Ultisnips"
endif
" let g:UltisnipsSnippetDirectories=["C:/Users/aaron/Ultisnips"]
" }}}

"  NerdTree {{{
Plug 'scrooloose/nerdtree'

let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store', '\.DAT*', '.gitconfig', '\.exe', '_viminfo', 'ntuser.ini']

let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-T> :NERDTreeToggle<CR>
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

" UndoTree --- not installed {{{
" Plug 'mbbill/undotree'
" map <Leader>u :UndotreeShow<CR>
" }}}

" Gruvbox {{{
Plug 'gruvbox-community/gruvbox'
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<ESC>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<ESC>[48;2;%lu;%lu;%lum"
endif
set t_Co=256
let g:gruvbox_invert_selection='0'
" }}}

" Mini-Plugins {{{
Plug 'vim-scripts/IndexedSearch'
" Plug 'Townk/vim-autoclose'
" let g:AutoClosePairs = "() [] {} \"\" ''"
Plug 'Raimondi/delimitMate'
Plug 'vim-syntastic/syntastic'

" " set statusline-=%#warningmsg#
" " set statusline-=%{SyntasticStatuslineFlag()}
" " set statusline-=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

Plug 'vim-python/python-syntax'

Plug 'vim-scripts/indentpython.vim'
" }}}

call plug#end()

filetype plugin indent on

" Disable Autoclosing for Tex-Files
" autocmd BufNewFile,BufRead *.tex AutoCloseOff

" }}}

" Basic settings {{{
set encoding=utf-8

set path+=**
set wildmenu

" Windows
set wildignore+=*/AppData/*,*/.ipython/*,*/3D\ Objects/*,*/Backup/*,*/Contacts/*,*/Cookies/*,*/Druckumgebung/*,*/Favorites/*,*/IntelGraphicsProfiles/*
set wildignore+=*/Links/*,*/Lokale\ Einstellungen/*,*/MicrosoftEdgeBackups/*,*/Music/*,*/Netzwerkumgebung/*,*/OneDrive/*,*/Pictures/*
set wildignore+=*/Recent/*,*/Saved\ Games/*,*/Searches/*,/*SendTo/*,*/Startmenü/*,*/Videos/*,*/Vorlagen/*

set guifont=Consolas:h11:b:cANSI:qDRAFT
set fillchars+=vert:\$

colorscheme gruvbox
set background=dark

" Windows?
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set lines=999 columns=999

set hlsearch
nnoremap <C-l> :noh<CR>

set ruler laststatus=2
set hidden
set foldmethod=marker

set splitbelow
set splitright

set number
set relativenumber

set expandtab
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab
au BufRead,BufNewFile *.yaml setlocal ts=2 sts=2 sw=2 expandtab
au BufRead,BufNewFile *.yml setlocal ts=2 sts=2 sw=2 expandtab
set tabstop=4 softtabstop=4 shiftwidth=4

set backspace=indent,eol,start whichwrap+=<,>,[,]

set nowrap

set nrformats-=octal

" }}}

" Syntax {{{
let python_highlight_all=1
syntax enable
" set spelllang=en,de
"}}}

" Backup and swap {{{
set noswapfile
set undofile
set undodir=~/aaron/vim/undo
set backupdir=~/aaron/vim/backup
" }}}

" Autocommands {{{
set updatetime=500
autocmd CursorHold * if @% != "" && &modifiable| update | endif
autocmd BufLeave * if &modifiable | %s/\s\+$//e | endif


" }}}

" mappings {{{

" hardmode
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Down> <Nop>
nnoremap <Up> <Nop>

inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Down> <Nop>
inoremap <Up> <Nop>

cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Down> <Nop>
cnoremap <Up> <Nop>

map <Space> <Leader>

nnoremap Y y$

" keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" create undo breakpoints
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" jumplist mutation
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" moving lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <ESC>my:m .+1<CR>==`ya
inoremap <C-k> <ESC>my:m .-2<CR>==`ya
nnoremap <Leader>j :m .+1<CR>==
nnoremap <Leader>k :m .-2<CR>==

" navigation in command mode
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

" jumping in exercise correction
nnoremap <Space><Space> /<++><CR>"_c4l
nnoremap <C-Space><C-Space> ?<++><CR>"_c4l

" CTRL-X in visual
vnoremap <C-X> "+x

" CTRL-C in visual
vnoremap <C-C> "+y

" CTRL-V for pasting
vnoremap <C-V> "+gP
inoremap <C-V> <Space><C-o>"+gP
cmap <C-V> <C-R>+

" CTRL-U for character codes
inoremap <C-U> <C-V>

" CTRL-F to make word uppercase
map! <C-F> <Esc>gUiw`]a

" CTRL-Tab is Next window
nnoremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" NerdTree open new file and close old buffer
nnoremap <Leader>s s<C-T><C-H>:bd<CR>

" .vimrc
autocmd FileType vimrc nnoremap <F5> :source $MYVIMRC<CR><CR>

" Python
autocmd Filetype python map <Leader>p <ESC>Iprint(<ESC>A)<ESC>
autocmd Filetype python nmap <F5> :! %<CR><CR>
autocmd FileType python nmap <F11> :SyntasticCheck<CR>

" Java
autocmd Filetype java nmap <F5> :!javac %<CR>
autocmd Filetype java nmap <F6> :!java %:r<CR>
autocmd Filetype java nmap <F11> :!javac % & java %:r<CR><CR>

" LaTex
let g:tex_flavor='latex'
autocmd FileType tex nmap <F5> :!start cmd /c "pdflatex -shell-escape %"<CR>
autocmd FileType tex nmap <C-F5> :!start cmd /c "pdflatex -shell-escape %"<CR>
autocmd FileType tex nmap <F6> :!start cmd /c "cd .. && pdflatex Zusammenfassung"<CR>
autocmd FileType tex nmap <F7> :!start cmd /c "pdflatex -shell-escape ../%:p:h:t"<CR>
autocmd FileType tex nmap <F8> :!start cmd /c "biber %:p"<CR>

" }}}
