return {
  {
    "nvim-treesitter/nvim-treesitter",

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

    config = true,

    event = "BufReadPre",
  },
}
