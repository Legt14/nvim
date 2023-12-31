return {
    "williamboman/mason.nvim",
    lazy = true,
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    keys = {
        { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" }
    },
    config = function()
        local mason = require "mason"
        local mason_lspconfig = require "mason-lspconfig"
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        mason_lspconfig.setup({
            ensure_install = {
                "tsserve",
                "html",
                "cssls",
                "tailwindcss",
                "astro",
                "lua_ls",
                "emmet_ls",
                "pyright",
                "astro",
                "eslint",
                'quick_lint_js'
            },
            automatic_installation = true,
        })
    end
}
