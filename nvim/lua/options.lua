-- OPTIONS

-- syntax
vim.cmd [[
  syntax on
  let mapleader=" "
  colorscheme sonokai
  hi MatchParen guibg=NONE guifg=red gui=bold
  set shortmess+=c
]]

-- color settings
vim.opt.termguicolors=true

-- random settings
vim.opt.number=true
vim.opt.rnu=true
vim.opt.clipboard='unnamed'
vim.opt.mouse='nvi'

vim.opt.visualbell=true
vim.opt.virtualedit='block'
vim.opt.scrolloff=1
vim.opt.wildmenu=true
vim.opt.autoread=true
vim.opt.lazyredraw=true
vim.opt.history=250
vim.opt.showmode=false

vim.opt.completeopt='menuone,noinsert,noselect'

-- tabs and line wrap
vim.opt.expandtab=true
vim.opt.tabstop=2
vim.opt.wrapmargin=8
vim.opt.softtabstop=0
vim.opt.shiftwidth=2
vim.opt.backspace='indent,eol,start'
vim.opt.encoding='utf-8'
vim.opt.autoindent=true

-- search
vim.opt.incsearch=true
vim.opt.hlsearch=true
vim.opt.smartcase=true

-- Disable Backup and Swap files
vim.opt.swapfile=false
vim.opt.backup=false
vim.opt.writebackup=false

-- setup split
vim.opt.splitbelow=true
vim.opt.splitright=true

-- Enable folding
vim.opt.foldmethod='indent'
vim.opt.foldlevel=99
