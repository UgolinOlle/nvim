return {
  "nvim-telescope/telescope.nvim",

  name = "Telescope",

  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-node-modules.nvim",
    "2kabhishek/nerdy.nvim",
  },

  config = function()
    -- Check if telescope is installed
    local active, telescope = pcall(require, "telescope")
    if not active then return end

    -- Telescope variables
    local actions = require "telescope.actions"

    -- Utils variables
    local utils = require "whoa.utils"
    local get_icons = utils.get_icons

    telescope.setup {
      defaults = {
        wrap_results = true,
        file_ignore_patterns = {
          "%.7z",
          "%.MOV",
          "%.RAF",
          "%.burp",
          "%.bz2",
          "%.cache",
          "%.class",
          "%.dll",
          "%.docx",
          "%.dylib",
          "%.epub",
          "%.exe",
          "%.flac",
          "%.ico",
          "%.ipynb",
          "%.jar",
          "%.lock",
          "%.mkv",
          "%.mov",
          "%.mp4",
          "%.otf",
          "%.pdb",
          "%.rar",
          "%.sqlite3",
          "%.svg",
          "%.tar",
          "%.tar.gz",
          "%.zip",
          ".git/",
          ".gradle/",
          ".idea/",
          ".settings/",
          ".vale/",
          ".vscode/",
          "__pycache__/*",
          "build/",
          "env/",
          "gradle/",
          "node_modules/",
          "smalljre_*/*",
          "target/",
          "vendor/*",
        },
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        prompt_prefix = get_icons("Command", 2), -- Prefix for prompt
        selection_caret = get_icons("ArrowRight", 2), -- Icon for selection
        entry_prefix = "  ", -- Prefix for each entry
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<S-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },

        pickets = {
          diagnostics = {
            theme = "ivy",
            initial_mode = "normal",
            layout_config = { preview_cutoff = 9999 },
          },
        },
      },
    }

    telescope.load_extension "fzf"
    telescope.load_extension "node_modules"
    telescope.load_extension "nerdy"
  end,

  keys = {
    {
      ";f",
      function()
        local builtin = require "telescope.builtin"
        builtin.find_files { hidden = true }
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
