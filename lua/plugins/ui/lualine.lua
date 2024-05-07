local get_icons = require("whoa.utils").get_icons

return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function(_, opts)
    local vscode = require "lualine.themes.vscode"

    opts.options.theme = vscode

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
      lualine_a = { mode },
      lualine_b = { "branch" },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    }
    require("lualine").setup(opts)
  end,
  opts = {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = { "neo-tree" },
        winbar = {},
      },
    },
  },
}
