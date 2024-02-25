return {
  {
    "sainnhe/sonokai",

    priority = 1000,

    config = function()
      vim.g.sonokai_style = "andromeda"
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_transparent_background = 1
      vim.cmd.colorscheme "sonokai"
    end,
  },
  {
    "stevearc/dressing.nvim",

    opts = true,
  },
  {
    "NvChad/nvim-colorizer.lua",

    opts = {
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = true,
        AARRGGBB = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        mode = "background",
        method = "lsp",
        tailwind = true,
        sass = { enable = true, parsers = { "css" } },
        virtualtext = "■",
      },
      buftypes = { "!prompt", "!popup" },
    },
  },
  {
    "mrshmllow/document-color.nvim",

    lazy = true,

    opts = true,
  },
}
