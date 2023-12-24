local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.api.nvim_command

-- Adding theme (gruvbox).
vim.cmd([[colorscheme gruvbox]])

-- Adding 42 norm on C file.
autocmd("FileType", {
	pattern = "c",
	command = "setlocal shiftwidth=4 tabstop=4",
})

-- Disable some style on terminal.
autocmd("TermOpen", {
	desc = "Disable foldcolumn in terminal and signcolumn for terminal.",
	callback = function()
		vim.opt.foldcolumn = "0"
		vim.opt.signcolumn = "no"
	end,
})

-- Open symbol-outline on startup.
