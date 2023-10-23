return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"hrsh7th/cmp-nvim-lsp",
			"folke/neodev.nvim",
			"williamboman/mason.nvim",
			opts = { ui = { border = "rounded" } },
		},
	},
	config = function()
		require("mason")

		vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist)

		require("neodev").setup({})
		-- Set up lspconfig.
		local lspconfig = require("lspconfig")
		local on_attach = function(_, bufnr)
			local opts = { buffer = bufnr }

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set("n", "<space>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set({ "n", "v" }, "<leader>ac", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			-- vim.keymap.set('n', '<leader>fm', function()
			--     return vim.lsp.buf.format { async = true }
			-- end, opts)
		end

		-- SERVERS CONFIG --

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		-- Enable the following language servers
		-- local servers = { 'html', 'tailwindcss', 'eslint', 'tsserver', 'emmet_ls', 'astro', 'pyrght' }
		--
		--

		-- lspconfig.hls.setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- 	cmd = { "haskell-language-server-wrapper", "--lsp" },
		-- 	filetypes = { "haskell", "lhaskell", "cabal" },
		-- 	settings = {
		-- 		haskell = {
		-- 			cabalFormattingProvider = "cabalfmt",
		-- 			formattingProvider = "ormolu",
		-- 		},
		-- 	},
		-- })
	
        lspconfig.denols.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = {
				"deno",
				"lsp",
			},
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
			settings = {
				deno = {
					enable = true,
					suggest = {
						imports = {
							hosts = {
								["https://crux.land"] = true,
								["https://deno.land"] = true,
								["https://x.nest.land"] = true,
							},
						},
					},
				},
			},
		})

		lspconfig.quick_lint_js.setup({
			on_attach = on_attach,
			filetypes = {
				"svelte",
				"javascript",
				"javascriptreact",
				"pug",
				"vue",
				"astro",
				"jsx",
			},
			capabilities = capabilities,
		})

		lspconfig.pyright.setup({
			on_attach = on_attach,
			filetypes = { "python" },
			capabilities = capabilities,
		})

		lspconfig.html.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = {
				"css",
				"html",
				"svelte",
				"pug",
				"typescriptreact",
				"javascriptreact",
				"vue",
				"astro",
			},
		})

		lspconfig.tailwindcss.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = {
				"html",
				"svelte",
				"javascript",
				"javascriptreact",
				"pug",
				"typescriptreact",
				"vue",
				"astro",
				"tsx",
				"jsx",
			},
		})

		-- lspconfig.eslint.setup({
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- 	filetypes = {
		-- 		"svelte",
		-- 		"javascript",
		-- 		"javascriptreact",
		-- 		"pug",
		-- 		"vue",
		-- 		"astro",
		-- 		"jsx",
		-- 	},
		-- })

		-- lspconfig.custom_elements_ls.setup({
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- 	filetypes = {
		-- 		"javascript",
		-- 		"javascriptreact",
		-- 		"javascript.jsx",
		-- 		"typescript",
		-- 		"typescriptreact",
		-- 		"typescript.tsx",
		-- 		"html",
		-- 	},
		-- 	cmd = { "custom-elements-languageserver", "--stdio" },
		-- })

		-- lspconfig.biome.setup({
		--     on_attach = on_attach,
		--     capabilities = capabilities,
		--     filetypes = {
		--         "javascript",
		--         "javascriptreact",
		--         "json",
		--         "jsonc",
		--         "typescript",
		--         "typescript.tsx",
		--         "typescriptreact",
		--     },
		-- })

		lspconfig.emmet_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = {
				"svelte",
				"html",
				"javascript",
				"javascriptreact",
				"pug",
				"typescriptreact",
				"vue",
				"astro",
			},
		})

		-- lspconfig.jedi_language_server.setup {
		--     on_attach = on_attach,
		--     filetypes = { 'python' },
		-- }

		lspconfig.tsserver.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = {
				"svelte",
				"pug",
				"typescriptreact",
				"typescript",
				"vue",
				"astro",
			},
			settings = {
				typescript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
						includeCompletionsForModuleExports = false,
					},
				},
			},
		})

		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			settings = {
				Lua = {
					telemetry = { enable = false },
					workspace = { checkThirdParty = false },
				},
			},
		})

		lspconfig.rnix.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetype = {
				"nix",
			},
			cmd = { "rnix-lsp" },
		})
	end,
}
