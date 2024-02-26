-- Import
local utils = require("whoa.utils")
local get_icons = utils.get_icons

return {
  "folke/noice.nvim",

  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },

  event = "VeryLazy",

  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true
      }
    },

    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename= false,
      lsp_doc_border = false
    },

    cmdline = {
      enable = true,
      view = "cmdline_popup",
      format = {
        cmdline = { pattern = "^:", icon = get_icons("Command", 1), lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = get_icons("Search", 1), lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = get_icons("Search", 1), lang = "regex" },
        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
      }
    },

    messages = {
      enabled = true,
    },

    popupmenu = {
      enabled = true,
    },

    redirect = {
      view = "popup",
      filter = { event = "msg_show" },
    },
  }
}
