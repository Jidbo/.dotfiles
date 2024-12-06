return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {
        update_cwd = true,
        renderer = {
          add_trailing = false,
          special_files = {"README.md", "readme.md", "Pipfile", "Makefile", "package.json"},
          indent_markers = {
            enable = true,
          },
        },
        hijack_directories = {
      	enable = true,
      	auto_open = true,
        },
        system_open = {
          cmd  = "open"
        },
        filters = {
          dotfiles = true
        },
        git = {
          enable = true,
          ignore = false,
          timeout = 500,
        },
        trash = {
          cmd = "trash"
        }
      }

      vim.cmd [[hi Directory guifg=#D1D5DB ctermfg=blue]]
      vim.cmd [[hi NvimTreeFolderIcon guifg=#4B5563]]
      vim.cmd [[hi NvimTreeRootFolder guifg=#9CA3AF]]
      vim.cmd [[hi NvimTreeIndentMarker guifg=#9CA3AF]]
      vim.cmd [[hi NvimTreeExecFile guifg=#DC2626]]
      vim.cmd [[hi NvimTreeGitDirty guifg=#FB923C]]
      vim.cmd [[hi NvimTreeGitStaged guifg=#DC2626]]
      vim.cmd [[hi NvimTreeGitNew guifg=#DC2626]]
      vim.cmd [[hi NvimTreeGitDeleted guifg=#DC2626]]
      vim.cmd [[hi NvimTreeSpecialFile guifg=#F8FAFC ]]
      vim.cmd [[hi NvimTreeFolderName guifg=#D1D5DB ]]
      vim.cmd [[hi NvimTreeOpenedFolderName guifg=#D1D5DB ]]
      vim.cmd [[hi NvimTreeEmptyFolderName guifg=#D1D5DB ]]
    end,
    keys = {
      { '<leader>e', '<cmd>NvimTreeToggle<CR>' },
    },
  }
}
