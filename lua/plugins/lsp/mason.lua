return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim"
    },
    keys = {
        { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" }
    },
    config = function()
        local mason = require "mason"
        local mason_lspconfig = require "mason-lspconfig"
        local lsp_config = require "lspconfig"
        local lsp_zero = require "lsp-zero"
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
            ensure_installed = {},
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    -- (Optional) Configure lua language server for neovim
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    lsp_config.lua_ls.setup(lua_opts)
                end,
            }
        })
        -- mason_lspconfig.setup({
        --     ensure_install = {
        --         "tsserve",
        --         "html",
        --         "cssls",
        --         "tailwindcss",
        --         "astro",
        --         "lua_ls",
        --         "emmet_ls",
        --         "pyright",
        --         "astro"
        --     },
        --     automatic_installation = true,
        -- })
    end
}
