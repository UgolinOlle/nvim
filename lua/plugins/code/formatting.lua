return {
  "stevearc/conform.nvim",

  lazy = true,

  event = { "BufReadPre", "BufNewFile" },

  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      lua = { "stylua" },
      python = { "isort", "black" },
      c = { "c_formatter_42" },
    },

    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    },

    formatters = {
      c_formatter_42 = {
        command = "c_formatter_42",
        args = { "$FILENAME" },
        stdin = false,
      },
    },
  },

  keys = {
    { "<LEADER>ci", "<CMD>ConformInfo<CR>", { noremap = true, silent = true } },
  },
}
