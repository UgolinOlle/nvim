return {
	"nvimdev/dashboard-nvim",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	event = "VimEnter",

	config = function()
		local status, dashboard = pcall(require, "dashboard")
		if not status then
			return
		end

		dashboard.setup({
			theme = "hyper",
			config = {
				packages = {
					enable = true,
				},
				shortcut = {
					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
				},
			},
		})
	end,
}
