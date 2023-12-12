return {
	"goolord/alpha-nvim",

	cmd = "Alpha",

	opts = function()
		local db = require("alpha.themes.dashboard")
		local get_icons = require("whoa.utils").get_icons

		db.section.header.opts.hl = "DashboardHeader"
		db.section.footer.opts.hl = "DashboardFooter"

		db.section.buttons.val = {
			db.button("n", get_icons("FileNew", 2) .. "New File   "),
		}

		db.config.layout = {
			{ type = "padding", val = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }) },
			{ type = "padding", val = 5 },
			db.section.buttons,
			{ type = "padding", val = 3 },
			db.section.footer,
		}

		db.config.opts.noautocmd = true

		return db
	end,

	config = require("plugins.configs.alpha"),
}
