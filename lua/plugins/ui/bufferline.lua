return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      numbers = "both", -- Show buffer index and number
      diagnostics = "nvim_lsp", -- Integrate LSP diagnostics
      separator_style = "slant", -- Separator style: "slant" | "thick" | "thin"
      show_close_icon = false, -- Hide close icon on tabs
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
    highlights = {
      fill = {
        bg = "none",
      },
      background = {
        bg = "none",
      },
      buffer_selected = {
        bg = "none",
        bold = true,
      },
      tab = {
        bg = "none",
      },
      tab_selected = {
        bg = "none",
      },
      tab_close = {
        bg = "none",
      },
    },
  },
}
