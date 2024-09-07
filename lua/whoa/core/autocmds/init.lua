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

--- Delete cursor on dashboard
autocmd("FileType", {
  pattern = "dashboard",
  callback = function()
    vim.opt.cursorline = false
    vim.opt.guicursor = "a:Cursor/lCursor"
  end,
})

--- Restore cursor when leave dashboard
autocmd("BufLeave", {
  pattern = "dashboard",
  callback = function() vim.opt.guicursor = "" end,
})

-- Desactive any movement on dashboard
autocmd("FileType", {
  pattern = "dashboard",
  callback = function()
    vim.opt_local.signcolumn = "no"
    vim.opt_local.foldcolumn = "0"
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.cursorline = false
    vim.opt_local.wrap = false
    vim.opt_local.scrolloff = 999
    vim.opt_local.sidescrolloff = 999
  end,
})

--- Automatically check if WhoaIDE is setup correctly.
autocmd("VimEnter", {
  callback = function() require("whoa.core").WChecker.ft_run_all_checks() end,
})

--- Highlight statusline based on mode
autocmd("ModeChanged", {
  callback = function()
    local mode = vim.fn.mode()
    if mode == "n" then
      vim.cmd [[ hi StatusLine guifg=#FFFFFF guibg=#007ACC ]]
    elseif mode == "i" then
      vim.cmd [[ highlight StatusLine guifg=#FFFFFF guibg=#009688 ]]
    elseif mode == "v" or mode == "V" then
      vim.cmd [[ hi StatusLine guifg=#FFFFFF guibg=#D32F2F ]]
    else
      vim.cmd [[ hi StatusLine guifg=#FFFFFF guibg=#3F51B5 ]]
    end
  end,
})

--- Automatically resize dashboard window
autocmd("BufEnter", {
  pattern = "neo-tree*",
  callback = function()
    vim.cmd "wincmd ="

    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
      if bufname:match "dashboard" then
        vim.api.nvim_set_current_win(win)
        vim.cmd "wincmd |" -- Maximiser horizontalement
        vim.cmd "wincmd _" -- Maximiser verticalement
        break
      end
    end
  end,
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
