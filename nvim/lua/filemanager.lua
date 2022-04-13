-- NVIM TREE setup
-- icons
vim.g.nvim_tree_icons = {
  default =        '',
  symlink =        '',
  git = {
    unstaged =     "✗",
    staged =       "✓",
    unmerged =     "",
    renamed =      "➜",
    untracked =    "★",
    deleted =      "",
   },
  folder = {
    default =      "",
    open =         "",
    empty =        "",
    empty_open =   "",
    symlink =      "",
    symlink_open = "",
   },
}


-- extra options
vim.g.nvim_tree_indent_markers=1
vim.g.nvim_tree_add_trailing=1
vim.g.nvim_tree_special_files= {
  ["README.md"] = true,
  ["readme.md"] = true,
  Pipfile = true,
  Makefile = true,
  ["package.json"] = true,
}

-- colors
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

-- setup
require'nvim-tree'.setup {
  update_cwd          = true,
  update_to_buf_dir   = {
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
  view = {
    mappings = {
      custom_only = false,
      list = {}
    },
  },
  trash = {
    cmd = "trash"
  }
}

vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")
