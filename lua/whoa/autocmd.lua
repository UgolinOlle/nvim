local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	pattern = "c",
	command = "setlocal shiftwidth=4 tabstop=4",
})
