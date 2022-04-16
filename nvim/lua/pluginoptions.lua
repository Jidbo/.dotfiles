-- PLUGIN OPTIONS

-- GITGUTTER SETUP
-- =========================
vim.api.nvim_set_var('gitgutter_sign_added', '∙')
vim.api.nvim_set_var('gitgutter_sign_modified', '∙')
vim.api.nvim_set_var('gitgutter_sign_removed', '∙')
vim.api.nvim_set_var('gitgutter_sign_modified_removed', '∙')

vim.cmd [[
augroup VimDiff
	autocmd!
	autocmd VimEnter,FilterWritePre * if &diff | GitGutterDisable | endif
augroup END
]]

-- VIMWIKI SETUP
-- =========================
vim.api.nvim_set_var('vimwiki_list', {{path = '~/.notes/', syntax = 'markdown', ext = '.md'}})
vim.api.nvim_set_var('vimwiki_hl_headers', 1)
vim.api.nvim_set_var('vimwiki_listsyms', '    X')

-- VIMTEX SETUP
-- =========================

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
 options = {'-pdflatex=lualatex', '-file-line-error', '-synctex=1', '-interaction=nonstopmode'}
})

-- TMUX SETUP
-- =========================
vim.api.nvim_set_var('tmuxcomplete#trigger', '')


-- GOYO
-- =========================

vim.cmd [[
function! s:goyo_enter()
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  set showcmd
  set scrolloff=1
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
]]

vim.api.nvim_set_var('goyo_width', 120)

-- COLORS.LUA SETUP
-- =========================
require('colorizer').setup()
