return {
  {
    "stevearc/dressing.nvim",

    name = "Dressing",

    event = "VeryLazy",
  },
  {
    "lukas-reineke/indent-blankline.nvim",

    name = "Indent Blankline",

    event = { "BufReadPre", "BufNewFile" },

    main = "ibl",

    opts = {
      indent = { char = "┊" },
      exclude = {
        filetypes = {
          "help",
          "packer",
          "dashboard",
          "NvimTree",
          "vista",
          "sagahover",
          "markdown",
          "txt",
          "TelescopePrompt",
          "TelescopeResults",
        },
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",

    name = "Colorizer",

    event = "BufEnter",

    config = function()
      require("colorizer").setup {
        filetypes = { "*" },
        user_default_options = {
          names = false,
          tailwind = "both",
          mode = "background",
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
  {
    "nvim-tree/nvim-web-devicons",

    name = "Web Devicons",

    lazy = false,
  },
}
