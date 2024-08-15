-- Variables
local autocmd = vim.api.nvim_create_autocmd

-- Imports
require "whoa.core.autocmds.ui"

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

-- Automatically restart LSP after modified Neovim configuration
autocmd("BufWritePost", {
  pattern = vim.fn.stdpath "config" .. "/*",
  callback = function()
    if vim.fn.exists ":LspRestart" == 2 then vim.cmd "LspRestart" end
  end,
})

-- Show LSP diagnostics on hover
autocmd("CursorHold", {
  pattern = "*",
  callback = function() vim.diagnostic.open_float(nil, { focusable = false }) end,
})

-- Set spell for markdown and text files
autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function() vim.opt_local.spell = true end,
})

-- Automatically open configuration file vertically for better visibility
autocmd("BufEnter", {
  pattern = { "*.json", "*.vim", "*.lua", "*.yml", "*.yaml" },
  command = "wincmd H",
})

-- Remind user if he didn't save the file for a long time
autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    if vim.bo.modified then vim.notify("N'oubliez pas de sauvegarder votre fichier !", vim.log.levels.WARN) end
  end,
})

-- Show gitsigns on hover
autocmd("CursorHold", {
  pattern = "*",
  command = "silent! lua require('gitsigns').blame_line({full=true})",
})
