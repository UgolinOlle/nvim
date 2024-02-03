return {
	{
		"norcalli/nvim-colorizer.lua",

		lazy = true,
	},
	{
		"kepano/flexoki-neovim",

		priority = 1000,

		config = function()
			vim.cmd([[colorscheme flexoki-dark]])
		end,
	},
}
