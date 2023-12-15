return {
	{
		"HPRIOR/telescope-gpt",
		dependencies = { "nvim-telescope/telescope.nvim", "jackMort/ChatGPT.nvim" },
	},
	{
		"nvim-telescope/telescope.nvim",

		branch = "0.1.x",

		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local status, telescope = pcall(require, "telescope")
			if not status then
				return
			end

			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<S-k>"] = actions.move_selection_previous,
							["<S-j>"] = actions.move_selection_next,
							["<S-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},

					vimgrep_arguments = {
						"rg",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},

					layout_config = {
						horizontal = {
							mirror = false,
						},
						vertical = {
							mirror = false,
						},
					},

					extensions = {
						gpt = {
							title = "Gpt Actions",
							commands = {
								"add_tests",
								"chat",
								"docstring",
								"explain_code",
								"fix_bugs",
								"grammar_correction",
								"interactive",
								"optimize_code",
								"summarize",
								"translate",
							},
							theme = require("telescope.themes").get_dropdown({}),
						},
					},

					prompt_prefix = "  ",
					selection_caret = "  ",
					entry_prefix = "  ",
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = "descending",
					layout_strategy = "horizontal",
					file_sorter = require("telescope.sorters").get_fuzzy_file,
					file_ignore_patterns = {},
					generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
					path_display = { "truncate " },
					winbled = 0,
					border = {},
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					color_devicons = true,
					use_less = true,
					set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
					buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("notify")
			telescope.load_extension("gpt")

			local keymap = vim.keymap.set
			local opts = { noremap = true, silent = true }

			opts.desc = "Fuzzy find files in cwd"
			keymap("n", "<LEADER>ff", "<CMD>Telescope find_files<CR>", opts)

			opts.desc = "Fuzzy find buffers"
			keymap("n", "<LEADER>fb", "<CMD>Telescope buffers<CR>", opts)

			opts.desc = "Fuzzy find recent files"
			keymap("n", "<LEADER>fr", "<CMD>Telescope oldfiles<CR>", opts)

			opts.desc = "Find string in cwd"
			keymap("n", "<LEADER>fg", "<CMD>Telescope live_grep<CR>", opts)

			opts.desc = "Find string under cursor in cwd"
			keymap("n", "<LEADER>fc", "<CMD>Telescope grep_string<CR>", opts)

			opts.desc = "Find git status"
			keymap("n", "<LEADER>gs", "<CMD>Telescope git_status<CR>", opts)

			opts.desc = "Find all notifications"
			keymap("n", "<LEADER>fn", "<CMD>Telescope notify<CR>", opts)

			opts.desc = "Use GPT to chat"
			keymap("n", "<LEADER>fgg", "<CMD>Telescope gpt<CR>", opts)
		end,
	},
}
