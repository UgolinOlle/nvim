local options = {
  opt = {
    -- core
    backup = false, -- no backup file
    swapfile = false, -- no swap file
    writebackup = false, -- no write backup file
    fileencoding = "utf-8", -- file encoding
    encoding = "utf-8", -- encoding
    mouse = "a", -- enable mouse support
    completeopt = { "menuone", "noselect" }, -- completion options
    smartindent = true, -- smart indent when starting a new line
    updatetime = 300, -- faster completion
    cursorline = true, -- highlight current line
    laststatus = 2, -- always show status line
    scrolloff = 10, -- minimum number of screen lines to keep above and below the cursor

    -- search
    hlsearch = true, -- highlight search
    ignorecase = true, -- ignore case when searching
    smartcase = true, -- smart case when searching

    -- copy/paste
    clipboard = "unnamedplus", -- use system clipboard

    -- miscelaneous
    splitbelow = true, -- split below
    splitright = true, -- split below and right
    expandtab = true, -- use spaces instead of tabs
    shiftwidth = 2, -- number of spaces to use for autoindent
    tabstop = 2, -- number of spaces that a <Tab> in the file counts for
    wrap = false, -- don't wrap lines
    linebreak = true, -- wrap lines at convenient points

    -- ui
    title = true, -- set the title of the window to the value of the titlestring
    pumheight = 10, -- max height of popup menu
    showmode = false, -- don't show mode
    showtabline = 2, -- always show tabline
    number = true, -- show line numbers
    relativenumber = true, -- show relative line numbers
    termguicolors = true, -- true color support
    signcolumn = "yes", -- always show sign column
    cmdheight = 0, -- height of command line
  },

  g = {
    icons_enabled = true, -- enable icons
  },

  o = {
    autored = true, -- auto read file when changed
    background = "dark", -- dark background
  },
}

for scope, table in pairs(options) do
  for key, value in pairs(table) do
    vim[scope][key] = value
  end
end

-- Specific options
vim.scriptencoding = "utf-8" -- set script encoding
vim.opt.shortmess:append "c" -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-" -- treat dash separated words as a word text object
vim.opt.fillchars:append { eob = " " } -- hide tilde on eob
vim.opt.runtimepath:remove "/usr/share/vim/vimfiles" -- don't load $VIMRUNTIME/vimfiles
