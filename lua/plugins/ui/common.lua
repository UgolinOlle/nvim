return {
  {
    "grapp-dev/nui-components.nvim",

    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "stevearc/dressing.nvim",

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
  {
    "rcarriga/nvim-notify",

    name = "Notify",

    event = "BufReadPre",

    config = function() vim.notify = require "notify" end,

    opts = {
      timeout = 100,
      stages = "fade_in_slide_out",
      top_down = true,
      render = "simple",
      fps = 120,
      background_colour = "#000000",
    },

    keys = {
      {
        "<LEADER>nn",
        function() require("notify").dismiss() end,
        { noremap = true, silent = true, desc = "Dismiss notifications" },
      },
    },
  },
  {
    "sphamba/smear-cursor.nvim",

    name = "Smear Cursor",

    opts = {},
  },
}
