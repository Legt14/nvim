return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
                null_ls.builtins.diagnostics.eslint,
                null_ls.builtins.completion.spell,
                null_ls.builtins.formatting.prettier.with({
                    filetype = { "html", "json", "lua", "markdown", "jsx", "tsx", "astro", 'python'},
                }),
            },
        })
        vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, { desc = "LSP (null ls) Code actions" })
        vim.keymap.set("n", "<leader>vf", function()
            return vim.lsp.buf.format({ async = true })
        end, { desc = "LSP (null ls) Format file" })
    end,
}
