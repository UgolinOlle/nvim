return {
  "folke/which-key.nvim",

  name = "WhichKey",

  event = "VeryLazy",

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
}
