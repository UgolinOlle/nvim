return {
  {
    "nvim-telescope/telescope.nvim",

    branch = "0.1.x",

    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      -- Check if telescope is installed
      local active, telescope = pcall(require, "telescope")
      if not active then return end

      -- Variables
      local utils = require "whoa.utils"
      local get_icons = utils.get_icons
      local actions = require "telescope.actions"

      -- Setup telescope
      telescope.setup {
        -- Default settings
        defaults = {
          -- Mappings
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<S-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },

          vimgrep_arguments = {
            "rg",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },

          layout_config = {
            horizontal = {
              mirror = false,
            },
            vertical = {
              mirror = false,
            },
          },

          -- Global settings
          prompt_prefix = get_icons("Command", 2), -- Prefix for prompt
          selection_caret = get_icons("ArrowRight", 2), -- Icon for selection
          entry_prefix = "  ", -- Prefix for each entry
          initial_mode = "insert", -- Initial mode
          selection_strategy = "closest", -- Selection strategy
          sorting_strategy = "descending", -- Sorting strategy
          layout_strategy = "horizontal", -- Layout strategy
          file_sorter = require("telescope.sorters").get_fuzzy_file, -- File sorter
          file_ignore_patterns = { "node_modules", ".git" }, -- Ignore patterns
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter, -- Generic sorter
          path_display = { truncate = 2 }, -- Path display
          winbled = 2, -- Window border
          border = {}, -- Border
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }, -- Border characters
          color_devicons = true, -- Use devicons
          use_less = true, -- Use less
          set_env = { ["COLORTERM"] = "truecolor" }, -- Set environment color
          file_previewer = require("telescope.previewers").vim_buffer_cat.new, -- File previewer
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new, -- Grep previewer
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new, -- Quickfix list previewer
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker, -- Buffer previewer maker
        },
      }

      -- Load extensions
      telescope.load_extension "fzf" -- FZF
      telescope.load_extension "notify" -- Notifications

      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }

      opts.desc = "Fuzzy find files in cwd"
      keymap("n", "<LEADER>ff", "<CMD>Telescope find_files<CR>", opts)

      opts.desc = "Fuzzy find buffers"
      keymap("n", "<LEADER>fb", "<CMD>Telescope buffers<CR>", opts)

      opts.desc = "Fuzzy find recent files"
      keymap("n", "<LEADER>fr", "<CMD>Telescope oldfiles<CR>", opts)

      opts.desc = "Find string in cwd"
      keymap("n", "<LEADER>fg", "<CMD>Telescope live_grep<CR>", opts)

      opts.desc = "Find string under cursor in cwd"
      keymap("n", "<LEADER>fc", "<CMD>Telescope grep_string<CR>", opts)

      opts.desc = "Find git status"
      keymap("n", "<LEADER>gs", "<CMD>Telescope git_status<CR>", opts)

      opts.desc = "Find all notifications"
      keymap("n", "<LEADER>fn", "<CMD>Telescope notify<CR>", opts)
    end,
  },
}
