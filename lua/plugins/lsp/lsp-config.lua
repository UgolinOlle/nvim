return {
  {
    "neovim/nvim-lspconfig",

    name = "LSP Config",

    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
      { "hrsh7th/cmp-nvim-lsp", name = "CMP Nvim LSP" },
      { "antosha417/nvim-lsp-file-operations", name = "Nvim LSP File Operations", config = true },
      { "folke/neodev.nvim", name = "Neodev" },
      { "soulis-1256/eagle.nvim", name = "Eagle" },
      { "jubnzv/virtual-types.nvim", name = "Virtual Types" },
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
          keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

          opts.desc = "Go to declaration"
          keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

          opts.desc = "Show LSP definitions"
          keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

          opts.desc = "Show LSP implementations"
          keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

          opts.desc = "Show LSP type definitions"
          keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

          opts.desc = "See available code actions"
          keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

          opts.desc = "Smart rename"
          keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

          opts.desc = "Show buffer diagnostics"
          keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

          opts.desc = "Show line diagnostics"
          keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

          opts.desc = "Go to previous diagnostic"
          keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

          opts.desc = "Go to next diagnostic"
          keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

          opts.desc = "Show documentation for what is under cursor"
          keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

          opts.desc = "Restart LSP"
          keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
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
        Error = get_icons "DiagnosticError",
        Warn = get_icons "DiagnosticWarn",
        Hint = get_icons "DiagnosticHint",
        Info = get_icons "DiagnosticInfo",
      }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- Setup server name
      local server_name = {
        "bashls",
        "cssls",
        "html",
        "jsonls",
        "tsserver",
        "vimls",
        "yamlls",
        "clangd",
        "tailwindcss",
      }

      for _, server in ipairs(server_name) do
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
  },
  {
    "VidocqH/lsp-lens.nvim",

    opts = {
      enable = true,
      include_declaration = false,
      sections = {
        definition = true,
        references = true,
        implements = true,
        git_authors = true,
      },
      ignore_filetype = {
        "prisma",
      },
    },
  },
  {
    "zeioth/garbage-day.nvim",

    name = "Garbage day",

    dependencies = "neovim/nvim-lspconfig",

    event = "VeryLazy",
  },
  {
    "jinzhongjia/LspUI.nvim",

    name = "LSP UI",

    branch = "main",

    config = function() require("LspUI").setup {} end,
  },
  {
    "j-hui/fidget.nvim",

    name = "Fidget",

    event = "LspAttach",

    config = function()
      require("fidget").setup {
        progress = {
          poll_rate = 200,
          ignore_done_already = true,
          display = {
            done_ttl = 0.5,
            progress_icon = { pattern = "meter", period = 1 },
            progress_style = "WarningMsg",
            group_style = "WarningMsg", -- Highlight group for group name (LSP server name)
            icon_style = "WarningMsg", -- Highlight group for group icons
            done_style = "Conditional", -- Highlight group for completed LSP tasks
          },
        },
        notification = {
          window = {
            winblend = 0,
          },
        },
      }
    end,
  },
}
