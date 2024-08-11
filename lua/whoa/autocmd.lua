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

-- Check if file need to be reload
autocmd("BufWritePost", {
  pattern = "*",
  callback = function()
    if vim.bo.modifiable and vim.bo.buftype == "" then vim.cmd "checktime" end
  end,
})

-- Highlight on yank
autocmd("TextYankPost", {
  pattern = "*",
  callback = function() vim.highlight.on_yank { higroup = "Visual", timeout = 200 } end,
})

-- Automatically save file when focus is lost
autocmd("FocusLost", {
  pattern = "*",
  callback = function() vim.cmd "silent! wa" end,
})

-- Autosave
autocmd({ "CursorMoved", "CursorMovedI", "FocusLost", "BufLeave", "BufWinLeave", "InsertLeave" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modified then vim.cmd "silent! update" end
  end,
})
