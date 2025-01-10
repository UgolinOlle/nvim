return {
  {
    "lewis6991/gitsigns.nvim",

    name = "Git Signs",

    opts = {
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
    },
  },
  {
    "isakbm/gitgraph.nvim",

    name = "GitGraph",

    dependencies = { "sindrets/diffview.nvim" },
    opts = {
      symbols = {
        merge_commit = "M",
        commit = "*",
      },
      format = {
        timestamp = "%H:%M:%S %d-%m-%Y",
        fields = { "hash", "timestamp", "author", "branch_name", "tag" },
      },
    },
    init = function()
      vim.keymap.set(
        "n",
        "<leader>gl",
        function() require("gitgraph").draw({}, { all = true, max_count = 5000 }) end,
        { desc = "new git graph" }
      )
    end,
  },
  {
    "f-person/git-blame.nvim",

    name = "Git Blame",

    event = "VeryLazy",

    opts = {
      enabled = true,
      message_template = " <summary> • <date> • <author> • <<sha>>",
      date_format = "%m-%d-%Y %H:%M:%S",
      virtual_text_column = 1,
    },
  },
  {
    "sindrets/diffview.nvim",

    name = "Git Diff View",

    keys = {
      { "<LEADER>gd", "<CMD>DiffviewOpen<CR>",  { noremap = true, silent = true, desc = "Open diff view." } },
      { "<LEADER>gD", "<CMD>DiffviewClose<CR>", { noremap = true, silent = true, desc = "Close diff view." } },
    }
  }
}
