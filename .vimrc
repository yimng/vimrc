colorscheme badwolf     " awesome colorscheme
syntax enable           " enable syntax processing
set tabstop=4           " number of visual spaces per TAB
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent file
filetype plugin on
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need
set showmatch           " hightlight matching [{()}]
set incsearch           " search as characters are enntered
set hlsearch            " highlight matches
set ignorecase          " ignore case in search patterns
set smartcase           " Override the 'ignorecase' option if the search pattern contians upper case charactors
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
