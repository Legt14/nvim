return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        local b = null_ls.builtins

        local sources = {

            -- webdev stuff
            b.formatting.deno_fmt,                                            -- choosed deno for ts/js files cuz its very fast!
            b.formatting.prettier.with({ filetypes = { "html", "markdown", "css" } }), -- so prettier works only on these filetypes
            -- Lua
            b.formatting.stylua,
        }

        null_ls.setup({
            debug = true,
            sources = sources,
       })
        vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, { desc = "LSP (null ls) Code actions" })
        vim.keymap.set("n", "<leader>vf", function()
            return vim.lsp.buf.format({ async = true })
        end, { desc = "LSP (null ls) Format file" })
    end,
}
