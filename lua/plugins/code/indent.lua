return {
  {
    "lukas-reineke/indent-blankline.nvim",

    config = function()
      local active, indent = pcall(require, "ibl")
      if not active then return end

      local hooks = require "ibl.hooks"
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowTeal",
        "RainbowGreen",
        "RainbowOrange",
        "RainbowCyan",
      }

      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#ea6962" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#fabd2f" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#458588" })
        vim.api.nvim_set_hl(0, "RainbowTeal", { fg = "#8ec07c" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#b8bb26" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#e78a4e" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#83a598" })
      end)

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

      indent.setup {
        filetype_exclude = {
          "lazy",
          "neo-tree",
          "mason",
          "dashboard",
          "terminal",
          "help",
        },

        indent = {
          char = "│",
          tab_char = "│",
          highlight = highlight,
        },

        scope = {
          enabled = true,
        },

        vim.opt.listchars:append "space: ",
      }
    end,
  },
  {
    "echasnovski/mini.indentscope",

    version = false,

    event = { "BufReadPre", "BufNewFile" },

    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },

    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "hyper",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function() vim.b.miniindentscope_disable = true end,
      })
    end,
  },
}
