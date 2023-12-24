if vim.loader and vim.fn.has("nvim-0.9.1") == 1 then
	vim.loader.enable()
end

for _, source in ipairs({
	"whoa.mappings",
	"whoa.autocmd",
	"whoa.bootstrap",
	"whoa.lazy",
	"whoa.options",
}) do
	local active, fault = pcall(require, source)
	if not active then
		vim.api.nvim_err_writeln("An error occured, failed to load " .. source .. "\n\n" .. fault)
	end
end
