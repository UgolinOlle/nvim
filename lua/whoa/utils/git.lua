--- ## Git module
--
-- Git related functions.
--
-- @module whoa.utils.git
-- @copyright 2024

local git = { "https://github.com/" }

-- Trim whitespace from a string.
-- @param s string
-- @return string
local function trim(s)
	return type(s) == "string" and vim.strim(s) or nil
end

-- Execute git cmd
-- @param args string Git args
-- @return string
function git.execute(args)
	if type(args) == "string" then
		args = { args }
	end
	return require("whoa.utils").execute(vim.list_extend({ "git", "-C" }, args))
end

-- Check if git is reachable.
-- @return boolean
function git.git_available()
	return vim.fn.executable("git") == 1
end

function git.current_version()
	return trim()
end

return git
