local M = {}

-- TODO: remove deprecated method check after dropping support for neovim v0.9
local health = {
	start = vim.health.start or vim.health.report_start,
	ok = vim.health.ok or vim.health.report_ok,
	warn = vim.health.warn or vim.health.report_warn,
	error = vim.health.error or vim.health.report_error,
	info = vim.health.info or vim.health.report_info,
}

function M.checkup()
	health.start("AstroNvim")
	health.info("Neovim Version: v" .. vim.fn.matchstr(vim.fn.execute("version"), "NVIM v\\zs[^\n]*"))

	local programs = {
		{
			cmd = "git",
			type = "error",
		},
		{ cmd = { "node" }, type = "warn", msg = "Used for mappings to pull up node REPL (Optional)" },
	}

	for _, program in ipairs(programs) do
		local name = table.concat(program.cmd, "/")
		local found = false
		for _, cmd in ipairs(program.cmd) do
			name = cmd
			if not program.extra_check or program.extra_check(program) then
				found = true
			end
			break
		end

		if found then
			health.ok(name .. " found")
		else
			health[program.type](name .. " not found")
		end
	end
end

return M
