require("null-ls").setup({
    sources = {
        -- FORMATTING
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.formatting.eslint,
        require("null-ls").builtins.formatting.prettierd,
        -- DIAGNOSTICS
        require("null-ls").builtins.diagnostics.eslint,
        -- COMPLETIONS
        require("null-ls").builtins.completion.spell,
    },
})
