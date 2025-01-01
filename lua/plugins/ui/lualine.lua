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
  yellow = "#f5dd76",
  green = "#98c379",
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.white, bg = colors.violet },
    b = { fg = colors.white },
    c = { fg = colors.white },
    y = { fg = colors.white },
    x = { fg = colors.white },
    z = { fg = colors.white },
  },
  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },
  command = { a = { fg = colors.black, bg = colors.yellow } },
  inactive = {
    a = { fg = colors.white },
    b = { fg = colors.white },
    c = { fg = colors.grey },
  },
}

return {
  "nvim-lualine/lualine.nvim",

  name = "Lualine",

  event = { "BufReadPost", "BufNewFile" },

  dependencies = { "nvim-tree/nvim-web-devicons", "AndreM222/copilot-lualine" },

  config = function(_, opts)
    local mode_icons = {
      ["n"] = get_icons "Normal" .. " ",
      ["i"] = get_icons "Insert" .. " ",
      ["v"] = get_icons "Visual" .. " ",
      ["V"] = get_icons "VisualLine" .. " ",
      ["c"] = get_icons "Command" .. " ",
      ["r"] = get_icons "Replace" .. " ",
      ["t"] = get_icons "Terminal" .. " ",
    }

    local mode = function()
      local mode = vim.fn.mode()
      return mode_icons[mode] or "Unknown"
    end

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_lsp" },
      sections = { "error", "warn", "info", "hint" },
      symbols = { error = " ", warn = " ", info = " ", hint = " " },
      colored = true,
      always_visible = false,
    }

    local filename = {
      "filename",
      file_status = true,
      path = 1, -- Show relative path
      symbols = { modified = " ●", readonly = " ", unnamed = " [No Name]" },
    }

    local getWords = function()
      local words = vim.fn.wordcount().words
      return string.format(get_icons "WordFile" .. "  %d", words)
    end

    opts.sections = {
      lualine_a = { { mode, right_padding = 1 } },
      lualine_b = { "branch", "diff" },
      lualine_c = { filename, diagnostics },
      lualine_x = { { getWords, right_padding = 1 }, "encoding", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { {
        "copilot",
        symbols = {
          spinners = require("copilot-lualine.spinners").dots,
          spinner_color = "#6272A4",
        },
        show_colors = true,
        show_loading = true
      } },
    }

    require("lualine").setup(opts)
  end,

  opts = {
    options = {
      icons_enabled = true,
      always_divide_middle = true,
      theme = bubbles_theme,
      component_separators = " ",
      section_separators = " ",
    },
  },
}
