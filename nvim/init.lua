local nvim_config_root = "~/.config/nvim"

-- BASIC OPTIONS
require('plugins')
require('options')
require('mappings')

-- VIM PLUGIN OPTIONS
vim.cmd("source " .. nvim_config_root .. "/pluginoptions.vim")

-- LUA PLUGIN OPTIONS
require('telescopeconfig')
require('autocompletion')
require('treesitterconfig')
require('filemanager')
require('statusline')
