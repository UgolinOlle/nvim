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

    opts = {
      symbols = {
        merge_commit = "M",
        commit = "*",
      },
      format = {
        timestamp = "%H:%M:%S %d-%m-%Y",
        fields = { "hash", "timestamp", "author", "branch_name", "tag" },
      },
      hooks = {
        on_select_commit = function(commit) print("selected commit:", commit.hash) end,
        on_select_range_commit = function(from, to) print("selected range:", from.hash, to.hash) end,
      },
    },

    keys = {
      {
        "<LEADER>gl",
        function() require("gitgraph").draw({}, { all = true, max_count = 5000 }) end,
        desc = "GitGraph - Draw",
      },
    },
  },
}
