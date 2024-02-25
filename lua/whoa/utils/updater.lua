--- ### Whoa updater
--
--- Updater functions for Whoa
--
-- @module whoa.utils.updater
-- @copyright 2024

-- Variables
local M = {}
local notify = require "whoa.utils".notify

-- Get the current Whoa version
-- @return string The current Whoa version
function M.version()
  local version = whoa.install.version or git.current_version(false) or "unknown"
  if version then notify(("Version: *%s*"):format(version)) end
end
