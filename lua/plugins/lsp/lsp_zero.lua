return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        { "lukas-reineke/lsp-format.nvim", config = true },
    },
    config = function()
        local lsp_zero = require('lsp-zero')
        lsp_zero.preset("recommended")
        lsp_zero.extend_lspconfig()
        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
            lsp_zero.buffer_autoformat()
            local opts = { buffer = bufnr }

            vim.keymap.set({ 'n', 'x' }, 'fm', function()
                vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
            end, opts)
        end)

        lsp_zero.set_sign_icons({
            error = '✘',
            warn = '▲',
            hint = '⚑',
            info = '»'
        })
    end
}
