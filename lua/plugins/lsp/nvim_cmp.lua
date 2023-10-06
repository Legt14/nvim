return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-git",
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind-nvim",
		{
			"L3MON4D3/LuaSnip",
		},
		"windwp/nvim-autopairs",
		"folke/neodev.nvim",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
	},
	event = "VeryLazy",
	main = "config.plugins.cmp",
	config = true,
}
