return {
  {
    "datsfilipe/min-theme.nvim",
    name = "min-theme",
    priority = 1000,
    event = "VeryLazy",
    config = function()
      vim.cmd "colorscheme min-theme"
      vim.cmd "hi FloatBorder guibg=NONE guifg=#F2E2C3"
      vim.cmd "hi NormalFloat guibg=NONE"
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup {} end,
  },
  {
    "folke/zen-mode.nvim",
    keys = {
      { "<LEADER>z", "<CMD>ZenMode<CR>", { noremap = true, silent = true, desc = "Enabled zen mode focus" } },
    },
  },
}
