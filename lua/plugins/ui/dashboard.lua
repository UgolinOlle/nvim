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
      theme = "doom",
      config = {
        header = header,
        center = {
          {
            icon = "",
            desc = "  Whoa Agency ",
            group = "@comment.todo",
            key = "1",
            action = function()
              require("telescope.builtin").find_files {
                prompt_title = "Select Folder",
                cwd = "~/Developer/whoa",
              }
            end,
          },
          {
            icon = "󰢱",
            desc = "  Configuration ",
            group = "@comment.error",
            key = "2",
            action = function() require("telescope.builtin").find_files { cwd = "~/.config/nvim" } end,
          },
          {
            icon = "",
            desc = "  Package manager ",
            group = "@property",
            key = "3",
            action = "Lazy",
          },
        },
        footer = {
          " ",
          "Made by WHOA ⨕ Ugolin Ollé",
        },
      },
    }
  end,
}
