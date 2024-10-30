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
vim.cmd [[
  highlight DashboardDesc1 guifg=#FF5733
  highlight DashboardDesc2 guifg=#33FF57
  highlight DashboardDesc3 guifg=#3357FF
]]

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
            desc_hl = "DashboardDesc1",
            key = "1",
          },
          {
            icon = "󰢱",
            desc = "  Configuration ",
            desc_hl = "DashboardDesc2",
            key = "2",
            action = function() require("telescope.builtin").find_files { cwd = "~/.config/nvim" } end,
          },
          {
            icon = "",
            desc = "  Package manager ",
            desc_hl = "DashboardDesc3",
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
