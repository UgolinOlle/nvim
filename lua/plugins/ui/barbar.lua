return {
  "romgrk/barbar.nvim",

  name = "Barbar",

  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  version = "^1.0.0",

  init = function() vim.g.barbar_auto_setup = false end,

  opts = {
    animation = true,
    insert_at_start = true,
    tabpages = true,
    clickable = true,
    hide = { extensions = true, inactive = false },
    preset = "slanted",
    sidebar_filetypes = {
      Explorer = true,
      Outline = true,
      ["neo-tree"] = { event = "BufWipeout" },
    },
  },
}
