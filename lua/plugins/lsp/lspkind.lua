return {
	"onsails/lspkind.nvim",

	config = function()
		local active, lspkind = pcall(require, "lspkind")
		if not active then
			return
		end

		lspkind.init({
			symbol_map = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "",
			},

			formatting = {
				formatter = lspkind.cmp_format({ with_text = true, menu = {
					nvim_lsp = "[LSP]",
				} }),
			},
		})
	end,
}
