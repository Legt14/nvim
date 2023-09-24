return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        { 'L3MON4D3/LuaSnip' },
    },
    config = function()
        -- Here is where you configure the autocompletion settings.
        local lsp_zero = require('lsp-zero')
        -- And you can configure cmp even more, if you want to.
        local cmp = require('cmp')
        local cmp_action = lsp_zero.cmp_action()

        cmp.setup({
            formatting = lsp_zero.cmp_format(),
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping({
                    i = function(fallback)
                        if cmp.visible() and cmp.get_active_entry() then
                            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                        else
                            fallback()
                        end
                    end,
                    s = cmp.mapping.confirm({ select = true }),
                    c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                }),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward(),
            })
        })
    end
}

--return {
--     "hrsh7th/nvim-cmp",
--     event = "InsertEnter",
--     dependencies = {
--         "hrsh7th/cmp-buffer",     -- source for text in buffer
--         "hrsh7th/cmp-path",       -- source for file system paths
--         "L3MON4D3/LuaSnip",       -- snippet engine
--         "saadparwaiz1/cmp_luasnip", -- for autocompletion
--         "rafamadriz/friendly-snippets", -- useful snippets
--         "onsails/lspkind.nvim",   -- vs-code like pictograms
--     },
--     config = function()
--         local cmp = require("cmp")
--
--         local luasnip = require("luasnip")
--
--         local lspkind = require("lspkind")
--
--         -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
--         require("luasnip.loaders.from_vscode").lazy_load()
--         cmp.setup({
--             completion = {
--                 completeopt = "menu,menuone,preview,noselect",
--             },
--             snippet = { -- configure how nvim-cmp interacts with snippet engine
--                 expand = function(args)
--                     luasnip.lsp_expand(args.body)
--                 end,
--             },
--             mapping = cmp.mapping.preset.insert({
--                 ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
--                 ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
--                 ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--                 ["<C-f>"] = cmp.mapping.scroll_docs(4),
--                 ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
--                 ["<C-e>"] = cmp.mapping.abort(), -- close completion window
--                 ["<CR>"] = cmp.mapping.confirm({ select = true }),
--             }),
--             -- sources for autocompletion
--             sources = cmp.config.sources({
--                 { name = "nvim_lsp" },
--                 { name = "luasnip" }, -- snippets
--                 { name = "buffer" }, -- text within current buffer
--                 { name = "path" }, -- file system paths
--             }),
--             -- configure lspkind for vs-code like pictograms in completion menu
--             formatting = {
--                 format = lspkind.cmp_format({
--                     maxwidth = 50,
--                     ellipsis_char = "...",
--                 }),
--             },
--         })
--         -- Set configuration for specific filetype.
--         cmp.setup.filetype("gitcommit", {
--             sources = cmp.config.sources({
--                 { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
--             }, {
--                 { name = "buffer" },
--             }),
--         })
--
--         -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--         cmp.setup.cmdline({ "/", "?" }, {
--             mapping = cmp.mapping.preset.cmdline(),
--             sources = {
--                 { name = "buffer" },
--             },
--         })
--
--         -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--         cmp.setup.cmdline(":", {
--             mapping = cmp.mapping.preset.cmdline(),
--             sources = cmp.config.sources({
--                 { name = "path" },
--             }, {
--                 { name = "cmdline" },
--             }),
--         })
--
--         -- Set up lspconfig.
--         local capabilities = require("cmp_nvim_lsp").default_capabilities()
--         -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--         require("lspconfig").tsserve.setup({
--             capabilities = capabilities,
--         })
--     end,
-- }
