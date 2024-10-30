return {
  "olimorris/codecompanion.nvim",

  enabled = false,

  name = "Code Companion",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    { "stevearc/dressing.nvim", opts = {} },
  },

  config = true,

  keys = {
    { "<LEADER>aa", "<CMD>CodeCompanionChat<CR>", { noremap = true, silent = true, desc = "Open AI Chat" } },
    { "<C-a>", "<CMD>CodeCompanionActions<CR>", { noremap = true, silent = true, desc = "Open AI Actions" } },
  },
  {
    "yetone/avante.nvim",

    event = "VeryLazy",

    lazy = false,

    version = false,

    opts = {
      provider = "copilot",
    },

    build = "make",

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
