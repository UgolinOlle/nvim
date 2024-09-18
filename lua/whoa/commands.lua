local functions = require("whoa.core").WUtils
local ft_create_cmd, ft_update_all, ft_reinstall, ft_issue, ft_feature =
  functions.ft_create_cmd, functions.ft_update_all, functions.ft_reinstall, functions.ft_issue, functions.ft_feature

--- Command to update all plugins.
ft_create_cmd("WhoaUpdateAll", ft_update_all)

--- Command to reinstall all plugins.
ft_create_cmd("WhoaReinstall", ft_reinstall)

--- Command to open an issue on Github
ft_create_cmd("WhoaIssue", ft_issue)

--- Command to open a feature request on Github
ft_create_cmd("WhoaFeature", ft_feature)
