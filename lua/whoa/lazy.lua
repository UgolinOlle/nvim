local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  -- Import
  { import = "plugins.code" },
  { import = "plugins.editor" },
  { import = "plugins.lsp" },
  { import = "plugins.mini" },
  { import = "plugins.ui" },

  ui = {
    border = "rounded",
    size = {
      width = 0.8,
      height = 0.8,
    },
    backdrop = 100,
  },

  checker = {
    enabled = true,
    notify = false,
  },

  change_detection = {
    notify = false,
  },

  performance = {
    cache = {
      enabled = true,
    },

    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },

  debug = false,
}
