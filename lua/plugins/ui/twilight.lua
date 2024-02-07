return {
	"folke/twilight.nvim",

	cmd = {
		"Twilight",
		"TwilightEnable",
		"TwilightDisable",
	},

	opts = {
		expand = {
			"object",
			"function_definition",
			"table_constructor",
		},
	},

	keys = {
		{
			"<LEADER>zz",
			"<CMD>Twilight<CR>",
			{ noremap = true, silent = true, desc = "Toggle Twilight" },
		},
	},
}
