local Plug = vim.fn['plug#']
-- PLUGINS
vim.call('plug#begin', '~/.config/nvim/bundle')
-- USEFUL
-- ===================

-- Editor config
Plug 'editorconfig/editorconfig-vim'

-- brackets management
Plug 'kylechui/nvim-surround'

-- comments
Plug 'numToStr/Comment.nvim'

-- shift and tab setup
Plug 'tpope/vim-sleuth'

-- new text objects
Plug 'wellle/targets.vim'

-- faster jump
Plug 'ggandor/leap.nvim'

-- auto brackets
Plug 'windwp/nvim-autopairs'

-- WINDOW MANAGEMENT
-- ===================

-- tmux navigator
Plug 'numToStr/Navigator.nvim'

-- winresizer
Plug 'simeji/winresizer'

-- vim zenmode
Plug 'folke/zen-mode.nvim'

-- FILE MANAGEMENT
-- ===================

-- nvim-tree.lua
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

-- telescope plugin
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- vimwiki
Plug 'vimwiki/vimwiki'

-- GIT STUFF
-- ===================

-- git
Plug 'tpope/vim-fugitive'

-- git signs
Plug 'lewis6991/gitsigns.nvim'

-- COLORS
-- ===================

-- Plastic colorscheme
Plug 'jidbo/sonokai'

-- Color higlighting
Plug 'norcalli/nvim-colorizer.lua'

-- powerline
Plug 'nvim-lualine/lualine.nvim'

-- LANGUAGES
-- ===================

-- nvim completion
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'folke/trouble.nvim'
Plug 'ray-x/lsp_signature.nvim'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

-- treesitter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- latex
Plug 'lervag/vimtex'

-- All of your Plugins must be added before the following line
vim.call('plug#end')
