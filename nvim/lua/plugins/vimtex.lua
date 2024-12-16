return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    vim.api.nvim_set_var('vimtex_compiler_engine', 'lualatex')
    vim.api.nvim_set_var('vimtex_quickfix_mode', 0)
    vim.api.nvim_set_var('tex_flavor', 'latex')
    vim.api.nvim_set_var('vimtex_compiler_method', 'latexmk')
    vim.api.nvim_set_var('vimtex_compiler_latexmk', {
      backend = 'nvim',
      background = 1,
      build_dir = '',
      callback = 1,
      continuous = 1,
      executable = 'latexmk',
      hooks = {},
      options = { '-pdflatex=lualatex', '-file-line-error', '-synctex=1', '-interaction=nonstopmode' }
    })
  end,
}
