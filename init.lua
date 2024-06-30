if vim.loader and vim.fn.has "nvim-0.9.1" == 1 then vim.loader.enable() end

for _, source in ipairs {
  "whoa.options",
  "whoa.mappings",
  "whoa.lazy",
  "whoa.autocmd",
  "whoa.commands",
} do
  local active, fault = pcall(require, source)
  if not active then vim.api.nvim_err_writeln("An error occured, failed to load " .. source .. "\n\n" .. fault) end
end

-- CUSTOM TEMP
local local_config = vim.fn.expand ".nvimrc"
if vim.fn.filereadable(local_config) == 1 then vim.cmd("source " .. local_config) end
