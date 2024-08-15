return {
  "folke/trouble.nvim",

  name = "Trouble",

  opts = {
    warn_no_results = false,
    open_no_results = true,
    modes = {
      lsp_references = {
        desc = "LSP References",
        mode = "lsp_references",
        restore = true,
        focus = false,
        follow = false,
      },
      lsp_definitions = {
        desc = "LSP definitions",
        mode = "lsp_definitions",
        restore = true,
        focus = false,
        follow = false,
      },
    },
    keys = {
      ["?"] = "help",
      r = "refresh",
      R = "toggle_refresh",
      q = "close",
      o = "jump_close",
      ["<esc>"] = "cancel",
      ["<cr>"] = "jump",
      ["<2-leftmouse>"] = "jump",
      ["<c-s>"] = "jump_split",
      ["<c-v>"] = "jump_vsplit",
      ["]"] = "next",
      ["["] = "prev",
      i = "inspect",
      p = "preview",
      P = "toggle_preview",
      l = "jump",
      L = "fold_open_all",
      h = "fold_close",
      H = "fold_close_all",
    },
  },

  keys = {
    {
      "<LEADER>ll",
      "<CMD>Trouble lsp_references<CR>",
      { noremap = true, silent = true, desc = "Open Trouble with LSP References" },
    },
    {
      "<LEADER>ld",
      "<CMD>Trouble lsp_definitions<CR>",
      { noremap = true, silent = true, desc = "Open Trouble with LSP Definitions" },
    },
    {
      "<LEADER>lq",
      "<CMD>Trouble diagnostics toggle<CR>",
      { noremap = true, silent = true, desc = "Open Trouble with diagnostics" },
    },
  },
}
