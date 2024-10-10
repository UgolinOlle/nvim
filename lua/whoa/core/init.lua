--- ## Whoa Core
--
---@desc Module for the core functionality of Whoa.
--
---@module whoa.core
---@copyright 2024

local M = {}

--- Imports
M.WUtils = require "whoa.core.utils"
M.WAutocmds = require "whoa.core.autocmds"
M.WChecker = require "whoa.core.checker"
M.WFeatures = require "whoa.core.features"
M.WLogger = require "whoa.core.logger"
M.WUser = require "whoa.core.user"
M.WTheme = require "whoa.core.theme"
M.WNotes = require "whoa.core.notes"
M.WPlugins = require "whoa.core.plugins"

--- Execute logger setup
M.WLogger.ft_setup_logging()

--- Execute checker
M.WChecker.ft_run_all_checks()

--- Execute user configuration
M.WUser.ft_load_user_config()

return M
