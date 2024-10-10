return {
  "echasnovski/mini.animate",

  name = "Mini Animate",

  version = false,

  config = function()
    require("mini.animate").setup {
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
    }
  end,
}
