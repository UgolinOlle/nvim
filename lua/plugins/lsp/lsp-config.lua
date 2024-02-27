return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- Completion
    { "antosha417/nvim-lsp-file-operations", config = true },
  },

  event = { "BufReadPre", "BufNewFile" },

  config = function()
    -- Utils variables
    local utils = require "whoa.utils"
    local get_icons = utils.get_icons

    -- Check if lspconfig is active
    local active, lspconfig = pcall(require, "lspconfig")
    if not active then return end

    -- Check if cmp_nvim_lsp is active
    local active, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if not active then return end

    -- Mapping variables
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    local attach = function(client, bufnr)
      -- Show LSP references
      opts.desc = "Show LSP references"
      keymap("n", "gR", "<CMD>lua vim.lsp.buf.references()<CR>", opts, bufnr)

      -- Show LSP definition
      opts.desc = "Show LSP definition"
      keymap("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", opts, bufnr)

      -- Show LSP implementation
      opts.desc = "Show LSP implementation"
      keymap("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", opts, bufnr)

      -- Show LSP type definition
      opts.desc = "Show LSP type definition"
      keymap("n", "gD", "<CMD>lua vim.lsp.buf.type_definition()<CR>", opts, bufnr)

      -- Show LSP hover
      opts.desc = "Show LSP hover"
      keymap("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", opts, bufnr)

      -- Show LSP signature help
      opts.desc = "Show LSP signature help"
      keymap("i", "<C-k>", "<CMD>lua vim.lsp.buf.signature_help()<CR>", opts, bufnr)

      -- Show LSP rename
      opts.desc = "Show LSP rename"
      keymap("n", "<leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>", opts, bufnr)

      -- Show LSP code actions
      opts.desc = "Show LSP code actions"
      keymap("n", "<leader>ca", "<CMD>lua vim.lsp.buf.code_action()<CR>", opts, bufnr)

      -- Restart LSP server
      opts.desc = "Restart LSP server"
      keymap("n", "<leader>rs", "<CMD>LspRestart<CR>", opts, bufnr)
    end

    -- Capabilities for LSP
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Signs for Lsp
    local signs = {
      Error = get_icons("DiagnosticError", 1),
      Warn = get_icons("DiagnosticWarn", 1),
      Hint = get_icons("DiagnosticHint", 1),
      Info = get_icons("DiagnosticInfo", 1),
    }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Setup LSP servers
    local servers = {
      "bashls",
      "cssls",
      "dockerls",
      "html",
      "jsonls",
      "pyright",
      "tsserver",
      "vimls",
      "tailwindcss",
    }
    for _, server in ipairs(servers) do
      lspconfig[server].setup {
        on_attach = attach,
        capabilities = capabilities,
      }
    end

    -- Custom LSP config for lua_ls
    lspconfig["lua_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            },
          },
        },
      },
    }
  end,
}
