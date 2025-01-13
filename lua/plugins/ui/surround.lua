return {
  "roobert/surround-ui.nvim",

  name = "Surround",

  event = "VeryLazy",

  dependencies = {
    "kylechui/nvim-surround",
    "folke/which-key.nvim",
  },

  config = function()
    require("surround-ui").setup {
      root_key = "S",
    }
  end,
}
