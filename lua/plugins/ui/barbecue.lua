return {
  "utilyre/barbecue.nvim",

  name = "Barbecue",

  version = "*",

  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },

  opts = {
    exclude_filetypes = {
      "neo-tree",
      "toggleterm",
    },
    symbols = {
      separator = "󱦰",
    },
  },
}
