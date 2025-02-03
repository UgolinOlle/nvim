return {
  "roobert/surround-ui.nvim",

  name = "Surround",

  event = "VeryLazy",

  dependencies = {
    { "kylechui/nvim-surround", name = "Nvim Surround" },
    { "folke/which-key.nvim", name = "Which Key" },
  },

  config = function()
    require("surround-ui").setup {
      root_key = "S",
    }
  end,
}
