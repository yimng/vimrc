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
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-syntastic/syntastic'

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
if has('syntax') && !exists('g:syntax_on')
  syntax enable         " enable syntax processing
endif
set autoread            " Set to auto read when a file is changed from the outside (default noautoread)
set number              " show line numbers (default nonumber)
set hidden              " Hide buffers when they are abandoned (default nohidden)
set nostartofline
set laststatus=2        " Always display the status line, even if only one window is displayed (default value 1)
set confirm             " instead of failing a command because of unsaved changes, instead raise a
                        " dialogue asking if you wish to save changed files.
if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

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
set display+=lastline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set background=dark

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
if !&scrolloff
  set scrolloff=7       " the line before or after cursor when scroll
endif
if !&sidescrolloff
  set sidescrolloff=5   "
endif
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
if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif
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
" CtrlP settings
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
" vim-javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-syntastic/syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args='--disable=C0111,R0903,C0301'
let g:syntastic_mode_map = {
    \ 'mode': 'passive', 
    \ 'active_filetypes': [], 
    \ 'passive_filetypes': ['go']
\ }
map <F4> :SyntasticCheck<CR>

