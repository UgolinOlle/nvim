return {
  "nvim-telescope/telescope.nvim",

  name = "Telescope",

  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", name = "Telescope fzf native" },
    { "nvim-telescope/telescope-file-browser.nvim", name = "Telescope file browser" },
    { "nvim-telescope/telescope-symbols.nvim", name = "Telescope symbols" },
    { "nvim-telescope/telescope-node-modules.nvim", name = "Telescope node modules" },
    { "2kabhishek/nerdy.nvim", name = "Telescope nerdy" },
  },

  config = function()
    -- Check if telescope is installed
    local active, telescope = pcall(require, "telescope")
    if not active then return end

    -- Telescope variables
    local actions = require "telescope.actions"
    local fb_actions = require("telescope").extensions.file_browser.actions

    -- Utils variables
    local utils = require "whoa.core.utils"
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
        borderchars = vim.g.border.borderchars,
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
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

        pickers = {
          find_files = {
            theme = "dropdown", -- 'ivy', 'dropdown', 'cursor'
            layout_strategy = "vertical",
            layout_config = { height = 0.9 },
            previewer = false,
            sorting_strategy = "ascending",
          },
          buffers = {
            previewer = false,
            theme = "dropdown",
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
        extensions = {

          file_browser = {
            dir_icon = "",
            prompt_path = true,
            grouped = true,
            theme = "dropdown",
            initial_mode = "normal",
            previewer = false,
            mappings = {
              n = {
                ["o"] = "select_default",
                ["H"] = fb_actions.toggle_hidden,
                ["h"] = fb_actions.goto_parent_dir,
                ["l"] = "select_default",
              },
            },
          },
        },
      },
    }

    telescope.load_extension "fzf"
    telescope.load_extension "node_modules"
    telescope.load_extension "nerdy"
    telescope.load_extension "file_browser"
  end,

  keys = {
    {
      ";ff",
      "<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>",
      { noremap = true, silent = true, desc = "Find files" },
    },
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
