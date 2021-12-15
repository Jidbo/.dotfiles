" PLUGINS
call plug#begin('~/.config/nvim/bundle')
" USEFUL
" ===================

" Editor config
Plug 'editorconfig/editorconfig-vim'

" brackets management
Plug 'tpope/vim-surround'

" WINDOW MANAGEMENT
" ===================

" tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" winresizer
Plug 'simeji/winresizer'

" goyo
Plug 'junegunn/goyo.vim'

" FILE MANAGEMENT
" ===================

" nerd-tree
Plug 'preservim/nerdtree'

" Icons
Plug 'ryanoasis/vim-devicons'

" fzf plugin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" vimwiki
Plug 'vimwiki/vimwiki'

" GIT STUFF
" ===================

" git
Plug 'tpope/vim-fugitive'

" vim gitgutter
Plug 'airblade/vim-gitgutter'

" COLORS
" ===================

" Plastic colorscheme
Plug 'jidbo/kuroi.vim'

" Color higlighting
Plug 'norcalli/nvim-colorizer.lua'

" powerline
Plug 'vim-airline/vim-airline'

" LANGUAGES
" ===================

" nvim language server
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Autoformatter
Plug 'sbdchd/neoformat'

" treesitter
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/playground'

" disable latex before loading
let g:polyglot_disabled = ["latex"]
Plug 'sheerun/vim-polyglot'

" latex
Plug 'lervag/vimtex'

" All of your Plugins must be added before the following line
call plug#end()
