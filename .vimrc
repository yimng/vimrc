set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible        " close the compatable
filetype indent on      " load filetype-specific indent file
set autoread            " Set to auto read when a file is changed from the outside
set number              " show line numbers

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu            " visual autocomplete for command menu
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase          " ignore case in search patterns
set smartcase           " Override the 'ignorecase' option if the search pattern contians upper case charactors
set hlsearch            " highlight matches
set incsearch           " search as characters are enntered
set lazyredraw          " redraw only when we need
set showmatch           " hightlight matching [{()}]
" turn off search highlight by click <space>
nnoremap <leader><space> :nohlsearch<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable           " enable syntax processing
syntax on               " enable syntax highlight
try
    colorscheme desert
catch
endtry
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb                " turn off writebackup
set noswapfile          " turn off swapfile
"When set autowrite, vi will automatically write out
"the contents of a changed buffer when you issue the :n (next) command to move to the
"next file to be edited, and before running a shell command with :!.
set autowrite

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab           " tabs are spaces
set smarttab            " be smart when use tabs
set tabstop=4           " number of visual spaces per TAB
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " number of spaces in tab when editing
set ai                  " auto indent
set si                  " smart indent
set wrap                " wrap lines
set textwidth=0         " set textwidth length
 " sets a mapping so that pressing F2 in normal mode will invert the 'paste' option
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>    " <F2> toggle the paste and nopaste mode
set showmode            " enables displaying whether 'paste' is turned on in insert mode


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Support Chinese Character
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set encoding=utf-8
set termencoding=gbk
"set gfn=Monaco:h10:cANSI
"set gfw=NSimsun:h12

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Support OCaml with merlin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"



" =====================================tagbar
nmap <F8> :TagbarToggle<CR>

" =====================================ctrlp
let g:ctrlp_map = '<c-p>' 
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" =====================================nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let NERDTreeHighlightCursorline=1
map <F3> :NERDTreeToggle<CR>
