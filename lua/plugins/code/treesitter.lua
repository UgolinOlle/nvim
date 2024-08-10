return {
  {
    "nvim-treesitter/nvim-treesitter",

    name = "Nvim Treesitter",

    event = { "BufReadPre", "BufNewFile" },

    build = ":TSUpdate",

    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-ts-autotag",
      "windwp/nvim-autopairs",
      "hiphish/rainbow-delimiters.nvim",
    },

    opts = {
      highlight = {
        enable = true,
        use_languagetree = true,
      },

      indent = {
        enable = true,
      },

      rainbow = {
        enable = true,
        extended_mode = true,
      },

      autotag = {
        enable = true,
      },

      autopairs = {
        enable = true,
      },

      ensure_installed = {
        "html",
        "json",
        "tsx",
        "yaml",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "php",
        "cpp",
        "c",
        "python",
        "go",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",

    name = "Nvim Treesitter Context",

    cmd = { "TSContextEnable", "TSContextDisable", "TSContextToggle" },

    event = { "BufReadPost", "BufNewFile", "BufWritePre" },

    dependencies = { "nvim-treesitter/nvim-treesitter" },

    opts = {
      enable = true,
      max_lines = 0,
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 20,
      trim_scope = "outer",
      mode = "cursor",
      separator = nil,
      zindex = 20,
      on_attach = nil,
    },
  },
}
