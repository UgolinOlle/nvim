return {
  "nvim-telescope/telescope.nvim",

  name = "Telescope",

  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", name = "Telescope fzf native" },
    { "nvim-telescope/telescope-symbols.nvim", name = "Telescope symbols" },
    { "nvim-telescope/telescope-node-modules.nvim", name = "Telescope node modules" },
    { "2kabhishek/nerdy.nvim", name = "Telescope nerdy" },
  },

  config = function()
    --- Check if telescope is active or not
    local active, telescope = pcall(require, "telescope")
    if not active then return end

    --- Variables
    local actions = require "telescope.actions"
    local utils = require "whoa.core.utils"
    local get_icons = utils.get_icons

    telescope.setup {
      defaults = {
        wrap_results = true,
        file_ignore_patterns = vim.g.telescope_exclude_file,
        layout_strategy = "horizontal",
        borderchars = vim.g.border.borderchars,
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        prompt_prefix = get_icons("Command", 2),
        selection_caret = get_icons("ArrowRight", 2),
        entry_prefix = "  ",
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<S-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },

      pickers = {
        find_files = {
          theme = "dropdown",
          layout_config = {
            prompt_position = "top",
          },
          previewer = false,
          sorting_strategy = "ascending",
        },
        buffers = {
          previewer = false,
          layout_strategy = "vertical",
          layout_config = {
            height = 0.4,
            width = 0.5,
          },
          mappings = {
            n = {
              ["<C-e>"] = "delete_buffer",
              ["l"] = "select_default",
            },
          },
          initial_mode = "normal",
        },
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = { preview_cutoff = 9999 },
        },
      },
    }

    --- Load extensions
    telescope.load_extension "fzf"
    telescope.load_extension "node_modules"
    telescope.load_extension "nerdy"
  end,

  keys = {
    {
      ";f",
      function()
        local builtin = require "telescope.builtin"
        builtin.find_files()
      end,
      { noremap = true, silent = true, desc = "Find files" },
    },
    {
      ";r",
      function()
        local builtin = require "telescope.builtin"
        builtin.live_grep()
      end,
      { noremap = true, silent = true, desc = "Live grep" },
    },
    {
      ";b",
      function()
        local builtin = require "telescope.builtin"
        builtin.buffers()
      end,
      { noremap = true, silent = true, desc = "Buffers" },
    },
    {
      ";d",
      function()
        local builtin = require "telescope.builtin"
        builtin.diagnostics()
      end,
      { noremap = true, silent = true, desc = "Document diagnostics" },
    },
    {
      ";s",
      function()
        local builtin = require "telescope.builtin"
        builtin.treesitter()
      end,
      { noremap = true, silent = true, desc = "Lists Function names, variables, from Treesitter" },
    },
    {
      ";ii",
      "<CMD>Telescope nerdy<CR>",
      { noremap = true, silent = true, desc = "List and select all available icons" },
    },
    {
      ";n",
      "<CMD>Telescope notify<CR>",
      { noremap = true, silent = true, desc = "Display notifications" },
    },
    {
      ";nn",
      "<CMD>Telescope node_modules list<CR>",
      { noremap = true, silent = true, desc = "Node modules" },
    },
  },
}
