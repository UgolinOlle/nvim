return {
  {
    "stevearc/dressing.nvim",

    name = "Dressing",

    opts = {
      input = {
        enabled = true,
      },
      select = {
        enabled = true,
      },
    },
  },
  {
    "norcalli/nvim-colorizer.lua",

    name = "Colorizer",

    config = function() require("colorizer").setup {} end,
  },
  {
    "folke/zen-mode.nvim",

    name = "Zen Mode",

    keys = {
      { "<LEADER>z", "<CMD>ZenMode<CR>", { noremap = true, silent = true, desc = "Enabled zen mode focus" } },
    },
  },
  {
    "nvim-tree/nvim-web-devicons",

    name = "Web Devicons",

    lazy = false,
  },
}
