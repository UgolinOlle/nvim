--- Variables
local header = {
  [[                                                    ]],
  [[  _       ____  ______  ___       ________  ______  ]],
  [[ | |     / / / / / __ \/   |     /  _/ __ \/ ____/  ]],
  [[ | | /| / / /_/ / / / / /| |     / // / / / __/     ]],
  [[ | |/ |/ / __  / /_/ / ___ |   _/ // /_/ / /___     ]],
  [[ |__/|__/_/ /_/\____/_/  |_|  /___/_____/_____/     ]],
  [[                                                    ]],
}

return {
  "nvimdev/dashboard-nvim",

  name = "Dashboard",

  dependencies = { "nvim-tree/nvim-web-devicons" },

  event = "VimEnter",

  config = function()
    require("dashboard").setup {
      theme = "hyper",
      config = {
        header = header,
        shortcut = {
          {
            desc = "  Whoa Agency",
            group = "Number",
            key = "1",
            action = function()
              require("telescope.builtin").find_files {
                prompt_title = "Select Folder",
                cwd = "~/Developer/whoa",
              }
            end,
          },
          {
            desc = "󰢱  Configuration",
            icon_hl = "@keyword",
            key = "2",
            action = function() require("telescope.builtin").find_files { cwd = "~/.config/nvim" } end,
          },
          {
            desc = "  Package manager",
            group = "@property",
            key = "3",
            action = "Lazy",
          },
        },
        packages = { enable = true },
        footer = {
          " ",
          "Made by WHOA ⨕ Ugolin Ollé",
        },
      },
    }
  end,
}
