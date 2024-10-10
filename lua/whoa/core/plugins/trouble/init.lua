--- ## Whoa Trouble
--
---@desc Trouble is a plugin that provides a quick way to navigate and manage the list of diagnostics.
---@module whoa.core.plugins.trouble
---@copyright 2024

local M = {}

M.diagnostics = require "whoa.core.plugins.trouble.diagnostics"

--- Variables
local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

opts.desc = "Show diagnostics in a floating window"
keymap(
  "n",
  "<LEADER>td",
  function() require("whoa.core.plugins.trouble.diagnostics").ft_show_diagnostics_in_float() end,
  opts
)

return M
