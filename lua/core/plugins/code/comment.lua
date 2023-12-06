return {
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
			pre_hook = ts_context.create_pre_hook(),
		})
	end,
}
