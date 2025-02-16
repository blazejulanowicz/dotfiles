return {
	{
		"williamboman/mason.nvim",
		optional = true,
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"html-lsp",
				"css-lsp",
				"prettierd",
				"eslint_d",
				"typescript-language-server",
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, {
					"html",
					"css",
					"javascript",
					"typescript",
					"tsx",
				})
			end
		end,
	},
}
