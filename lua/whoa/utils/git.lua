--- ### Git module
--
-- Git related functions.
--
-- @module whoa.utils.git
-- @copyright 2024

-- Variables
local git = { url = "https://github.com/" }
local trim = require("whoa.utils").trim

-- Execute git cmd
-- @param args string Git args
-- @return string
function git.execute(args, ...)
	if type(args) == "string" then
		args = { args }
	end
	return require("whoa.utils").execute(vim.list_extend({ "git", "-C" }, args), ...)
end

-- Check if git is reachable.
-- @return boolean
function git.available()
	return vim.fn.executable("git") == 1
end

-- Get the git client version.
-- @return table|nil - Table with version information or nil if git is not available.
function git.version()
	if not git.available() then
		return nil
	end
	local output = git.execute("--version")
	local version = string.match(output, "git version ([%d%.]+)")
	if version then
		return {
			major = tonumber(string.match(version, "(%d+)")),
			minor = tonumber(string.match(version, "(%d+)%.(%d+)")),
			patch = tonumber(string.match(version, "(%d+)%.(%d+)%.(%d+)")),
		}
	end
	return { major = major, minor = minor, patch = patch }
end

-- Check if the current directory is a git repository.
-- @return boolean
function git.is_repo()
	return git.execute("rev-parse", "--is-inside-work-tree") == 0
end

-- Fetch the current branch name.
-- @param remote string - Remote name
-- @return string - Branch name
function git.fetch(remote, ...)
	return git.execute({ "fetch", remote}, ...)
end

return git
