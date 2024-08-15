--- ## Logger
--
-- Module for logging user actions in Neovim.
--
-- @module logger
-- @copyright 2024

local M = {}

-- Variables
local ft_augroup = require("whoa.utils.functions").ft_augroup
local log_file = vim.fn.stdpath "config" .. "/user/logs/actions.log"
local log_dir = vim.fn.stdpath "config" .. "/user/logs"

-- Checking if the log file exists or creating it
if vim.fn.isdirectory(log_dir) == 0 then
  vim.fn.mkdir(log_dir, "p")
  if vim.fn.filereadable(log_file) == 0 then
    local file = io.open(log_file, "w")
    if file then
      file:write "User actions log\n"
      file:close()
    else
      print "Error: Unable to create log file."
    end
  end
end

-- Function to log an action
-- @param action string: The action to log
function M.log_action(action)
  local file = io.open(log_file, "a")
  if file then
    local timestamp = os.date "%Y-%m-%d %H:%M:%S"
    file:write(string.format("[%s] %s\n", timestamp, action))
    file:close()
  else
    print "Error: Unable to open log file."
  end
end

-- Function to setup logging for specific events
function M.setup_logging()
  -- Log every command executed
  ft_augroup("UserLogsActions", {
    {
      events = { "CmdlineLeave" },
      targets = { "*" },
      command = "lua require('whoa.core.logger').log_action('Command executed: ' .. vim.fn.getcmdline())",
    },
    {
      events = { "BufWritePost" },
      targets = { "*" },
      command = "lua require('whoa.core.logger').log_action('File saved: ' .. vim.fn.expand('<afile>'))",
    },
    {
      events = { "BufReadPost" },
      targets = { "*" },
      command = "lua require('whoa.core.logger').log_action('File opened: ' .. vim.fn.expand('<afile>'))",
    },
  })
end

-- Function to view the logs in a floating window
function M.view_logs()
  local buf = vim.api.nvim_create_buf(false, true)
  local log_lines = {}

  -- Read the log file
  local file = io.open(log_file, "r")
  if file then
    for line in file:lines() do
      table.insert(log_lines, line)
    end
    file:close()
  else
    log_lines = { "No log file found." }
  end

  -- Window options
  local opts = {
    relative = "editor",
    width = 80,
    height = #log_lines + 4,
    col = (vim.o.columns - 80) / 2,
    row = (vim.o.lines - (#log_lines + 4)) / 2,
    style = "minimal",
    border = "rounded",
    title = " User Actions Log ",
    title_pos = "center",
  }

  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Adding the log lines to the buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, log_lines)

  -- Keymap for closing the window
  vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>q<CR>", { noremap = true, silent = true })

  -- Set buffer options
  vim.api.nvim_set_option_value("buftype", "nofile", { buf = buf })
  vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })
  vim.api.nvim_set_option_value("swapfile", false, { buf = buf })
  vim.api.nvim_set_option_value("modifiable", false, { buf = buf })
end

return M
