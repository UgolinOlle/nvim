return {
	"neovim/nvim-lspconfig",

	event = { "BufReadPre", "BufNewFile" },

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},

	config = function()
		local lsp_status, lspconfig = pcall(require, "lspconfig")
		if not lsp_status then
			return
		end

		local cmp_status, cmp = pcall(require, "cmp_nvim_lsp")
		if not cmp_status then
			return
		end

		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		local on_attach = function(_, bufnr)
			opts.buffer = bufnr

			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<CMD>Telescope lsp_reference<CR>", opts)

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", function()
				vim.api.nvim_exec("tabnew")
				vim.lsp.buf.declaration()
			end, opts)

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<CMD>lua vim.lsp.buf.definitions<CR>", opts)

			opts.desc = "Show LSP on hover"
			keymap("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<CMD>Telescope lsp_implementations<CR>", opts)

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<CMD>Telescope lsp_type_definitions<CR>", opts)

			opts.desc = "Show available code actions"
			keymap.set({ "n", "v" }, "<LEADER>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Smart rename"
			keymap.set("n", "<LEADER>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<LEADER>di", "<CMD>Telescope diagnostics bufnr=0<CR>", opts)

			opts.desc = "Go to previous diagnostics"
			keymap.set("n", "[d", vim.diagnostics.goto_prev, opts)

			opts.desc = "Go to next diagnostics"
			keymap.set("n", "]d", vim.diagnostics.goto_next, opts)

			opts.desc = "Restart LSP"
			keymap.set("n", "<LEADER>rs", "<CMD>LspRestart<CR>", opts)

			opts.desc = "Show LSP info"
			keymap.set("n", "<LEADER>li", "<CMD>LspInfo<CR>", opts)
		end

		local capabilities = cmp.default_capabilities()
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local servers = { "pyright", "bashls", "tsserver", "tailwindcss" }

		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		lspconfig["clangd"].setup({
			on_attach = function(client, bufnr)
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.document_range_formatting = false
				on_attach(client, bufnr)
			end,
			capabilities = capabilities,
		})
	end,
}
