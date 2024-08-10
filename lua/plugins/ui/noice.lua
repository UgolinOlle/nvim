-- Import
local utils = require "whoa.utils"
local get_icons = utils.get_icons

return {
  "folke/noice.nvim",

  name = "Noice",

  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },

  event = "VeryLazy",

  opts = {
    -- Command line configuration
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      format = {
        cmdline = { pattern = "^:", icon = get_icons("Command", 1), lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = get_icons("Search", 1), lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = get_icons("Search", 1), lang = "regex" },
        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
      },
    },

    -- Preset configuration
    preset = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      -- lsp_doc_border = true,
    },
  },
}
