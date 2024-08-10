--- ## Theme Selector
--
-- Module for selecting and applying themes.
--
-- @module theme_selector
-- @copyright 2024

local M = {}

-- Variables
local notify = require("whoa.utils").notify
local themes = {
  { name = "Hack the Box", icon = "" },
  { name = "Catppuccino", icon = "" },
  { name = "Github Dark", icon = "" },
  { name = "Gruvbox", icon = "" },
}

vim.api.nvim_set_hl(0, "TitleBold", { bold = true, ctermfg = "Yellow", ctermbg = "Blue" })

-- Apply a theme
-- @param theme_name string: The name of the theme to apply
function M.set_theme(theme_name)
  local success, _ = pcall(function()
    if theme_name == "Catppuccino" then
      vim.cmd "colorscheme catppuccin-mocha"
    else
      vim.cmd("colorscheme " .. theme_name)
    end
  end)

  if not success then notify("Error: Cannot find color scheme '" .. theme_name .. "'", vim.log.levels.ERROR) end

  return success
end

-- List available themes and open a floating window to select one
function M.list_themes()
  local buf = vim.api.nvim_create_buf(false, true)

  -- Window options
  local opts = {
    relative = "editor",
    width = 40, -- Increase width of the window
    height = (#themes * 3) + 4, -- Adjust height to add space below each title
    col = (vim.o.columns - 40) / 2,
    row = (vim.o.lines - ((#themes * 3) + 2)) / 2,
    style = "minimal",
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Adding the list of themes to the buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "Select a Theme:", "" })
  vim.api.nvim_buf_add_highlight(buf, -1, "TitleBold", 0, 0, -1)

  for i, theme in ipairs(themes) do
    local line_content = theme.icon .. "  " .. theme.name
    vim.api.nvim_buf_set_lines(buf, (i - 1) * 3 + 2, (i - 1) * 3 + 3, false, { line_content, "" })
  end

  -- Keymaps for selecting a theme
  vim.api.nvim_buf_set_keymap(
    buf,
    "n",
    "<CR>",
    [[<cmd>lua require('whoa.core.theme').select_theme()<CR>]],
    { noremap = true, silent = true }
  )

  -- Keymap for closing the window
  vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>q<CR>", { noremap = true, silent = true })

  -- Store the window data
  vim.api.nvim_win_set_var(win, "theme_selector_win", { buf = buf, win = win })

  -- Set buffer options
  vim.api.nvim_set_option_value("buftype", "nofile", { buf = buf })
  vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })
  vim.api.nvim_set_option_value("swapfile", false, { buf = buf })
  vim.api.nvim_set_option_value("modifiable", false, { buf = buf })
end

-- Select a theme from the list
function M.select_theme()
  local win_data = vim.api.nvim_win_get_var(0, "theme_selector_win")
  local cur_line = vim.fn.line "."

  -- Adjusting for spacing: find the correct theme based on line number
  local theme_index = math.floor((cur_line - 1) / 3) + 1

  -- Close the window
  vim.api.nvim_win_close(win_data.win, true)

  -- Apply the selected theme
  local theme = themes[theme_index]
  if theme then M.set_theme(theme.name) end
end

return M
