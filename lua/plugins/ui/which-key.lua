return {
  "folke/which-key.nvim",

  name = "WhichKey",

  event = "VeryLazy",

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,

  opts = {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },

    win = {
      border = "rounded",
      relative = "editor",
      row = vim.o.lines - 10,
      col = math.floor(vim.o.columns / 2 - 25),
      padding = { 2, 2, 2, 2 },
    },

    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "center",
    },

    show_help = true,
    triggers = { "<leader>" },
  },
}
