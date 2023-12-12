local M = {}

local health = {
	start = vim.health.start or vim.health.report_start,
	ok = vim.health.ok or vim.health.report_ok,
	warn = vim.health.warn or vim.health.report_warn,
	error = vim.health.error or vim.health.report_error,
	info = vim.health.info or vim.health.report_info,
}

function M.checkup()
	health.start("Whoa")
	health.info("Neovim version: v" .. vim.fn.matchstr(vim.fn.execute("vesion"), "NVIM v\\zs[^\n]*"))
end

return M
