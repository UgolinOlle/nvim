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
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        print("Linting triggered for buffer:", bufnr)

        local ft = vim.bo[bufnr].filetype
        print("Filetype:", ft)

        local linters = require("lint").linters_by_ft[ft]
        print("Linters:", vim.inspect(linters))

        require("lint").try_lint()
      end,
    })
  end,
}
