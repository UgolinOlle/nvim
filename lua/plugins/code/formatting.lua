return {
  "stevearc/conform.nvim",

  name = "Conform",

  event = { "BufReadPre", "BufNewFile" },

  config = function()
    -- Check if the plugin is active
    local active, conform = pcall(require, "conform")
    if not active then return end

    -- Setup formatting
    conform.setup {
      -- Setup formatter for each filetype
      formatters_by_ft = {
        typescript = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        scss = { "prettier" },
        lua = { "stylua" },
        php = { "phpcbf" },
        twig = { "twig_formatter" },
        c = { "c_formatter_42" },
        cpp = { "c_formatter_42" },
        mdx = { "prettier" },
      },

      -- Formatting options
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },

      -- Specific formatters
      formatters = {
        c_formatter_42 = {
          command = "c_formatter_42",
          args = { "$FILENAME" },
          stdin = false,
        },

        twig_formatter = {
          command = "prettier",
          args = {
            "--plugin",
            "prettier-plugin-twig-melody",
            "--write",
            "$FILENAME",
          },
          stdin = true,
        },
      },

      -- Filetype specific formatters configuration
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
        md = {
          function()
            return {
              exe = "prettier",
              args = { "--print-width", "120" },
              stdin = true,
            }
          end,
        },
        mdx = {
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
