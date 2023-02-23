-- TELESCOPE
require("telescope").setup {
  defaults = {
    -- ....
  },
  pickers = {
    find_files = {
      find_command = { "fd",
        "--type", "f",
        "--strip-cwd-prefix",
        -- "--exclude", "node_modules",
        "--exclude", ".git",
      }
    },
  }
}

-- FUNCTIONS
local function find()
  require("telescope.builtin").find_files {
    hidden = true
  }
end

-- KEYMAPS
vim.keymap.set('n', '<C-y>', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>f', find)
vim.keymap.set('n', '<leader>l', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<silent> gy', '<cmd>Telescope treesitter<CR>')

