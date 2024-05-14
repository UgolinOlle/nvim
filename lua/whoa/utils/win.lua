local M = {}

-- Function to create a simple window.
--
-- @param opts table: The options for the window.
-- @return number: The window number.
function M.ft_create_window(opts)
  opts = opts or {}

  -- Set the default options.
  opts.row = opts.row or 0
  opts.col = opts.col or 0
  opts.width = opts.width or 0
  opts.height = opts.height or 0

  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Set the window options.
  vim.api.nvim_win_set_option(win, "wrap", true) -- Wrap lines.
  vim.api.nvim_win_set_option(win, "number", true) -- Show line numbers.
  vim.api.nvim_win_set_option(win, "relativenumber", true) -- Show relative line numbers.
  vim.api.nvim_win_set_option(win, "cursorline", true) -- Highlight the current line.
  vim.api.nvim_win_set_option(win, "signcolumn", "yes") -- Show the sign column.
  vim.api.nvim_win_set_option(win, "winhl", "Normal:Normal") -- Set the window highlight.
  vim.api.nvim_win_set_option(win, "winblend", 0) -- Set the window blend.
  vim.api.nvim_win_set_option(win, "winhighlight", "Normal:Normal") -- Set the window highlight.

  return win
end

return M
