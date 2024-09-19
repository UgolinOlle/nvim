-- Variables
local get_icons = require("whoa.core.utils").get_icons
local colors = {
  blue = "#80a0ff",
  cyan = "#79dac8",
  black = "#080808",
  white = "#c6c6c6",
  red = "#ff5189",
  violet = "#8338ec",
  grey = "#303030",
}
local bubbles_theme = {
  normal = {
    a = { fg = colors.white, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

return {

  "nvim-lualine/lualine.nvim",

  name = "Lualine",

  event = { "BufReadPost", "BufNewFile" },

  dependencies = { "nvim-tree/nvim-web-devicons", "AndreM222/copilot-lualine" },

  config = function(_, opts)
    local mode_actions = {
      ["n"] = get_icons "Normal",
      ["i"] = get_icons "Insert",
      ["v"] = get_icons "Visual",
      ["c"] = get_icons "Command",
      ["s"] = get_icons "Select",
      ["t"] = get_icons "Terminal",
    }

    local mode = function()
      local mode = vim.fn.mode()
      return mode_actions[mode] or mode
    end

    opts.options.sections = {
      lualine_a = {
        { mode, separator = { left = "" }, right_padding = 2 },
      },
      lualine_b = {
        "branch",
      },
      lualine_c = {
        "filename",
      },
      lualine_x = { "copilot", "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    }

    require("lualine").setup(opts)
  end,

  opts = {
    options = {
      icons_enabled = true,
      always_divide_middle = true,
      theme = bubbles_theme,
      component_separators = "",
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = { "neo-tree", "AvanteInput", "Avante", "packer", "NvimTree", "Outline" },
      },
    },
  },
}
