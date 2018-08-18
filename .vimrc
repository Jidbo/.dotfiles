set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" Simply Fold
Plugin 'tmhedberg/SimpylFold'

" autodindent python
Plugin 'vim-scripts/indentpython.vim'

" syntax highlighting
Plugin 'vim-syntastic/syntastic'

" pep8 checking
Plugin 'nvie/vim-flake8'

" autocomplete 
Bundle 'Valloric/YouCompleteMe'

" search for files
Plugin 'ctrlpvim/ctrlp.vim'

" color schemes
Plugin 'flazz/vim-colorschemes'

" nert-tree
Plugin 'scrooloose/nerdtree'

" git
Plugin 'tpope/vim-fugitive'

" easy escape
Plugin 'zhou13/vim-easyescape'

" powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" syntax
syntax on
colorscheme Benokai
let g:airline_theme='luna'
let python_highlight_all=1

set number
set clipboard=unnamed

set tabstop=4
set wrapmargin=8
set softtabstop=0 noexpandtab
set shiftwidth=4
set backspace=2
set backspace=indent,eol,start
set encoding=utf-8

" setup split
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" remap code folding
nnoremap <space> za

" see docstrings for folded code
let g:SimpylFold_docstring_preview=1

" pep 8 indents
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

" html css js indents
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" you complete me setup 
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" nerd tree setup
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR>

" easyescape setup
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
cnoremap jk <ESC>
cnoremap kj <ESC>

" airline tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
