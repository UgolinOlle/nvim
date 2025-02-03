--- ## Whoa checker
--
-- Checking WHOA's configuration and environment.
--
-- @module whoa.utils.checker
-- @copyright 2024

-- Variables
local M = {}
local git = require("whoa.core").w_utils
local logger = require("whoa.core").w_logger

--- Check if all LSP servers are installed.
--
-- @param servers table
-- @return boolean
function M.ft_check_lsp_servers(servers)
  for _, server in ipairs(servers) do
    if not require("lspconfig")[server] then return false end
  end
  return true
end

--- Check for plugins that are installed.
--
-- @param plugins table
-- @return boolean
function M.ft_check_plugins(plugins)
  for _, plugin in ipairs(plugins) do
    if not pcall(require, plugin) then return false end
  end
  return true
end

--- Check if essential external tools are available.
--
-- @param tools table - A list of external tools to check (e.g., git, node, python)
-- @return boolean
function M.ft_check_tools(tools)
  for _, tool in ipairs(tools) do
    if vim.fn.executable(tool) == 0 then
      vim.api.nvim_err_writeln("Required tool not found: " .. tool)
      return false
    end
  end
  return true
end

--- Check if essential configurations are set.
--
-- @param configs table - A list of configuration keys to check (e.g., globals, options)
-- @return boolean
function M.ft_check_configs(configs)
  for _, config in ipairs(configs) do
    if vim.g[config] == nil then
      vim.api.nvim_err_writeln("Configuration not set: " .. config)
      return false
    end
  end
  return true
end

--- Collect and report errors in WHOA's environment setup.
--
-- @return table - A table of error messages
function M.ft_report_errors()
  local errors = {}

  if not M.ft_check_lsp_servers { "bashls", "pyright", "ts_ls" } then
    table.insert(errors, "Missing LSP servers.")
  end

  if not M.ft_check_plugins { "nvim-treesitter", "telescope.nvim" } then
    table.insert(errors, "Missing essential plugins.")
  end

  if not M.ft_check_tools { "git", "node", "python" } then table.insert(errors, "Missing essential tools.") end

  if not M.ft_check_configs { "theme", "lsp_enabled" } then
    table.insert(errors, "Essential configurations are not set.")
  end

  -- Print everything in logger
  if #errors > 0 then
    logger.ft_log_action("ERROR", "WHOA environment setup has the following issues:")
    for _, error in ipairs(errors) do
      logger.ft_log_action("ERROR", "  - " .. error)
    end
  end

  return errors
end

--- Get the current version of WHOA IDE.
--
-- @return string
function M.get_version() local version = git.current_version(false) or "unknown" end

return M
