return {
	"goolord/alpha-nvim",

	enabled = false,

	config = function()
		local active, alpha = pcall(require, "alpha")
		if not active then
			return
		end

		local dashboard = require("alpha.themes.dashboard")

		-- Set the dashboard header
		local header = {
			type = "text",
			val = {
				[[        .........................]],
				[[............................]],
				[[.............................        ######(]],
				[[................................   ##       ##]],
				[[................................##(           ###]],
				[[..............................##..               ##]],
				[[...........................##(...                  ##(]],
				[[.........................##.......                    ##]],
				[[......................(((.........                      ###]],
				[[.,.,................((............                         ##]],
				[[.................((/..............                           ##(]],
				[[.,.,...........((................. .    .                       ##]],
				[[............((/...................    #####                       ###]],
				[[..........((......................   ### ##*                         ##]],
				[[.......((/......................    /##   ##,                          ##(]],
				[[.....((........................(#####.     *#####/                        ##]],
				[[....((......................###                   ###                      #(]],
				[[.....((..................... . ,#####/     (#####.                        ##]],
				[[.......(((................          *##   ##.                          ##*]],
				[[..........##............ .           (## ##,                         ##]],
				[[............(##......                 ####/                       ##*]],
				[[...............##.                                              ##]],
				[[                 (##                                         ##*]],
				[[                    ##                                     ##]],
				[[                      (##                               ##*]],
				[[                         ##                           ##]],
				[[                           (##                     ##*]],
				[[                              ##                 ##]],
				[[                                (##           ##*]],
				[[                                   ##       ##]],
				[[                                     (#####,]],
			},
			opts = {
				position = "center",
				hl = "Type",
			},
		}

		alpha.setup({
			hide = {
				statusline = true,
				tabline = true,
				winbar = true,
			},
			config = {
				header = header,
				center = {
					{
						icon = "",
						desc = "Lazy sync / TSUpdate / MasonToolsUpdate",
						key = "s",
						action = "UpdateAndSyncAll",
					},
					{
						icon = "",
						desc = "Lazy sync",
						key = "l",
						action = "Lazy sync",
					},
					{
						icon = "",
						desc = "Find files",
						key = "f",
						action = "TelescopeFindFiles",
					},
					{
						icon = "",
						desc = "Neogit",
						key = "g",
						action = "Neogit",
					},
					{
						icon = "",
						desc = "DiffView main",
						key = "d",
						action = "DiffviewOpen origin/main...HEAD",
					},
					{
						icon = "",
						desc = "Mason",
						key = "m",
						action = "Mason",
					},
					{
						icon = "",
						desc = "Restore session",
						key = "r",
						action = "SessionRestore",
					},
					{
						icon = "",
						desc = "Oil",
						key = "o",
						action = "Oil",
					},
					{
						icon = "",
						desc = "Empty buffer",
						key = "e",
						action = "enew",
					},
					{
						icon = "",
						desc = "Quit",
						key = "q",
						action = "q",
					},
				},
			},
		})
	end,
}
