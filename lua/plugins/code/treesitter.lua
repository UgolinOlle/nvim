return {
  {
    "nvim-treesitter/nvim-treesitter",

    event = { "BufReadPre", "BufNewFile" },

    build = ":TSUpdate",

    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-ts-autotag",
      "hiphish/rainbow-delimiters.nvim",
    },

    opts = {
      autoinstall = true,

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
        "css",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "bash",
        "lua",
        "dockerfile",
        "gitignore",
        "cpp",
        "c",
        "java",
        "python",
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
  },
}
