return {
  "olimorris/codecompanion.nvim",

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
}
