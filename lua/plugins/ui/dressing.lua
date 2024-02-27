return {
  "stevearc/dressing.nvim",

  event = "VeryLazy",

  config = function()
    local active, dressing = pcall(require, "dressing")
    if not active then return end

    dressing.setup {
      select = {
        telescope = require("telescope.themes").get_dropdown(),
      },

      input = {
        insert_only = false,
        relative = "editor",
        default_prompt = " ",
      },
    }
  end,
}
