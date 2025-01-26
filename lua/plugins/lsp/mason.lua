-- Import
local utils = require "whoa.core.utils"

return {
  "williamboman/mason.nvim",

  name = "Mason",

  event = "BufReadPre",

  dependencies = {
    { "williamboman/mason-lspconfig.nvim", name = "Mason LSP Config", lazy = true },
    { "WhoIsSethDaniel/mason-tool-installer.nvim", name = "Mason Tool Installer", lazy = true },
  },

  config = function()
    -- Check if Mason is active
    local active_mason, mason = pcall(require, "mason")
    if not active_mason then return end

    -- Check if Mason LSPConfig is active
    local active_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
    if not active_mason_lspconfig then return end

    -- Check if Mason Tool Installer is active
    local active_tool_installer, mason_tool_installer = pcall(require, "mason-tool-installer")
    if not active_tool_installer then vim.notify("Mason Tool Installer n'est pas installé", vim.log.levels.WARN) end

    -- Setup Mason
    mason.setup {
      ui = {
        icons = {
          package_installed = utils.get_icons("Git.Staged", 1),
          package_pending = utils.get_icons("Git.Modified", 1),
          package_uninstalled = utils.get_icons("Git.Untracked", 1),
        },
      },
    }

    -- Setup LSP servers
    mason_lspconfig.setup {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "cssls",
        "tailwindcss",
        "emmet_ls",
      },

      automatic_installation = true,
    }

    mason_tool_installer.setup {
      ensure_installed = {
        "prettier",
        "eslint_d",
        "stylua",
      },
    }
  end,

  keys = {
    { "<LEADER>pM", "<CMD>MasonUpdate<CR>", { noremap = true, desc = "Mason update" } },
    { "<LEADER>pp", "<CMD>Mason<CR>", { noremap = true, desc = "Mason home" } },
  },
}
