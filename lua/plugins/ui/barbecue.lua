return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
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
