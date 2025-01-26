return {
  "nanozuki/tabby.nvim",

  name = "Tabby",

  lazy = false,

  dependencies = { "nvim-lualine/lualine.nvim", name = "Lualine", lazy = true },

  config = function()
    local tabby_presets = require "tabby.presets"
    local tabby_config = require "whoa.core.plugins.tabs.tabby-cfg"

    require("tabby").setup {
      tabline = vim.tbl_extend("force", tabby_presets.active_wins_at_tail, tabby_config),
    }
  end,
}
