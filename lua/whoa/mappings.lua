local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- NORMAL
-- Save
keymap("n", "<LEADER>w", "<CMD>confirm w<ENTER>", opts)
keymap("n", "<LEADER>q", "<CMD>confirm q<ENTER>", opts)
keymap("n", "<LEADER>Q", "<CMD>confirm qall<ENTER>", opts)
keymap("n", "<C-s>", "<CMD>confirm w!<ENTER>", opts)

-- Window navigation
keymap("n", "<S-h>", "<C-w>h", opts)
keymap("n", "<S-j>", "<C-w>j", opts)
keymap("n", "<S-k>", "<C-w>k", opts)
keymap("n", "<S-l>", "<C-w>l", opts)

-- Split screen
keymap("n", "ss", "<CMD>split<CR>", opts)
keymap("n", "sv", "<CMD>vsplit<CR>", opts)

-- Tab navigation
keymap("n", "<S-t>", "<CMD>tabnew<CR>", opts)
keymap("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Zen mode
keymap("n", "<LEADER>z", "<CMD>ZenMode<CR>", opts)

-- Trouble
keymap("n", "<LEADER>x", "<CMD>TroubleToggle<CR>", opts)
keymap("n", "<LEADER>xd", "<CMD>Trouble document_diagnostics<CR>", opts)
keymap("n", "<LEADER>xw", "<CMD>Trouble workspace_diagnostics<CR>", opts)

-- Insert
-- Exit in insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- VISUAL
-- Indent
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- VISUAL BLOCK
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Plugins --

-- Mason
opts.desc = "Mason home"
keymap("n", "<LEADER>pm", "<CMD>Mason<CR>", opts)

opts.desc = "Mason clear"
keymap("n", "<LEADER>pM", "<CMD>MasonUpdate<CR>", opts)

-- NeoTree
opts.desc = "Toggle file explorer"
keymap("n", "<LEADER>e", "<CMD>Neotree toggle<CR>", opts)
