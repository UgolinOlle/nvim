return {
	"luckasRanarison/nvim-devdocs",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},

	config = true,

	opts = {
		wrap = true,

		after_open = function(bufnr)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "<ESC>", "<CMD>close<CR>", { silent = true, noremap = true })
		end,

		ensure_installed = {
			"angular",
			"bash",
			"c",
			"css",
			"docker",
			"eslint",
			"html",
			"http",
			"lua",
			"javascript",
			"jsdoc",
			"markdown",
			"node",
			"prettier",
			"sass",
			"tailwindcss",
			"typescript",
		},
	},

	keys = {
		{
			"<LEADER>v ",
			"<CMD>DevdocsToggle<CR>",
			{ noremap = true, silent = true, desc = "Toggle devdocs in floating window." },
		},
		{
			"<LEADER>vi",
			"<CMD>DevdocsInstall<CR>",
			{ noremap = true, silent = true, desc = "Install option ensure_installed devdocs." },
		},
		{
			"<LEADER>vv",
			"<CMD>DevdocsOpenCurrentFloat<CR>",
			{
				noremap = true,
				silent = true,
				desc = "Open devdocs for file type in a floating window.",
			},
		},
	},
}
