--- ## User configuration
--
-- Module for user management
--
-- @module uconfig
-- @copyright 2024

local M = {}

-- Variables
local notify = require("whoa.utils").notify
local user_dir = vim.fn.stdpath "config" .. "/user"
local ft_uparser = require("whoa.core.user.parser").ft_uparser

-- Check if user directory exists, if not create it
if vim.fn.isdirectory(user_dir) == 0 then
  -- Create the user directory
  vim.fn.mkdir(user_dir, "p")
  print("Dossier 'user' créé à : " .. user_dir)

  -- Create the default config file
  vim.fn.writefile({
    "return {",
    "  -- Put your custom configuration here",
    "  -- Example: ",
    "  -- colorscheme = 'gruvbox'",
    "}",
  }, user_dir .. "/main.lua")
end

function M.ft_load_user_config()
  local user_config_path = vim.fn.stdpath "config" .. "/user/main.lua"
  if vim.fn.filereadable(user_config_path) == 1 then
    local user_loaded, error = dofile(user_config_path)
    if user_loaded then
      ft_uparser()
      notify("User config loaded", vim.log.levels.INFO)
    else
      notify("Error loading user config: " .. error, vim.log.levels.ERROR)
    end
  else
    notify("No user config found", vim.log.levels.WARN)
  end
end

return M
