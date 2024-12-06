-- search for visual selection
vim.keymap.set('v', '//', 'y/<C-R>"<CR>')
vim.keymap.set('n', 'H', '^')

-- ex command 
vim.keymap.set('c', '<C-p>', '<Up>')
vim.keymap.set('c', '<C-n>', '<Down>')

-- auto expand brackets
-- vim.keymap.set('i', '(;', '(<CR>)<C-c>O')
-- vim.keymap.set('i', '(,', '(<CR>),<C-c>O')
-- vim.keymap.set('i', '{;', '{<CR>}<C-c>O')
-- vim.keymap.set('i', '{,', '{<CR>},<C-c>O')
-- vim.keymap.set('i', '[;', '[<CR>]<C-c>O')
-- vim.keymap.set('i', '[,', '[<CR>],<C-c>O')

-- toggle hybrid mode
vim.keymap.set('n', '<leader>l', ':set rnu!<CR>')

-- spelling
vim.keymap.set('n', '<silent> <leader>se', ':set spell spelllang=en<CR>')
vim.keymap.set('n', '<silent> <leader>sd', ':set spell spelllang=de<CR>')

-- source 
vim.keymap.set('n', '<leader><leader>x', ':source ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>x', ':source %<CR>')

