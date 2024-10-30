return {
  "mistweaverco/kulala.nvim",

  name = "Kulala",

  opts = {},

  keys = {
    {
      "<LEADER>kr",
      function() require("kulala").run() end,
      {
        desc = "Run request",
        noremap = true,
        silent = true,
      },
    },
    {
      "<LEADER>kt",
      function() require("kulala").toggle_view() end,
      {
        desc = "Toggle view",
        noremap = true,
        silent = true,
      },
    },
    {
      "<LEADER>ka",
      function() require("kulala").run_all() end,
      {
        desc = "Run all requests",
        noremap = true,
        silent = true,
      },
    },
    {
      "<LEADER>krr",
      function() require("kulala").replay() end,
      {
        desc = "Replay last request",
        noremap = true,
        silent = true,
      },
    },
    {
      "<LEADER>ks",
      function() require("kulala").show_stats() end,
      {
        desc = "Show stats",
        noremap = true,
        silent = true,
      },
    },
  },
}
