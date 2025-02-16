return {
	{
		"williamboman/mason.nvim",
		optional = true,
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"pyright",
				"ruff_format",
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, {
					"python",
					"rst",
					"toml",
				})
			end
		end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				pyright = {
					settings = {
						python = {
							analysis = {
								typeCheckingMode = "on",
								reportMissingImports = false,
								reportMissingTypeStubs = false,
							},
						},
					},
					-- Disable organize imports in favor of Ruff
					disableOrganizeImports = true,
				},
				ruff = {
					cmd_env = { RUFF_TRACE = "messages" },
					init_options = {
						settings = {
							logLevel = "error",
						},
					},
				},
			},
			setup = {
				["ruff"] = function()
					LazyVim.lsp.on_attach(function(client, _)
						-- Disable hover in favor of Pyright
						client.server_capabilities.hoverProvider = false
					end, "ruff")
				end,
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				python = {
					"ruff_organize_imports",
					lsp_format = "first",
				},
			},
		},
	},
}
