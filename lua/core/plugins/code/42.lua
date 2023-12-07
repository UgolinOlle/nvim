return {
	"hardyrafael17/norminette42.nvim",

	dependencies = {
		"vinicius507/header42.nvim",
	},

	lazy = false,

	opts = {
		runOnSave = true,
		login = "uolle",
		email = "uolle@student.42bangkok.com",
	},

	keys = {
		{ "<LEADER>he", "<CMD>Stdheader<CR>", desc = "Set official 42 header.", mode = "n" },
	},
}
