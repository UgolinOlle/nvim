return {
  "rcarriga/nvim-notify",

  event = "BufReadPre",

  opts = {
    timeout = 100,
    stages = "fade_in_slide_out",
    top_down = true,
    render = "simple",
    fps = 120,
    background_colour = "#000000",
  },
}
