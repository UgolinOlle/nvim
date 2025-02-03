-- Import
local utils = require "whoa.core.utils"

return {
  "williamboman/mason.nvim",

  dependencies = {
    { "williamboman/mason-lspconfig.nvim" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  },

  cmd = { "Mason", "MasonInstall", "MasonUpdate" },

  config = function()
    require("mason").setup {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    }

    require("mason-lspconfig").setup {
      ensure_installed = {
        -- Lua
        "lua_ls", -- Serveur LSP pour Lua

        -- JavaScript / TypeScript / Node.js / Next.js / Nest.js
        "tl_ls", -- Serveur LSP pour JavaScript et TypeScript
        "eslint", -- Serveur LSP pour ESLint (analyse de code)
        "tailwindcss", -- Serveur LSP pour Tailwind CSS

        -- HTML / CSS
        "html", -- Serveur LSP pour HTML
        "cssls", -- Serveur LSP pour CSS
        "emmet_ls", -- Serveur LSP pour Emmet (accélère l'écriture de HTML et CSS)

        -- Bash / Shell
        "bashls", -- Serveur LSP pour les scripts Bash et Shell

        -- YAML
        "yamlls", -- Serveur LSP pour YAML

        -- Fichiers de configuration
        "taplo", -- Serveur LSP pour TOML
        "jsonls", -- Serveur LSP pour JSON
        "dockerls", -- Serveur LSP pour Dockerfile
        "docker_compose_language_service", -- Serveur LSP pour Docker Compose
        "marksman", -- Serveur LSP pour Markdown
        "graphql", -- Serveur LSP pour GraphQL
      },

      automatic_installation = true,
    }

    require("mason-tool-installer").setup {
      ensure_installed = {
        -- Formatters
        "prettier", -- Formateur pour JavaScript, TypeScript, JSON, etc.
        "eslint_d", -- Linter pour JavaScript et TypeScript (version daemon pour des performances accrues)
        "stylua", -- Formateur pour Lua
        "shfmt", -- Formateur pour les scripts Shell
        "stylelint", -- Linter pour CSS, SCSS, Less
        "jsonlint", -- Linter pour JSON
        "markdownlint", -- Linter pour Markdown

        -- Linters
        "luacheck", -- Linter pour Lua
        "shellcheck", -- Linter pour les scripts Shell
        "swiftlint", -- Linter pour Swift
      },

      automatic_installation = true,
    }
  end,

  keys = {
    { "<LEADER>pM", "<CMD>MasonUpdate<CR>", { noremap = true, desc = "Mason update" } },
    { "<LEADER>pp", "<CMD>Mason<CR>", { noremap = true, desc = "Mason home" } },
  },
}
