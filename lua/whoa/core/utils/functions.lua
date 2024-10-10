--- ## Whoa checker
--
---@desc Checking WHOA's configuration and environment.
---@module whoa.core.utils.functions
---@copyright 2024

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

--- Get the open command for the current OS.
--
---@return string
function M.ft_open_cmd()
  local os_name = vim.loop.os_uname().sysname
  local cmd

  if os_name == "Linux" then
    cmd = "xdg-open"
  elseif os_name == "Darwin" then
    cmd = "open"
  elseif os_name == "Windows" then
    cmd = "start"
  end

  return cmd
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

--- Switch AI Model
--
---@param model string: The model to be switched to.
---@return nil
function M.ft_switch_model(model)
  local avante = require "avante"

  if not model then
    vim.notify "No model provided."
    return
  elseif model == "claude" then
    avante.setup {
      provider = "claude",
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20240620",
        temperature = 0.7,
        max_tokens = 4096,
      },
    }
  elseif model == "openai" then
    avante.setup {
      provider = "openai",
      openai = {
        endpoint = "https://api.openai.com",
        model = "gpt-4",
        temperature = 0.7,
        max_tokens = 4096,
      },
    }
  else
    vim.notify("Model not found: " .. model, 2)
    return
  end
  print("Switched to model: " .. model)
end

--- Open an issue on WhoaIDE Github
--
---@return nil
function M.ft_issue()
  local url = "https://github.com/UgolinOlle/WhoaIDE/issues/new?assignees=&labels=&projects=&template=bug_report.md"
  local cmd = M.ft_open_cmd()

  vim.fn.jobstart({ cmd, url }, { detach = true })
end

--- Open an feature request on WhoaIDE Github
--
---@return nil
function M.ft_feature()
  local url =
    "https://github.com/UgolinOlle/WhoaIDE/issues/new?assignees=&labels=&projects=&template=feature_request.md&title="
  local cmd = M.ft_open_cmd()

  vim.fn.jobstart({ cmd, url }, { detach = true })
end

--- Copy the diagnostic message under the cursor to the clipboard.
--
---@return nil
function M.ft_copy_diagnostic()
  local line_diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })

  if #line_diagnostics == 0 then
    vim.notify("Aucun diagnostic trouvé.", 1)
    return
  end

  local diag_message = line_diagnostics[1].message
  vim.fn.setreg("+", diag_message)

  vim.notify("Diagnostic copié : " .. diag_message, 2)
end

--- Go to line
--
---@param line number: The line to go to.
---@return nil
function M.ft_go_to_line()
  local line = tonumber(vim.fn.input "Go to line: ")
  if line and line > 0 then
    vim.cmd(tostring(line))
  else
    vim.notify("Numéro de ligne invalide", vim.log.levels.ERROR)
  end
end

return M
