local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- FORMATTING
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.eslint,
        null_ls.builtins.formatting.prettierd,
        -- DIAGNOSTICS
        null_ls.builtins.diagnostics.eslint,
        -- COMPLETIONS
        null_ls.builtins.completion.spell,
        -- CODE ACTIONS
        null_ls.builtins.code_actions.gitsigns
    },
})
