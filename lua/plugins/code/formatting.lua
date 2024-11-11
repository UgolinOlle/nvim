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
        scss = { "prettier" },
        lua = { "stylua" },
        php = { "phpcbf" },
        twig = { "twig_formatter" },
        c = { "c_formatter_42" },
        cpp = { "c_formatter_42" },
        markdown = { "prettier" },
        sh = { "shfmt" },
        python = { "black" },
        swift = { "swiftformat" },
      },

      -- Formatting options
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 2500,
      },

      -- Specific formatters
      formatters = {
        prettier = {
          extra_args = { "--print-width", "120" },
        },

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
            "--print-width",
            "120",
            "--write",
            "$FILENAME",
          },
          stdin = true,
        },
      },

      --- Filetype specific formatters configuration
      filetypes = {
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

  keys = {
    { "<LEADER>ci", "<CMD>ConformInfo<CR>", { noremap = true, silent = true, desc = "Show Conform information" } },
  },
}
