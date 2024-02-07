return {
	{
		"lewis6991/gitsigns.nvim",

		event = { "BufRead", "BufNewFile" },

		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = true,

			preview_config = {
				border = "none",
			},
		},
	},
	{
		"f-person/git-blame.nvim",

		lazy = true,

		opts = {
			enabled = true,
		},
	},
}
