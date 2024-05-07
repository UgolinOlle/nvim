-- Import
local l, api = vim.lsp, vim.api

return {
  "neovim/nvim-lspconfig",

  dependencies = {
    { "nvim-telescope/telescope.nvim", dependencies = "nvim-lua/plenary.nvim" }, -- Telescope
    "folke/noice.nvim", -- UI
    "folke/neodev.nvim", -- Signature help + completion
    "hrsh7th/cmp-nvim-lsp", -- Completion
    "lvimuser/lsp-inlayhints.nvim", -- Inlay hints
    { "antosha417/nvim-lsp-file-operations", config = true },
  },

  event = { "VeryLazy", "BufReadPre", "BufNewFile" },

  config = function()
    -- Utils variables
    local utils = require "whoa.utils"
    local get_icons = utils.get_icons

    -- Check if lspconfig is active
    local active, lspconfig = pcall(require, "lspconfig")
    if not active then return end

    -- Check if cmp_nvim_lsp is active
    local active_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if not active_cmp_nvim_lsp then return end

    -- Check if telescope is active
    local active_telescope, telescope = pcall(require, "telescope")
    if not active_telescope then return end

    -- Check if neodev is active
    local active_neodev, neodev = pcall(require, "neodev")
    if not active_neodev then return end

    -- Mapping variables
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Neodev setup
    neodev.setup {
      override = function(_, library)
        library.enabled = true
        library.plugins = true
      end,
    }

    -- Vim LSP config
    vim.diagnostic.config {
      virtual_text = {
        prefix = "󱓻 ",
      },
      virtual_lines = {
        only_current_line = true,
      },
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        source = "always",
        header = "",
        prefix = "",
      },
    }

    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      -- Show LSP references
      opts.desc = "Show LSP references"
      keymap("n", "gR", telescope.lsp_definitions, opts)

      -- Show LSP definition
      opts.desc = "Show LSP definition"
      keymap("n", "gd", telescope.lsp_definitions, opts)

      -- Show LSP declaration
      opts.desc = "Show LSP type definitions"
      keymap("n", "gD", telescope.lsp_type_definitions, opts)

      -- Show LSP implementation
      opts.desc = "Show LSP implementation"
      keymap("n", "gi", telescope.lsp_implementations, opts)

      -- Show LSP hover
      opts.desc = "Show LSP hover"
      keymap("n", "K", "<CMD>lua vim.lsp.hover<CR>", opts)

      -- Show LSP signature help
      opts.desc = "Show LSP signature help"
      keymap("i", "<C-k>", "<CMD>lua vim.lsp.buf.signature_help()<CR>", opts)

      -- Show LSP rename
      opts.desc = "Show LSP rename"
      keymap("n", "<leader>r", "<CMD>lua vim.lsp.buf.rename()<CR>", opts)

      -- Show LSP code actions
      opts.desc = "Show LSP code actions"
      keymap("n", "<leader>ca", "<CMD>lua vim.lsp.buf.code_action()<CR>", opts)

      -- Go to previous LSP diagnostics
      opts.desc = "Go to previous LSP diagnostics"
      keymap("n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>", opts)

      -- Go to next LSP diagnostics
      opts.desc = "Go to next LSP diagnostics"
      keymap("n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>", opts)

      -- Restart LSP server
      opts.desc = "Restart LSP server"
      keymap("n", "<leader>rs", "<CMD>LspRestart<CR>", opts)
    end

    -- LSP on_attach advanced
    local augroup = api.nvim_create_augroup("LSP", { clear = true })
    api.nvim_create_autocmd("LspAttach", {
      group = augroup,
      desc = "Default LSP on_attach",
      callback = function(event)
        local bufnr = event.buf
        local client = l.get_client_by_id(event.client_id)

        if not client then return end

        -- Inlay hints
        if event.data and event.data.client_id then
          local inlay_hints = require "lsp-inlayhints"

          inlay_hints.on_attach(client, bufnr)
        end
      end,
    })

    -- UI LSP
    local active_noice, _ = pcall(require, "noice")
    if active_noice then
      l.handlers["textDocument/hover"] = l.with(l.handlers.hover, { border = "single" })
      l.handlers["textDocument/signatureHelp"] = l.with(l.handlers.signature_help, { border = "single" })
    end

    -- Capabilities for LSP
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Settings for LSP
    local settings = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    }

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
        on_attach = on_attach,
        capabilities = capabilities,
        settings = settings,
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
