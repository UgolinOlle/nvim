--- ## Whoa User parser
--
-- Handles the user-specific configurations by loading from a default file
-- or creating it if it doesn't exist.
--
-- @module w_user_parser
-- @copyright 2024

local M = {}

-- Local imports
local notify = require("whoa.core.utils").notify
local user_dir = vim.fn.stdpath "config" .. "/user"
local user_config_path = user_dir .. "/main.lua"

--- Check if user directory exists, if not create it
--
-- @function ft_check_user_dir
-- @return nil
function M.ft_uparser()
  if vim.fn.filereadable(user_config_path) == 1 then
    local status, user_config = pcall(dofile, user_config_path)

    if status and type(user_config) == "table" then
      for key, value in pairs(user_config) do
        if key == "colorscheme" and value ~= "" then
          vim.cmd("colorscheme " .. value)
        elseif not vim.o[key] then
          notify("Invalid user config key: " .. key, vim.log.levels.ERROR)
        else
          vim.o[key] = value
        end
      end
      notify("User config loaded successfully", vim.log.levels.INFO)
    else
      notify("Error loading user config: " .. (user_config or "Invalid config format"), vim.log.levels.ERROR)
    end
  else
    notify("No user config found", vim.log.levels.WARN)
  end
end

return M
