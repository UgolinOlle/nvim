return {
  {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark"

      vim.cmd.colorscheme "solarized"
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function() require("colorizer").setup() end,
  },
  {
    "ziontee113/icon-picker.nvim",
    config = function() require("icon-picker").setup { disable_legacy_commands = true } end,
  },
  {
    "folke/zen-mode.nvim",
    keys = {
      { "<LEADER>z", "<CMD>ZenMode<CR>", { noremap = true, silent = true, desc = "Enabled zen mode focus" } },
    },
  },
}
