return {
  "mfussenegger/nvim-lint",

  name = "NeoVim Lint",

  event = {
    "BufEnter",
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
      markdown = { "eslint" },
      swift = { "swiftlint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
      group = lint_augroup,
      callback = function() require("lint").try_lint() end,
    })
  end,
}
