local functions = require "whoa.utils.functions"
local ft_create_cmd, ft_update_all, check = functions.ft_create_cmd, functions.ft_update_all, functions.check

-- Command to update all plugins.
ft_create_cmd("WhoaUpdateAll", ft_update_all)

-- Command to check health of Whoa.
ft_create_cmd("WhoaHealth", check)

-- Command test to create a window.
local win_opts = {
  width = 100,
  height = 25,
  row = 5,
  col = 10,
}
ft_create_cmd("WhoaCreateWindow", function() require("whoa.utils.win").ft_create_window(win_opts) end)
