--- ## Whoa utilities
--
-- Many utility functions
--
-- @module whoa.utils
-- @copyright 2023

local M = {}

-- Merge functions opts with custom opts
---@param default? table Default function table opts
---@param opts? table New table opts
---@return table
function M.extend_opts(default, opts)
  opts = opts or {}
  return default and vim.tbl_deep_extend("force", default, opts) or opts
end

-- Get icon from Whoa icons
---@param name string Name of icon
---@param padding? integer Adding a padding if necessary
function M.get_icons(name, padding)
  if not vim.g.icons_enabled then return "" end

  local icon_pack = vim.g.icons_enabled and "icons"
  if not M[icon_pack] then M.icons = require "whoa.icons.nerd" end

  local icon = M[icon_pack] and M[icon_pack][name]
  return icon and icon .. string.rep(" ", padding or 0) or ""
end

-- Custom notification with Whoa in title
---@param content string Content of the notification
---@param type? number Notification type
---@param opts? table nvim-notify options to add
function M.notify(content, type, opts)
  vim.schedule(function() vim.notify(content, type, M.extend_opts({ title = "Whoa" }, opts)) end)
end

-- Execute a shell command and return the output
-- @param cmd string The command to execute
-- @return string The output of the command
function M.execute(cmd)
  if type(cmd) == "string" then cmd = { cmd } end
  local res = vim.fn.system(cmd)
  local success = vim.v.shell_error == 0
  if not success then vim.api.nvim_err_writeln("Error running command: " .. table.concat(cmd, " "), res) end
  return success and res:gsub("[\27\155][][()#;?%d]*[A-PRZcf-ntqry=><~]", "") or nil
end

return M
