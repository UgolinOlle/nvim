--- ## Whoa Features
--
-- Module to manage IDE features via a popup menu.
--
-- @module whoa.core.features
-- @copyright 2024

local M = {}

-- Load saved configurations
local config_path = vim.fn.stdpath "config" .. "/lua/whoa/configs/features.lua"
local feature_settings = dofile(config_path)

-- Variables
local features = {
  { name = "Autosave", key = "Autosave", enabled = feature_settings.Autosave },
  { name = "LSP Diagnostics", key = "LSP_Diagnostics", enabled = feature_settings.LSP_Diagnostics },
  { name = "Highlight on Yank", key = "Highlight_on_Yank", enabled = feature_settings.Highlight_on_Yank },
  {
    name = "Spell Check for Markdown",
    key = "Spell_Check_for_Markdown",
    enabled = feature_settings.Spell_Check_for_Markdown,
  },
  -- Add more features if necessary
}

local function save_features()
  local file = io.open(config_path, "w")
  if not file then
    vim.notify("Error: Unable to open the config file for writing!", vim.log.levels.ERROR)
    return
  end

  file:write "return {\n"
  for _, feature in ipairs(features) do
    file:write(string.format("  %s = %s,\n", feature.key, feature.enabled and "true" or "false"))
  end
  file:write "}\n"
  file:close()

  vim.notify("Feature settings saved!", vim.log.levels.INFO)
end

local function toggle_feature(index)
  features[index].enabled = not features[index].enabled
  vim.notify(
    features[index].name .. " is now " .. (features[index].enabled and "enabled" or "disabled"),
    vim.log.levels.INFO
  )
  save_features() -- Save after each change
end

local function update_popup_content(buf)
  -- Temporarily make the buffer modifiable
  vim.bo[buf].modifiable = true
  vim.bo[buf].readonly = false

  local lines = { "Select a feature to toggle:" }
  for i, feature in ipairs(features) do
    local status = feature.enabled and " " or " "
    table.insert(lines, i .. ". " .. status .. feature.name)
  end
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Make the buffer read-only again
  vim.bo[buf].modifiable = false
  vim.bo[buf].readonly = true
end

local function create_popup()
  local buf = vim.api.nvim_create_buf(false, true)

  -- Window options
  local width = 40
  local height = #features + 4
  local opts = {
    relative = "editor",
    width = width,
    height = height,
    col = (vim.o.columns - width) / 2,
    row = (vim.o.lines - height) / 2,
    style = "minimal",
    border = "rounded",
    title = " Toggle IDE Features ",
    title_pos = "center",
  }

  -- Create the window
  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Initial content of the popup
  update_popup_content(buf)

  -- Make the buffer read-only
  vim.bo[buf].modifiable = false
  vim.bo[buf].readonly = true

  -- Autocmd to prevent modifications and show an error message
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = buf,
    callback = function()
      vim.notify("Error: Modifications are not allowed in this popup!", vim.log.levels.ERROR)
      vim.cmd "stopinsert" -- Stop any attempt to enter insert mode
    end,
  })

  -- Keybinding to toggle the selected feature with Space
  vim.api.nvim_buf_set_keymap(
    buf,
    "n",
    "<Space>",
    "<cmd>lua require('whoa.core.features').toggle_selected()<CR>",
    { noremap = true, silent = true }
  )

  -- Keybinding to close the popup
  vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>q<CR>", { noremap = true, silent = true })
end

-- Toggle the feature currently under the cursor
function M.toggle_selected()
  local line = vim.fn.line "."
  local index = tonumber(vim.fn.getline(line):match "^%d+")
  if index then M.toggle_and_update(index, vim.api.nvim_get_current_buf()) end
end

-- Toggle a feature and update the popup content
function M.toggle_and_update(index, buf)
  toggle_feature(index)
  update_popup_content(buf)
end

-- Open the popup
function M.open() create_popup() end

return M
