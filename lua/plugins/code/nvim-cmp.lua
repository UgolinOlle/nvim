return {
	"hrsh7th/nvim-cmp",

	event = "InsertEnter",

	dependencies = {
		"neovim/nvim-lspconfig", -- LSP client
		"hrsh7th/cmp-nvim-lsp", -- source for LSP completions
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-cmdline", -- source for command line completions
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},

	opts = function()
		local cmp_active, cmp = pcall(require, "cmp")
		if not cmp_active then
			return
		end

		local luasnip_active, luasnip = pcall(require, "luasnip")
		if not luasnip_active then
			return
		end

		local lspkind_active, lspkind = pcall(require, "lspkind")
		if not lspkind_active then
			return
		end

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, { { name = "cmdline" } }),
		})

		cmp.setup({
			-- Configure sources from which to get completions
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			}),

			-- Configure the completion menu
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},

			-- Configure the completion window
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			-- Configure the key mappings
			mapping = cmp.mapping.preset.insert({
				["<Up>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<Down>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),

			-- Configure formatting
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 25,
					ellipsis_char = "...",
					menu = {
						nvim_lsp = "[LSP]",
						path = "[PATH]",
						buffer = "[BUF]",
					},
				}),
			},
		})
	end,
}
