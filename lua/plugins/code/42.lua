return {
	{
		"hardyrafael17/norminette42.nvim",

		lazy = false,

		opts = {
			runOnSave = true,
		},
	},
	{
		"Diogo-ss/42-header.nvim",

		opts = {
			user = "uolle",
			mail = "uolle@student.42bangkok.com",
		},

		keys = {
			{ "<LEADER>he", "<CMD>Stdheader<CR>", desc = "Set official 42 header.", mode = "n" },
		},
	},
}
