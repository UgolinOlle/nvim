-- Import
local get_icons = require("whoa.utils").get_icons

return {
  "nvim-neo-tree/neo-tree.nvim",

  name = "Neo Tree",

  branch = "main",

  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  cmd = "NeoTree",

  init = function() vim.g.neo_tree_remove_legacy_commands = true end,

  opts = {
    auto_clean_after_session_restore = true,
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,

    sources = {
      "filesystem",
      "buffers",
    },

    source_selector = {
      winbar = true,
      content_layout = "center",
      sources = {
        { source = "filesystem", name = "File System", icon = get_icons("FolderClosed", 1) .. "File" },
        { source = "buffers", name = "Buffers", icon = get_icons("DefaultFile", 1) .. "Bufs" },
      },
    },
  },

  keys = {
    { "<LEADER>e", "<CMD>Neotree toggle<CR>", { noremap = true, silent = true, desc = "Open Neotree" } },
  },
}
