local functions = require("whoa.core").WUtils
local ft_create_cmd, ft_update_all, ft_reinstall =
  functions.ft_create_cmd, functions.ft_update_all, functions.ft_reinstall

--- Command to update all plugins.
ft_create_cmd("WhoaUpdateAll", ft_update_all)

--- Command to reinstall all plugins.
ft_create_cmd("WhoaReinstall", ft_reinstall)
