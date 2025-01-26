return {
  {
    "lewis6991/gitsigns.nvim",

    name = "Git Signs",

    event = { "BufReadPre", "BufNewFile" },

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

    lazy = true,

    cmd = { "GitGraph" },

    dependencies = { "sindrets/diffview.nvim", name = "Diffview", lazy = true },

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

    keys = {
      {
        "<leader>gl",
        function() require("gitgraph").draw({}, { all = true, max_count = 5000 }) end,
        desc = "Draw Git graph",
      },
    },
  },
  {
    "f-person/git-blame.nvim",

    name = "Git Blame",

    event = { "BufReadPre", "BufNewFile" },

    cmd = { "GitBlameToggle" },

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

    lazy = true,

    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },

    keys = {
      { "<LEADER>gd", "<CMD>DiffviewOpen<CR>", desc = "Open Diffview", noremap = true, silent = true },
      { "<LEADER>gD", "<CMD>DiffviewClose<CR>", desc = "Close Diffview", noremap = true, silent = true },
      { "<LEADER>gh", "<CMD>DiffviewFileHistory<CR>", desc = "File History", noremap = true, silent = true },
    },
  },
  {
    "SuperBo/fugit2.nvim",

    name = "Fugit2",

    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
      {
        "chrisgrieser/nvim-tinygit",

        name = "TinyGit",

        event = { "BufReadPre", "BufNewFile" },
      },
    },

    cmd = { "Fugit2", "Fugit2Diff", "Fugit2Graph" },

    opts = {
      width = 100,
    },

    keys = {
      { "<leader>F", mode = "n", "<cmd>Fugit2<cr>" },
    },
  },
}
