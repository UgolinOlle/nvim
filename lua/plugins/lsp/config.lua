return {
  "neovim/nvim-lspconfig",

  name = "LSP Config",

  event = "LspAttach",

  dependencies = {
    { "hrsh7th/cmp-nvim-lsp", name = "CMP Nvim LSP", event = "InsertEnter", lazy = true },
    {
      "antosha417/nvim-lsp-file-operations",

      name = "Nvim LSP File Operations",

      config = true,

      event = { "BufReadPre", "BufNewFile" },
    },
  },

  config = function()
    -- Variables
    local lspconfig = require "lspconfig"
    local mason_lspconfig = require "mason-lspconfig"
    local cmp_nvim_lsp = require "cmp_nvim_lsp"
    local keymap = vim.keymap
    local get_icons = require("whoa.core.utils").get_icons

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("LspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<CMD>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<CMD>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<CMD>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<CMD>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<LEADER>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<LEADER>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<LEADER>D", "<CMD>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<LEADER>d", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<LEADER>rs", "<CMD>LspRestart<CR>", opts)

        opts.desc = "Show LSP info"
        keymap.set("n", "<LEADER>li", "<CMD>LspInfo<CR>", opts)
      end,
    })

    -- Setup UI
    local border = {
      { "╭", "FloatBorder" },

      { "─", "FloatBorder" },

      { "╮", "FloatBorder" },

      { "│", "FloatBorder" },

      { "╯", "FloatBorder" },

      { "─", "FloatBorder" },

      { "╰", "FloatBorder" },

      { "│", "FloatBorder" },
    }
    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }

    -- Setup LSP capabilities
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Setup LSP symbols
    local signs = {
      Error = get_icons "Diagnostic.Error",
      Warn = get_icons "Diagnostic.Warn",
      Hint = get_icons "Diagnostic.Hint",
      Info = get_icons "Diagnostic.Info",
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Setup server name
    local servers = {
      "ts_ls", -- TypeScript / JavaScript
      "eslint", -- ESLint
      "tailwindcss", -- Tailwind CSS
      "html", -- HTML
      "cssls", -- CSS
      "bashls", -- Bash / Shell
      "docker_compose_language_service", -- Docker Compose
      "dockerls", -- Dockerfile
      "yamlls", -- YAML
      "taplo", -- TOML (config)
      "jsonls", -- JSON
      "marksman", -- Markdown
      "graphql", -- GraphQL
      "vimls", -- Vim
      "lua_ls", -- Lua
      "emmet_ls", -- Emmet pour HTML/CSS
      "sqlls", -- SQL
    }

    mason_lspconfig.setup {
      ensure_installed = servers,
      automatic_installation = true,
    }

    for _, server in ipairs(servers) do
      lspconfig[server].setup {
        capabilities = capabilities,
        on_attach = mason_lspconfig.on_attach,
        flags = { debounce_text_changes = 150 },
        handlers = handlers,
      }
    end

    -- lua_ls
    lspconfig["lua_ls"].setup {
      capabilities = capabilities,
      on_attach = mason_lspconfig.on_attach,
      flags = { debounce_text_changes = 150 },
      handlers = handlers,
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

    -- Setup emmet_ls server
    lspconfig["emmet_ls"].setup {
      capabilities = capabilities,
      on_attach = mason_lspconfig.on_attach,
      flags = { debounce_text_changes = 150 },
      filetypes = { "html", "css", "javascript", "typescript", "php" },
      handlers = handlers,
      init_options = {
        html = {
          options = {
            ["bem.enabled"] = true,
          },
        },
      },
    }
  end,
}
