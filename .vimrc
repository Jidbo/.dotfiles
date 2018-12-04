" if empty(glob("~/.vim/bundle/Vundle.vim"))
	" silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	" autocmd GUIEnter * PluginInstall
			" \ source ~/.vimrc
" endif

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

" jedi-vim
Plugin 'davidhalter/jedi-vim'

" winresizer
Plugin 'simeji/winresizer'

" search for files
Plugin 'ctrlpvim/ctrlp.vim'

" color schemes
Plugin 'flazz/vim-colorschemes'

" nert-tree
Plugin 'scrooloose/nerdtree'

" nerd-commenter
Plugin 'scrooloose/nerdcommenter'

" git
Plugin 'tpope/vim-fugitive'

" surround blocks
Plugin 'tpope/vim-surround'

" latex
Plugin 'lervag/vimtex'

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

" random settings
set number
set clipboard=unnamed
set mouse=nvi
set smarttab
set visualbell
set virtualedit=block
set scrolloff=1
set wildmenu
set term=screen-256color

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

" setup split
set splitbelow
set splitright

"split navigations
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" tabs
nnoremap <leader>t :tabnew<CR> 
nnoremap <leader>u gT
nnoremap <leader>i gt

" Enable folding
set foldmethod=indent
set foldlevel=99

" remap code folding
nnoremap <leader>f za

" html css js indents
au BufNewFile,BufRead *.js, *.html, *.css
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4

" PLUGIN SETTINGS
" nerd tree setup
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <leader>n :NERDTreeToggle<CR>

" ctrl-p setup
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn))?(venv)?$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" see docstrings for folded code
let g:SimpylFold_docstring_preview=1

" airline tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" nerd-commenter setup
let g:NERDSpaceDelims = 1
