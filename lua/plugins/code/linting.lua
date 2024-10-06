return {
  "mfussenegger/nvim-lint",

  name = "Lint",

  event = {
    "BufReadPre",
    "BufNewFile",
  },

  config = function()
    local active, lint = pcall(require, "lint")
    if not active then return end

    lint.linters_by_ft = {
      javascript = { "eslint" },
      typescript = { "eslint" },
      typescriptreact = { "eslint" },
      javascriptreact = { "eslint" },
      php = { "phpcs" },
      twig = { "twigcs", "stylelint", "eslint" },
      c = { "norminette" },
      cpp = { "norminette" },
      markdown = { "eslint" },
      python = { "flake8" },
    }

    lint.linters.norminette = {
      cmd = "norminette",
      stdin = false,
      args = {},
      stream = "stdout",
      ignore_exitcode = true,
      parser = function(output, _)
        local diagnostics = {}
        local lines = vim.split(output, "\n")
        for _, line in ipairs(lines) do
          local filename, lnum, col, message = string.match(line, "(.-):(%d+):(%d+): (.*)")
          if filename and lnum and col and message then
            table.insert(diagnostics, {
              lnum = tonumber(lnum) - 1,
              col = tonumber(col) - 1,
              message = message,
              severity = vim.diagnostic.severity.ERROR,
              source = "norminette",
            })
          end
        end
        return diagnostics
      end,
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
      group = lint_augroup,
      callback = function() lint.try_lint() end,
    })
  end,
}
