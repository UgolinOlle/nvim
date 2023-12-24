return {
	"williamboman/mason.nvim",

	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},

	config = function()
		local mason_status, mason = pcall(require, "mason")
		if not mason_status then
			return
		end

		local mason_lsp_status, mason_lsp = pcall(require, "mason-lspconfig")
		if not mason_lsp_status then
			return
		end

		local mason_tool_status, mason_tool = pcall(require, "mason-tool-installer")
		if not mason_tool_status then
			return
		end

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lsp.setup({
			ensure_installed = {
				"tsserver",
				"tailwindcss",
				"lua_ls",
				"emmet_ls",
				"pyright",
				"clangd",
				"bashls",
			},
			automatic_installation = true,
		})

		mason_tool.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"pylint",
				"eslint_d",
				"clang-format",
				"codelldb",
			},
		})
	end,
}
