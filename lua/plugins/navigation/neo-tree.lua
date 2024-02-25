-- Import
local get_icons = require("whoa.utils").get_icons

return {
    "nvim-neo-tree/neo-tree.nvim",

    branch = "main",

    dependencies = {
        "MunifTanjim/nui.nvim",
    },

    cmd = "NeoTree",

    init = function()
        vim.g.neo_tree_remove_legacy_commands = true
    end,

    opts = {
        auto_clean_after_session_restore = true,
        close_if_last_window = true,
        sources = {
            "filesystem",
            "buffers",
            "git_status",
            "diagnostics",
        },

        source_selector = {
            winbar = true,
            content_layout = "center",
            sources = {
                { source = "filesystem", name = "File System", icon = get_icons("FolderClosed", 1) .. "File" },
                { source = "buffers", name = "Buffers", icon = get_icons("DefaultFile", 1) .. "Bufs" },
                { source = "git_status", name = "Git Status", icon = get_icons("Git", 1) .. "Git" },
                { source = "diagnostics", name = "Diagnostics", icon = get_icons("Diagnostic", 1) .. "Diag" },
            }
        }
    },

    keys = {
      { "<LEADER>e", "<CMD>Neotree<CR>", { noremap = true, silent = true, desc = "Toggle file tree." } }
    }
}
