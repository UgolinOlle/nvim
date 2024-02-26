--- ## Whoa checker
--
-- Checking WHOA's configuration and environment.
--
-- @module whoa.checker
-- @copyright 2024

local M = {}

-- Variables
local api = vim.api

--- Update all plugins with a single command.
-- @return nil
function M.w_update_all()
  local cmds = {
    "Lazy update",
  }

  for _, cmd in ipairs(cmds) do
    vim.cmd(cmd)
  end
end

--- Create a command for usesr.
-- @param cmd string: The command to be created.
-- @param fn string: The function to be called.
-- @param opts table: The options for the command.
-- @return nil
function M.w_create_command(cmd, fn, opts)
  opts = opts or {}
  api.nvim_create_user_command(cmd, fn, opts)
end

-- Trim whitespace from a string.
-- @param s string
-- @return string
local function trim(s)
	return type(s) == "string" and vim.strim(s) or nil
end

return M
