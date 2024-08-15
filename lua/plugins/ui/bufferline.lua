--- Check if a buffer is pinned
---
---@param buf any
local function is_pinned(buf)
  for _, e in ipairs(require("bufferline").get_elements().elements or {}) do
    if e.id == buf.bufnr then return require("bufferline.groups")._is_pinned(e) end
  end

  return false
end

return {
  "akinsho/bufferline.nvim",

  name = "Buffer Line",

  event = "BufEnter",

  dependencies = {
    { "echasnovski/mini.bufremove" },
  },

  opts = {
    options = {
      themable = true,

      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = true,
      always_show_bufferline = true,

      modified_icon = "",
      truncate_names = false,
      name_formatter = function(buf)
        local short_name = vim.fn.fnamemodify(buf.name, ":t:r")
        return is_pinned(buf) and "" or short_name
      end,
      tab_size = 0,
      separator_style = { "", "" },
      indicator = {
        icon = "",
        style = "none",
      },
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          text_align = "center",
          separator = false,
        },
      },
      diagnostics = false,
      diagnostics_update_in_insert = false,
      diagnostics_indicator = nil,
      hover = { enabled = false },
    },
  },

  keys = {
    { "<A-h>", "<cmd>BufferLineMovePrev<cr>", desc = "Buffer Move Previous" },
    { "<A-l>", "<cmd>BufferLineMoveNext<cr>", desc = "Buffer Move Next" },
    { "<C-p>", "<cmd>BufferLineTogglePin<cr>", desc = "Buffer Pin" },
    { "<C-1>", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Buffer 1" },
    { "<C-2>", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Buffer 2" },
    { "<C-3>", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Buffer 3" },
    { "<C-4>", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Buffer 4" },
    { "<C-5>", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Buffer 5" },
    { "<C-6>", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Buffer 6" },
    { "<C-7>", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Buffer 7" },
    { "<C-8>", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Buffer 8" },
    { "<C-9>", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Buffer 9" },
    { "<C-0>", "<cmd>BufferLast<cr>", desc = "Buffer Last" },
    { "<C-/>", "<cmd>BufferLinePick<cr>", desc = "Buffer Pick" },
    { "<LEADER>bf", "<cmd>BufferLineSortByRelativeDirectory<cr>", desc = "Buffer Order By Directory" },
    { "<LEADER>bl", "<cmd>BufferLineSortByExtension<cr>", desc = "Buffer Order By Language" },
    {
      "<C-q>",
      function() require("mini.bufremove").delete(0, false) end,
      desc = "Delete Buffer",
    },
  },
}
