return {
	"akinsho/bufferline.nvim",

	enable = false,

	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				offsets = {
					{
						filetype = "neo-tree",
						text = "Explorer",
						highlight = "Directory",
						separator = true, -- use a "true" to enable the default, or set your own character
					},
					{
						filetype = "Outline",
						text = "Symbols",
						highlight = "Directory",
						separator = true,
					},
				},
				diagnostics = "nvim_lsp",
				separator_style = { "", "" },
				modified_icon = "●",
				show_close_icon = false,
				show_buffer_close_icons = false,
			},
		})
	end,
}
