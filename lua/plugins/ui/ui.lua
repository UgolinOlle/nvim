return {
	{
		"stevearc/dressing.nvim",

		opts = true,
	},
	{
		"norcalli/nvim-colorizer.lua",

		opts = true,

		config = function()
			require("colorizer").setup()
		end,
	},
}
