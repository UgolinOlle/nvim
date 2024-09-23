return {
  "akinsho/toggleterm.nvim",

  name = "Toggle Terminal",

  version = "main",

  cmd = {
    "ToggleTerm",
  },

  opts = {
    float_opts = {
      border = "curved",
    },
  },

  config = function()
    --- Variables
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new { cmd = "lazygit", hidden = true }

    function _lazygit_toggle() lazygit:toggle() end

    --- Setup the keymap to toggle lazygit
    vim.api.nvim_set_keymap(
      "n",
      "<LEADER>tg",
      "<CMD>lua _lazygit_toggle()<CR>",
      { noremap = true, silent = true, desc = "Toggle lazygit" }
    )
  end,

  keys = {
    {
      "<leader>th",
      "<cmd>ToggleTerm direction=horizontal<CR>",
      { noremap = true, silent = true, desc = "Toggle horizontal terminal" },
    },
    {
      "<leader>tt",
      "<cmd>ToggleTerm direction=float<CR>",
      { noremap = true, silent = true, desc = "Toggle floating terminal" },
    },
  },
}
