syntax enable           " enable syntax processing
set tabstop=4           " number of visual spaces per TAB
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent file
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need
set showmatch           " hightlight matching [{()}]
set incsearch           " search as characters are enntered
set hlsearch            " highlight matches
" turn off search highlight by click <space>
nnoremap <leader><space> :nohlsearch<CR>
set ignorecase          " ignore case in search patterns
set smartcase           " Override the 'ignorecase' option if the search pattern contians upper case charactors
