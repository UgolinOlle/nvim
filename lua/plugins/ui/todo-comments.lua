return {
	"folke/todo-comments.nvim",

	dependencies = { "nvim-lua/plenary.nvim" },

	opts = function()
		local utils = require("whoa.utils")
		local get_icons = utils.get_icons

		return {
			keywords = {
				FIX = {
					icon = get_icons("Debugger", 1),
					color = "error",
					alt = { "FIXME", "BUG", "FIXIT", "FIX", "ISSUE" },
				},
				TODO = { icon = get_icons("DiagnosticInfo", 1), color = "info", alt = { "TODO" } },
				HACK = { icon = " ", color = "warning", alt = { "HACK" } },
				WARN = { icon = get_icons("DiagnosticWarn", 1), color = "warning", alt = { "WARNING" } },
				PERF = { icon = get_icons("DiagnosticPerf", 1), color = "warning", alt = { "PERF" } },
				NOTE = { icon = get_icons("DiagnosticHint", 1), color = "hint", alt = { "NOTE" } },
			},
		}
	end,
}
