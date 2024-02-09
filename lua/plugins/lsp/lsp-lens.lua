return {
	"VidocqH/lsp-lens.nvim",

	event = "BufReadPre",

	opts = {
		include_declaration = true,

		sections = {
			definition = true,
			references = true,
			implements = true,
		},
	},

	keys = {
		{ "n", "<LEADER>lt", "<CMD>LspLensToggle<CR>" },
	},
}
