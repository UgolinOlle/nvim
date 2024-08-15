local functions = require "whoa.utils.functions"
local ft_create_cmd, ft_update_all, check = functions.ft_create_cmd, functions.ft_update_all, functions.check

-- Command to update all plugins.
ft_create_cmd("WhoaUpdateAll", ft_update_all)

-- Command to check health of Whoa.
ft_create_cmd("WhoaHealth", check)

vim.cmd [[ 
  hi FloatBorder guibg=NONE guifg=#F2E2C3
  hi PmenuSel guibg=NONE guifg=#F2E2C3
  hi Pmenu guibg=NONE guifg=#FFFFFF
  hi NormalFloat guibg=NONE
  hi Pmenu guibg=NONE
]]
