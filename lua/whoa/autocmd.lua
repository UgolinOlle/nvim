local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	pattern = "c",
	command = "setlocal shiftwidth=4 tabstop=4",
})

autocmd("TermOpen", {
	desc = "Disable foldcolumn in terminal and signcolumn for terminal.",
	callback = function()
		vim.opt.foldcolumn = "0"
		vim.opt.signcolumn = "no"
	end,
})
