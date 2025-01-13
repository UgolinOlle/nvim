return {
  {
    "audibleblink/hackthebox.vim",

    name = "Hack The Box",

    priority = 1000,

    lazy = false,
  },
  {
    "projekt0n/github-nvim-theme",

    name = "GitHub Theme",

    lazy = false,

    priority = 1000,

    config = function()
      require('github-theme').setup({
        options = {
          transparent = true,
        }
      })
    end
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
    "Mofiqul/vscode.nvim",

    name = "VSCode",

    lazy = false,

    priority = 1000,

    opts = function()
      return {
        transparent = true,
      }
    end,
  }
}
