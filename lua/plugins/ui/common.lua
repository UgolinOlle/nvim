local highlight = {
  "RainbowYellow",
  "RainbowLightGreen",
  "RainbowViolet",
  "RainbowBlue",
  "RainbowLightGreen",
  "RainbowCyan",
  "RainbowViolet",
}

return {
  {
    "audibleblink/hackthebox.vim",

    name = "Hack The Box",

    priority = 1000,

    event = "VeryLazy",

    config = function()
      vim.cmd [[ 
        colorscheme hackthebox
        hi FloatBorder guibg=NONE guifg=#F2E2C3
        hi PmenuSel guibg=NONE guifg=#F2E2C3
        hi Pmenu guibg=NONE guifg=#FFFFFF
        hi NormalFloat guibg=NONE
        hi Pmenu guibg=NONE
      ]]
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",

    name = "Colorizer",

    config = function() require("colorizer").setup {} end,
  },
  {
    "folke/zen-mode.nvim",

    name = "Zen Mode",

    keys = {
      { "<LEADER>z", "<CMD>ZenMode<CR>", { noremap = true, silent = true, desc = "Enabled zen mode focus" } },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",

    name = "Indent Blankline",

    main = "ibl",

    keys = {
      { "<leader>uI", "<cmd>IBLToggle<cr>", desc = "Toggle indent blankline" },
    },

    opts = {
      indent = {
        char = "│",
        tab_char = "│",
        highlight = "VertSplit",
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        injected_languages = false,
        highlight = highlight,
      },
      exclude = {
        filetypes = {
          "",
          "TelescopePrompt",
          "TelescopeResults",
          "checkhealth",
          "git",
          "gitcommit",
          "help",
          "lspinfo",
          "man",
          "packer",
        },
      },
    },

    config = function(_, opts)
      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { link = "TSRainbowRed" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { link = "TSRainbowYellow" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { link = "TSRainbowBlue" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { link = "TSRainbowOrange" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { link = "TSRainbowGreen" })
        vim.api.nvim_set_hl(0, "RainbowLightGreen", { link = "TSRainbowLightGreen" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { link = "TSRainbowViolet" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { link = "TSRainbowCyan" })
      end)

      require("ibl").setup(opts)
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
}
