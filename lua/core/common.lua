local options = {
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 2,
	completeopt = { "menuone", "noselect" },
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	mouse = "a",
	pumheight = 10,
	showmode = false,
	showtabline = 2,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	updatetime = 300,
	writebackup = false,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	cursorline = true,
	number = true,
	relativenumber = false,
	numberwidth = 4,
	termguicolors = true,
	signcolumn = "yes",
	wrap = false,
	linebreak = true,
	linespace = 10,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

vim.opt.shortmess:append("c")
vim.opt.iskeyword:append("-")
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")

vim.g.icons_enabled = true

vim.o.autored = true
