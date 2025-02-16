return {
	{
		"stevearc/conform.nvim",
		opts = {
			lsp_fallback = true,
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			defaults = {
				path_display = { "smart" },
			},
		},
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				--- Lua
				"lua-language-server",
				"stylua",

				--- Rust
				"rust-analyzer",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"lua",
			},
		},
	},
}
