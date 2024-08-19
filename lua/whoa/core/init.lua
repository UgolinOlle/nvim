-- Execute logger setup
local logger = require "whoa.core.logger"
logger.setup_logging()

-- Import all the modules
require "whoa.core.user"
require "whoa.core.autocmds"

-- Execute user configuration
require("whoa.core.user").ft_load_user_config()

require("whoa.utils").notify "Whoa loaded successfully!"
