return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = false,
  opts = {
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
  },
  config = function()
    local function find()
      require("telescope.builtin").find_files {
        hidden = true
      }
    end
    
    local function buffers()
      require("telescope.builtin").buffers {
        sort_lastused = true
      }
    end
    
    local function treesitter()
      require("telescope.builtin").treesitter()
    end
    
    -- KEYMAPS
    vim.keymap.set('n', '<C-y>', buffers)
    vim.keymap.set('n', '<leader>f', find)
    vim.keymap.set('n', '<leader>s', treesitter)
  end,
  keys = {
    {'<leader>l', '<cmd>Telescope live_grep<CR>'},
    {'<silent> gy', '<cmd>Telescope treesitter<CR>'}
  }
}
