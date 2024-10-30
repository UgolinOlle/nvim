if vim.loader and vim.fn.has "nvim-0.9.1" == 1 then vim.loader.enable() end

vim.g.start_time = vim.fn.reltime()
vim.g.border = {
  enabled = true,
  style = "rounded",
  borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
}

vim.g.telescope_exclude_file = {
  "%.7z",
  "%.MOV",
  "%.RAF",
  "%.burp",
  "%.bz2",
  "%.cache",
  "%.class",
  "%.dll",
  "%.docx",
  "%.dylib",
  "%.epub",
  "%.exe",
  "%.flac",
  "%.ico",
  "%.ipynb",
  "%.jar",
  "%.lock",
  "%.mkv",
  "%.mov",
  "%.mp4",
  "%.otf",
  "%.pdb",
  "%.rar",
  "%.sqlite3",
  "%.svg",
  "%.tar",
  "%.tar.gz",
  "%.zip",
  ".git/",
  ".gradle/",
  ".idea/",
  ".settings/",
  ".vale/",
  ".vscode/",
  "__pycache__/*",
  "build/",
  "env/",
  "gradle/",
  "node_modules/",
  "smalljre_*/*",
  "target/",
  "vendor/*",
}

for _, source in ipairs {
  "whoa.options",
  "whoa.mappings",
  "whoa.lazy",
  "whoa.commands",
  "whoa.core",
} do
  local active, fault = pcall(require, source)
  if not active then vim.api.nvim_err_writeln("An error occured, failed to load " .. source .. "\n\n" .. fault) end
end
