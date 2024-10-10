return {
  "nvimdev/lspsaga.nvim",

  name = "LSP Saga",

  event = "LspAttach",

  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter", name = "Nvim Treesitter" },
  },

  opts = {
    diagnostic = {
      on_insert = false,
      border_follow = false,
    },

    lightbulb = { enable = false },

    outline = {
      auto_preview = false,
      keys = {
        jump = "<Enter>",
        expand_collapse = nil,
      },
    },

    symbol_in_winbar = {
      enable = true,
      hide_keyword = true,
      separator = "   ",
      show_file = false,
    },

    rename = {
      in_select = false,
    },

    ui = {
      theme = "round",
      border = vim.g.border.style,
      winblend = vim.o.pumblend,
      lines = { "", "", "", "", "" },
      expand = "",
      collapse = "",
    },
    code_action = {
      num_shortcut = true,
    },
  },
}
