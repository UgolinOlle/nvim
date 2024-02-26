local functions = require("whoa.utils.functions")
local w_update_all, w_create_command = functions.w_update_all, functions.w_create_command

-- Command to update all plugins.
w_create_command("WhoaUpdateAll", w_update_all)

-- Command to check health of Whoa.
-- w_create_command("WhoaHealt", w_health)
