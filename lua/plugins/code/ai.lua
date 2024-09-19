return {
  "yetone/avante.nvim",

  name = "Avante",

  lazy = true,

  build = "make",

  opts = {
    provider = "openai",
    behaviour = {
      auto_set_keymaps = false,
    },
  },

  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },

  keys = {
    { "<LEADER>cc", "<CMD>AvanteAsk<CR>" },
  },
}
