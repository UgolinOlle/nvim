return {
  "stevearc/conform.nvim",

  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local active, conform = pcall(require, "conform")
    if not active then return end

    local function go_formatter(bufnr)
      local gofmt = {
        cmd = "gofmt",
        args = {},
        stdin = true,
      }
      local goimports = {
        cmd = "goimports",
        args = {},
        stdin = true,
      }
      conform.format(bufnr, gofmt)
      conform.format(bufnr, goimports)
    end

    conform.setup {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        jjavascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        scss = { "prettier" },
        lua = { "stylua" },
        go = { "gofmt" },
      },

      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    }
  end,
}
