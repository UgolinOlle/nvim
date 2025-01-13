return {
  {
    "kosayoda/nvim-lightbulb",

    name = "Nvim Lightbulb",

    event = { "CursorHold", "CursorHoldI" },

    opts = function()
      local get_icons = require("whoa.core").WUtils.get_icons
      return {
        autocmd = { enabled = true },
        sign = {
          enabled = true,
          text = get_icons "Diagnostic.Warn",
          hl = "LightBulbSign",
        },
      }
    end,
  },
  {
    "LukasPietzschmann/boo.nvim",

    name = "Boo",

    lazy = true,
  },
  {
    "zeioth/garbage-day.nvim",

    name = "Garbage day",

    lazy = true,

    dependencies = { {
      "neovim/nvim-lspconfig",

      name = "LSP Config",

      lazy = true,

      event = { "BufReadPre", "BufNewFile" },
    } },
  },
  {
    "jinzhongjia/LspUI.nvim",

    name = "LSP UI",

    event = { "BufReadPre", "BufNewFile" },

    config = function()
      require("LspUI").setup {}
    end,
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
            group_style = "WarningMsg",
            icon_style = "WarningMsg",
            done_style = "Conditional",
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
  {
    "ray-x/lsp_signature.nvim",

    name = "LSP Signature",

    event = "InsertEnter",

    opts = function()
      local get_icons = require("whoa.core").WUtils.get_icons
      return {
        bind = true,
        handler_opts = {
          border = "rounded",
        },
        cfg = {
          hint_prefix = get_icons "Diagnostic.Info",
        },
      }
    end,

    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",

    name = "Tiny Inline Diagnostic",

    event = "LspAttach",

    config = function()
      require("tiny-inline-diagnostic").setup()
    end,
  },
}
