--- ## Whoa Autocmds
--
-- Module to manage autocmds.
--
-- @module whoa.core.autocmds
-- @copyright 2024

--- Variables
local autocmd = vim.api.nvim_create_autocmd

--- Adding 42 norm on C file.
autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

--- Adding 42 norm on H file.
autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

--- Disable some style on terminal.
autocmd("TermOpen", {
  desc = "Disable foldcolumn in terminal and signcolumn for terminal.",
  callback = function()
    vim.opt.foldcolumn = "0"
    vim.opt.signcolumn = "no"
  end,
})

--- Check if file need to be reload
autocmd("BufWritePost", {
  pattern = "*",
  callback = function()
    if vim.bo.modifiable and vim.bo.buftype == "" then vim.cmd "checktime" end
  end,
})

--- Highlight on yank
autocmd("TextYankPost", {
  pattern = "*",
  callback = function() vim.highlight.on_yank { higroup = "Visual", timeout = 200 } end,
})

--- Automatically save file when focus is lost
autocmd("FocusLost", {
  pattern = "*",
  callback = function() vim.cmd "silent! wa" end,
})

--- Autosave
autocmd({ "CursorMoved", "CursorMovedI", "FocusLost", "BufLeave", "BufWinLeave", "InsertLeave" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modified then vim.cmd "silent! update" end
  end,
})

--- Automatically restart LSP after modified Neovim configuration
autocmd("BufWritePost", {
  pattern = vim.fn.stdpath "config" .. "/*",
  callback = function()
    if vim.fn.exists ":LspRestart" == 2 then vim.cmd "LspRestart" end
  end,
})

--- Show LSP diagnostics on hover
autocmd("CursorHold", {
  pattern = "*",
  callback = function() vim.diagnostic.open_float(nil, { focusable = false }) end,
})

--- Set spell for markdown and text files
autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function() vim.opt_local.spell = true end,
})

--- Automatically check if WhoaIDE is setup correctly.
autocmd("VimEnter", {
  callback = function() require("whoa.core").WChecker.ft_run_all_checks() end,
})

--- Automatically hide diagnostic when editing
autocmd("InsertEnter", {
  group = vim.api.nvim_create_augroup("HideDiagnostic", { clear = true }),
  pattern = "*",
  callback = function() vim.diagnostic.hide(nil, 0) end,
})

--- Automatically show diagnostic when quit editing
autocmd("InsertLeave", {
  group = vim.api.nvim_create_augroup("ShowDiagnostic", { clear = true }),
  pattern = "*",
  callback = function() vim.diagnostic.show(nil, 0) end,
})

--- Automatically close neo-tree when loose focus on the page.
autocmd("BufLeave", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "neo-tree" then vim.cmd "Neotree close" end
  end,
})
