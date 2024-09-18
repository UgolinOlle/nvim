return {
  {
    "audibleblink/hackthebox.vim",

    name = "Hack The Box",

    priority = 1000,

    lazy = true,
  },
  {
    "projekt0n/github-nvim-theme",

    name = "GitHub",

    lazy = true,

    priority = 1000,
  },
  {
    "craftzdog/solarized-osaka.nvim",

    name = "Solarized Osaka",

    lazy = true,

    priority = 1000,

    opts = function()
      return {
        transparent = true,
      }
    end,
  },
}
