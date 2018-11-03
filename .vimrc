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

" powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" promela syntax highlighting
Plugin 'vim-scripts/promela.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" syntax
syntax on
colorscheme Benokai
let g:airline_theme='luna'
let python_highlight_all=1
let mapleader=" "

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
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" remap code folding
nnoremap <leader>f za

" see docstrings for folded code
let g:SimpylFold_docstring_preview=1
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
map <leader>n :NERDTreeToggle<CR>

" airline tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
