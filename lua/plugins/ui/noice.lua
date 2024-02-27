-- Import
local utils = require "whoa.utils"
local get_icons = utils.get_icons

return {
  "folke/noice.nvim",

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

    -- LSP configuration
    lsp = {
      progress = {
        enabled = true,
      },
    },

    -- Preset configuration
    preset = {
      lsp_doc_border = true,
    },
  },

  keys = {
    {
      "gl",
      function() require("noice").cmd "last" end,
      { noremap = true, silent = true, desc = "Show last message" },
    },
    {
      "gm",
      "<CMD>messages<CR>",
      { noremap = true, silent = true, desc = "Show messages" },
    },
  },
}
