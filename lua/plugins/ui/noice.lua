-- Import
local utils = require "whoa.core.utils"
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
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      format = {
        cmdline = { title = "  Command  ", pattern = "^:", icon = get_icons("Command", 1), lang = "vim" },
        search_down = { title = "  Search  ", kind = "search", pattern = "^/", icon = get_icons("Search", 1), lang = "regex" },
        search_up = { title = "  Search  ", kind = "search", pattern = "^%?", icon = get_icons("Search", 1), lang = "regex" },
        filter = { title = "  Filter  ", pattern = "^:%s*!", icon = "$", lang = "bash" },
      },
    },

    preset = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
    },

    lsp = {
      signature = {
        enabled = false,
      },
    },
  },
}
