return {
  'stevearc/oil.nvim',

  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  keys = {
    { '<leader>o', '<CMD>Oil<CR>' }
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
