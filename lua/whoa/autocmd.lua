local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.api.nvim_create_user_command

-- On Vim enter, disable tmux
autocmd("VimEnter", {
  desc = "Disable tmux",
  callback = function() vim.cmd "silent !tmux set status off" end,
})

-- On Vim exit, enable tmux
autocmd("VimLeave", {
  desc = "Enable tmux",
  callback = function() vim.cmd "silent !tmux set status on" end,
})

-- Adding 42 norm on C file.
autocmd("FileType", {
  pattern = "c",
  command = "setlocal shiftwidth=4 tabstop=4",
})

-- Disable some style on terminal.
autocmd("TermOpen", {
  desc = "Disable foldcolumn in terminal and signcolumn for terminal.",
  callback = function()
    vim.opt.foldcolumn = "0"
    vim.opt.signcolumn = "no"
  end,
})

-- WhoaVersion
cmd("WhoaVersion", {
  desc = "Print whoa version",
  command = function() require("whoa.utils").version() end,
})
