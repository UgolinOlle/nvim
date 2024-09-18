return {
  "github/copilot.vim",

  name = "Github Copilot",

  event = "InsertEnter",

  cmd = "Copilot",

  config = function()
    local active, copilot = pcall(require, "copilot")
    if not active then return end

    copilot.setup {
      layout = {
        position = "bottom",
        ratio = 0.4,
      },

      suggestion = {
        enabled = true,

        keymap = {
          accept = "<TAB>",
          accept_line = "<S-TAB>",
          next = "<C-]>",
          prev = "<C-[>",
          dimiss = "<ESC>",
        },
      },
    }
  end,
}
