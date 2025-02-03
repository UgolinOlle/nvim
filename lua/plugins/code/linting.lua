return {
  "mfussenegger/nvim-lint",

  name = "NeoVim Lint",

  event = { "BufEnter", "BufReadPre", "BufNewFile" },

  dependencies = {
    "williamboman/mason.nvim",
  },

  config = function()
    -- Check if lint is active
    local active, lint = pcall(require, "lint")
    if not active then return end

    -- Configure linters by filetype
    lint.linters_by_ft = {
      -- TypeScript & JavaScript
      typescript = { "eslint" },
      javascript = { "eslint" },
      typescriptreact = { "eslint" },
      javascriptreact = { "eslint" },

      -- CSS & HTML
      css = { "stylelint" },
      html = { "stylelint" },

      -- JSON
      json = { "jsonlint" },

      -- Lua
      lua = { "luacheck" },

      -- Markdown
      markdown = { "markdownlint" },

      -- Shell & Bash
      sh = { "shellcheck" },
      bash = { "shellcheck" },

      -- Swift
      swift = { "swiftlint" },

      -- Other languages
      yaml = { "yamllint" }, -- YAML
      toml = { "taplo" }, -- TOML
    }

    -- Check if Mason registry is active & install linters
    local mason_active, mason_registry = pcall(require, "mason-registry")
    if mason_active then
      local tools = {
        "eslint_d",
        "stylelint",
        "jsonlint",
        "luacheck",
        "markdownlint",
        "shellcheck",
        "swiftlint",
        "checkstyle",
        "yamllint",
        "taplo",
      }
      for _, tool in ipairs(tools) do
        if not mason_registry.is_installed(tool) then mason_registry.get_package(tool):install() end
      end
    end

    -- Configuration des autocmd pour lancer le linting
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
      group = lint_augroup,
      callback = function() lint.try_lint() end,
    })
  end,
}
