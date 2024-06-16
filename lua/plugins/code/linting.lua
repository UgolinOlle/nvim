return {
  "mfussenegger/nvim-lint",

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
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
      group = lint_augroup,
      callback = function() lint.try_lint() end,
    })
  end,
}
