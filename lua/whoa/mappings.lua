local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Common
opts.desc = "Save without quit"
keymap("n", "<LEADER>w", "<CMD>confirm w<ENTER>", opts)

opts.desc = "Close buffer"
keymap("n", "<LEADER>q", "<CMD>bd<ENTER>", opts)

opts.desc = "Close window"
keymap("n", "Q", "<CMD>confirm q<CR>", opts)

opts.desc = "Make the current file executable"
keymap("n", "<LEADER>x", "<CMD>!chmod +x %<CR>", opts)

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

-- Tab navigation
opts.desc = "New tab"
keymap("n", "<S-t>", "<CMD>tabnew<CR>", opts)

opts.desc = "Go to next tab"
keymap("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>", opts)

opts.desc = "Go to previous tab"
keymap("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>", opts)

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
keymap("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)

opts.desc = "Move text up"
keymap("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)

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

-- Plugins --

-- Lazy
opts.desc = "Open Lazy package manager"
keymap("n", "<LEADER>L", "<CMD>Lazy<CR>", opts)

-- Zen mode
keymap("n", "<LEADER>z", "<CMD>ZenMode<CR>", opts)

-- Trouble
keymap("n", "<LEADER>x", "<CMD>TroubleToggle<CR>", opts)
keymap("n", "<LEADER>xd", "<CMD>Trouble document_diagnostics<CR>", opts)
keymap("n", "<LEADER>xw", "<CMD>Trouble workspace_diagnostics<CR>", opts)

-- Mason
opts.desc = "Mason home"
keymap("n", "<LEADER>pp", "<CMD>Mason<CR>", opts)

opts.desc = "Mason clear"
keymap("n", "<LEADER>pM", "<CMD>MasonUpdate<CR>", opts)

-- NeoTree
opts.desc = "Toggle file explorer"
keymap("n", "<LEADER>e", "<CMD>Neotree toggle<CR>", opts)

-- Todo comments
opts.desc = "Jump to next todo"
keymap("n", "]t", function()
	require("todo-comments").jump_next()
end, opts)

opts.desc = "Jump to previous todo"
keymap("n", "[t", function()
	require("todo-comments").jump_prev()
end, opts)
