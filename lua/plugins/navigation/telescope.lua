return {
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

				layout_strategy = "horizontal",
				path_display = { "truncate " },
				winbled = 0,
				border = {},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				color_devicons = true,
				use_less = true,
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("notify")

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
	end,
}
