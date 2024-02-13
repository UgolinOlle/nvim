local utils = require "whoa.utils"
local functions = utils.functions
local w_update_all, w_create_command = functions.w_update_all, functions.w_create_command

-- Command to update all plugins.
w_create_command("WhoaUpdateAll", w_update_all)
