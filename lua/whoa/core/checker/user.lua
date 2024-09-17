-- ## Whoa User Checker
--
-- Module to check the user configuration directories.
--
-- @module whoa.core.checker.user
-- @copyright 2024

local M = {}

--- Run the user configuration directory checker
--- if not present, add to table.
--
-- @function ft_run
-- @param table tconfig: List of configuration files
-- @return nil
function M.ft_run(tconfig)
  local user_dirs = {
    vim.fn.stdpath "config" .. "/user",
  }

  for _, dir in ipairs(user_dirs) do
    if vim.fn.isdirectory(dir) == 0 then tconfig[dir] = false end
  end
end

return M
