return {
	"rcarriga/nvim-notify",

	config = function()
		local status, notify = pcall(require, "notify")
		if not status then
			return
		end

		vim.notify = notify
		notify.setup({
			minimum_width = 50,
			background_colour = "#1d2021",
			stages = "fade",
			timeout = 2000,
			fps = 60,
		})
	end,

	keys = {
		{
			"<LEADER>nn",
			"<CMD>require('notify').dismiss()<CR>",
			{ noremap = true, silent = true, desc = "Dismiss notifications" },
		},
		{
			"<LEADER>nl",
			"<CMD>Notifications<CR>",
			{
				noremap = true,
				silent = true,
				desc = "List notifications",
			},
		},
	},
}
