return {
	"nvimtools/none-ls.nvim",

	lazy = true,

	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},

	config = function()
		local status, mason_null_ls = pcall(require, "mason-null-ls")
		if not status then
			return
		end

		local null_ls_status, null_ls = pcall(require, "null-ls")
		if not null_ls_status then
			return
		end

		local null_ls_utils = require("null-ls.utils")

		mason_null_ls.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"black",
				"pylint",
				"eslint_d",
			},
		})

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),

			sources = {
				formatting.prettier,
				formatting.stylua,
				formatting.isort,
				formatting.black,
				formatting.pylint,
				diagnostics.pylint,
				diagnostics.eslint_d.with({
					condition = function(utils)
						return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" })
					end,
				}),
			},

			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
	end,
}
