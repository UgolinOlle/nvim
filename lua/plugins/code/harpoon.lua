return {
  {
    "ThePrimeagen/harpoon",

    name = "Harpoon",

    event = { "BufReadPre", "BufWritePre" },

    branch = "harpoon2",

    dependencies = {
      { "nvim-lua/plenary.nvim",         name = "Plenary",   lazy = true },
      { "nvim-telescope/telescope.nvim", name = "Telescope", lazy = true },
    },

    config = function()
      -- Import & check if harpoon is available
      local status_ok, harpoon = pcall(require, "harpoon")
      if not status_ok then return end

      -- Harpoon configuration
      harpoon.setup({
        global_settings = {
          save_on_toggle = false,
          save_on_change = true,
          enter_on_sendcmd = false,
          tmux_autoclose_windows = false,
          excluded_filetypes = { "harpoon" },
        },
      })

      -- Telescope configuration for Harpoon
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end

      -- Keybindings
      vim.keymap.set("n", "<LEADER>a", function()
        harpoon:list():add()
      end, { noremap = true, silent = true, desc = "Ajouter un fichier à Harpoon" })

      vim.keymap.set("n", "<C-e>", function()
        toggle_telescope(harpoon:list())
      end, { noremap = true, silent = true, desc = "Ouvrir Harpoon via Telescope" })

      vim.keymap.set("n", "<C-1>", function()
        harpoon:list():select(1)
      end, { noremap = true, silent = true, desc = "Naviguer vers le fichier 1" })

      vim.keymap.set("n", "<C-2>", function()
        harpoon:list():select(2)
      end, { noremap = true, silent = true, desc = "Naviguer vers le fichier 2" })

      vim.keymap.set("n", "<C-3>", function()
        harpoon:list():select(3)
        require("harpoon.ui").nav_file(3)
      end, { noremap = true, silent = true, desc = "Naviguer vers le fichier 3" })

      vim.keymap.set("n", "<C-4>", function()
        harpoon:list():select(4)
      end, { noremap = true, silent = true, desc = "Naviguer vers le fichier 4" })
    end,
  },
}
