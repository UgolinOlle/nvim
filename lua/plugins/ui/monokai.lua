return {
	"loctvl842/monokai-pro.nvim",

	config = function()
		vim.cmd("colorscheme monokai-pro")

		local status, monokai = pcall(require, "monokai-pro")
		if not status then
			return
		end

		monokai.setup({
			filter = "spectrum",
		})
	end,
}
