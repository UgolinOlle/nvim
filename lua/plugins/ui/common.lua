return {
	{
		"projekt0n/github-nvim-theme",

		lazy = false,

		priority = 100,

		config = function()
			require("github-theme").setup({
				dim_inactive = true,
			})

			vim.cmd("colorscheme github_dark_dimmed")
		end,
	},
	{
		"stevearc/dressing.nvim",

		opts = true,
	},
	{
		"NvChad/nvim-colorizer.lua",

		opts = {
			user_default_options = {
				RGB = true,
				RRGGBB = true,
				names = true,
				RRGGBBAA = true,
				AARRGGBB = true,
				rgb_fn = true,
				hsl_fn = true,
				css = true,
				css_fn = true,
				mode = "background",
				method = "lsp",
				tailwind = true,
				sass = { enable = true, parsers = { "css" } },
				virtualtext = "■",
			},
			buftypes = { "!prompt", "!popup" },
		},
	},
	{
		"mrshmllow/document-color.nvim",

		lazy = true,

		opts = true,
	},
}
