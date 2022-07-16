local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local pickers = require "telescope.pickers"
local sorters = require "telescope.sorters"
local conf = require("telescope.config").values
local flatten = vim.tbl_flatten


local function list()
  require("telescope.builtin").find_files {
    prompt_title = "Notes",
    cwd = "~/.notes"
  }
end

local function tags()
  local opts = {}

  local vimgrep_arguments = conf.vimgrep_arguments
  opts.cwd = vim.fn.expand("~/.notes")

  local additional_args = {}
  if opts.additional_args ~= nil and type(opts.additional_args) == "function" then
    additional_args = opts.additional_args(opts)
  end

  local live_grepper = finders.new_job(function(prompt)
    if not prompt or prompt == "" then
      prompt = "#[A-z]+"
    else
      prompt = "#" .. prompt
    end

    local command = flatten { vimgrep_arguments, additional_args, "--", prompt }
    return command
  end, make_entry.gen_from_vimgrep(opts), opts.max_results, opts.cwd)

  pickers.new(opts, {
    prompt_title = "Note Tags",
    finder = live_grepper,
    previewer = conf.grep_previewer(opts),
    sorter = sorters.highlighter_only(opts),
  }):find()
end

local function new_note()
  local note_name = vim.ui.input({prompt = 'New note name: '}, function(input)
    print(input)
  end)
end

-- VIMWIKI SETUP
-- =========================
vim.api.nvim_set_var('vimwiki_list', {{path = '~/.notes/', syntax = 'markdown', ext = '.md'}})
vim.api.nvim_set_var('vimwiki_hl_headers', 1)
vim.api.nvim_set_var('vimwiki_listsyms', '    X')

-- KEYMAPS
vim.keymap.set('n', '<leader>wm', list)
vim.keymap.set('n', '<leader>wt', tags)
vim.keymap.set('n', '<leader>wn', new_note)
