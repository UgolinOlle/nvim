return {
	"stevearc/dressing.nvim",

	opts = {
		-- Input configuration
		input = {
			enabled = true,
			default_prompt = "Input:",
			title_pos = "center",
		},

		-- Selection configuration
		select = {
			enabled = true,
			backend = { "telescope", "fzf", "builtin", "nui" },
			trim_prompt = true,
			telescope = nil,
			nui = {
				position = "50%",
				size = nil,
				relative = "editor",
				border = {
					style = "rounded",
				},
				buf_options = {
					swapfile = false,
					filetype = "DressingSelect",
				},
				win_options = {
					winblend = 2,
				},
				max_width = 80,
				max_height = 40,
				min_width = 40,
				min_height = 10,
			},
			builtin = {
				border = "rounded",
				relative = "editor",
				win_options = {
					winblend = 2,
					winhighlight = "",
				},
				width = nil,
				max_width = { 140, 0.8 },
				min_width = { 40, 0.2 },
				height = nil,
				max_height = 0.9,
				min_height = { 10, 0.2 },
				mappings = {
					["<Esc>"] = "Close",
					["<C-c>"] = "Close",
					["<CR>"] = "Confirm",
				},
				override = function(conf)
					return conf
				end,
			},
		},
	},
}
