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
set nowb
set noswapfile

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
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
