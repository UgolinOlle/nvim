local utils = require "whoa.utils"
local get_icons = utils.get_icons

return {
  "nvimdev/dashboard-nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  event = "VimEnter",

  opts = {
    theme = "doom",

    header = {
      "███╗   ███╗ █████╗ ███████╗██╗  ██╗",
      "████╗ ████║██╔══██╗██╔════╝██║  ██║",
      "██╔████╔██║███████║███████╗███████║",
      "██║╚██╔╝██║██╔══██║╚════██║██╔══██║",
      "██║ ╚═╝ ██║██║  ██║███████║██║  ██║",
      "╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝",
    },

    hide = {
      statusline = true,
      tabline = true,
      winbar = true,
    },

    center = {
      {
        icon = get_icons("Cube", 1),
        desc = "Lazy sync / TSUpdate / Mason",
        key = "s",
        action = "WhoaUpdateAll",
      },
      {
        icon = get_icons("File", 1),
        desc = "Find File",
        key = "f",
        action = "Telescope find_files",
      },
      {
        icon = get_icons("File", 1),
        desc = "Recently Used Files",
        key = "r",
        action = "Telescope oldfiles",
      },
      {
        icon = get_icons("File", 1),
        desc = "Find Word",
        key = "w",
        action = "Telescope live_grep",
      },
      {
        icon = get_icons("Terminal", 1),
        desc = "Open Terminal",
        key = "t",
        action = "ToggleTerm",
      },
    },
  },
}
