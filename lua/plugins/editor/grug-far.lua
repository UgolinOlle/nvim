return {
  "MagicDuck/grug-far.nvim",

  name = "GrugFar",

  event = { "BufRead", "BufNewFile" },

  opts = {
    resultsSeparatorLineChar = "-",
    spinnerStates = { "", "", "", "" },
    startInInsertMode = false,

    icons = {
      resultsStatusReady = " ",
      resultsStatusError = " ",
      resultsStatusSuccess = " ",
      resultsActionMessage = "  ",
      resultsChangeIndicator = "│",
      historyTitle = "  ",
    },

    engines = {
      ripgrep = {
        placeholders = {
          enabled = false,
        },
      },
    },

    disableBufferLineNumbers = true,
  },

  keys = {
    { "<leader>gf", function() require("grug-far").grug_far {} end, desc = "GrugFar" },
    {
      "<leader>gf",
      function()
        require("grug-far").with_visual_selection {
          prefills = {
            search = vim.fn.expand "<cword>",
            filesFilter = vim.fn.expand "%",
          },
        }
      end,
      mode = "v",
      desc = "GrugFar",
    },
  },
}
