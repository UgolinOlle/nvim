--- ## Whoa Core
--
-- Module for the core functionality of Whoa.
--
-- @module whoa.core
-- @copyright 2024

local M = {}

--- Imports
M.w_logger = require "whoa.core.logger"
M.w_user = require "whoa.core.user"
M.w_autocmds = require "whoa.core.autocmds"
M.w_theme = require "whoa.core.theme"

--- Execute logger setup
M.w_logger.setup_logging()

--- Execute user configuration
M.w_user.ft_load_user_config()

require("whoa.utils").notify "Whoa loaded successfully!"

return M
