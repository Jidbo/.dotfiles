local ls = require "luasnip"

local types = require "luasnip.util.types"

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",

  enable_autosnippets = true,

  ext_opts = {
    [types.choiceNode] = {
      active = {
	virt_text = { { "<-", "Error" } },
      }
    }
  },
}

-- expand snippet / jump to next location
vim.keymap.set({"i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- jump to previous location
vim.keymap.set({"i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- jump to previous location
vim.keymap.set({"i"}, "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

-- source luafile again
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/snippets.lua<CR>")

local s = ls.s
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt


ls.add_snippets("tex", {
    s("beg", fmt([[
\begin{<>}
  <>
\end{<>}
    ]], {i(1, "itemize"), i(2, "test"), rep(1)}, {delimiters = "<>"})),
})
