-- search for visual selection
vim.keymap.set('v', '//', 'y/<C-R>"<CR>')
vim.keymap.set('n', 'H', '^')

-- ex command
vim.keymap.set('c', '<C-p>', '<Up>')
vim.keymap.set('c', '<C-n>', '<Down>')

-- toggle hybrid mode
vim.keymap.set('n', '<leader>n', ':set rnu!<CR>')

-- spelling
vim.keymap.set('n', '<silent> <leader>se', ':set spell spelllang=en<CR>')
vim.keymap.set('n', '<silent> <leader>sd', ':set spell spelllang=de<CR>')

-- source
vim.keymap.set('n', '<leader><leader>x', ':source ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>x', ':source %<CR>')
