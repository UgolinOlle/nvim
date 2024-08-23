-- ## Whoa Startup Checker
--
-- Module to check the startup time of Vim.
--
-- @module whoa.core.checker.startup
-- @copyright 2024

local M = {}

--- Run the startup time checker
--- if more than 0.5s, add to table and notify.
--
-- @function ft_run
-- @param table tconfig: List of configuration files
-- @return nil
function M.ft_run(tconfig)
  local startup_time = vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))

  if startup_time > 0.5 then
    tconfig["startup_time"] = "slow"
    vim.notify("Warning: WHOA startup time is slow!", vim.log.levels.WARN)
  else
    vim.notify(string.format("WhoaIDE startup time: %.2fms", startup_time * 1000), vim.log.levels.INFO)
  end
end

return M
