local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Common
opts.desc = "Save without quit"
keymap("n", "<LEADER>w", "<CMD>confirm w<ENTER>", opts)

opts.desc = "Close buffer"
keymap("n", "<LEADER>q", function() require("mini.bufremove").delete(0, false) end, opts)

opts.desc = "Close window"
keymap("n", "Q", "<CMD>confirm q<CR>", opts)

opts.desc = "Make the current file executable"
keymap("n", "<LEADER>x", "<CMD>!chmod +x %<CR>", opts)

-- Tabs
opts.desc = "New tab"
keymap("n", "<LEADER>te", "<CMD>tabnew<CR>", opts)

opts.desc = "Next tab"
keymap("n", "<Tab>", "<CMD>tabnext<CR>", opts)

opts.desc = "Previous tab"
keymap("n", "<S-Tab>", "<CMD>tabprevious<CR>", opts)

-- Window navigation
opts.desc = "Move on left window"
keymap("n", "<C-h>", "<C-w>h", opts)

opts.desc = "Move on bottom window"
keymap("n", "<C-j>", "<C-w>j", opts)

opts.desc = "Move on up window"
keymap("n", "<C-k>", "<C-w>k", opts)

opts.desc = "Move on right window"
keymap("n", "<C-l>", "<C-w>l", opts)

-- Split screen
opts.desc = "Split horizontal screen"
keymap("n", "ss", "<CMD>split<CR>", opts)

opts.desc = "Split vertical screen"
keymap("n", "sv", "<CMD>vsplit<CR>", opts)

-- Resize with arrows
opts.desc = "Decrease height"
keymap("n", "<C-Up>", ":resize -2<CR>", opts)

opts.desc = "Increase height"
keymap("n", "<C-Down>", ":resize +2<CR>", opts)

opts.desc = "Decrease width"
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)

opts.desc = "Increase width"
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
opts.desc = "Move text down"
keymap({ "v", "n" }, "<S-j>", ":m '>+1<CR>gv=gv", opts)

opts.desc = "Move text up"
keymap({ "v", "n" }, "<S-k>", ":m '<-2<CR>gv=gv", opts)

-- Exit in insert mode
opts.desc = "Exit insert mode"
keymap("i", "jk", "<ESC>", opts)

opts.desc = "Exit insert mode"
keymap("i", "kj", "<ESC>", opts)

-- Indent
opts.desc = "Indent line"
keymap("v", "<", "<gv^", opts)

opts.desc = "Unindent line"
keymap("v", ">", ">gv^", opts)

--- Remove highlights after search
opts.desc = "Remove highlights"
keymap("n", "<LEADER><SPACE>", "<cmd>nohlsearch<CR>", opts)

--- WHOA Mappings ---
opts.desc = "Open logs"
keymap("n", "<LEADER>lo", function() require("whoa.core").WLogger.ft_view_logs() end, opts)

opts.desc = "Open features config"
keymap("n", "<LEADER>ft", function() require("whoa.core").WFeatures.open() end, opts)

opts.desc = "Select theme"
keymap("n", "<leader>st", function() require("whoa.core").WTheme.ft_list_themes() end, opts)

opts.desc = "Create an issue"
keymap("n", "<leader>gi", function() require("whoa.core").WUtils.ft_issue() end, opts)

opts.desc = "Open input to go to line"
keymap("n", "\\", function() require("whoa.core").WUtils.ft_go_to_line() end, opts)

--- Plugins ---

-- Lazy
opts.desc = "Open Lazy package manager"
keymap("n", "<LEADER>l", "<CMD>Lazy<CR>", opts)
