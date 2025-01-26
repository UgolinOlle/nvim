return {
  "hedyhli/outline.nvim",

  name = "Outline",

  event = "BufReadPre",

  config = function() require("outline").setup {} end,

  keys = {
    { "<LEADER>o", "<CMD>Outline<CR>", { noremap = true, silent = true, desc = "Toggle Outline" } },
  },
}
