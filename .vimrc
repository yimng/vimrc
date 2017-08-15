"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A basic vim config file with plugins
" author: Lukun
" email: yimng@me.com
" version: 1.0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible        " be iMproved, required
filetype off            " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'rking/ag.vim'
Plugin 'dyng/ctrlsf.vim'
"Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('syntax') && !exists('g:syntax_on')
  syntax enable         " enable syntax processing
endif
set hidden              " Hide buffers when they are abandoned 
set confirm             " instead of failing a command because of unsaved changes, instead raise a
                        " dialogue asking if you wish to save changed files.
set pastetoggle=<F2>    " <F2> toggle the paste and nopaste mode
set path+=$PWD/**       " Set current path as vim path
set wrap                " wrap lines
set textwidth=0         " set textwidth length
set cursorline          " Highlight the screen line of the cursor with CursorLine

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu            " visual autocomplete for command menu 
set wildignore=*.o,*.obj,*.out,*.bak,*.cmo,*.cmi,*.cmx,*.exe,*.py[co],*.swp,*~,.svn,.git,node_modules/**
set wildmode=list:longest,full
set backspace=eol,start,indent
set whichwrap+=<,>      " Add left and right key to wrap the line when move cursor
set lazyredraw          " redraw only when we need
set display+=lastline
set showmode            " show the vim mode 
set showcmd             " Show partial commands in the last line of the screen
set ruler               " Show the line and column number of the cursor position
set title               " show file in titlebar
set ttyfast             " Indicates a fast terminal connection
set laststatus=2        " Always display the status line, even if only one window is displayed 
set number              " show line numbers
set relativenumber      " Show the line number relative to the line with the cursor
set nostartofline       " Keep the cursor at the same column as possible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase          " ignore case in search patterns
set smartcase           " Override the 'ignorecase' option if the search pattern contians upper case charactors
set hlsearch            " highlight matches
set matchpairs+=<:>     " specially for html
set incsearch           " search as characters are enntered 
set showmatch           " hightlight matching [{()}] 
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
                        " turn off search highlight by click <space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " do not keep a backup file, use versions instead
set autoread            " Set to auto read when a file is changed from the outside
set nowb                " turn off writebackup
set noswapfile          " turn off swapfile
if has('persistent_undo')
    let udir = '/tmp/vimundo'
    call system('mkdir ' . udir)
    let &undodir = udir
    set undofile        " keep an undo file
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smarttab            " be smart when use tabs
set smartindent         " smart indent
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " number of spaces in tab when editing
set tabstop=4           " number of visual spaces per TAB
set autoindent          " auto indent
set listchars+=tab:>-,trail:~,extends:>,precedes:<
                        " The visible chars to displayed when set list
if has("autocmd")
  autocmd FileType c,cpp,cs,diff,java,perl,php,python,sh,sql,xml,zsh          
        \ setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
  autocmd FileType ocaml,css,html,javascript,vim,yaml                         
        \ setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Support Chinese Character
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings+=cp936,gb18030,big5

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Support OCaml with merlin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim/ctrlp.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>' 
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
    \ 'dir':  'dist\|node_modules\|\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-syntastic/syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_python_pylint_args='--disable=C0111,R0903,C0301'
let g:syntastic_mode_map = {
    \ 'mode': 'passive', 
    \ 'active_filetypes': [], 
    \ 'passive_filetypes': ['go']
\ }
map <F4> :SyntasticCheck<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dyng/ctrlsf.vim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
