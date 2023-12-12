return {
	"akinsho/toggleterm.nvim",

	config = function()
		local status, terminal = pcall(require, "toggleterm")
		if not status then
			return
		end

		terminal.setup({
			shade_terminals = true,

			float_opts = {
				border = "curved",
			},
		})

		local cterminal = require("toggleterm.terminal").Terminal
		local btop = cterminal:new({ cmd = "btop", hidden = true, direction = "float" })
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		function _btop_toggle()
			btop:toggle()
		end

		opts.desc = "Toggle terminal float"
		keymap("n", "<LEADER>tt", "<CMD>ToggleTerm direction=float<CR>", opts)

		opts.desc = "Toggle terminal in new tab"
		keymap("n", "<LEADER>ta", "<CMD>ToggleTerm direction=tab<CR>", opts)

		opts.desc = "Toggle terminal horizontally"
		keymap("n", "<LEADER>th", "<CMD>ToggleTerm direction=horizontal size=60<CR>", opts)

		opts.desc = "Toggle terminal vertically"
		keymap("n", "<LEADER>tv", "<CMD>ToggleTerm direction=vertical size=80<CR>", opts)

		opts.desc = "Toggle terminal float with htop"
		keymap("n", "<LEADER>tb", "<CMD>lua _btop_toggle()<CR>", opts)
	end,
}
