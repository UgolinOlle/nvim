return {
	"neovim/nvim-lspconfig",

	event = { "BufReadPre", "BufNewFile" },

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},

	config = function()
		-- Check if LSP is available
		local lsp_active, lspconfig = pcall(require, "lspconfig")
		if not lsp_active then
			return
		end

		-- Check if cmp is available
		local cmp_active, cmp = pcall(require, "cmp_nvim_lsp")
		if not cmp_active then
			return
		end

		-- Variables
		local utils = require("whoa.utils")
		local get_icons = utils.get_icons

		-- LSP configuration
		local capabilities = cmp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
		local signs = {
			Error = get_icons("DiagnosticError"),
			Warn = get_icons("DiagnosticWarn"),
			Hint = get_icons("DiagnosticHint"),
			Info = get_icons("DiagnosticInfo"),
		}

		-- Keymaps variables
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		-- LSP on_attach function
		local on_attach = function(_, bufnr)
			-- Set LSP omnifunc
			vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

			-- Autocmd for LSP hover
			vim.api.nvim_create_autocmd("CursorHold", {
				buffer = bufnr,
				desc = "Show LSP hover",
				callback = function()
					vim.diagnostic.open_float(nil, {
						focusable = false,
						close_events = { "BufLeave", "CursorMoved", "FocusLost", "InsertEnter" },
						border = "rounded",
						source = "always",
						prefix = " ",
					})
				end,
			})

			-- Set LSP keymaps
			opts.buffer = bufnr

			opts.desc = "Show LSP informations"
			keymap.set("n", "<LEADER>li", "<CMD>LspInfo<CR>", opts)

			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<CMD>Telescope lsp_reference<CR>", opts)

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", function()
				vim.lsp.buf.declaration()
			end, opts)

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", vim.lsp.buf.definitions, opts)

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

			opts.desc = "Show diagnostics in floating window"
			keymap.set("n", "[w", vim.diagnostics.open_float, opts)

			opts.desc = "Restart LSP"
			keymap.set("n", "<LEADER>rs", "<CMD>LspRestart<CR>", opts)

			opts.desc = "Show LSP info"
			keymap.set("n", "<LEADER>li", "<CMD>LspInfo<CR>", opts)
		end

		-- Set LSP signs
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- LSP servers configurations
		local servers = { "pyright", "bashls", "tsserver", "tailwindcss" }

		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end

		-- Custom configuration for specific LSPs
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

		-- LSP configuration
		vim.diagnostic.config({
			virtual_text = {
				source = "always",
				prefix = "●",
			},
			underline = true,
			signs = true,
			severity_sort = true,
			float = {
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
				focusable = false,
			},
		})

		-- LSP windows configuration
		require("lspconfig.ui.windows").default_options.border = "rounded"
	end,
}
