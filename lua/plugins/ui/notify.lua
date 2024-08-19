return {
  "rcarriga/nvim-notify",

  name = "Notify",

  event = "BufReadPre",

  config = function() vim.notify = require "notify" end,

  opts = {
    timeout = 100,
    stages = "fade_in_slide_out",
    top_down = true,
    render = "simple",
    fps = 120,
    background_colour = "#000000",
  },
}
