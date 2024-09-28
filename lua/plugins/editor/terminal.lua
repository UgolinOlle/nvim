return {
  "akinsho/toggleterm.nvim",

  name = "Toggle Terminal",

  version = "main",

  cmd = {
    "ToggleTerm",
  },

  opts = {
    float_opts = {
      border = "curved",
    },
  },

  keys = {
    {
      "<leader>th",
      "<cmd>ToggleTerm direction=horizontal<CR>",
      { noremap = true, silent = true, desc = "Toggle horizontal terminal" },
    },
    {
      "<leader>tt",
      "<cmd>ToggleTerm direction=float<CR>",
      { noremap = true, silent = true, desc = "Toggle floating terminal" },
    },
  },
}
