return {
	"nvim-lualine/lualine.nvim",

	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local status, lualine = pcall(require, "lualine")
		if not status then
			return
		end

		local utils = require("whoa.utils")
		local get_icons = utils.get_icons
		local solarized_dark = require("lualine.themes.solarized_dark")

		lualine.setup({
			extensions = {
				"neo-tree",
				"lazy",
				"symbols-outline",
			},
			options = {
				theme = solarized_dark,
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = { statusline = { "NvimTree", "alpha" } },
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { { "mode", padding = { left = 1 } } },
				lualine_b = { "branch" },
				lualine_c = {
					{ "filename", path = 1 },
					{
						"diff",
						on_click = function()
							require("gitsigns").setloclist()
						end,
					},
				},
				lualine_x = {
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
						on_click = function()
							require("lazy.status").home()
						end,
					},
					{
						"diagnostic",
						update_in_insert = true,
						symbols = {
							error = get_icons("DiagnosticError", 1),
							warn = get_icons("DiagnosticWarn", 1),
							info = get_icons("DiagnosticInfo", 1),
							hint = get_icons("DiagnosticHint", 1),
						},
						on_click = function()
							vim.diagnostic.setloclist()
						end,
					},
					{ "filetype", padding = { right = 1 } },
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
