return {
	"nvim-tree/nvim-tree.lua",

	lazy = false,

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local status, nvimtree = pcall(require, "nvim-tree")
		if not status then
			return
		end

		-- Recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 35,
			},

			sort = {
				sorter = "name",
				folders_first = true,
			},

			renderer = {
				highlight_git = true,
				highlight_diagnostics = true,

				indent_markers = {
					enable = true,
				},

				icons = {
					glyphs = {
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},

						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},

			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},

			git = {
				enable = true,
			},

			diagnostics = {
				enable = false,
				show_on_dirs = false,
				show_on_open_dirs = true,
				debounce_delay = 50,
				severity = {
					min = vim.diagnostic.severity.HINT,
					max = vim.diagnostic.severity.ERROR,
				},
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},

			filters = {
				dotfiles = true,
			},
		})

		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		opts.desc = "Toggle nvim tree"
		keymap("n", "<LEADER>e", "<CMD>NvimTreeToggle<CR>", opts)
	end,
}
