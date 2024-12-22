return {
  {
    "nvim-treesitter/nvim-treesitter",

    name = "Nvim Treesitter",

    event = { "BufReadPre", "BufNewFile" },

    build = ":TSUpdate",

    dependencies = {
      { "JoosepAlviste/nvim-ts-context-commentstring", name = "Nvim TS Context Comment String" },
      { "windwp/nvim-ts-autotag",                      name = "Nvim Treesitter Autotag" },
      { "windwp/nvim-autopairs",                       name = "Nvim Autopairs" },
      { "hiphish/rainbow-delimiters.nvim",             name = "Rainbow Delimiters" },
    },

    opts = {
      sync_install = true,

      auto_install = true,

      highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = false,
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
        "tsx",
        "bash",
        "lua",
        "php",
        "cpp",
        "c",
        "python",
        "twig",
        "vim",
        "mdx",
        "md",
        "json",
        "yaml",
        "dockerfile",
        "gitignore",
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
