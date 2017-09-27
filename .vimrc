"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A basic vim config file with plugins
" Author: Lukun
" Email: yimng@me.com
" Version: 1.0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible        " be iMproved, required
filetype off            " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" general plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jiangmiao/auto-pairs'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'

"javascript plugin
Plugin 'moll/vim-node'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mxw/vim-jsx'

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
set number              " show line numbers
set relativenumber      " Show the line number relative to the line with the cursor
set wrap                " wrap lines
"set scrolljump=5        " Lines to scroll when cursor leaves the screen
set fileencodings+=cp936,gb18030,big5
                       " Support Chinese

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu            " visual autocomplete for command menu 
set wildignore=*.o,*.obj,*.out,*.bak,*.cmo,*.cmi,*.cmx,*.exe,*.py[co],*.swp,*~,.svn,.git
set wildmode=list:longest,full
set backspace=eol,start,indent
"set whichwrap+=<,>      " Add left and right key to wrap the line when move cursor
"set showmode            " show the vim mode 
"set showcmd             " Show partial commands in the last line of the screen
"set ruler               " Show the line and column number of the cursor position
"set title               " show file in titlebar
set laststatus=2        " Always display the status line, even if only one window is displayed 
"set nostartofline       " Keep the cursor at the same column as possible
"set display+=lastline   " When included, as much as possible of the last line in a window will be displayed

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
    set undofile        " keep an undo file in /tmp/vimundo
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
set expandtab           " expand tab to space
set listchars+=tab:>-,trail:~,extends:>,precedes:<
                        " The visible chars to displayed when set list
if has("autocmd")
  autocmd FileType c,cpp,cs,diff,java,perl,php,python,sh,sql,xml,zsh          
        \ setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
  autocmd FileType ocaml,css,html,javascript,vim,yaml,json                         
        \ setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Support OCaml with merlin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim/ctrlp.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>' 
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_match_window_reversed=0
let g:ctrlp_follow_symlinks=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-syntastic/syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" majutsushi/tagbar 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scrooloose/nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F3> :NERDTreeToggle<CR>

" stop scroll the window when switch buffers
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif
