local autocmd = vim.api.nvim_create_autocmd

-- Adding 42 norm on C file.
autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

-- Adding 42 norm on H file.
autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

-- Disable some style on terminal.
autocmd("TermOpen", {
  desc = "Disable foldcolumn in terminal and signcolumn for terminal.",
  callback = function()
    vim.opt.foldcolumn = "0"
    vim.opt.signcolumn = "no"
  end,
})

-- Automatically open NeoTree when vim is opened on a directory.
-- autocmd("BufEnter", {
--   group = vim.api.nvim_create_augroup("Neotree_open", { clear = true }),
--   desc = "Start Neo-tree",
--   once = true,
--   callback = function()
--     if package.loaded["neo-tree"] then vim.cmd [[ Neotree ]] end
--   end,
-- })
