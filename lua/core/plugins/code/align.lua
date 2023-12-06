return {
	"Vonr/align.nvim",
	branch = "v2",
	lazy = true,
	init = function()
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		opts.desc = "Align text."
		keymap("n", "<LEADER>ll", function()
			require("align").align_to_char({
				length = 1,
			})
		end, opts)
	end,
}
