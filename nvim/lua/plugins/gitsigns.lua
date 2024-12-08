return {
  {"lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      on_attach = function()
	local gitsigns = require('gitsigns')
	gitsigns.setup()
	vim.keymap.set('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
	vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame)
      end,
    },
    keys = {
      { '<leader>hb', nil },
      { '<leader>tb', nil }
    },
  },
}
