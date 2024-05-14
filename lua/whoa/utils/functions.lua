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
--
-- @return nil
function M.ft_update_all()
  local cmds = {
    "Lazy update",
    "MasonUpdate",
  }

  for _, cmd in ipairs(cmds) do
    vim.cmd(cmd)
  end
end

-- Check health of my nvim config and addons.
--
-- @return nil
function M.check()
  local health = require "vim.health"

  health.start "WhoaIDE"
  health.info("Neovim Version: v" .. vim.fn.matchstr(vim.fn.execute "version", "NVIM v\\zs[^\n]*"))
end

--- Create a command for usesr.
--
-- @param cmd string: The command to be created.
-- @param fn string: The function to be called.
-- @param opts table: The options for the command.
-- @return nil
function M.ft_create_cmd(cmd, fn, opts)
  opts = opts or {}
  api.nvim_create_user_command(cmd, fn, opts)
end

return M
