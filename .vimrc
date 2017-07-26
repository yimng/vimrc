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
"Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'moll/vim-node'

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
set nocompatible        " close the compatable (default nocompatible)
syntax enable           " enable syntax processing
"syntax on               " enable syntax highlight
filetype on
filetype indent on      " load filetype-specific indent file
filetype plugin on
set autoread            " Set to auto read when a file is changed from the outside (default noautoread)
set number              " show line numbers (default nonumber)
set hidden              " Hide buffers when they are abandoned (default nohidden)
set nostartofline
set laststatus=2        " Always display the status line, even if only one window is displayed (default value 1)
set confirm             " instead of failing a command because of unsaved changes, instead raise a
                        " dialogue asking if you wish to save changed files.
"set visualbell          " Use visual bell instead of beeping when doing something wrong
"set t_vb=               " And reset the terminal code for the visual bell. If visualbell is set, and
                        " this line is also included, vim will neither flash nor beep. If visualbell
                        " is unset, this does nothing.
set mouse=a             " Enable use of the mouse for all modes
"set cmdheight=2         " Set the command window height to 2 lines, to avoid many cases of having to
                        " "press <Enter> to continue"
set notimeout ttimeout ttimeoutlen=200
                        " Quickly time out on keycodes, but never time out on mappings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu            " visual autocomplete for command menu (default nowildmenu)
set backspace=eol,start,indent
set whichwrap+=<,>      " Add left and right key to wrap the line when move cursor
set ignorecase          " ignore case in search patterns (default noignorecase)
set smartcase           " Override the 'ignorecase' option if the search pattern contians upper case charactors (default smartcase)
set hlsearch            " highlight matches (default hlsearch)
set incsearch           " search as characters are enntered (default noincsearh)
set lazyredraw          " redraw only when we need (default nolazyredraw)
set showmatch           " hightlight matching [{()}] (default noshowmatch)
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
                        " turn off search highlight by click <space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " turn off backup file
set nowb                " turn off writebackup
set noswapfile          " turn off swapfile
"set autowrite          " When set autowrite, vi will automatically write out
                        " the contents of a changed buffer when you issue the :n (next) command to move to the
                        " next file to be edited, and before running a shell command with :!.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab           " tabs are changed to spaces auto
set smarttab            " be smart when use tabs
set tabstop=2           " number of visual spaces per TAB
set shiftwidth=2        " number of spaces to use for each step of (auto)indent
set softtabstop=2       " number of spaces in tab when editing
set autoindent          " auto indent
set smartindent         " smart indent
set wrap                " wrap lines
set textwidth=0         " set textwidth length
set pastetoggle=<F2>    " <F2> toggle the paste and nopaste mode
set showmode            " show the vim mode 
set showcmd             " Show partial commands in the last line of the screen (default noshowcmd)
set ruler               " Show the line and column number of the cursor position (default ruler)
set scrolloff=7         " the line before or after cursor when scroll
autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
autocmd FileType ocaml      setlocal sw=2 sts=2 ts=2 et
autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Support Chinese Character
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings+=cp936,gb18030,big5
"set fileencoding=utf-8
"set encoding=utf-8
"set termencoding=gbk
"set gfn=Monaco:h10:cANSI
"set gfw=NSimsun:h12

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Support OCaml with merlin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctlp 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let NERDTreeHighlightCursorline=1
map <F3> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:javascript_plugin_jsdoc = 1
