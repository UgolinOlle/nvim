return {
	"github/copilot.vim",

	event = "InsertEnter",

	cmd = "Copilot",

	opts = {
		layout = {
			position = "bottom",
			ratio = 0.4,
		},

		suggestion = {
			enabled = true,

			keymap = {
				accept = "<TAB>",
				accept_line = "<S-TAB>",
				next = "<C-]>",
				prev = "<C-[>",
				dimiss = "<ESC>",
			},
		},
	},
}
