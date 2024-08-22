return {
  "echasnovski/mini.animate",

  name = "Mini Animate",

  version = false,

  opts = {
    open = {
      enable = false,
    },
    close = {
      enable = false,
    },
    cursor = {
      enable = false,
    },
    scroll = {
      enable = true,
    },
    resize = {
      enable = false,
    },
  },

  config = function() require("mini.animate").setup(opts) end,
}
