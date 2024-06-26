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
      filetype = {
        javascript = {
          function()
            if vim.g.use_standard then
              return {
                exe = "standard",
                args = { "--fix", "--stdin" },
                stdin = true,
              }
            else
              return {
                exe = "prettier",
                args = { "--stdin-filepath", util.escape_path(util.get_current_buffer_file_path()), "--single-quote" },
                stdin = true,
              }
            end
          end,
        },
      },
      formatters_by_ft = {
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
