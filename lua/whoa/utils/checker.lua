--- ## Whoa checker
--
-- Checking WHOA's configuration and environment.
--
-- @module whoa.checker
-- @copyright 2024

local M = {}

-- Variables
local utils = require("whoa.utils")
local notify = utils.notify

--- Check if all LSP servers are installed.
-- @param servers table
-- @return boolean
function M.check_lsp_servers(servers)
	for _, server in ipairs(servers) do
		if not require("lspconfig")[server] then
			return false
		end
	end
	return true
end

-- Get the current version of WHOA IDE.
-- @return string
function M.get_version()
	local version = git.current_version(false) or "unknown"
end

return M
