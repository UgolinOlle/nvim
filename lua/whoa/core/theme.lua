--- ## Whoa Theme Selector
--
-- Module for selecting and applying themes.
--
-- @module w_theme
-- @copyright 2024

local M = {}

--- Variables
local notify = require("whoa.core.utils").notify
local themes = {
  { title = "Hack the Box", name = "hackthebox", icon = "" },
  { title = "Github Dark", name = "github_dark", icon = "" },
  { title = "Solarized Dark", name = "solarized-osaka", icon = "" },
}

vim.api.nvim_set_hl(0, "TitleBold", { bold = true, ctermfg = "Yellow", ctermbg = "Blue" })

--- Apply a theme
--
-- @param theme_name string: The name of the theme to apply
-- @return boolean: Whether the theme was applied successfully
function M.ft_set_theme(theme_name)
  local success, _ = pcall(function() vim.cmd("colorscheme " .. theme_name) end)

  if not success then notify("Error: Cannot find color scheme '" .. theme_name .. "'", vim.log.levels.ERROR) end

  return success
end

--- List available themes and open a floating window to select one
--
-- @return nil
function M.ft_list_themes()
  local buf = vim.api.nvim_create_buf(false, true)

  -- Window options
  local opts = {
    relative = "editor",
    width = 40,
    height = (#themes * 3) + 4,
    col = (vim.o.columns - 40) / 2,
    row = (vim.o.lines - ((#themes * 3) + 2)) / 2,
    style = "minimal",
    border = "rounded",
    title = " Select a Theme: ",
    title_pos = "left",
  }

  local win = vim.api.nvim_open_win(buf, true, opts)

  --- Adding the list of themes to the buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "" })
  vim.api.nvim_buf_add_highlight(buf, -1, "TitleBold", 0, 0, -1)

  for i, theme in ipairs(themes) do
    local line_content = theme.icon .. "  " .. theme.title
    vim.api.nvim_buf_set_lines(buf, (i - 1) * 3 + 2, (i - 1) * 3 + 3, false, { line_content, "" })
  end

  --- Keymaps for selecting a theme
  vim.api.nvim_buf_set_keymap(
    buf,
    "n",
    "<CR>",
    [[<cmd>lua require('whoa.core.theme').ft_select_theme()<CR>]],
    { noremap = true, silent = true }
  )

  --- Keymap for closing the window
  vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>q<CR>", { noremap = true, silent = true })

  --- Store the window data
  vim.api.nvim_win_set_var(win, "theme_selector_win", { buf = buf, win = win })

  --- Set buffer options
  vim.api.nvim_set_option_value("buftype", "nofile", { buf = buf })
  vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })
  vim.api.nvim_set_option_value("swapfile", false, { buf = buf })
  vim.api.nvim_set_option_value("modifiable", false, { buf = buf })
end

--- Select a theme from the list
--
-- @function ft_select_theme
-- @return nil
function M.ft_select_theme()
  local win_data = vim.api.nvim_win_get_var(0, "theme_selector_win")
  local cur_line = vim.fn.line "."

  --- Adjusting for spacing: find the correct theme based on line number
  local theme_index = math.floor((cur_line - 1) / 3) + 1

  --- Close the window
  vim.api.nvim_win_close(win_data.win, true)

  --- Apply the selected theme
  local theme = themes[theme_index]
  print("Theme: " .. themes[theme_index].name .. " selected")
  print("Selected theme: " .. theme.name)
  if theme then M.ft_set_theme(theme.name) end
end

--- Get current theme
--
---@function ft_get_current_theme
---@return string: The name of the current theme
function M.ft_get_current_theme() return vim.g.colors_name end

--- Get highlight color
---
---@function ft_get_hl
---@param group string: The highlight group
---@param type string: The type of highlight
---@return string|nil: The hex color of the highlight group
function M.ft_get_hl(group, type)
  local hl = vim.api.nvim_get_hl(0, { name = group })
  if hl and hl[type] then return string.format("#%06x", hl.fg) end
  return nil
end

return M
