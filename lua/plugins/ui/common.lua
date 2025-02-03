return {
  {
    "grapp-dev/nui-components.nvim",

    name = "Nui Components",

    event = "VeryLazy",

    dependencies = {
      {
        "MunifTanjim/nui.nvim",

        name = "Nui",

        lazy = true,
      },
    },
  },
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

    event = { "BufReadPost", "BufNewFile" },

    config = function()
      require("colorizer").setup {
        filetypes = {
          "*",
          "!vim",
          "!packer",
          "!lazy",
          "!dashboard",
          "!help",
        },
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

    event = "BufReadPre",

    keys = {
      { "<LEADER>z", "<CMD>ZenMode<CR>", { noremap = true, silent = true, desc = "Enable zen mode focus" } },
    },
  },
  {
    "nvim-tree/nvim-web-devicons",

    name = "Web Devicons",

    event = "VeryLazy",

    lazy = true,
  },
  {
    "rcarriga/nvim-notify",

    name = "Notify",

    event = "VeryLazy",

    config = function() vim.notify = require "notify" end,

    opts = {
      timeout = 100,
      stages = "slide",
      top_down = true,
      render = "default",
      fps = 120,
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

    event = "VeryLazy",
  },
}
