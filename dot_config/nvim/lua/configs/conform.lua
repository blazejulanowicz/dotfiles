local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettierd" },
		html = { "prettierd" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		python = { "isort", "black" },
		rust = { "rustfmt" },
	},

	formatters = {
		black = {
			prepend_args = { "--line-length", "100" },
		},
		isort = {
			prepend_args = {
				"--profile",
				"black",
				"--line-length",
				"100",
				"--lines-after-imports",
				"2",
				"--combine-as",
			},
		},
	},

	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
}

require("conform").setup(options)
