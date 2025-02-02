return {
  "nvim-lualine/lualine.nvim",

  name = "Lualine",

  event = { "BufReadPost", "BufNewFile" },

  dependencies = { "nvim-tree/nvim-web-devicons", name = "Web Devicons", lazy = true },

  config = function(_, opts)
    -- Variables
    local get_icons = require("whoa.core.utils").get_icons
    local mode_icons = {
      ["n"] = get_icons "Normal" .. " ",
      ["i"] = get_icons "Insert" .. " ",
      ["v"] = get_icons "Visual" .. " ",
      ["V"] = get_icons "VisualLine" .. " ",
      ["c"] = get_icons "Command" .. " ",
      ["r"] = get_icons "Replace" .. " ",
      ["t"] = get_icons "Terminal" .. " ",
    }

    --- Get the current mode
    local mode = function()
      local mode = vim.fn.mode()
      return mode_icons[mode] or "Unknown"
    end

    --- Setup LSP Diagnostics for lualine
    local diagnostics = {
      "diagnostics",
      sources = { "nvim_lsp" },
      sections = { "error", "warn", "info", "hint" },
      symbols = { error = " ", warn = " ", info = " ", hint = " " },
      colored = true,
      always_visible = false,
    }

    --- Setup filename for lualine
    local filename = {
      "filename",
      file_status = true,
      path = 1, -- Show relative path
      symbols = { modified = " ●", readonly = " ", unnamed = " [No Name]" },
    }

    --- Get the number of words in the current buffer
    local getWords = function()
      local words = vim.fn.wordcount().words
      return string.format(get_icons "WordFile" .. "  %d", words)
    end

    opts.sections = {
      lualine_a = { { mode, separator = { left = "", right = "", padding_right = 1 } } },
      lualine_b = { "branch", "diff" },
      lualine_c = { filename, diagnostics },
      lualine_x = { { getWords, right_padding = 1 }, "encoding", "filetype" },
      lualine_y = { "progress" },
      lualine_z = {},
    }

    require("lualine").setup(opts)
  end,

  opts = {
    options = {
      icons_enabled = true,
      always_divide_middle = true,
      theme = "vscode",
      component_separators = " ",
      section_separators = " ",
    },
  },
}
