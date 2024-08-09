return {
  {
    "audibleblink/hackthebox.vim",

    name = "Hack The Box",

    priority = 1000,

    event = "VeryLazy",

    config = function()
      vim.cmd [[ 
        colorscheme hackthebox
        hi FloatBorder guibg=NONE guifg=#F2E2C3
        hi NormalFloat guibg=NONE
        hi Pmenu guibg=NONE
      ]]
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",

    name = "Colorizer",

    config = function() require("colorizer").setup {} end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",

    name = "Rainbow Delimiters",

    config = function()
      local rainbow_delimiters = require "rainbow-delimiters"

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        priority = {
          [""] = 110,
          lua = 210,
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
  {
    "folke/zen-mode.nvim",

    name = "Zen Mode",

    keys = {
      { "<LEADER>z", "<CMD>ZenMode<CR>", { noremap = true, silent = true, desc = "Enabled zen mode focus" } },
    },
  },
}
