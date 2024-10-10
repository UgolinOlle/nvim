--- ## Whoa Trouble diagnostics
--
---@desc Trouble is a plugin that provides a quick way to navigate and manage the list of diagnostics.
---@module whoa.core.plugins.trouble.diagnostics
---@copyright 2024

local M = {}

--- Variables
local w_utils = require "whoa.core.utils"

local function jump_to_diagnostic(file, lnum, col)
  vim.cmd("tabnew " .. file)
  vim.api.nvim_win_set_cursor(0, { lnum + 1, col })
end

M.ft_show_diagnostics_in_float = function()
  local buffers = vim.api.nvim_list_bufs()
  local diagnostics_by_file = {}
  local diagnostics_positions = {}

  for _, buf in ipairs(buffers) do
    local diagnostics = vim.diagnostic.get(buf)
    if not vim.tbl_isempty(diagnostics) then
      local filename = vim.api.nvim_buf_get_name(buf)
      if not diagnostics_by_file[filename] then diagnostics_by_file[filename] = {} end

      for _, diagnostic in ipairs(diagnostics) do
        table.insert(diagnostics_by_file[filename], diagnostic)
        table.insert(diagnostics_positions, { file = filename, lnum = diagnostic.lnum, col = diagnostic.col })
      end
    end
  end

  if vim.tbl_isempty(diagnostics_by_file) then
    vim.notify("Aucun diagnostic dans le projet", vim.log.levels.INFO)
    return
  end

  local buf = vim.api.nvim_create_buf(false, true)
  local lines = {}

  for file, file_diagnostics in pairs(diagnostics_by_file) do
    table.insert(lines, w_utils.get_icons("FolderClosed", 1) .. " " .. file)

    for _, diagnostic in ipairs(file_diagnostics) do
      local line =
        string.format("   ╰── Ligne %d, Col %d: %s", diagnostic.lnum + 1, diagnostic.col + 1, diagnostic.message)
      table.insert(lines, line)
    end
    table.insert(lines, "")
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_set_option_value("modifiable", false, { buf = buf })

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.6)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)
  local win_id = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = vim.g.border.style or "rounded",
  })

  vim.api.nvim_buf_set_keymap(buf, "n", "<CR>", "", {
    noremap = true,
    silent = true,
    callback = function()
      local cursor = vim.api.nvim_win_get_cursor(win_id)
      local line_num = cursor[1]
      local diagnostic_info = diagnostics_positions[line_num]

      if diagnostic_info then jump_to_diagnostic(diagnostic_info.file, diagnostic_info.lnum, diagnostic_info.col) end
    end,
  })
end

return M
