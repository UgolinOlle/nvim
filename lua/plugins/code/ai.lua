return {
  "yetone/avante.nvim",

  event = "VeryLazy",

  version = false,

  opts = {
    provider = "copilot",
    vendors = {
      ["ollama"] = {
        ["local"] = true,
        endpoint = "127.0.0.1:11434/v1",
        model = "codegemma",
        parse_curl_args = function(opts, code_opts)
          return {
            url = opts.endpoint .. "/chat/completions",
            headers = {
              ["Accept"] = "application/json",
              ["Content-Type"] = "application/json",
            },
            body = {
              model = opts.model,
              messages = require("avante.providers").copilot.parse_messages(code_opts),
              max_tokens = 2048,
              stream = true,
            },
          }
        end,
        parse_response = function(data_stream, event_state, opts)
          require("avante.providers").copilot.parse_response(data_stream, event_state, opts)
        end,
      },
    },
  },

  build = "make",

  dependencies = {
    { "nvim-treesitter/nvim-treesitter", event = "BufReadPre", lazy = true },
    { "stevearc/dressing.nvim",          event = "VeryLazy",   lazy = true },
    { "nvim-lua/plenary.nvim",           lazy = true },
    { "MunifTanjim/nui.nvim",            lazy = true },
    { "nvim-tree/nvim-web-devicons",     lazy = true },
  },
}
