--- ## Whoa checker
--
-- Checking WHOA's configuration and environment.
--
-- @module whoa.core.utils.functions
-- @copyright 2024

local M = {}

-- Variables
local api = vim.api

--- Update all plugins with a single command.
--
-- @return nil
function M.ft_update_all()
  local cmds = {
    "Lazy update",
    "MasonUpdate",
  }

  for _, cmd in ipairs(cmds) do
    vim.cmd(cmd)
  end
end

--- Create a command for usesr.
--
-- @param cmd string: The command to be created.
-- @param fn string: The function to be called.
-- @param opts table: The options for the command.
-- @return nil
function M.ft_create_cmd(cmd, fn, opts)
  opts = opts or {}
  api.nvim_create_user_command(cmd, fn, opts)
end

-- Create a group of autocommands.
--
-- @param name string: The name of the group.
-- @param commands table: The commands to be created.
-- @return nil
function M.ft_augroup(name, commands)
  local group_id = vim.api.nvim_create_augroup(name, { clear = true })

  for _, cmd in ipairs(commands) do
    vim.api.nvim_create_autocmd(cmd.events, {
      group = group_id,
      pattern = cmd.targets,
      command = cmd.command,
    })
  end
end

--- Reinstall all plugins
--
-- @return nil
function M.ft_reinstall()
  local lazy_path = vim.fn.stdpath "data" .. "/lazy"

  vim.ui.select({ "Oui", "Non" }, {
    prompt = "Voulez-vous réinstaller tous les plugins ? Cela supprimera les plugins existants.",
  }, function(choice)
    if choice == "Oui" then
      local success = vim.fn.delete(lazy_path, "rf")

      if success == 0 then
        vim.notify "Répertoire des plugins Lazy supprimé avec succès."
        require("lazy").sync()
      else
        vim.notify "Échec de la suppression du répertoire des plugins Lazy."
      end
    else
      vim.notify "Réinstallation annulée."
    end
  end)
end

return M
