return {
  "stevearc/conform.nvim",

  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local active, conform = pcall(require, "conform")
    if not active then return end

    conform.setup {
      formatters_by_ft = {
        typescript = { "prettier" },
        javascript = { "prettier" },
        jjavascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        scss = { "prettier" },
        lua = { "stylua" },
        go = { "gofmt" },
        c = { "c_formatter_42" },
        cpp = { "c_formatter_42" },
      },

      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },

      formatters = {
        c_formatter_42 = {
          command = "c_formatter_42",
          args = { "$FILENAME" },
          stdin = false,
        },
      },

      filetypes = {
        ["*"] = {
          function()
            return {
              exe = "prettier",
              args = { "--print-width", "120" },
              stdin = true,
            }
          end,
        },
        lua = {
          function()
            return {
              exe = "stylua",
              args = { "--column-width", "120", "-" },
              stdin = true,
            }
          end,
        },
      },
    }
  end,
}
