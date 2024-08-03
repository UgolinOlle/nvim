return {
  {
    "andweeb/presence.nvim",
    opts = {
      client_id = "445957680729817088",
      log_level = "debug",
    },
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "windwp/nvim-autopairs",

    event = "InsertEnter",

    opts = {
      check_ts = true,
      ts_config = { java = false },
    },
  },
  {
    "numToStr/Comment.nvim",

    opts = function()
      local comment_string_active, comment_string = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
      if not comment_string_active then return end

      return comment_string_active and comment_string and { pre_hook = comment_string.create_pre_hook() } or {}
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = true,
  },
  {
    "eduardomosko/header42.nvim",
    lazy = false,
    opts = {
      user = "uolle",
      mail = "marvin@42.fr",
    },
    keys = {
      { "<LEADER>h", "<CMD>Stdheader<CR>" },
    },
  },
}
