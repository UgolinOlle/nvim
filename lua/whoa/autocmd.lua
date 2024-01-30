local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.api.nvim_create_user_command

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

-- CUSTOM --

-- Health cmd
-- FIXME: This is not working.
cmd("WhoaHealth", function()
	require("whoa.health").checkup()
end, { desc = "Checking Whoa health status." })
