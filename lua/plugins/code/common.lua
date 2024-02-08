return {
	{
		"kylechui/nvim-surround",

		event = "VeryLazy",

		version = "*",
	},
	{
		"numToStr/Comment.nvim",

		event = { "BufReadPre", "BufNewFile" },

		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},

		config = function()
			local status, comment = pcall(require, "Comment")
			if not status then
				return
			end

			local ts_context_status, ts_context = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
			if not ts_context_status then
				return
			end

			comment.setup({
				pre_hook = ts_context.create_pre_hook(), -- We will create a pre_hook using the helper created
				padding = true, -- Add a space b/w comment and line
				sticky = true, -- Whether the cursor should stay at the end of the comment after toggling
			})
		end,
	},
}
