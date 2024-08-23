--- ## Whoa Check
--
-- Module to check if the configuration files are present.
--
-- @module whoa.core.checker
-- @copyright 2024

local M = {}

--- Imports
M.w_config_check = require "whoa.core.checker.config"
M.w_startup_check = require "whoa.core.checker.startup"
M.w_user_check = require "whoa.core.checker.user"

--- Run all checks
--
-- @function ft_run_all_checks
-- @return nil
function M.ft_run_all_checks()
  -- Variables
  local tconfig = {}

  M.w_config_check.ft_run(tconfig)
  M.w_startup_check.ft_run(tconfig)
  M.w_user_check.ft_run(tconfig)

  -- Display everything from the table in one notification
  for k, v in pairs(tconfig) do
    if v == false then
      vim.notify("Warning: " .. k .. " is missing!", vim.log.levels.WARN)
    elseif v == "slow" then
      vim.notify("Warning: " .. k .. " is slow!", vim.log.levels.WARN)
    end
  end
end

return M
