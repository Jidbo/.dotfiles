local map = require("utils").map
-- search for visual selection
map {'v', '//', 'y/<C-R>"<CR>'}
map {'n', 'H', '^'}

-- ex command 
map {'c', '<C-p>', '<Up>'}
map {'c', '<C-n>', '<Down>'}

-- auto expand brackets
map {'i', '(;', '(<CR>)<C-c>O'}
map {'i', '(,', '(<CR>),<C-c>O'}
map {'i', '{;', '{<CR>}<C-c>O'}
map {'i', '{,', '{<CR>},<C-c>O'}
map {'i', '[;', '[<CR>]<C-c>O'}
map {'i', '[,', '[<CR>],<C-c>O'}

-- toggle hybrid mode
map {'n', '<leader>h', ':set rnu!<CR>'}

-- nvim-tree.lua
map {'n', '<leader>e', ':NvimTreeToggle<CR>'}

-- Telescope
map {'n', '<C-y>', '<cmd>Telescope buffers<CR>'}
map {'n', '<leader>f', '<cmd>Telescope find_files<CR>'}
map {'n', '<leader>l', '<cmd>Telescope live_grep<CR>'}
map {'n', '<silent> gy', '<cmd>Telescope treesitter<CR>'}

map {'n', '<leader>wm', '<cmd>lua require("notes").list()<CR>'}
map {'n', '<leader>wt', '<cmd>lua require("notes").tags()<CR>'}

-- neo formatter
map {'n', '<leader>p', ':Neoformat<CR>'}

-- goyo mapping
map {'n', '<silent> <leader>w', ':Goyo<CR>'}

-- spelling
map {'n', '<silent> <leader>se', ':set spell spelllang=en<CR>'}
map {'n', '<silent> <leader>sd', ':set spell spelllang=de<CR>'}
