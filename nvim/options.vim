" OPTIONS

" syntax
syntax on
let mapleader=" "

" color settings
set termguicolors
colorscheme kuroi
set background=dark
hi MatchParen guibg=NONE guifg=red gui=bold

" random settings
set number
set clipboard=unnamed
set mouse=nvi
" set smarttab
set expandtab
set tabstop=4
set visualbell
set virtualedit=block
set scrolloff=1
set wildmenu
set autoread
set lazyredraw
set history=250
set noshowmode

" tabs and line wrap
set tabstop=4
set wrapmargin=8
set softtabstop=0 noexpandtab
set shiftwidth=4
set backspace=2
set backspace=indent,eol,start
set encoding=utf-8
set autoindent

" search
set incsearch
set hlsearch
set smartcase

" Disable Backup and Swap files
set noswapfile
set nobackup
set nowritebackup

" setup split
set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99
