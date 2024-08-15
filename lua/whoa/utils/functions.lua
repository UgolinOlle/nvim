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

-- Create a group of autocommands.
--
-- @param name string: The name of the group.
-- @param commands table: The commands to be created.
-- @return nil
function M.ft_augroup(name, commands)
  local group_id = vim.api.nvim_create_augroup(name, { clear = true })

  for _, cmd in ipairs(commands) do
    vim.api.nvim_create_autocmd(cmd.events, {
      group = group_id,
      pattern = cmd.targets,
      command = cmd.command,
    })
  end
end

return M
