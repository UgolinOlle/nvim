return {
	{
		"kepano/flexoki-neovim",

		priority = 1000,

		config = function()
			vim.cmd([[colorscheme flexoki-dark]])
		end,
	},
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
	{
		"mrshmllow/document-color.nvim",

		lazy = true,

		opts = true,
	},
}
