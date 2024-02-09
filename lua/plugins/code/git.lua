local text = "┃"

return {
	{
		"lewis6991/gitsigns.nvim",

		event = { "BufRead", "BufNewFile" },

		opts = {
			signs = {
				add = { hl = "GitSignsAdd", text = text, numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
				change = { hl = "GitSignsChange", text = text, numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
				delete = { hl = "GitSignsDelete", text = text, numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
				topdelete = {
					hl = "GitSignsDelete",
					text = text,
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				changedelete = {
					hl = "GitSignsChange",
					text = text,
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
				untracked = { hl = "GitSignsAdd", text = text, numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
			},
			signcolumn = true,
			numhl = false,
			linehl = false,
			word_diff = false,
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame = false,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "right_align",
				delay = 1000,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 1,
			update_debounce = 100,
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
