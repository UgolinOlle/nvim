return {
  "akinsho/toggleterm.nvim",
  version = "main",
  cmd = {
    "ToggleTerm",
  },
  config = true,
  keys = {
    {
      "<LEADER>tv",
      "<CMD>ToggleTerm direction=vertical<CR>",
      { noremap = true, silent = true, desc = "Toggle vertical terminal" },
    },
    {
      "<LEADER>th",
      "<CMD>ToggleTerm direction=horizontal<CR>",
      { noremap = true, silent = true, desc = "Toggle horizontal terminal" },
    },
    {
      "<LEADER>tf",
      "<CMD>ToggleTerm direction=float<CR>",
      { noremap = true, silent = true, desc = "Toggle terminal in current window" },
    },
    {
      "<LEADER>tt",
      "<CMD>ToggleTerm direction=tab<CR>",
      { noremap = true, silent = true, desc = "Toggle terminal in a new tab" },
    },
  },
}
