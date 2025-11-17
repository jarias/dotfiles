return {
	{ "dracula/vim", name = "dracula" },
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"lua",
				"templ",
				"html",
				"css",
				"bash",
				"go",
				"java",
				"kotlin",
				"json",
				"sql",
				"rust",
				"javascript",
				"hcl",
				"liquid",
				"graphql",
				"embedded_template",
			},
		},
	},
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				terraform = { "terraform_fmt" },
				sh = { "shfmt" },
				json = { "prettier" },
				jsonc = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.1.9",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"saghen/blink.cmp",
		opts = {
			keymap = { preset = "enter" },
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
}
