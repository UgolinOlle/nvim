return {
	"nvim-neo-tree/neo-tree.nvim",

	branch = "main",

	dependencies = { "MunifTanjim/nui.nvim" },

	cmd = "NeoTree",

	init = function()
		vim.g.neo_tree_remove_legacy_commands = true
	end,

	opts = function()
		return {
			auto_clean_after_session_restore = true,
			close_if_last_window = true,
			sources = { "filesystem", "buffers", "git_status" },

			source_selector = {
				winbar = true,
				content_layout = "center",
				sources = {
					{ source = "filesystem", display_name = "" .. "File" },
					{ source = "buffers", display_name = "󰈙" .. "Bufs" },
					{ source = "git_status", display_name = "󰊢" .. "Git" },
					{ source = "diagnostics", display_name = "󰒡" .. "Diagnostic" },
				},
			},

			default_component_configs = {
				indent = { padding = 0 },
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
					folder_empty_open = "",
					default = "󰈙",
				},
				modified = { symbol = "" },
				git_status = {
					symbols = {
						added = "",
						deleted = "",
						modified = "",
						renamed = "➜",
						untracked = "★",
						ignored = "◌",
						unstaged = "✗",
						staged = "✓",
						conflict = "",
					},
				},
			},
		}
	end,
}
