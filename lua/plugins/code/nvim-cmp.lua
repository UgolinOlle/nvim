return {
	"hrsh7th/nvim-cmp",

	event = "InsertEnter",

	dependencies = {
		"neovim/nvim-lspconfig", -- LSP client
		"hrsh7th/cmp-nvim-lsp", -- source for LSP completions
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-cmdline", -- source for command line completions
		"hrsh7th/cmp-nvim-lua", -- source for nvim lua completions
		"hrsh7th/cmp-emoji", -- source for emoji completions
		"ray-x/cmp-treesitter", -- source for treesitter completions
		"chrisgrieser/cmp-nerdfont", -- source for nerdfont completions
		"roobert/tailwindcss-colorizer-cmp.nvim", -- source for tailwindcss completions
		{
			"tzachar/cmp-ai",
			dependencies = "nvim-lua/plenary.nvim",
		},
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},

	opts = function()
		local cmp_active, cmp = pcall(require, "cmp")
		if not cmp_active then
			return
		end

		local lspkind_active, lspkind = pcall(require, "lspkind")
		if not lspkind_active then
			return
		end

		local cmp_autopairs_active, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
		if not cmp_autopairs_active then
			return
		end

		local cmp_tailwind_active, cmp_tailwind = pcall(require, "cmp_tailwindcss")
		if not cmp_tailwind_active then
			return
		end

		local cmp_ai_active, cmp_ai = pcall(require, "cmp_ai")
		if not cmp_ai_active then
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
			-- Global configurations
			preselect = cmp.PreselectMode.Item,
			keyword_length = 2,

			-- Configure sources from which to get completions
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "treesitter" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "emoji" },
				{ name = "nerdfont" },
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
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),

			-- Configure formatting
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 25,
					ellipsis_char = "...",
					before = function(entry, vim_item)
						cmp_tailwind.formatter(entry, vim_item)
						return vim_item
					end,
					menu = {
						nvim_lsp = "[LSP]",
						path = "[PATH]",
						buffer = "[BUF]",
						treesitter = "[TREE]",
						nvim_lua = "[LUA]",
						cmp_ai = "[AI]",
					},
				}),
			},

			-- Configure sorting
			sorting = {
				priority_weight = 2,
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.recently_used,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
		})

		-- Setup nvim-autopairs
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		-- Setup cmp ai
		cmp_ai:setup({
			max_lines = 1000,
			provider = "OpenAI",
			model = "gpt-3.5-turbo",
			notify = true,
			notify_callback = function(msg)
				require("notify").notify(msg, vim.log.levels.INFO, { title = "OpenAI", render = "compact" })
			end,
			run_on_every_keystroke = true,
			ignored_file_types = {},
		})
	end,
}
