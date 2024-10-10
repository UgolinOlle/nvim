--- ## Customizable Note Taking Module
--
---@desc Module for taking notes with a customizable file name using NuiComponents
--
---@module whoa.core.notes
---@copyright 2024

local M = {}
local NuiText = require "nui.text"
local NuiPopup = require "nui.popup"
local NuiInput = require "nui.input"
local NuiMenu = require "nui.menu"
local NuiEvent = require("nui.utils.autocmd").event

--- Variables
local notify = require("whoa.core.utils").notify
local default_note_dir = vim.fn.expand "~/.notes/"
vim.fn.mkdir(default_note_dir, "p")

--- Helper function to check if a file name has an extension
local function has_extension(file_name) return file_name:match "^.+(%..+)$" ~= nil end

--- Helper function to create a file with the appropriate extension
local function create_file(file_name)
  -- Add .md extension if no extension is provided
  if not has_extension(file_name) then file_name = file_name .. ".md" end

  local file_path = default_note_dir .. file_name
  local file = io.open(file_path, "a")
  if file then
    file:close()
    notify("File created: " .. file_path, 1)

    -- Open the file after creation
    vim.cmd("edit " .. file_path)
  else
    notify("Error creating file: " .. file_path, 3)
  end
end

--- Function to ask for the file name and then create and open the file
function M.create_note_with_file()
  local file_input_popup = NuiInput({
    relative = "editor",
    position = "50%",
    size = {
      width = 50,
      height = 3,
    },
    border = {
      style = "rounded",
      text = {
        top = " Enter file name ",
        top_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  }, {
    prompt = "File: ",
    default_value = "default.md",
    on_submit = function(file_name) create_file(file_name) end,
  })

  file_input_popup:mount()

  -- Close the popup when pressing Escape
  file_input_popup:map("n", "<Esc>", function() file_input_popup:unmount() end, { noremap = true })
end

--- Function to display all notes from a chosen file
function M.list_notes_from_file(file_name)
  local file_path = default_note_dir .. file_name
  local file = io.open(file_path, "r")
  if file then
    local notes = file:read "*a"
    file:close()

    local popup = NuiPopup {
      relative = "editor",
      position = "50%",
      size = {
        width = 50,
        height = 10,
      },
      border = {
        style = "rounded",
        text = {
          top = " Notes in " .. file_name,
          top_align = "center",
        },
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
    }

    popup:mount()

    local content = vim.split(notes, "\n")
    for _, note in ipairs(content) do
      popup:insert_line(1, NuiText(note .. "\n"))
    end

    popup:on(NuiEvent.BufLeave, function() popup:unmount() end)
  else
    notify("No notes found in " .. file_name, 2)
  end
end

--- Helper function to get list of note files in the directory
local function get_note_files()
  local handle = io.popen("ls " .. default_note_dir)
  local result = handle:read "*a"
  handle:close()
  return vim.split(result, "\n", { trimempty = true })
end

--- Function to show the notes in a dropdown menu
function M.list_notes_with_menu()
  local files = get_note_files()
  if #files == 0 then
    notify("No notes found!", 2)
    return
  end

  local menu_items = {}
  for _, file_name in ipairs(files) do
    table.insert(menu_items, NuiMenu.item(file_name))
  end

  local menu = NuiMenu({
    relative = "editor",
    position = "50%",
    size = {
      width = 40,
      height = 10,
    },
    border = {
      style = "rounded",
      text = {
        top = " Select a note ",
        top_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  }, {
    lines = menu_items,
    max_height = 10,
    on_submit = function(item) M.list_notes_from_file(item.text) end,
  })

  menu:mount()
  menu:on(NuiEvent.BufLeave, function() menu:unmount() end)
end

return M
