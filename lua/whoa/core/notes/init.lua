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
local NuiEvent = require("nui.utils.autocmd").event

--- Variables
local notify = require("whoa.core.utils").notify
local default_note_dir = vim.fn.expand "~/.notes/"
vim.fn.mkdir(default_note_dir, "p")

--- Helper function to write note to a file
local function write_note_to_file(note, file_name)
  local file_path = default_note_dir .. file_name
  local file = io.open(file_path, "a")
  if file then
    file:write(note .. "\n")
    file:close()
    notify("Note saved to " .. file_path, 1)

    -- Open the file after saving the note
    vim.cmd("edit " .. file_path)
  else
    notify("Error saving note to " .. file_path, 3)
  end
end

--- Function to create the note taking input popup
local function create_note_popup(file_name)
  local input_popup = NuiInput({
    relative = "editor",
    position = "50%",
    size = {
      width = 40,
      height = 3,
    },
    border = {
      style = "rounded",
      text = {
        top = " Enter your note ",
        top_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  }, {
    prompt = "Note: ",
    on_submit = function(value) write_note_to_file(value, file_name) end,
  })

  input_popup:mount()

  -- Close the popup when pressing Escape
  input_popup:map("n", "<Esc>", function() input_popup:unmount() end, { noremap = true })
end

--- Function to ask for the file name and then take a note
function M.take_note_with_file()
  local file_input_popup = NuiInput({
    relative = "editor",
    position = "50%",
    size = {
      width = 40,
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
    on_submit = function(file_name) create_note_popup(file_name) end,
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

--- Function to choose a file and list notes from that file
function M.list_notes_with_file()
  local file_input_popup = NuiInput({
    relative = "editor",
    position = "50%",
    size = {
      width = 40,
      height = 3,
    },
    border = {
      style = "rounded",
      text = {
        top = " Enter file name to view ",
        top_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  }, {
    prompt = "File: ",
    default_value = "default.txt",
    on_submit = function(file_name) M.list_notes_from_file(file_name) end,
  })

  file_input_popup:mount()

  -- Close the popup when pressing Escape
  file_input_popup:map("n", "<Esc>", function() file_input_popup:unmount() end, { noremap = true })
end

vim.api.nvim_create_user_command(
  "NuiListNotes",
  function() M.list_notes_with_file() end,
  { desc = "List notes from a file using NuiComponents" }
)

return M
