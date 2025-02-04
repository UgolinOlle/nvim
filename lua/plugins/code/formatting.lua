return {
  "stevearc/conform.nvim",

  name = "Conform",

  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "williamboman/mason.nvim",
  },

  config = function()
    -- Check if Conform is active
    local active, conform = pcall(require, "conform")
    if not active then return end

    -- Setup Conform
    conform.setup {
      formatters_by_ft = {
        -- TypeScript & JavaScript
        typescript = { "prettier" },
        javascript = { "prettier" },
        typescriptreact = { "prettier" },
        javascriptreact = { "prettier" },

        -- CSS & HTML
        css = { "prettier" },
        html = { "prettier" },

        -- JSON
        json = { "prettier" },

        -- Lua
        lua = { "stylua" },

        -- Markdown
        markdown = { "prettier" },

        -- Shell & Bash
        sh = { "shfmt" },
        bash = { "shfmt" },

        -- Swift
        swift = { "swiftformat" },

        -- Other languages
        yaml = { "prettier" }, -- YAML
        toml = { "prettier" }, -- TOML
      },

      -- Automatically format on save
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 2500,
      },
    }

    -- Check if Mason registry is active & install formatters
    local mason_active, mason_registry = pcall(require, "mason-registry")
    if mason_active then
      local tools = {
        "prettier",
        "stylua",
        "shfmt",
      }
      for _, tool in ipairs(tools) do
        local p = mason_registry.get_package(tool)
        if not p:is_installed() then p:install() end
      end
    end
  end,

  keys = {
    {
      "<LEADER>ci",
      "<CMD>ConformInfo<CR>",
      { noremap = true, silent = true, desc = "Show informations about Conform" },
    },
  },
}
