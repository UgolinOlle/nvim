return {
  {
    "andweeb/presence.nvim",
    opts = {
      client_id = "445957680729817088",
    },
  },
  {
    "ziontee113/icon-picker.nvim",
    config = function() require("icon-picker").setup { disable_legacy_commands = true } end,
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
}
