--- ## Whoa Configuration Checker
--
-- Module to check if the configuration files are present.
--
-- @module whoa.core.checker.config
-- @copyright 2024

local M = {}

--- Check if the configuration files are present
--- if not present, add to table.
--
-- @function ft_run
-- @param table tconfig: List of configuration files
-- @return nil
function M.ft_run(tconfig)
  local config_files = {
    vim.fn.stdpath "config" .. "/init.lua",
    vim.fn.stdpath "config" .. "/lua/whoa/configs/features.lua",
  }

  for _, file in ipairs(config_files) do
    if vim.fn.filereadable(file) == 0 then tconfig[file] = false end
  end
end

return M
