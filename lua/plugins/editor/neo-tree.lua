-- Import
local get_icons = require("whoa.core.utils").get_icons

return {
  "nvim-neo-tree/neo-tree.nvim",

  name = "Neo Tree",

  event = "BufReadPre",

  branch = "main",

  dependencies = {
    { "MunifTanjim/nui.nvim",     name = "Nui", lazy = true },
    { "nvim-tree/nvim-web-devicons", name = "Web Devicons", lazy = true },
  },

  cmd = "NeoTree",

  init = function() vim.g.neo_tree_remove_legacy_commands = true end,

  opts = {
    auto_clean_after_session_restore = true,
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,

    popup_border_style = "rounded",

    sources = {
      "filesystem",
      "buffers",
      "git_status",
    },

    default_component_configs = {
      container = {
        enable_character_fade = true,
      },
      indent = {
        indent_size = 2,
        padding = 1,
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "╰",
        with_expanders = nil,
      },
      git_status = {
        symbols = {
          added = get_icons("Git.Added", 1),
          modified = get_icons("Git.Change", 1),
          deleted = get_icons("Git.Delete", 1),
          renamed = get_icons("Git.Renamed", 1),
          untracked = get_icons("Git.Untracked", 1),
          ignored = get_icons("Git.Ignored", 1),
          unstaged = get_icons("Git.Unstaged", 1),
          staged = get_icons("Git.Staged", 1),
          conflict = get_icons("Git.Conflict", 1),
        },
      },
    },

    source_selector = {
      winbar = true,
      content_layout = "center",
      sources = {
        { source = "filesystem", name = "File System", icon = get_icons("FolderClosed", 1) .. "File" },
        { source = "buffers",    name = "Buffers",     icon = get_icons("DefaultFile", 1) .. "Bufs" },
        { source = "git_status", name = "Git",         icon = get_icons("Git.Main", 1) .. "Git" },
      },
    },

    window = {
      position = "right",
    },
  },

  keys = {
    { "<LEADER>e", "<CMD>Neotree toggle<CR>", { noremap = true, silent = true, desc = "Open Neotree" } },
    {
      "<LEADER>eb",
      "<CMD>Neotree buffers<CR>",
      { noremap = true, silent = true, desc = "Switch to Buffers" },
    },
    {
      "<LEADER>ef",
      "<CMD>Neotree filesystem<CR>",
      { noremap = true, silent = true, desc = "Switch to File System" },
    },
  },
}
