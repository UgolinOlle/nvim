--- Variables
local header = {
  [[                                                                      ]],
  [[                                                                      ]],
  [[  __      __  __  __  _____   ______      ______  ____    ____        ]],
  [[ /\ \  __/\ \/\ \/\ \/\  __`\/\  _  \    /\__  _\/\  _`\ /\  _`\      ]],
  [[ \ \ \/\ \ \ \ \ \_\ \ \ \/\ \ \ \L\ \   \/_/\ \/\ \ \/\ \ \ \L\_\    ]],
  [[  \ \ \ \ \ \ \ \  _  \ \ \ \ \ \  __ \     \ \ \ \ \ \ \ \ \  _\L    ]],
  [[   \ \ \_/ \_\ \ \ \ \ \ \ \_\ \ \ \/\ \     \_\ \_\ \ \_\ \ \ \L\ \  ]],
  [[    \ `\___x___/\ \_\ \_\ \_____\ \_\ \_\    /\_____\ \____/\ \____/  ]],
  [[     '\/__//__/  \/_/\/_/\/_____/\/_/\/_/    \/_____/\/___/  \/___/   ]],
  [[                                                                      ]],
  [[                                                                      ]],
  [[                            Version: 0.1.0                            ]],
  [[                                                                      ]],
  [[                                                                      ]],
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
