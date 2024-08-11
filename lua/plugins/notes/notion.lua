return {
  "Al0den/notion.nvim",

  name = "Notion",

  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },

  config = function() require("notion").setup() end,

  keys = {
    { "<LEADER>no", "<CMD>Notion menu<CR>", { desc = "Open Notion menu" } },
  },
}
