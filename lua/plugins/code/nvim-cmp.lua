return {
  "hrsh7th/cmp-nvim",

  event = "InsertEnter",

  dependencies = {
    "neovim/nvim-lspconfig", -- LSP client
    "hrsh7th/cmp-buffer", -- Source for text in buffer
    "hrsh7th/cmp-path", -- Source for file paths
    "hrsh7th/cmp-nvim-lsp", -- Source for LSP completions
    "hrsh7th/cmp-cmdline", -- Source for command line completions
    "hrsh7th/cmp-emoji", -- Source for emoji completions
    "hrsh7th/cmp-nvim-lua", -- Source for Lua completions

    "L3MON4D3/LuaSnip", -- Snippets
    "saadparwaiz1/cmp_luasnip", -- Source for autocomplete
    "rafamadriz/friendly-snippets", -- Snippets
  },

  config = function()
    -- Check if cmp is installed
    local active, cmp = pcall(require, "cmp")
    if not active then
      return
    end

    -- Check if luasnip is installed
    local active, luasnip = pcall(require, "luasnip")
    if not active then
      return
    end

    -- Setup luasnip
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Setup cmp 
    cmp.setup({
      -- Configure sources
      sources = cmp.config.sources ({
        { name = "nvim_lsp" }, -- Source for LSP completions
        { name = "buffer" }, -- Source for text in buffer
        { name = "path" }, -- Source for file paths
        { name = "luasnip" }, -- Source for autocomplete
      }),

      -- Configure completion sources
      completion = {
        completeopt = "menu,menuone,noinsert",
      },

      -- Configure how nvim-cmp should handle snippets
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      -- Configure keybindings
      mappings = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
      }),

      -- Configure formatting
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          with_text = true,
          maxwidth = 50,
          ellipsis_char = "...",
          menu = {
            buffer = "[BUF]",
            nvim_lsp = "[LSP]",
            luasnip = "[SNIP]",
            nvim_lua = "[LUA]",
            path = "[PATH]",
            cmdline = "[CMD]",
            emoji = "[EMOJI]",
          },
        }),
      }
    })
  end
}
