return {
  "echasnovski/mini.move",

  name = "Mini Move",

  event = "VeryLazy",

  version = "*",

  config = function()
    require("mini.move").setup {
      mappings = {
        left = "",
        right = "",
        line_left = "",
        line_right = "",
      },
    }
  end,
}
