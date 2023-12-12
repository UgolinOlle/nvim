return {
	"windwp/nvim-autopairs",

	event = { "InsertEnter" },

	dependencies = {
		"hrsh7th/nvim-cmp",
	},

	config = function()
		local status, autopairs = pcall(require, "nvim-autopairs")
		if not status then
			return
		end

		autopairs.setup({
			check_ts = true,
		})

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
