-- search for visual selection
vim.keymap.set('v', '//', 'y/<C-R>"<CR>')
vim.keymap.set('n', 'H', '^')


-- ex command 
vim.keymap.set('c', '<C-p>', '<Up>')
vim.keymap.set('c', '<C-n>', '<Down>')

-- auto expand brackets
vim.keymap.set('i', '(;', '(<CR>)<C-c>O')
vim.keymap.set('i', '(,', '(<CR>),<C-c>O')
vim.keymap.set('i', '{;', '{<CR>}<C-c>O')
vim.keymap.set('i', '{,', '{<CR>},<C-c>O')
vim.keymap.set('i', '[;', '[<CR>]<C-c>O')
vim.keymap.set('i', '[,', '[<CR>],<C-c>O')

-- toggle hybrid mode
vim.keymap.set('n', '<leader>h', ':set rnu!<CR>')

-- Telescope
vim.keymap.set('n', '<C-y>', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>l', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<silent> gy', '<cmd>Telescope treesitter<CR>')

vim.keymap.set('n', '<leader>wm', require("notes").list)
vim.keymap.set('n', '<leader>wt', require("notes").tags)

-- neo formatter
vim.keymap.set('n', '<leader>p', ':Neoformat<CR>')

-- spelling
vim.keymap.set('n', '<silent> <leader>se', ':set spell spelllang=en<CR>')
vim.keymap.set('n', '<silent> <leader>sd', ':set spell spelllang=de<CR>')
