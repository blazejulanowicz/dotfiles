local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettierd" },
		html = { "prettierd" },
		javascript = { "prettierd", "eslint_d" },
		typescript = { "prettierd", "eslint_d" },
		javascriptreact = { "prettierd", "eslint_d" },
		typescriptreact = { "prettierd", "eslint_d" },
		python = function(bufnr)
			if require("conform").get_formatter_info("black", bufnr).available then
				return { "black", "isort" }
			else
				return { "ruff_format", "ruff_fix", "ruff_organize_imports" }
			end
		end,
		rust = { "rustfmt" },
	},

	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
}

require("conform").setup(options)

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})
