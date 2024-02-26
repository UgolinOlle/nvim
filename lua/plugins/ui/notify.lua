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

  keys = {
    { "<LEADER>nn", "<CMD>lua require('notify').dismiss()<CR>", { noremap = true, silent = true, desc = "Dismiss notifications" } },
    { "<LEADER>nl", "<CMD>Notifications<CR>", { noremap = true, silent = true, desc = "List notifications" } },
  }
}
