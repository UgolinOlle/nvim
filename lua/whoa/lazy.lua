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
  { import = "plugins.notes" },
  { import = "plugins.ui" },

  -- UI
  ui = {
    border = "simple",
  },

  -- Checking for updates
  checker = {
    notify = true,
  },

  -- Checking for change
  change_detection = {
    notify = false,
  },
}
