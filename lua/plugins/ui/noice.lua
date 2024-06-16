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
      enabled = true,
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      hover = {
        enabled = true,
      },
      signature = {
        enabled = true,
        auto_open = {
          enabled = true,
          trigger = true,
        },
        floating_window = {
          enabled = true,
          border = "rounded",
        },
      },
      progress = {
        enabled = true,
      },
      documentation = {
        view = "hover",
        opts = {
          lang = "markdown",
          replace = true,
          render = "plain",
          format = { "{message}" },
          win_options = { concealcursor = "n", conceallevel = 3 },
        },
      },
    },

    -- Preset configuration
    preset = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = "rounded",
    },
  },
}
