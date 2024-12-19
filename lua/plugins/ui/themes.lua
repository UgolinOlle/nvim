return {
  {
    "audibleblink/hackthebox.vim",

    name = "Hack The Box",

    priority = 1000,

    lazy = false,
  },
  {
    "projekt0n/github-nvim-theme",

    name = "GitHub",

    lazy = false,

    priority = 1000,
  },
  {
    "craftzdog/solarized-osaka.nvim",

    name = "Solarized Osaka",

    lazy = false,

    priority = 1000,

    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",

    name = "Cyber Dream",

    lazy = false,

    priority = 1000,

    opts = {
      transparent = true,
      italic_comments = true,
      hide_fillchars = true,
      terminal_colors = false,
      cache = true,
      borderless_telescope = { border = true, style = "flat" },
      theme = { variant = "auto" },
    }
  }
}
