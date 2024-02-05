return {
	"luckasRanarison/nvim-devdocs",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},

	event = "VeryLazy",

	config = true,

	cmd = {
		"DevdocsFetch",
		"DevdocsInstall",
		"DevdocsUninstall",
		"DevdocsOpen",
		"DevdocsOpenFloat",
		"DevdocsOpenCurrent",
		"DevdocsOpenCurrentFloat",
		"DevdocsUpdate",
		"DevdocsUpdateAll",
	},

	ensure_installed = {
		"angular",
		"bash",
		"css",
		"docker",
		"eslint",
		"html",
		"http",
		"javascript",
		"jsdoc",
		"markdown",
		"node",
		"prettier",
		"sass",
		"tailwindcss",
		"typescript",
	},
}
