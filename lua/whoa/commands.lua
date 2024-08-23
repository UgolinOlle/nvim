local functions = require("whoa.core").WUtils
local ft_create_cmd, ft_update_all = functions.ft_create_cmd, functions.ft_update_all

-- Command to update all plugins.
ft_create_cmd("WhoaUpdateAll", ft_update_all)
